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
      File.exists?(env_yml).must_equal false
      capture_io { cli.install }
      File.exists?(env_yml).must_equal true
    end

    it "should create a file in config/env.yml.example" do
      env_yml_example = "#{cli.destination_root}/config/env.yml.example"
      File.exists?(env_yml_example).must_equal false
      capture_io { cli.install }
      File.exists?(env_yml_example).must_equal true
    end

    it "should not create a .gitignore" do
      gitignore = "#{cli.destination_root}/.gitignore"
      File.exists?(gitignore).must_equal false
      capture_io { cli.install }
      File.exists?(gitignore).must_equal false
    end

    it "should add config/env.yml to existing .gitignore" do
      gitignore = "#{cli.destination_root}/.gitignore"
      cli = Envyable::CLI.new([], {}, :destination_root => destination_root(:with_gitignore => true))
      File.exists?(gitignore).must_equal true
      File.readlines(gitignore).none? { |line| line == "config/env.yml" }.must_equal true
      capture_io { cli.install }
      File.readlines(gitignore).any? { |line|  line == "config/env.yml" }.must_equal true
    end
  end
end
