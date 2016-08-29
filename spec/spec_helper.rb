require 'rubygems'
begin
  require "simplecov"
  require "codeclimate-test-reporter"
  SimpleCov.start do
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
      CodeClimate::TestReporter::Formatter
    ])
  end
rescue LoadError
end

gem 'minitest'
require 'minitest/autorun'

require File.join(File.dirname(__FILE__), '..', 'lib', 'envyable')
