require File.expand_path('../../spec_helper', __FILE__)
require File.expand_path('../../../lib/envyable/cli', __FILE__)

describe Envyable::CLI do
  before do
    ::FileUtils.rm_rf(destination_root)
  end

  let(:cli) { Envyable::CLI.new([], {}, :destination_root => destination_root) }

  describe "install" do
    it "should create a file in config/env.yml" do
      env_yml = "#{cli.destination_root}/config/env.yml"
      File.exist?(env_yml).must_equal false
      capture_io { cli.install }
      File.exist?(env_yml).must_equal true
    end

    it "should create a file in config/env.yml.example" do
      env_yml_example = "#{cli.destination_root}/config/env.yml.example"
      File.exist?(env_yml_example).must_equal false
      capture_io { cli.install }
      File.exist?(env_yml_example).must_equal true
    end

    it "should not create a .gitignore" do
      gitignore = "#{cli.destination_root}/.gitignore"
      File.exist?(gitignore).must_equal false
      capture_io { cli.install }
      File.exist?(gitignore).must_equal false
    end

    it "should add config/env.yml to existing .gitignore" do
      gitignore = "#{cli.destination_root}/.gitignore"
      cli = Envyable::CLI.new([], {}, :destination_root => destination_root(:with_gitignore => true))
      File.exist?(gitignore).must_equal true
      File.readlines(gitignore).none? { |line| line == "config/env.yml" }.must_equal true
      capture_io { cli.install }
      File.readlines(gitignore).any? { |line|  line == "config/env.yml" }.must_equal true
    end

    it "should create a file in config/spring.rb if it doesn't exist already" do
      spring_rb = "#{cli.destination_root}/config/spring.rb"
      spring_bin = "#{cli.destination_root}/bin/spring"
      unless File.exist?(spring_rb) || !File.exist?(spring_bin)
        File.exist?(spring_rb).must_equal false
        capture_io { cli.install }
        File.exist?(spring_rb).must_equal true
      end
    end

    it "should add config/env.yml to Spring's watch list" do
      spring_rb = "#{cli.destination_root}/config/spring.rb"
      spring_bin = "#{cli.destination_root}/bin/spring"
      unless File.exist?(spring_rb) || !File.exist?(spring_bin)
        File.readlines(spring_rb).none? { |line| line == "Spring.watch 'config/env.yml'" }.must_equal true
        capture_io { cli.install }
        File.readlines(spring_rb).any? { |line| line == "Spring.watch 'config/env.yml'" }.must_equal true
      end
    end
  end
end
