# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vigilion/version"

Gem::Specification.new do |spec|
  spec.name          = "vigilion"
  spec.version       = Vigilion::VERSION
  spec.authors       = ["Bit Zesty Ltd"]
  spec.email         = ["help@vigilion.com"]
  spec.description   = "API client for Vigilion Anti-Virus & Malware file scanning service"
  spec.summary       = "API client for Vigilion Anti-Virus & Malware file scanning service"
  spec.homepage      = "https://github.com/vigilion/vigilion-ruby"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%q{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "faraday"
  spec.add_dependency "faraday_middleware"
  spec.add_dependency "faraday-detailed_logger"
  spec.add_dependency "addressable", "~> 2"

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "mocha"
  spec.add_development_dependency "shoulda"
end
