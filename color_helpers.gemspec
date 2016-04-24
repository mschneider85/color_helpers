# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "color_helpers"
  spec.version       = ColorHelpers::VERSION
  spec.authors       = ["Martin Schneider"]
  spec.email         = ["mschneider85@gmx.de"]

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  end

  spec.summary       = %q{View helpers for hex color brightness adjustments.}
  spec.homepage      = "https://github.com/mschneider85/color_helpers"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "actionview", '~> 4.2', '>= 4.2.6'

  spec.add_development_dependency "bundler", "~> 1.8"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
