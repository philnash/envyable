require 'yaml'
require 'envyable/version'
require 'envyable/railtie' if defined?(Rails)

module Envyable
  def self.load(path, env='development')
    yml = File.expand_path(path)
    if File.exists? yml
      Array(YAML.load_file(yml)[env]).each do |key,value|
        ENV[key.to_s] = value.to_s
      end
    end
  end
end
