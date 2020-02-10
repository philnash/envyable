# frozen_string_literal: true

require 'yaml'
require 'envyable/loader'
require 'envyable/version'
require 'envyable/railtie' if defined?(Rails)

# Public: A simple yaml to ENV loader.
module Envyable
  # Public: load the yaml file from path and set the variables in the given
  # environment to the ENV.
  #
  # path        - a Pathname or String that describes where the yaml file
  #               resides.
  # environment - a String describing the environment from which to load the
  #               variables (default: development).
  #
  # Examples
  #
  #   Envyable.load('config/env.yml')
  #
  #   Envyable.load('config/application.yml', 'production')
  #
  # Returns nothing.
  def self.load(path, environment = 'development')
    Loader.new(path).load(environment)
  end
end
