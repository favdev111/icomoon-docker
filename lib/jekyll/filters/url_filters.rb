module Jekyll
  module Filters
    module URLFilters
      # Produces an absolute URL based on site.url and site.baseurl.
      #
      # input - the URL to make absolute.
      #
      # Returns the absolute URL as a String.
      def absolute_url(input)
        return if input.nil?
        site = @context.registers[:site]
        return relative_url(input).to_s if site.config["url"].nil?
        URI(site.config["url"] + relative_url(input)).to_s
      end

      # Produces a URL relative to the domain root based on site.baseurl.
      #
      # input - the URL to make relative to the domain root
      #
      # Returns a URL relative to the domain root as a String.
      def relative_url(input)
        return if input.nil?
        site = @context.registers[:site]
        return ensure_leading_slash(input.to_s) if site.config["baseurl"].nil?
        ensure_leading_slash( # in case the baseurl doesn't have a leading slash
          URI(
            site.config["baseurl"] + ensure_leading_slash(input.to_s)
            # in case the input doesn't have a leading slash
          ).to_s
        )
      end

      private
      def ensure_leading_slash(input)
        return input if input.nil? || input.empty?
        if input.start_with?("/")
          input
        else
          "/#{input}"
        end
      end

    end
  end
end
