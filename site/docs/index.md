---
layout: docs
title: Welcome
next_section: installation
permalink: /docs/home/
---

This site aims to be a comprehensive guide to Jekyll. We’ll cover topics such
as getting your site up and running, creating and managing your content,
customizing the way your site works and looks, deploying to various
environments, and give you some advice on participating in the future
development of Jekyll itself.

## So what is Jekyll, exactly?

Jekyll is a simple, blog-aware, static site generator. It takes a template
directory containing raw text files in various formats, runs it through
[Markdown](http://daringfireball.net/projects/markdown/) (or
[Textile](http://textile.sitemonks.com/)) and
[Liquid](http://wiki.shopify.com/Liquid)
converters, and spits out a complete, ready-to-publish static website suitable
for serving with your favorite web server. Jekyll also happens to be the engine
behind [GitHub Pages](http://pages.github.com), which means you can use Jekyll
to host your project’s page, blog, or website from GitHub’s servers **for
free**.

## Quick-start guide

For the impatient, here's how to get a boilerplate Jekyll site up and running.

{% highlight bash %}
~ $ gem install jekyll
~ $ jekyll new myblog
~ $ cd myblog
~/myblog $ jekyll serve
# => Now browse to http://localhost:4000
{% endhighlight %}

That's nothing, though. The real magic happens when you start creating blog
posts, using the front-matter to control templates and layouts, and taking
advantage of all the awesome configuration options Jekyll makes available.

## ProTips™, Notes, and Warnings

Throughout this guide there are a number of small-but-handy pieces of
information that can make using Jekyll easier, more interesting, and less
hazardous. Here’s what to look out for.

<div class="note">
  <h5>ProTips™ help you get more from Jekyll</h5>
  <p>These are tips and tricks that will help you be a Jekyll wizard!</p>
</div>

<div class="note info">
  <h5>Notes are handy pieces of information</h5>
  <p>These are for the extra tidbits sometimes necessary to understand
     Jekyll.</p>
</div>

<div class="note warning">
  <h5>Warnings help you not blow things up</h5>
  <p>Be aware of these messages if you wish to avoid certain death.</p>
</div>

If you come across anything along the way that we haven’t covered, or if you
know of a tip you think others would find handy, please [file an
issue](https://github.com/mojombo/jekyll/issues/new) and we’ll see about
including it in this guide.
