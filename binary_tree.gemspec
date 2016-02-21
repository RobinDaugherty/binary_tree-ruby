# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'binary_tree/version'

Gem::Specification.new do |spec|
  spec.name          = "binary_tree"
  spec.version       = BinaryTree::VERSION
  spec.authors       = ["Robin Daugherty"]
  spec.email         = ["robin@robindaugherty.net"]
  spec.summary       = %q{Binary Tree implementations for Ruby.}
  spec.description   = %q{Data structures for Ruby that use binary trees for storage.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
