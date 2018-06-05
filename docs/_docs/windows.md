---
title: Jekyll on Windows
permalink: /docs/windows/
---

While Windows is not an officially-supported platform, it can be used to run Jekyll with the proper tweaks. This page aims to collect some of the general knowledge and lessons that have been unearthed by Windows users.


## Installing Jekyll
The easiest way to run Jekyll is by using the [RubyInstaller][] for Windows.

### Installation via RubyInstaller

[RubyInstaller][] is a self-contained Windows-based installer that includes the Ruby language, an execution environment, important documentation, and more.
We only cover RubyInstaller-2.4 and newer here, older versions need to [install the Devkit][Devkit-install] manually.

1. Download and Install a **Ruby+Devkit** version from [RubyInstaller Downloads][RubyInstaller-downloads].
   Use default options for installation.
2. Open a new command prompt window from the start menu, so that changes to the `PATH` environment variable becomes effective.
   Install Jekyll and Bundler via: `gem install jekyll bundler`
3. Check if Jekyll installed properly: `jekyll -v`

That's it, you're ready to install our [default minimal blog theme](https://github.com/jekyll/minima) with `jekyll new jekyll-website`.

[RubyInstaller]: https://rubyinstaller.org/
[RubyInstaller-downloads]: https://rubyinstaller.org/downloads/
[Devkit-install]: https://github.com/oneclick/rubyinstaller/wiki/Development-Kit


### Encoding

If you use UTF-8 encoding, make sure that no `BOM` header characters exist in your files or very, very bad things will happen to
Jekyll. This is especially relevant when you're running Jekyll on Windows.

Additionally, you might need to change the code page of the console window to UTF-8 in case you get a "Liquid Exception: Incompatible character encoding" error during the site generation process. It can be done with the following command:

```sh
chcp 65001
```


### Time-Zone Management

Since Windows doesn't have a native source of zoneinfo data, the Ruby Interpreter would not understand IANA Timezones and hence using them had the `TZ` environment variable default to UTC/GMT 00:00.
Though Windows users could alternatively define their blog's timezone by setting the key to use POSIX format of defining timezones, it wasn't as user-friendly when it came to having the clock altered to changing DST-rules.

Jekyll now uses a rubygem to internally configure Timezone based on established [IANA Timezone Database][IANA-database].
While 'new' blogs created with Jekyll v3.4 and greater, will have the following added to their 'Gemfile' by default, existing sites *will* have to update their 'Gemfile' (and installed) to enable development on Windows:

```ruby
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
```

[IANA-database]: https://en.wikipedia.org/wiki/List_of_tz_database_time_zones

### Auto Regeneration

Jekyll uses the `listen` gem to watch for changes when the `--watch` switch is specified during a build or serve. While `listen` has built-in support for UNIX systems, it may require an extra gem for compatibility with Windows.

Add the following to the Gemfile for your site if you have issues with auto-regeneration on Windows alone:

```ruby
gem 'wdm', '~> 0.1.1' if Gem.win_platform?
```

You have to use a [Ruby+Devkit](https://rubyinstaller.org/downloads/) version of the RubyInstaller.


## Installation via Bash on Windows 10

If you are using Windows 10 version 1607 or later, another option to run Jekyll is by [installing][WSL-Guide] the Windows Subsystem for Linux.


*Note:* You must have [Windows Subsystem for Linux][BASH-WSL] enabled.

First let's make sure all our packages / repositories are up to date. Open a new Command Prompt instance, and type the following:

```sh
bash
```
Your Command Prompt instance should now be a Bash instance. Now we must update our repo lists and packages.

```sh
sudo apt-get update -y && sudo apt-get upgrade -y
```
Now we can install Ruby. To do this we will use a repository from [BrightBox](https://www.brightbox.com/docs/ruby/ubuntu/), which hosts optimized versions of Ruby for Ubuntu.

```sh
sudo apt-add-repository ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get install ruby2.4 ruby2.4-dev build-essential dh-autoreconf
```

Next let's update our Ruby gems:

```sh
sudo gem update
```

Now all that is left to do is install Jekyll.

```sh
sudo gem install jekyll bundler
```

Check if Jekyll installed properly by running:

```sh
jekyll -v
```

Configure the bundler/gem path so bundle doesn't prompt for sudo

```sh
bundle config path vendor/bundle
```

**And that's it!**

To start a new project named `my_blog`, just run:

```sh
jekyll new my_blog
```

You can make sure time management is working properly by inspecting your `_posts` folder. You should see a markdown file with the current date in the filename.

<div class="note info">
  <h5>Non-superuser account issues</h5>
  <p>If the `jekyll new` command prints the error "Your user account isn't allowed to install to the system RubyGems", see the "Running Jekyll as Non-Superuser" instructions in <a href="/docs/troubleshooting/#no-sudo">Troubleshooting</a>.</p>
</div>

**Note:** Bash on Ubuntu on Windows is still under development, so you may run into issues.

[WSL-Guide]: https://msdn.microsoft.com/en-us/commandline/wsl/install_guide
[BASH-WSL]: https://msdn.microsoft.com/en-us/commandline/wsl/about

