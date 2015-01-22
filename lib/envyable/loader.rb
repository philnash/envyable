module Envyable
  # Internal: Loads yaml files into ENV (or a supplied hash).
  class Loader
    # Internal: Returns the String or Pathname path of the loader
    attr_reader :path

    # Internal: Returns the Hash loadable of the loader
    attr_reader :loadable

    # Internal: initalize a Loader
    #
    # path      - a Pathname or String that describes where the yaml file
    #             resides.
    # loadable  - a Hash or hashlike structure that the yaml file variables
    #             should be loaded into (default: ENV).
    def initialize(path, loadable=ENV)
      @path = path
      @loadable = loadable
    end

    # Internal: perform the loading from the given environment
    #
    # environment - a String describing the environment from which to load the
    #               variables (default: development).
    #
    # Examples
    #
    # load('production')
    #
    # Returns nothing.
    def load(environment='development')
      if @yml ||= load_yml
        return unless @yml[environment]
        @yml[environment].each { |key, value| set_value(key, value) }
      end
    end

    private

    def load_yml
      yml_path = File.expand_path(@path)
      return nil unless File.exists?(yml_path)
      YAML.load_file(yml_path)
    end

    def set_value(key, value)
      @loadable[key.to_s] = value.to_s
    end
  end
end
