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

### Rails

Once installed in a Rails app, add a `config/env.yml` file with your config
separated into environments, like so:

```
development:
  API_CLIENT_ID: development-id
test:
  API_CLIENT_ID: test-id
```

The gem will load the correct environment on initialization of the application.

Do not check in the `config/env.yml` file as it may contain application secrets
that you do not want shared.

### Other applications

You can simply call `Envyable.load(path, environment)` and the yaml file will be loaded into ENV.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
