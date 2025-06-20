# frozen_string_literal: true

require "bundler/setup"
Bundler.require

require "simplecov"
require "simplecov-tailwindcss"
SimpleCov.formatter = SimpleCov::Formatter::TailwindFormatter
SimpleCov.start do
  add_filter "/spec/"
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
