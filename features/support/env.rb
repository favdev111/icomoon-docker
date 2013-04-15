require 'fileutils'
require 'rr'
require 'test/unit'

World do
  include Test::Unit::Assertions
end

TEST_DIR    = File.join('/', 'tmp', 'jekyll')
JEKYLL_PATH = File.join(File.dirname(__FILE__), '..', '..', 'bin', 'jekyll')

def run_jekyll(opts = {})
  command = JEKYLL_PATH.clone
  command << " build"
  command << " --drafts" if opts[:drafts]
  command << " >> /dev/null 2>&1" if opts[:debug].nil?
  system command
end

def has_time_component?(date_string)
  date_string.split(" ").size > 1
end

# work around "invalid option: --format" cucumber bug (see #296)
Test::Unit.run = true if RUBY_VERSION < '1.9'
