# encoding: UTF-8
lib = File.expand_path('../lib/', __FILE__)
$LOAD_PATH.unshift lib unless $LOAD_PATH.include?(lib)

require 'spree_analysis/version'

Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_analysis'
  s.version     = SpreeAnalysis.version
  s.summary     = 'A spree extension that provides detailed analysis reports on commerce metrics'
  s.description = 'It provides detailed analysis reports using chartJS, that is useful for building right stragery for marketing, finding lacks and areas to make improve on'
  s.required_ruby_version = '>= 2.5'

  s.author    = 'Rahul Singh'
  s.email     = 'radolf@bluebash.co'
  s.homepage  = 'https://github.com/spree-edge/spree_analysis'
  s.license = 'BSD-3-Clause'

  s.files       = `git ls-files`.split("\n").reject { |f| f.match(/^spec/) && !f.match(/^spec\/fixtures/) }
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree', '>= 4.4.0'
  s.add_dependency 'spree_extension'

  s.add_development_dependency 'spree_dev_tools'
end
