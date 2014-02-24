module Jekyll
  module Commands
    class Build < Command
      def self.process(options)
        site = Jekyll::Site.new(options)

        Jekyll.logger.log_level = Jekyll::Stevenson::ERROR if options['quiet']

        build(site, options)
        watch(site, options) if options['watch']
      end

      # Private: Build the site from source into destination.
      #
      # site - A Jekyll::Site instance
      # options - A Hash of options passed to the command
      #
      # Returns nothing.
      def self.build(site, options)
        source = options['source']
        destination = options['destination']
        Jekyll.logger.info "Source:", source
        Jekyll.logger.info "Destination:", destination
        print Jekyll.logger.formatted_topic "Generating..."
        process_site(site)
        puts "done."
      end

      # Private: Watch for file changes and rebuild the site.
      #
      # site - A Jekyll::Site instance
      # options - A Hash of options passed to the command
      #
      # Returns nothing.
      def self.watch(site, options)
        require 'listen'

        source = options['source']
        destination = options['destination']

        begin
          dest = Pathname.new(destination).relative_path_from(Pathname.new(source)).to_s
          ignored = Regexp.new(Regexp.escape(dest))
        rescue ArgumentError
          # Destination is outside the source, no need to ignore it.
          ignored = nil
        end

        Jekyll.logger.info "Auto-regeneration:", "enabled"

        listener = Listen.to(source, :ignore => ignored) do |modified, added, removed|
          t = Time.now.strftime("%Y-%m-%d %H:%M:%S")
          n = modified.length + added.length + removed.length
          print Jekyll.logger.formatted_topic("Regenerating:") + "#{n} files at #{t} "
          process_site(site)
          puts  "...done."
        end
        listener.start

        unless options['serving']
          trap("INT") do
            listener.stop
            puts "     Halting auto-regeneration."
            exit 0
          end

          loop { sleep 1000 }
        end
      end
    end
  end
end
