$stdout.puts "# -------------------------------------------------------------"
$stdout.puts "# SPECS AND TESTS ARE RUNNING WITH WARNINGS OFF."
$stdout.puts "# SEE: https://github.com/Shopify/liquid/issues/730"
$stdout.puts "# SEE: https://github.com/jekyll/jekyll/issues/4719"
$stdout.puts "# -------------------------------------------------------------"
$VERBOSE = nil

def jruby?
  defined?(RUBY_ENGINE) && RUBY_ENGINE == "jruby"
end

if ENV["CI"]
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
else
  require File.expand_path("../simplecov_custom_profile", __FILE__)
  SimpleCov.start "gem" do
    add_filter "/vendor/gem"
    add_filter "/vendor/bundle"
    add_filter ".bundle"
  end
end

require "nokogiri"
require "rubygems"
require "ostruct"
require "minitest/autorun"
require "minitest/reporters"
require "minitest/profile"
require "rspec/mocks"
require_relative "../lib/jekyll.rb"

Jekyll.logger = Logger.new(StringIO.new)

unless jruby?
  require "rdiscount"
  require "redcarpet"
end

require "kramdown"
require "shoulda"

include Jekyll

# Report with color.
Minitest::Reporters.use! [
  Minitest::Reporters::DefaultReporter.new(
    :color => true
  )
]

module Minitest::Assertions
  def assert_exist(filename, msg = nil)
    msg = message(msg) { "Expected '#{filename}' to exist" }
    assert File.exist?(filename), msg
  end

  def refute_exist(filename, msg = nil)
    msg = message(msg) { "Expected '#{filename}' not to exist" }
    refute File.exist?(filename), msg
  end
end

module DirectoryHelpers
  def dest_dir(*subdirs)
    test_dir("dest", *subdirs)
  end

  def source_dir(*subdirs)
    test_dir("source", *subdirs)
  end

  def test_dir(*subdirs)
    File.join(File.dirname(__FILE__), *subdirs)
  end
end

class JekyllUnitTest < Minitest::Test
  include ::RSpec::Mocks::ExampleMethods
  include DirectoryHelpers
  extend DirectoryHelpers

  def mu_pp(obj)
    s = obj.is_a?(Hash) ? JSON.pretty_generate(obj) : obj.inspect
    s = s.encode Encoding.default_external if defined? Encoding
    s
  end

  def mocks_expect(*args)
    RSpec::Mocks::ExampleMethods::ExpectHost.instance_method(:expect)\
      .bind(self).call(*args)
  end

  def before_setup
    RSpec::Mocks.setup
    super
  end

  def after_teardown
    super
    RSpec::Mocks.verify
  ensure
    RSpec::Mocks.teardown
  end

  def fixture_site(overrides = {})
    Jekyll::Site.new(site_configuration(overrides))
  end

  def default_configuration
    Marshal.load(Marshal.dump(Jekyll::Configuration::DEFAULTS))
  end

  def build_configs(overrides, base_hash = default_configuration)
    Utils.deep_merge_hashes(base_hash, overrides)
  end

  def site_configuration(overrides = {})
    full_overrides = build_configs(overrides, build_configs({
      "destination" => dest_dir,
      "incremental" => false
    }))
    Configuration.from(full_overrides.merge({
      "source" => source_dir
    }))
  end

  def clear_dest
    FileUtils.rm_rf(dest_dir)
    FileUtils.rm_rf(source_dir(".jekyll-metadata"))
  end

  def directory_with_contents(path)
    FileUtils.rm_rf(path)
    FileUtils.mkdir(path)
    File.open("#{path}/index.html", "w") { |f| f.write("I was previously generated.") }
  end

  def with_env(key, value)
    old_value = ENV[key]
    ENV[key] = value
    yield
    ENV[key] = old_value
  end

  def capture_output
    stderr = StringIO.new
    Jekyll.logger = Logger.new stderr
    yield
    stderr.rewind
    return stderr.string.to_s
  end
  alias_method :capture_stdout, :capture_output
  alias_method :capture_stderr, :capture_output

  def nokogiri_fragment(str)
    Nokogiri::HTML.fragment(
      str
    )
  end
end
