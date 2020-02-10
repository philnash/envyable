# frozen_string_literal: true

require File.expand_path('../spec_helper', __FILE__)

describe Envyable do
  describe '.load' do
    it 'should load a yml settings file' do
      Envyable.load 'spec/fixtures/env.yml'
      expect(ENV['CHUNKY']).must_equal 'bacon'
    end

    it 'should take an optional environment argument' do
      Envyable.load 'spec/fixtures/env.yml', 'staging'
      expect(ENV['CHUNKY']).must_equal 'foxes'
    end

    it 'should not fail if file is not there' do
      Envyable.load 'spec/fixtures/nothing.yml'
    end

    it 'should not fail if the environment is not represented in the file' do
      Envyable.load 'spec/fixtures/env.yml', 'production'
    end
  end
end
