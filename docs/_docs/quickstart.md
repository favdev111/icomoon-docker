---
layout: docs
title: Quick-start guide
permalink: /docs/quickstart/
---

For the impatient, here's how to get a boilerplate Jekyll site up and running.

```sh
~ $ gem install jekyll bundler
~ $ jekyll new myblog
~ $ cd myblog
~/myblog $ bundle exec jekyll serve
# => Now browse to http://localhost:4000
```

The `jekyll new` command now automatically initiates `bundle install` and installs the dependencies required. To skip this, pass `--skip-bundle` option like so `jekyll new myblog --skip-bundle`.

If you wish to install jekyll into an existing directory, you can do so by running `jekyll new .` from within the directory instead of creating a new one. If the existing directory isn't empty, you'll also have to pass the `--force` option like so `jekyll new . --force`.

That's nothing, though. The real magic happens when you start creating blog
posts, using the front matter to control templates and layouts, and taking
advantage of all the awesome configuration options Jekyll makes available.

If you're running into problems, ensure you have all the [requirements
installed][Installation].

[Installation]: /docs/installation/
