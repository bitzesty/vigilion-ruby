# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "vigilion/version"

Gem::Specification.new do |s|
  s.name          = "vigilion"
  s.version       = Vigilion::VERSION
  s.authors       = ["Bit Zesty Ltd"]
  s.email         = ["help@vigilion.com"]
  s.description   = "API client for Vigilion Anti-Virus & Malware file scanning service"
  s.summary       = "API client for Vigilion Anti-Virus & Malware file scanning service"
  s.homepage      = "https://github.com/vigilion/vigilion-ruby"
  s.license       = "MIT"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%q{^bin/}) { |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "faraday"
  s.add_dependency "faraday_middleware"

  s.add_development_dependency "rake"
end
