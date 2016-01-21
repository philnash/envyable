require 'envyable'

module Envyable
  class Railtie < Rails::Railtie
    initializer "envyable.load", :before => :load_environment_config do
      load
    end

    def load
      Envyable.load root.join('config', 'env.yml'), Rails.env
    end

    # Fallback of ENV variable or current directory because
    # Rails 4.1+ returns nil for Rails.root prior to app initialization
    def root
      Rails.root || Pathname.new(ENV["RAILS_ROOT"] || Dir.pwd)
    end

    # Avoid Rails calling `Kernel#load` via #method_mising
    def self.load
      instance.load
    end
  end
end
