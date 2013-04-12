$:.unshift File.dirname(__FILE__) # For use/testing when no gem is installed

# Require all of the Ruby files in the given directory.
#
# path - The String relative path from here to the directory.
#
# Returns nothing.
def require_all(path)
  glob = File.join(File.dirname(__FILE__), path, '*.rb')
  Dir[glob].each do |f|
    require f
  end
end

# rubygems
require 'rubygems'

# stdlib
require 'fileutils'
require 'time'
require 'safe_yaml'
require 'English'

# 3rd party
require 'liquid'
require 'maruku'
require 'pygments'

# internal requires
require 'jekyll/core_ext'
require 'jekyll/configuration'
require 'jekyll/site'
require 'jekyll/convertible'
require 'jekyll/layout'
require 'jekyll/page'
require 'jekyll/post'
require 'jekyll/draft'
require 'jekyll/filters'
require 'jekyll/static_file'
require 'jekyll/errors'

# extensions
require 'jekyll/plugin'
require 'jekyll/converter'
require 'jekyll/generator'
require 'jekyll/command'

require_all 'jekyll/commands'
require_all 'jekyll/converters'
require_all 'jekyll/generators'
require_all 'jekyll/tags'

SafeYAML::OPTIONS[:suppress_warnings] = true

module Jekyll
  VERSION = '1.0.0.beta4'

  # Public: Generate a Jekyll configuration Hash by merging the default
  # options with anything in _config.yml, and adding the given options on top.
  #
  # override - A Hash of config directives that override any options in both
  #            the defaults and the config file. See Jekyll::Configuration::DEFAULTS for a
  #            list of option names and their defaults.
  #
  # Returns the final configuration Hash.
  def self.configuration(override)
    # Convert any symbol keys to strings and remove the old key/values
    override = override.reduce({}) { |hsh,(k,v)| hsh.merge(k.to_s => v) }

    # _config.yml may override default source location, but until
    # then, we need to know where to look for _config.yml
    source = override['source'] || Jekyll::DEFAULTS['source']

    # Get configuration from <source>/_config.yml or <source>/<config_file>
    config_files = override.delete('config')
    config_files = File.join(source, "_config.yml") if config_files.to_s.empty?
    unless config_files.is_a? Array
      config_files = [config_files]
    end

    begin
      config = {}
      config_files.each do |config_file|
        next_config = YAML.safe_load_file(config_file)
        raise "Configuration file: (INVALID) #{config_file}" if !next_config.is_a?(Hash)
        $stdout.puts "Configuration file: #{config_file}"
        config = config.deep_merge(next_config)
      end
    rescue SystemCallError
      # Errno:ENOENT = file not found
      $stderr.puts "Configuration file: none"
      config = {}
    rescue => err
      $stderr.puts "           " +
                   "WARNING: Error reading configuration. " +
                   "Using defaults (and options)."
      $stderr.puts "#{err}"
      config = {}
    end

    # Provide backwards-compatibility
    if config['auto']
      $stderr.puts "Deprecation: ".rjust(20) + "'auto' has been changed to " +
                   "'watch'. Please update your configuration to use 'watch'."
      config['watch'] = config['auto']
    end

    # Merge DEFAULTS < _config.yml < override
    Jekyll::DEFAULTS.deep_merge(config).deep_merge(override)
  end
end
