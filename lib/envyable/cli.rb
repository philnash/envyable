require 'thor'

module Envyable
  # Internal: class that runs the command line interface. This is loaded in
  # bin/cli and the actions are provided by Thor.
  class CLI < Thor
    include Thor::Actions

    namespace :envyable

    desc 'install', 'Installs Envyable with sensible defaults'
    def install
      create_file('config/env.yml')
      create_file('config/env.yml.example')
      if File.exist?("#{destination_root}/.gitignore")
        append_to_file('.gitignore') do
          "\n# Don't check in credentials \nconfig/env.yml"
        end
      end
      if File.exist?("#{destination_root}/bin/spring")
        unless File.exist?("#{destination_root}/config/spring.rb")
          create_file('config/spring.rb')
        end
        append_to_file('config/spring.rb') do
          "\nSpring.watch 'config/env.yml'"
        end
      end
    end
  end
end
