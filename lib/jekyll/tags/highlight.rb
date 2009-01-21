module Jekyll
  
  class HighlightBlock < Liquid::Block
    include Liquid::StandardFilters
    
    def initialize(tag_name, lang, tokens)
      super
      @lang = lang.strip
    end
  
    def render(context)
      if Jekyll.pygments
        render_pygments(context, super.to_s)
      else
        render_codehighlighter(context, super.to_s)
      end
    end
    
    def render_pygments(context, code)
      if Jekyll.content_type == :markdown
        return "\n" + Albino.new(code, @lang).to_s + "\n"
      else
        "<notextile>" + Albino.new(code, @lang).to_s + "</notextile>"
      end
    end
    
    def render_codehighlighter(context, code)
    #The div is required because RDiscount blows ass
      <<-HTML
<div>
  <pre>
    <code class='#{@lang}'>#{h(code).strip}</code>
  </pre>
</div>
      HTML
    end
  end
  
end

Liquid::Template.register_tag('highlight', Jekyll::HighlightBlock)
