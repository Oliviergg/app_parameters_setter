# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'app_parameters_setter/version'

Gem::Specification.new do |spec|
  spec.name          = "app_parameters_setter"
  spec.version       = AppParametersSetter::VERSION
  spec.authors       = ["Olivier Gosse-Gardet"]
  spec.email         = ["olivier.gosse.gardet@gmail.com"]
  spec.description   = %q{ceci est une description}
  spec.summary       = %q{ceci est un résumé}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
