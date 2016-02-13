require "thor"

module Envyable
  class CLI < Thor
    include Thor::Actions

    namespace :envyable

    desc "install", "Installs Envyable with sensible defaults"
    def install
      create_file("config/env.yml")
      create_file("config/env.yml.example")
      if File.exists?("#{destination_root}.gitignore")
        append_to_file(".gitignore") do
          "\n# Don't check in credentials \nconfig/env.yml"
        end
      end
    end
  end
end
