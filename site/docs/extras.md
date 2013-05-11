---
layout: docs
title: Extras
prev_section: plugins
next_section: github-pages
permalink: /docs/extras/
---

There are a number of (optional) extra features that Jekyll supports that you
may want to install, depending on how you plan to use Jekyll.

## LaTeX Support

Maruku comes with optional support for LaTeX to PNG rendering via blahtex
(Version 0.6) which must be in your `$PATH` along with `dvips`. If you need
Maruku to not assume a fixed location for `dvips`, check out [Remi’s Maruku
fork](http://github.com/remi/maruku).

## RDiscount

If you prefer to use [RDiscount](http://github.com/rtomayko/rdiscount) instead
of [Maruku](http://maruku.rubyforge.org/) for markdown, just make sure you have
it installed:

{% highlight bash %}
$ sudo gem install rdiscount
{% endhighlight %}

And then specify RDiscount as the Markdown engine in your `_config.yml` file to
have Jekyll run with that option.

{% highlight bash %}
# In _config.yml
markdown: rdiscount
{% endhighlight %}
