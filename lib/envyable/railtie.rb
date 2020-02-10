# frozen_string_literal: true

require 'envyable'

module Envyable
  # Internal: Automatically run Envyable.load before the Rails application loads
  # it's environment based config.
  class Railtie < Rails::Railtie
    # Internal: sets up the initializer to run when the Railtie is run.
    initializer 'envyable.load', before: :load_environment_config do
      load
    end

    # Internal: loads Envyable using the default config/env.yml location and the
    # current Rails environment.
    def load
      Envyable.load root.join('config', 'env.yml'), Rails.env
    end

    # Fallback of ENV variable or current directory because
    # Rails 4.1+ returns nil for Rails.root prior to app initialization
    def root
      Rails.root || Pathname.new(ENV['RAILS_ROOT'] || Dir.pwd)
    end

    # Avoid Rails calling `Kernel#load` via #method_mising
    def self.load
      instance.load
    end
  end
end
