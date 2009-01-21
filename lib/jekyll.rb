$:.unshift File.dirname(__FILE__)     # For use/testing when no gem is installed

# rubygems
require 'rubygems'

# core
require 'fileutils'
require 'time'
require 'yaml'

# stdlib

# 3rd party
require 'liquid'
require 'redcloth'
begin
  require 'maruku'
  require 'maruku/ext/math'
  # Switch off MathML output
  MaRuKu::Globals[:html_math_output_mathml] = false
  MaRuKu::Globals[:html_math_engine] = 'none'

  # Turn on math to PNG support with blahtex
  # Resulting PNGs stored in `images/latex`
  MaRuKu::Globals[:html_math_output_png] = true
  MaRuKu::Globals[:html_png_engine] =  'blahtex'
  MaRuKu::Globals[:html_png_dir] = 'images/latex'
  MaRuKu::Globals[:html_png_url] = '/images/latex/'
rescue LoadError
  puts "The maruku gem is required for markdown support!"
end

# internal requires
require 'jekyll/core_ext'
require 'jekyll/site'
require 'jekyll/convertible'
require 'jekyll/layout'
require 'jekyll/page'
require 'jekyll/post'
require 'jekyll/filters'
require 'jekyll/tags/highlight'
require 'jekyll/tags/include'
require 'jekyll/albino'

module Jekyll
  VERSION = '0.3.0'
  
  class << self
    attr_accessor :source, :dest, :lsi, :pygments, :markdown_proc, :content_type, :permalink_style
  end
  
  Jekyll.lsi = false
  Jekyll.pygments = false
  Jekyll.markdown_proc = Proc.new { |x| Maruku.new(x).to_html }
  Jekyll.permalink_style = :date
  
  def self.process(source, dest)
    require 'classifier' if Jekyll.lsi
    
    Jekyll.source = source
    Jekyll.dest = dest
    Jekyll::Site.new(source, dest).process
  end
end
