module Jekyll

  class Site
    attr_accessor :config, :layouts, :posts, :pages, :static_files, :categories, :exclude,
                  :source, :dest, :lsi, :pygments, :permalink_style, :tags

    # Initialize the site
    #   +config+ is a Hash containing site configurations details
    #
    # Returns <Site>
    def initialize(config)
      self.config          = config.clone

      self.source          = File.expand_path(config['source'])
      self.dest            = config['destination']
      self.lsi             = config['lsi']
      self.pygments        = config['pygments']
      self.permalink_style = config['permalink'].to_sym
      self.exclude         = config['exclude'] || []

      self.reset
      self.setup
    end

    def reset
      self.layouts         = {}
      self.posts           = []
      self.pages           = []
      self.static_files    = []
      self.categories      = Hash.new { |hash, key| hash[key] = [] }
      self.tags            = Hash.new { |hash, key| hash[key] = [] }
    end

    def setup
      # Check to see if LSI is enabled.
      require 'classifier' if self.lsi

      # Set the Markdown interpreter (and Maruku self.config, if necessary)
      case self.config['markdown']
        when 'rdiscount'
          begin
            require 'rdiscount'

            def markdown(content)
              RDiscount.new(content).to_html
            end

          rescue LoadError
            puts 'You must have the rdiscount gem installed first'
          end
        when 'maruku'
          begin
            require 'maruku'

            def markdown(content)
              Maruku.new(content).to_html
            end

            if self.config['maruku']['use_divs']
              require 'maruku/ext/div'
              puts 'Maruku: Using extended syntax for div elements.'
            end

            if self.config['maruku']['use_tex']
              require 'maruku/ext/math'
              puts "Maruku: Using LaTeX extension. Images in `#{self.config['maruku']['png_dir']}`."

              # Switch off MathML output
              MaRuKu::Globals[:html_math_output_mathml] = false
              MaRuKu::Globals[:html_math_engine] = 'none'

              # Turn on math to PNG support with blahtex
              # Resulting PNGs stored in `images/latex`
              MaRuKu::Globals[:html_math_output_png] = true
              MaRuKu::Globals[:html_png_engine] =  self.config['maruku']['png_engine']
              MaRuKu::Globals[:html_png_dir] = self.config['maruku']['png_dir']
              MaRuKu::Globals[:html_png_url] = self.config['maruku']['png_url']
            end
          rescue LoadError
            puts "The maruku gem is required for markdown support!"
          end
        else
          raise "Invalid Markdown processor: '#{self.config['markdown']}' -- did you mean 'maruku' or 'rdiscount'?"
      end
    end

    def textile(content)
      RedCloth.new(content).to_html
    end

    # Do the actual work of processing the site and generating the
    # real deal.  Now has 4 phases; reset, read, render, write.  This allows
    # rendering to have full site payload available.
    #
    # Returns nothing
    def process
      self.reset
      self.read
      self.render
      self.write
    end

    def read
      self.read_layouts # existing implementation did this at top level only so preserved that
      self.read_directories
    end

    # Read all the files in <source>/<dir>/_layouts and create a new Layout
    # object with each one.
    #
    # Returns nothing
    def read_layouts(dir = '')
      base = File.join(self.source, dir, "_layouts")
      return unless File.exists?(base)
      entries = []
      Dir.chdir(base) { entries = filter_entries(Dir['*.*']) }

      entries.each do |f|
        name = f.split(".")[0..-2].join(".")
        self.layouts[name] = Layout.new(self, base, f)
      end
    end

    # Read all the files in <source>/<dir>/_posts and create a new Post
    # object with each one.
    #
    # Returns nothing
    def read_posts(dir)
      base = File.join(self.source, dir, '_posts')
      return unless File.exists?(base)
      entries = Dir.chdir(base) { filter_entries(Dir['**/*']) }

      # first pass processes, but does not yet render post content
      entries.each do |f|
        if Post.valid?(f)
          post = Post.new(self, self.source, dir, f)

          if post.published
            self.posts << post
            post.categories.each { |c| self.categories[c] << post }
            post.tags.each { |c| self.tags[c] << post }
          end
        end
      end

      self.posts.sort!
    end

    def render
      self.posts.each do |post|
        post.render(self.layouts, site_payload)
      end

      self.pages.dup.each do |page|
        if Pager.pagination_enabled?(self.config, page.name)
          paginate(page)
        else
          page.render(self.layouts, site_payload)
        end
      end

      self.categories.values.map { |ps| ps.sort! { |a, b| b <=> a} }
      self.tags.values.map { |ps| ps.sort! { |a, b| b <=> a} }
    rescue Errno::ENOENT => e
      # ignore missing layout dir
    end

    # Write static files, pages and posts
    #
    # Returns nothing
    def write
      self.posts.each do |post|
        post.write(self.dest)
      end
      self.pages.each do |page|
        page.write(self.dest)
      end
      self.static_files.each do |sf|
        sf.write(self.dest)
      end
    end

    # Reads the directories and finds posts, pages and static files that will 
    # become part of the valid site according to the rules in +filter_entries+.
    #   The +dir+ String is a relative path used to call this method
    #            recursively as it descends through directories
    #
    # Returns nothing
    def read_directories(dir = '')
      base = File.join(self.source, dir)
      entries = filter_entries(Dir.entries(base))

      self.read_posts(dir)

      entries.each do |f|
        f_abs = File.join(base, f)
        f_rel = File.join(dir, f)
        if File.directory?(f_abs)
          next if self.dest.sub(/\/$/, '') == f_abs
          read_directories(f_rel)
        elsif !File.symlink?(f_abs)
          first3 = File.open(f_abs) { |fd| fd.read(3) }
          if first3 == "---"
            # file appears to have a YAML header so process it as a page
            pages << Page.new(self, self.source, dir, f)
          else
            # otherwise treat it as a static file
            static_files << StaticFile.new(self, self.source, dir, f)
          end
        end
      end
    end

    # Constructs a hash map of Posts indexed by the specified Post attribute
    #
    # Returns {post_attr => [<Post>]}
    def post_attr_hash(post_attr)
      # Build a hash map based on the specified post attribute ( post attr => array of posts )
      # then sort each array in reverse order
      hash = Hash.new { |hash, key| hash[key] = Array.new }
      self.posts.each { |p| p.send(post_attr.to_sym).each { |t| hash[t] << p } }
      hash.values.map { |sortme| sortme.sort! { |a, b| b <=> a} }
      return hash
    end

    # The Hash payload containing site-wide data
    #
    # Returns {"site" => {"time" => <Time>,
    #                     "posts" => [<Post>],
    #                     "categories" => [<Post>]}
    def site_payload
      {"site" => self.config.merge({
          "time"       => Time.now,
          "posts"      => self.posts.sort { |a,b| b <=> a },
          "categories" => post_attr_hash('categories'),
          "tags"       => post_attr_hash('tags')})}
    end

    # Filter out any files/directories that are hidden or backup files (start
    # with "." or "#" or end with "~"), or contain site content (start with "_"),
    # or are excluded in the site configuration, unless they are web server
    # files such as '.htaccess'
    def filter_entries(entries)
      entries = entries.reject do |e|
        unless ['.htaccess'].include?(e)
          ['.', '_', '#'].include?(e[0..0]) || e[-1..-1] == '~' || self.exclude.include?(e)
        end
      end
    end

    # Paginates the blog's posts. Renders the index.html file into paginated
    # directories, ie: page2/index.html, page3/index.html, etc and adds more
    # site-wide data.
    #   +page+ is the index.html Page that requires pagination
    #
    # {"paginator" => { "page" => <Number>,
    #                   "per_page" => <Number>,
    #                   "posts" => [<Post>],
    #                   "total_posts" => <Number>,
    #                   "total_pages" => <Number>,
    #                   "previous_page" => <Number>,
    #                   "next_page" => <Number> }}
    def paginate(page)
      all_posts = site_payload['site']['posts']
      pages = Pager.calculate_pages(all_posts, self.config['paginate'].to_i)
      (1..pages).each do |num_page|
        pager = Pager.new(self.config, num_page, all_posts, pages)
        if num_page > 1
          newpage = Page.new(self, self.source, page.dir, page.name)
          newpage.render(self.layouts, site_payload.merge({'paginator' => pager.to_hash}))
          newpage.dir = File.join(page.dir, "page#{num_page}")
          self.pages << newpage
        else
          page.render(self.layouts, site_payload.merge({'paginator' => pager.to_hash}))
        end
      end
    end
  end
end
