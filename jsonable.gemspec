# frozen_string_literal: true

require_relative "lib/jsonable/version"

Gem::Specification.new do |spec|
  spec.name = "jsonable"
  spec.version = Jsonable::VERSION
  spec.authors = ["kinjouj"]
  spec.email = ["kinjouj@gmail.com"]

  spec.summary = "a private use object to json"
  spec.description = spec.summary
  spec.homepage = "https://kinjouj.github.io"
  spec.required_ruby_version = ">= 3.1.0"
  spec.files = Dir["lib/**/*"]
  spec.require_paths = ["lib"]
end
