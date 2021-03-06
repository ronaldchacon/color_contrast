# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_contrast/version'

Gem::Specification.new do |spec|
  spec.name          = "color_contrast"
  spec.version       = ColorContrast::VERSION
  spec.authors       = ["Ronald Chacon"]
  spec.email         = ["ronald.chacon87@gmail.com"]

  spec.summary       = %q{Calculate contrasting color}
  spec.homepage      = "https://github.com/ronaldchacon/color_contrast"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 12.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
end
