# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'faraday_character_encoding/version'

Gem::Specification.new do |spec|
  spec.name          = "faraday_character_encoding"
  spec.version       = FaradayCharacterEncoding::VERSION
  spec.authors       = ["Colin Gagon"]
  spec.email         = ["cgagon@turbosquid.com"]
  spec.description   = %q{Sets string encoding of response body to match charset}
  spec.summary       = %q{Provides Faraday middleware for handling response body string encoding}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'faraday'

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
