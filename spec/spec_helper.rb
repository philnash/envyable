require 'fileutils'
require 'rubygems'
begin
  require 'simplecov'
  SimpleCov.start do
    formatter SimpleCov::Formatter::HTMLFormatter
    add_filter '/spec/'
  end
rescue LoadError
  require 'logger'
  logger = Logger.new('./log/test.log')
  logger.info "Couldn't load simplecov. Check your dependencies."
end

gem 'minitest'
require 'minitest/autorun'

require File.join(File.dirname(__FILE__), '..', 'lib', 'envyable')

def make_dir_and_create_file(root, dir, file)
  FileUtils.mkdir_p("#{root}/#{dir}")
  FileUtils.touch("#{root}/#{dir}/#{file}")
end

def destination_root(opts = {})
  root = File.join(File.dirname(__FILE__), 'sandbox')
  FileUtils.mkdir_p(root)
  FileUtils.touch("#{root}/.gitignore") if opts[:with_gitignore]
  make_dir_and_create_file(root, "config", "spring.rb") if opts[:with_spring_rb]
  make_dir_and_create_file(root, "bin", "spring") if opts[:with_spring_bin]
  root
end
