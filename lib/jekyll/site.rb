# encoding: UTF-8
require 'csv'

module Jekyll
  class Site
    attr_reader   :source, :dest, :config
    attr_accessor :layouts, :posts, :pages, :static_files,
                  :exclude, :include, :lsi, :highlighter, :permalink_style,
                  :time, :future, :unpublished, :safe, :plugins, :limit_posts,
                  :show_drafts, :keep_files, :baseurl, :data, :file_read_opts,
                  :gems, :plugin_manager

    attr_accessor :converters, :generators, :reader
    attr_reader   :regenerator

    # Public: Initialize a new Site.
    #
    # config - A Hash containing site configuration details.
    def initialize(config)
      @config = config.clone

      %w[safe lsi highlighter baseurl exclude include future unpublished
        show_drafts limit_posts keep_files gems].each do |opt|
        self.send("#{opt}=", config[opt])
      end

      # Source and destination may not be changed after the site has been created.
      @source              = File.expand_path(config['source']).freeze
      @dest                = File.expand_path(config['destination']).freeze

      @reader = Jekyll::Reader.new(self)

      # Initialize incremental regenerator
      @regenerator = Regenerator.new(self)

      self.plugin_manager = Jekyll::PluginManager.new(self)
      self.plugins        = plugin_manager.plugins_path

      self.file_read_opts = {}
      self.file_read_opts[:encoding] = config['encoding'] if config['encoding']

      self.permalink_style = config['permalink'].to_sym

      Jekyll.sites << self

      reset
      setup
    end

    # Public: Read, process, and write this Site to output.
    #
    # Returns nothing.
    def process
      reset
      read
      generate
      render
      cleanup
      write
    end

    # Reset Site details.
    #
    # Returns nothing
    def reset
      self.time = (config['time'] ? Utils.parse_date(config['time'].to_s, "Invalid time in _config.yml.") : Time.now)
      self.layouts = {}
      self.posts = []
      self.pages = []
      self.static_files = []
      self.data = {}
      @collections = nil

      if limit_posts < 0
        raise ArgumentError, "limit_posts must be a non-negative number"
      end
    end

    # Load necessary libraries, plugins, converters, and generators.
    #
    # Returns nothing.
    def setup
      ensure_not_in_dest

      plugin_manager.conscientious_require

      self.converters = instantiate_subclasses(Jekyll::Converter)
      self.generators = instantiate_subclasses(Jekyll::Generator)
    end

    # Check that the destination dir isn't the source dir or a directory
    # parent to the source dir.
    def ensure_not_in_dest
      dest_pathname = Pathname.new(dest)
      Pathname.new(source).ascend do |path|
        if path == dest_pathname
          raise Errors::FatalException.new "Destination directory cannot be or contain the Source directory."
        end
      end
    end

    # The list of collections and their corresponding Jekyll::Collection instances.
    # If config['collections'] is set, a new instance is created for each item in the collection.
    # If config['collections'] is not set, a new hash is returned.
    #
    # Returns a Hash containing collection name-to-instance pairs.
    def collections
      @collections ||= Hash[collection_names.map { |coll| [coll, Jekyll::Collection.new(self, coll)] } ]
    end

    # The list of collection names.
    #
    # Returns an array of collection names from the configuration,
    #   or an empty array if the `collections` key is not set.
    def collection_names
      case config['collections']
      when Hash
        config['collections'].keys
      when Array
        config['collections']
      when nil
        []
      else
        raise ArgumentError, "Your `collections` key must be a hash or an array."
      end
    end

    # Read Site data from disk and load it into internal data structures.
    #
    # Returns nothing.
    def read
      self.layouts = LayoutReader.new(self).read
      reader.read_directories
      reader.read_data(config['data_source'])
      reader.read_collections
    end

    # Run each of the Generators.
    #
    # Returns nothing.
    def generate
      generators.each do |generator|
        generator.generate(self)
      end
    end

    # Render the site to the destination.
    #
    # Returns nothing.
    def render
      relative_permalinks_deprecation_method

      payload = site_payload
      collections.each do |label, collection|
        collection.docs.each do |document|
          if regenerator.regenerate?(document)
            document.output = Jekyll::Renderer.new(self, document, payload).run
          end
        end
      end

      payload = site_payload
      [posts, pages].flatten.each do |page_or_post|
        if regenerator.regenerate?(page_or_post)
          page_or_post.render(layouts, payload)
        end
      end
    rescue Errno::ENOENT
      # ignore missing layout dir
    end

    # Remove orphaned files and empty directories in destination.
    #
    # Returns nothing.
    def cleanup
      site_cleaner.cleanup!
    end

    # Write static files, pages, and posts.
    #
    # Returns nothing.
    def write
      each_site_file { |item|
        item.write(dest) if regenerator.regenerate?(item)
      }
      regenerator.write_metadata
    end

    # Construct a Hash of Posts indexed by the specified Post attribute.
    #
    # post_attr - The String name of the Post attribute.
    #
    # Examples
    #
    #   post_attr_hash('categories')
    #   # => { 'tech' => [<Post A>, <Post B>],
    #   #      'ruby' => [<Post B>] }
    #
    # Returns the Hash: { attr => posts } where
    #   attr  - One of the values for the requested attribute.
    #   posts - The Array of Posts with the given attr value.
    def post_attr_hash(post_attr)
      # Build a hash map based on the specified post attribute ( post attr =>
      # array of posts ) then sort each array in reverse order.
      hash = Hash.new { |h, key| h[key] = [] }
      posts.each { |p| p.send(post_attr.to_sym).each { |t| hash[t] << p } }
      hash.values.each { |posts| posts.sort!.reverse! }
      hash
    end

    def tags
      post_attr_hash('tags')
    end

    def categories
      post_attr_hash('categories')
    end

    # Prepare site data for site payload. The method maintains backward compatibility
    # if the key 'data' is already used in _config.yml.
    #
    # Returns the Hash to be hooked to site.data.
    def site_data
      config['data'] || data
    end

    # The Hash payload containing site-wide data.
    #
    # Returns the Hash: { "site" => data } where data is a Hash with keys:
    #   "time"       - The Time as specified in the configuration or the
    #                  current time if none was specified.
    #   "posts"      - The Array of Posts, sorted chronologically by post date
    #                  and then title.
    #   "pages"      - The Array of all Pages.
    #   "html_pages" - The Array of HTML Pages.
    #   "categories" - The Hash of category values and Posts.
    #                  See Site#post_attr_hash for type info.
    #   "tags"       - The Hash of tag values and Posts.
    #                  See Site#post_attr_hash for type info.
    def site_payload
      {
        "jekyll" => {
          "version" => Jekyll::VERSION,
          "environment" => Jekyll.env
        },
        "site"   => Utils.deep_merge_hashes(config,
          Utils.deep_merge_hashes(Hash[collections.map{|label, coll| [label, coll.docs]}], {
            "time"         => time,
            "posts"        => posts.sort { |a, b| b <=> a },
            "pages"        => pages,
            "static_files" => static_files,
            "html_pages"   => pages.select { |page| page.html? || page.url.end_with?("/") },
            "categories"   => post_attr_hash('categories'),
            "tags"         => post_attr_hash('tags'),
            "collections"  => collections,
            "documents"    => documents,
            "data"         => site_data
        }))
      }
    end

    # Get the implementation class for the given Converter.
    #
    # klass - The Class of the Converter to fetch.
    #
    # Returns the Converter instance implementing the given Converter.
    def find_converter_instance(klass)
      converters.find { |c| c.class == klass } || proc { raise "No converter for #{klass}" }.call
    end

    # Create array of instances of the subclasses of the class or module
    #   passed in as argument.
    #
    # klass - class or module containing the subclasses which should be
    #         instantiated
    #
    # Returns array of instances of subclasses of parameter
    def instantiate_subclasses(klass)
      klass.descendants.select do |c|
        !safe || c.safe
      end.sort.map do |c|
        c.new(config)
      end
    end

    def relative_permalinks_deprecation_method
      if config['relative_permalinks'] && has_relative_page?
        Jekyll::Deprecator.deprecation_message "Since v2.0, permalinks for pages" +
                                            " in subfolders must be relative to the" +
                                            " site source directory, not the parent" +
                                            " directory. Check http://jekyllrb.com/docs/upgrading/"+
                                            " for more info."
      end
    end

    def docs_to_write
      documents.select(&:write?)
    end

    def documents
      collections.reduce(Set.new) do |docs, (_, collection)|
        docs + collection.docs + collection.files
      end.to_a
    end

    def each_site_file
      %w(posts pages static_files docs_to_write).each do |type|
        send(type).each do |item|
          yield item
        end
      end
    end

    def frontmatter_defaults
      @frontmatter_defaults ||= FrontmatterDefaults.new(self)
    end

    # Whether to perform a full rebuild without incremental regeneration
    #
    # Returns a Boolean: true for a full rebuild, false for normal build
    def full_rebuild?(override = {})
      override['full_rebuild'] || config['full_rebuild']
    end

    def publisher
      @publisher ||= Publisher.new(self)
    end

    private

    def has_relative_page?
      pages.any? { |page| page.uses_relative_permalinks }
    end

    def site_cleaner
      @site_cleaner ||= Cleaner.new(self)
    end
  end
end
