# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jekyll/version'

Gem::Specification.new do |s|
  s.specification_version = 2 if s.respond_to? :specification_version=
  s.required_rubygems_version = Gem::Requirement.new('>= 0') if s.respond_to? :required_rubygems_version=
  s.rubygems_version = '2.2.2'
  s.required_ruby_version = '>= 2.0.0'

  s.name          = 'jekyll'
  s.version       = Jekyll::VERSION
  s.license       = 'MIT'

  s.summary       = 'A simple, blog aware, static site generator.'
  s.description   = 'Jekyll is a simple, blog aware, static site generator.'

  s.authors       = ['Tom Preston-Werner']
  s.email         = 'tom@mojombo.com'
  s.homepage      = 'https://github.com/jekyll/jekyll'

  all_files       = `git ls-files -z`.split("\x0")
  s.files         = all_files.grep(%r{^(exe|lib)/|^.rubocop.yml$})
  s.executables   = all_files.grep(%r{^exe/}) { |f| File.basename(f) }
  s.bindir        = "exe"
  s.require_paths = ['lib']

  s.rdoc_options = ['--charset=UTF-8']
  s.extra_rdoc_files = %w[README.markdown LICENSE]

  s.add_runtime_dependency('liquid',    '~> 3.0')
  s.add_runtime_dependency('kramdown',  '~> 1.3')
  s.add_runtime_dependency('mercenary', '~> 0.3.3')
  s.add_runtime_dependency('safe_yaml', '~> 1.0')
  s.add_runtime_dependency('colorator', '~> 1.0')
  s.add_runtime_dependency('rouge', '~> 1.7')
  s.add_runtime_dependency('jekyll-sass-converter', '~> 1.0')
  s.add_runtime_dependency('jekyll-watch', '~> 1.1')
  s.add_runtime_dependency("pathutil", "~> 0.9")
  s.add_runtime_dependency('addressable', '~> 2.4')
end
