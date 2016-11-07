require 'fileutils'
require 'rubygems'
begin
  require 'simplecov'
  require 'codeclimate-test-reporter'
  SimpleCov.start do
    formatter SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::HTMLFormatter,
      CodeClimate::TestReporter::Formatter
    ])
    add_filter '/spec/'
  end
rescue LoadError
  require 'logger'
  logger = Logger.new('./log/test.log')
  logger.info 'Couldn\'t load simplecov or codeclimate-test-reporter. Check ' \
              'your dependencies.'
end

gem 'minitest'
require 'minitest/autorun'

require File.join(File.dirname(__FILE__), '..', 'lib', 'envyable')

def destination_root(opts={})
  dir = File.join(File.dirname(__FILE__), 'sandbox')
  FileUtils.mkdir_p(dir)
  FileUtils.touch("#{dir}/.gitignore") if opts[:with_gitignore]
  if opts[:with_spring_rb]
    FileUtils.mkdir_p("#{dir}/config")
    FileUtils.touch("#{dir}/config/spring.rb")
  end
  if opts[:with_spring_bin]
    FileUtils.mkdir_p("#{dir}/bin")
    FileUtils.touch("#{dir}/bin/spring")
  end
  dir
end
