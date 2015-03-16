# Envyable

The simplest yaml to ENV config loader.

[![Build Status](https://travis-ci.org/philnash/envyable.png?branch=master)](https://travis-ci.org/philnash/envyable)

## Installation

Add this line to your application's Gemfile:

    gem 'envyable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install envyable

## Usage

### YAML file

Create a yaml file that holds your settings. You can put default settings into the root of the yaml file and then override those on an environment by environment basis. For example, the following yaml file will load the id "development-id" into all environments it is loaded in except for the test environment, where the id would be "test-id".

```
API_CLIENT_ID: development-id
test:
  API_CLIENT_ID: test-id
```

### Rails

Once installed in a Rails app, add your yaml file at `config/env.yml`. The gem will load the correct environment on initialization of the application.

### Other applications

You can create your yaml file anywhere (though why not `config/env.yml`?). Then call `Envyable.load('path/to/yml', environment)` and the yaml file will be loaded into `ENV`.

### Version control

It is not recommended that you check the yaml file in to version control. Personally, I like to check in a `env.yml.example` file that shows the required keys, but does not include any credentials.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
