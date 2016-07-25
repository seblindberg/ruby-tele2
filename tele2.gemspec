# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tele2/version'

Gem::Specification.new do |spec|
  spec.name          = "tele2"
  spec.version       = Tele2::VERSION
  spec.authors       = ["Sebastian Lindberg"]
  spec.email         = ["seb.lindberg@gmail.com"]

  spec.summary       = %q{Library and executable for downloading usage from Tele2.}
  #spec.description   = %q{TODO: Write a longer description or delete this line.}
  #spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency "mechanize", "~> 2.7"
  spec.add_dependency "dotenv", "~> 2.1"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
  spec.add_development_dependency "coveralls", "~> 0.8"
end
