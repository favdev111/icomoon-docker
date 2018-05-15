# frozen_string_literal: true

source "https://rubygems.org"
gemspec :name => "jekyll"

gem "rake", "~> 12.0"

group :development do
  gem "launchy", "~> 2.3"
  gem "pry"

  unless RUBY_ENGINE == "jruby"
    gem "pry-byebug"
  end
end

#

group :test do
  gem "codeclimate-test-reporter", "~> 1.0.5"
  gem "cucumber", "~> 3.0"
  gem "httpclient"
  gem "jekyll_test_plugin"
  gem "jekyll_test_plugin_malicious"
  gem "nokogiri", "~> 1.7"
  gem "rspec"
  gem "rspec-mocks"
  gem "rubocop", "~> 0.56.0"
  gem "test-dependency-theme", :path => File.expand_path("test/fixtures/test-dependency-theme", __dir__)
  gem "test-theme", :path => File.expand_path("test/fixtures/test-theme", __dir__)

  gem "jruby-openssl" if RUBY_ENGINE == "jruby"
end

#

group :test_legacy do
  if RUBY_PLATFORM =~ %r!cygwin!
    gem "test-unit"
  end

  gem "minitest"
  gem "minitest-profile"
  gem "minitest-reporters"
  gem "shoulda"
  gem "simplecov"
end

#

group :benchmark do
  if ENV["BENCHMARK"]
    gem "benchmark-ips"
    gem "rbtrace"
    gem "ruby-prof"
    gem "stackprof"
  end
end

#

group :jekyll_optional_dependencies do
  gem "coderay", "~> 1.1.0"
  gem "jekyll-coffeescript"
  gem "jekyll-docs", :path => "../docs" if Dir.exist?("../docs") && ENV["JEKYLL_VERSION"]
  gem "jekyll-feed", "~> 0.9"
  gem "jekyll-gist"
  gem "jekyll-paginate"
  gem "jekyll-redirect-from"
  gem "kramdown", "~> 1.14"
  gem "mime-types", "~> 3.0"
  gem "rdoc", "~> 6.0"
  gem "tomlrb", "~> 1.2"

  platform :ruby, :mswin, :mingw, :x64_mingw do
    gem "classifier-reborn", "~> 2.2.0"
    gem "liquid-c", "~> 3.0"
    gem "pygments.rb", "~> 1.0"
    gem "yajl-ruby", "~> 1.3"
  end

  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem "tzinfo-data", :platforms => [:mingw, :mswin, :x64_mingw, :jruby]
end

#

group :site do
  if ENV["PROOF"]
    gem "html-proofer", "~> 3.4"
  end

  gem "jekyll-avatar"
  gem "jekyll-mentions"
  gem "jekyll-seo-tag"
  gem "jekyll-sitemap"
  gem "jemoji"
end
