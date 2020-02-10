# frozen_string_literal: true
# coding: utf-8

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'envyable/version'

Gem::Specification.new do |spec|
  spec.name          = "envyable"
  spec.version       = Envyable::VERSION
  spec.authors       = ["Phil Nash"]
  spec.email         = ["philnash@gmail.com"]
  spec.description   = %q{The simplest yaml to ENV config loader}
  spec.summary       = %q{The simplest yaml to ENV config loader}
  spec.homepage      = "https://github.com/philnash/envyable"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", ">= 0.18.1", "< 2.0"

  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "rake"
end
