---
layout: docs
title: Plugins
prev_section: assets
next_section: extras
permalink: /docs/plugins/
---

Jekyll has a plugin system with hooks that allow you to create custom generated
content specific to your site. You can run custom code for your site without
having to modify the Jekyll source itself.

<div class="note info">
  <h5>Plugins on GitHub Pages</h5>
  <p>
    <a href="http://pages.github.com">GitHub Pages</a> is powered by Jekyll,
    however all Pages sites are generated using the <code>--safe</code> option
    to disable custom plugins for security reasons. Unfortunately, this means
    your plugins won’t work if you’re deploying to GitHub Pages.<br><br>
    You can still use GitHub Pages to publish your site, but you'll need to
    convert the site locally and push the generated static files to your GitHub
    repository instead of the Jekyll source files.
  </p>
</div>

## Installing a plugin

In your site source root, make a `_plugins` directory. Place your plugins here.
Any file ending in `*.rb` inside this directory will be loaded before Jekyll
generates your site.

In general, plugins you make will fall into one of three categories:

1. Generators
2. Converters
3. Tags

## Generators

You can create a generator when you need Jekyll to create additional content
based on your own rules. For example, a generator might look like this:

{% highlight ruby %}
module Jekyll

  class CategoryPage < Page
    def initialize(site, base, dir, category)
      @site = site
      @base = base
      @dir = dir
      @name = 'index.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'category_index.html')
      self.data['category'] = category

      category_title_prefix = site.config['category_title_prefix'] || 'Category: '
      self.data['title'] = "#{category_title_prefix}#{category}"
    end
  end

  class CategoryPageGenerator < Generator
    safe true

    def generate(site)
      if site.layouts.key? 'category_index'
        dir = site.config['category_dir'] || 'categories'
        site.categories.keys.each do |category|
          site.pages << CategoryPage.new(site, site.source, File.join(dir, category), category)
        end
      end
    end
  end

end
{% endhighlight %}

In this example, our generator will create a series of files under the
`categories` directory for each category, listing the posts in each category
using the `category_index.html` layout.

Generators are only required to implement one method:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>generate</code></p>
      </td>
      <td>
        <p>String output of the content being generated.</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

## Converters

If you have a new markup language you’d like to use with your site, you can
include it by implementing your own converter. Both the Markdown and Textile
markup languages are implemented using this method.

<div class="note info">
  <h5>Remember your YAML front-matter</h5>
  <p>
    Jekyll will only convert files that have a YAML header at the top, even for
    converters you add using a plugin.
  </p>
</div>

Below is a converter that will take all posts ending in `.upcase` and process
them using the `UpcaseConverter`:

{% highlight ruby %}
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low

    def matches(ext)
      ext =~ /^\.upcase$/i
    end

    def output_ext(ext)
      ".html"
    end

    def convert(content)
      content.upcase
    end
  end
end
{% endhighlight %}

Converters should implement at a minimum 3 methods:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>matches</code></p>
      </td>
      <td><p>
        Does the given extension match this converter's list of acceptable
        extensions? Takes one argument: the file's extension (including the
        dot). Must return <code>true</code> if it matches, <code>false</code>
        otherwise.
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>output_ext</code></p>
      </td>
      <td><p>
        The extension to be given to the output file (including the dot).
        Usually this will be <code>".html"</code>.
      </p></td>
    </tr>
    <tr>
      <td>
        <p><code>convert</code></p>
      </td>
      <td><p>
        Logic to do the content conversion. Takes one argument: the raw content
        of the file (without YAML front matter). Must return a String.
      </p></td>
    </tr>
  </tbody>
</table>
</div>

In our example, `UpcaseConverter#matches` checks if our filename extension is
`.upcase`, and will render using the converter if it is. It will call
`UpcaseConverter#convert` to process the content. In our simple converter we’re
simply uppercasing the entire content string. Finally, when it saves the page,
it will do so with a `.html` extension.

## Tags

If you’d like to include custom liquid tags in your site, you can do so by
hooking into the tagging system. Built-in examples added by Jekyll include the
`highlight` and `include` tags. Below is an example of a custom liquid tag that
will output the time the page was rendered:

{% highlight ruby %}
module Jekyll
  class RenderTimeTag < Liquid::Tag

    def initialize(tag_name, text, tokens)
      super
      @text = text
    end

    def render(context)
      "#{@text} #{Time.now}"
    end
  end
end

Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
{% endhighlight %}

At a minimum, liquid tags must implement:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Method</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>render</code></p>
      </td>
      <td>
        <p>Outputs the content of the tag.</p>
      </td>
    </tr>
  </tbody>
</table>
</div>

You must also register the custom tag with the Liquid template engine as
follows:

{% highlight ruby %}
Liquid::Template.register_tag('render_time', Jekyll::RenderTimeTag)
{% endhighlight %}

In the example above, we can place the following tag anywhere in one of our
pages:

{% highlight ruby %}
{% raw %}
<p>{% render_time page rendered at: %}</p>
{% endraw %}
{% endhighlight %}

And we would get something like this on the page:

{% highlight html %}
<p>page rendered at: Tue June 22 23:38:47 –0500 2010</p>
{% endhighlight %}

### Liquid filters

You can add your own filters to the Liquid template system much like you can add
tags above. Filters are simply modules that export their methods to liquid. All
methods will have to take at least one parameter which represents the input of
the filter. The return value will be the output of the filter.

{% highlight ruby %}
module Jekyll
  module AssetFilter
    def asset_url(input)
      "http://www.example.com/#{input}?#{Time.now.to_i}"
    end
  end
end

Liquid::Template.register_filter(Jekyll::AssetFilter)
{% endhighlight %}

<div class="note">
  <h5>ProTip™: Access the site object using Liquid</h5>
  <p>
    Jekyll lets you access the <code>site</code> object through the
    <code>context.registers</code> feature of Liquid. For example, you can
    access the global configuration file <code>_config.yml</code> using
    <code>context.registers.config</code>.
  </p>
</div>

### Flags

There are two flags to be aware of when writing a plugin:

<div class="mobile-side-scroller">
<table>
  <thead>
    <tr>
      <th>Flag</th>
      <th>Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <p><code>safe</code></p>
      </td>
      <td>
        <p>
          A boolean flag that informs Jekyll whether this plugin may be safely
          executed in an environment where arbitrary code execution is not
          allowed. This is used by GitHub Pages to determine which core plugins
          may be used, and which are unsafe to run. If your plugin does not
          allow for arbitrary code, execution, set this to <code>true</code>.
          GitHub Pages still won't load your plugin, but if you submit it for
          inclusion in core, it's best for this to be correct!
        </p>
      </td>
    </tr>
    <tr>
      <td>
        <p><code>priority</code></p>
      </td>
      <td>
        <p>
          This flag determines what order the plugin is loaded in. Valid values
          are: <code>:lowest</code>, <code>:low</code>, <code>:normal</code>,
          <code>:high</code>, and <code>:highest</code>. Highest priority
          matches are applied first, lowest priority are applied last.
        </p>
      </td>
    </tr>
  </tbody>
</table>
</div>

To use one of the example plugins above as an illustration, here is how you’d
specify these two flags:

{% highlight ruby %}
module Jekyll
  class UpcaseConverter < Converter
    safe true
    priority :low
    ...
  end
end
{% endhighlight %}

## Available Plugins

There are a few useful, prebuilt plugins at the following locations:

- [Truncate HTML while preserving markup structure](https://github.com/MattHall/truncatehtml) by [Matt Hall](http://codebeef.com)
- [Domain Name Filter by Lawrence Woodman](https://github.com/LawrenceWoodman/domain_name-liquid_filter): Filters the input text so that just the domain name is left
- [Jekyll Plugins by Recursive Design](http://recursive-design.com/projects/jekyll-plugins/): Plugin to generate Project pages from GitHub readmes, a Category page plugin, and a Sitemap generator
- [Pygments Cache Path by Raimonds Simanovskis](https://github.com/rsim/blog.rayapps.com/blob/master/_plugins/pygments_cache_patch.rb): Plugin to cache syntax-highlighted code from Pygments
- [Delicious Plugin by Christian Hellsten](https://github.com/christianhellsten/jekyll-plugins): Fetches and renders bookmarks from delicious.com.
- [Ultraviolet plugin by Steve Alex](https://gist.github.com/480380): Jekyll Plugin for Ultraviolet
- [Jade plugin by John Papandriopoulos](https://github.com/snappylabs/jade-jekyll-plugin): Jade Converter plugin for Jekyll
- [HAML plugin by Sam Z](https://gist.github.com/517556): HAML plugin for jekyll
- [ArchiveGenerator by Ilkka Laukkanen](https://gist.github.com/707909): Uses [this archive page](https://gist.github.com/707020) to generate archives
- [Tag Cloud Plugin by Ilkka Laukkanen](https://gist.github.com/710577): Jekyll tag cloud / tag pages plugin
- [HAML/SASS Converter by Adam Pearson](https://gist.github.com/481456): Simple haml-sass conversion for jekyll. [Fork](https://gist.github.com/528642) by Sam X
- [SASS scss Converter by Mark Wolfe](https://gist.github.com/960150): Jekyll Converter which uses the new css compatible syntax, based on the one written by Sam X.
- [GIT Tag by Alexandre Girard](https://gist.github.com/730347): Jekyll plugin to add Git activity inside a list
- [Draft/Publish Plugin by Michael Ivey](https://gist.github.com/49630)
- [Less.js generator by Andy Fowler](https://gist.github.com/642739): Jekyll plugin to render less.js files during generation.
- [Less Converter by Jason Graham](https://gist.github.com/639920): A Jekyll plugin to convert a .less file to .css
- [Less Converter by Josh Brown](https://gist.github.com/760265)

- [MathJax Liquid Tags by Jessy Cowan-Sharp](https://gist.github.com/834610): A simple liquid tag for Jekyll that converts and into inline math, and and into block equations, by replacing with the appropriate MathJax script tags.
- [Non-JS Gist Tag by Brandon Tilley](https://gist.github.com/1027674) A Liquid tag for Jekyll sites that allows embedding Gists and showing code for non-JavaScript enabled browsers and readers.
- [Growl Notification Generator by Tate Johnson](https://gist.github.com/490101)
- [Growl Notification Hook by Tate Johnson](https://gist.github.com/525267): Better alternative to the above, but requires his “hook” fork.
- [Version Reporter by Blake Smith](https://gist.github.com/449491)
- [Upcase Converter by Blake Smith](https://gist.github.com/449463)
- [Render Time Tag by Blake Smith](https://gist.github.com/449509)
- [Summarize Filter by Mathieu Arnold](https://gist.github.com/731597)
- [Status.net/OStatus Tag by phaer](https://gist.github.com/912466)
- [CoffeeScript converter by phaer](https://gist.github.com/959938): Put this file in `plugins` and write a YAML header to your .coffee files. See [http://coffeescript.org](http://coffeescript.org) for more info
- [Raw Tag by phaer.](https://gist.github.com/1020852): Keeps liquid from parsing text betweeen `{{ "{% raw " }}%}` and `{{ "{% endraw " }}%}`
- [URL encoding by James An](https://gist.github.com/919275)
- [Sitemap.xml Generator by Michael
Levin](https://github.com/kinnetica/jekyll-plugins)
- [Markdown references by Olov Lassus](https://github.com/olov/jekyll-references): Keep all your markdown reference-style link definitions in one file (_references.md)
- [Full-text search by Pascal Widdershoven](https://github.com/PascalW/jekyll_indextank): Add full-text search to your Jekyll site with this plugin and a bit of JavaScript.
- [Stylus Converter](https://gist.github.com/988201) Convert .styl to .css.
- [Embed.ly client by Robert Böhnke](https://github.com/robb/jekyll-embedly-client) Autogenerate embeds from URLs using oEmbed.
- [Logarithmic Tag Cloud](https://gist.github.com/2290195): Flexible. Logarithmic distribution. Documentation inline.
- [Related Posts by Lawrence Woodman](https://github.com/LawrenceWoodman/related_posts-jekyll_plugin): Overrides `site.related_posts` to use categories to assess relationship
- [AliasGenerator by Thomas Mango](https://github.com/tsmango/jekyll_alias_generator): Generates redirect pages for posts when an alias configuration is specified in the YAML Front Matter.
- [FlickrSetTag by Thomas Mango](https://github.com/tsmango/jekyll_flickr_set_tag): Generates image galleries from Flickr sets.
- [Projectlist by Frederic Hemberger](https://github.com/fhemberger/jekyll-projectlist): Loads all files from a directory and renders the entries into a single page, instead of creating separate posts.
- [Tiered Archives by Eli Naeher](https://gist.github.com/88cda643aa7e3b0ca1e5): creates a tiered template variable that allows you to create archives grouped by year and month.
- [oEmbed Tag by Tammo van Lessen](https://gist.github.com/1455726): enables easy content embedding (e.g. from YouTube, Flickr, Slideshare) via oEmbed.
- [Company website and blog plugins](https://github.com/flatterline/jekyll-plugins) by Flatterline, a [Ruby on Rails development company](http://flatterline.com/): portfolio/project page generator, team/individual page generator, author bio liquid template tag for use on posts and a few other smaller plugins.
- [Transform Layouts](https://gist.github.com/1472645) Monkey patching allowing HAML layouts (you need a HAML Converter plugin for this to work)
- [ReStructuredText converter](https://github.com/xdissent/jekyll-rst): Converts ReST documents to HTML with Pygments syntax highlighting.
- [Tweet Tag by Scott W. Bradley](https://github.com/scottwb/jekyll-tweet-tag): Liquid tag for [Embedded Tweets](https://dev.twitter.com/docs/embedded-tweets) using Twitter’s shortcodes
- [jekyll-localization](https://github.com/blackwinter/jekyll-localization): Jekyll plugin that adds localization features to the rendering engine.
- [jekyll-rendering](https://github.com/blackwinter/jekyll-rendering): Jekyll plugin to provide alternative rendering engines.
- [jekyll-pagination](https://github.com/blackwinter/jekyll-pagination): Jekyll plugin to extend the pagination generator.
- [jekyll-tagging](https://github.com/pattex/jekyll-tagging): Jekyll plugin to automatically generate a tag cloud and tag pages.
- [jekyll-contentblocks](https://github.com/rustygeldmacher/jekyll-contentblocks): Lets you use Rails-like content_for tags in your templates, for passing content from your posts up to your layouts.
- [Generate YouTube Embed (tag)](https://gist.github.com/1805814) by [joelverhagen](https://github.com/joelverhagen): Jekyll plugin which allows you to embed a YouTube video in your page with the YouTube ID. Optionally specify width and height dimensions. Like “oEmbed Tag” but just for YouTube.
- [JSON Filter](https://gist.github.com/1850654) by [joelverhagen](https://github.com/joelverhagen): filter that takes input text and outputs it as JSON. Great for rendering JavaScript.
- [jekyll-beastiepress](https://github.com/okeeblow/jekyll-beastiepress): FreeBSD utility tags for Jekyll sites.
- [jsonball](https://gist.github.com/1895282): reads json files and produces maps for use in jekylled files
- [bibjekyll](https://github.com/pablooliveira/bibjekyll): render BibTeX-formatted bibliographies/citations included in posts/pages using bibtex2html
- [jekyll-citation](https://github.com/archome/jekyll-citation): render BibTeX-formatted bibliographies/citations included in posts/pages (pure Ruby)
- [jekyll-scholar](https://github.com/inukshuk/jekyll-scholar): Jekyll extensions for the blogging scholar
- [jekyll-asset_bundler](https://github.com/moshen/jekyll-asset_bundler): bundles and minifies JavaScript and CSS
- [Jekyll Dribbble Set Tag](https://github.com/ericdfields/Jekyll-Dribbble-Set-Tag): builds Dribbble image galleries from any user
- [debbugs](https://gist.github.com/2218470): allows posting links to Debian BTS easily
- [refheap_tag](https://github.com/aburdette/refheap_tag): Liquid tag that allows embedding pastes from [refheap](https://refheap.com)
- [i18n_filter](https://github.com/gacha/gacha.id.lv/blob/master/_plugins/i18n_filter.rb): Liquid filter to use I18n localization.
- [singlepage-jekyll](https://github.com/JCB-K/singlepage-jekyll) by [JCB-K](https://github.com/JCB-K): turns Jekyll into a dynamic one-page website.
- [flickr](https://github.com/reagent/fleakr): Embed photos from flickr right into your posts.
- [jekyll-devonly_tag](https://gist.github.com/2403522): A block tag for including markup only during development.
- [Jekyll plugins by Aucor](https://github.com/aucor/jekyll-plugins): Plugins for eg. trimming unwanted newlines/whitespace and sorting pages by weight attribute.
- [jekyll-pandoc-plugin](https://github.com/dsanson/jekyll-pandoc-plugin): use pandoc for rendering markdown.
- [File compressor](https://gist.github.com/2758691) by [mytharcher](https://github.com/mytharcher): Compress HTML (\*.html) and JavaScript(\*.js) files when output.
- [smilify](https://github.com/SaswatPadhi/jekyll_smilify) by [SaswatPadhi](https://github.com/SaswatPadhi): Convert text emoticons in your content to themeable smiley pics. [Demo](http://saswatpadhi.github.com/)
- [jekyll-minibundle](https://github.com/tkareine/jekyll-minibundle): Asset bundling and cache busting using external minification tool of your choice, no gem dependencies.
- [JekyllGalleryTag](https://github.com/redwallhp/JekyllGalleryTag) by [redwallhp](https://github.com/redwallhp): Generates thumbnails from a directory of images and displays them in a grid with a Liquid tag.
- [Read in X Minutes](https://gist.github.com/zachleat/5792681) by [zachleat](https://github.com/zachleat): Estimates the reading time of a string (use for blog post content).
- [jekyll-assets](http://ixti.net/jekyll-assets/) by [ixti](https://github.com/ixti): Rails-alike assets pipeline (write assets in CoffeeScript, SASS, LESS etc; specify dependencies for automatic bundling using simple declarative comments in assets; minify and compress; use JST templates; cache bust; and many-many more).
- [jekyll-pandoc-multiple-formats](https://github.com/fauno/jekyll-pandoc-multiple-formats)
  by [edsl](https://github.com/edsl): Use pandoc to generate your site in
  multiple formats plus support for pandoc's markdown extensions.
- [Youku and Tudou Embed](https://gist.github.com/Yexiaoxing/5891929): Liquid plugin for
  embedding Youku and Tudou videos
- [jekyll-timeago](https://github.com/markets/jekyll-timeago): Time-ago Liquid filter
- [jekyll-swfobject](https://github.com/sectore/jekyll-swfobject): Liquid plugin for embedding Adobe Flash files (`*.swf`) using [SWFObject](http://code.google.com/p/swfobject/)

<div class="note info">
  <h5>Jekyll Plugins Wanted</h5>
  <p>
    If you have a Jekyll plugin that you would like to see added to this list,
    you should <a href="../contributing">read the contributing page</a> to find
    out how to make that happen.
  </p>
</div>
