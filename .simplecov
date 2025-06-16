# frozen_string_literal: true

require "simplecov-tailwindcss"
SimpleCov.formatter = SimpleCov::Formatter::TailwindFormatter
SimpleCov.start do
  add_filter "/spec/"
  enable_coverage :branch
end
