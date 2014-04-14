# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cloopen/version'

Gem::Specification.new do |spec|
  spec.name          = 'cloopen_rest'
  spec.version       = Cloopen::REST::VERSION
  spec.authors       = ['fahchen']
  spec.email         = ['dev.fah@gmail.com']
  spec.description   = %q{the ruby wrapper of cloopen rest}
  spec.summary       = %q{cloopen rest}
  spec.homepage      = 'http://fahchen.github.io/cloopen_rest/'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 0'
  spec.add_dependency 'rest-client', '~> 0'
  spec.add_dependency 'json', '~> 1.8'
  spec.add_dependency 'multi_xml', '~> 0.5', '>= 0.5.2'
  spec.add_dependency 'builder', '~> 2.0'
end
