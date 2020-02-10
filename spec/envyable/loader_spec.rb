# frozen_string_literal: true

require File.expand_path('../../spec_helper', __FILE__)

describe Envyable::Loader do
  it 'should initialize with a path' do
    loader = Envyable::Loader.new('.')
    expect(loader).must_be_kind_of Envyable::Loader
  end

  it 'needs a path to initialize' do
    expect(-> { Envyable::Loader.new }).must_raise ArgumentError
  end

  it 'can be loaded with a path, environment and loadable hash' do
    hash = {}
    loader = Envyable::Loader.new('.', hash)
    expect(loader.loadable).must_equal hash
  end

  describe 'initialized with just a path' do
    before { @loader = Envyable::Loader.new('spec/fixtures/env.yml') }

    it 'should have access to the path' do
      expect(@loader.path).must_equal 'spec/fixtures/env.yml'
    end

    it 'should default to loading to the ENV' do
      expect(@loader.loadable).must_equal ENV
    end
  end

  describe 'initialized with a path and a loadable hash' do
    before do
      @loadable = {}
      @loader = Envyable::Loader.new('spec/fixtures/env.yml', @loadable)
    end

    describe 'loading the default development env' do
      before { @loader.load }

      it 'should load variables from the yaml file into the loadable hash' do
        expect(@loadable['CHUNKY']).must_equal 'bacon'
      end

      it 'should load all items as strings' do
        expect(@loadable['NUMBER']).must_equal '3'
      end
    end

    describe 'loading the staging env' do
      before { @loader.load('staging') }

      it 'should load variables from the yaml file into the loadable hash' do
        expect(@loadable['CHUNKY']).must_equal 'foxes'
      end

      it 'should load all items as strings' do
        expect(@loadable['NUMBER']).must_equal '5'
      end
    end
  end

  describe 'initialized with a path to an env with default values and a loadable hash' do
    before do
      @loadable = {}
      @loader = Envyable::Loader.new('spec/fixtures/default_env.yml', @loadable)
    end

    describe 'loading the default development environment' do
      before { @loader.load }

      it 'should load default values into the loadable' do
        expect(@loadable['CHUNKY']).must_equal 'bacon'
        expect(@loadable['NUMBER']).must_equal '3'
      end

      it 'should not load a key for environment specific values' do
        expect(@loadable['staging']).must_be_nil
      end
    end

    describe 'loading the staging environment' do
      before { @loader.load('staging') }

      it 'should overwrite the default values' do
        expect(@loadable['CHUNKY']).must_equal 'foxes'
      end

      it 'should still load the other default values' do
        expect(@loadable['NUMBER']).must_equal '3'
      end
    end
  end
end
