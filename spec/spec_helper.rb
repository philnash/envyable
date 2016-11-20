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

def make_dir_and_create_file(base_dir, dir, file)
  FileUtils.mkdir_p("#{base_dir}/#{dir}")
  FileUtils.touch("#{base_dir}/#{dir}/#{file}")
end

def destination_root(opts = {})
  base_dir = File.join(File.dirname(__FILE__), 'sandbox')
  FileUtils.mkdir_p(base_dir)
  FileUtils.touch("#{base_dir}/.gitignore") if opts[:with_gitignore]
  if opts[:with_spring_rb]
    make_dir_and_create_file(base_dir, "config", "spring.rb")
  end
  if opts[:with_spring_bin]
    make_dir_and_create_file(base_dir, "bin", "spring")
  end
  base_dir
end
