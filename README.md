# Envyable

The simplest yaml to ENV config loader.

[![Gem version](https://badge.fury.io/rb/envyable.svg)](https://rubygems.org/gems/envyable) ![Build Status](https://github.com/philnash/envyable/workflows/tests/badge.svg) [![Code Climate](https://codeclimate.com/github/philnash/envyable/badges/gpa.svg)](https://codeclimate.com/github/philnash/envyable)

## Installation

Add this line to your application's Gemfile:

    gem 'envyable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install envyable

### Install task

Once the gem is included in your project, you can then use it to generate the
default required files. Just run:

    $ envyable install

and you will get a `config` directory containing an `env.yml` and a
`env.yml.example` file. If you have a `.gitignore` file this will also append
the line:

```yaml
/config/env.yml
```

to your config so that you do not check in `/config/env.yml`.

If you have [Spring](https://github.com/rails/spring) bundled with your
application this will append the following line to `/config/spring.rb`:

```ruby
Spring.watch 'config/env.yml'
```

If the file `/config/spring.rb` does not exist, it will be created.

## Usage

### YAML file

Create a yaml file that holds your settings. You can put default settings into the root of the yaml file and then override those on an environment by environment basis. For example, the following yaml file will load the id "development-id" into all environments it is loaded in except for the test environment, where the id would be "test-id".

```
API_CLIENT_ID: development-id
test:
  API_CLIENT_ID: test-id
```

### Rails

Once installed in a Rails app, add your yaml file at `config/env.yml`. The gem will load the correct environment on initialization of the application. If you are using Spring to load your Rails application, [add `config/env.yml` to Spring's watch list](https://github.com/rails/spring#watching-files-and-directories).

### Load Immediately

If you have gems that require variables to be set earlier then place `envyable` in the `Gemfile` before those gems and require `envyable/rails-now`:
```
gem 'envyable', require: 'envyable/rails-now'
gem 'other-gem-that-requires-env-variables'
```

### Other applications

With the exception of loading Envyable immediately via the Gemfile, you can create your yaml file anywhere (though why not `config/env.yml`?). To load your yaml file into `ENV`, call:
```
Envyable.load('path/to/yml', environment)
```

The default environment is development if you leave that argument blank.  For example, if your variables are in a config folder in a file called env.yml, and you want to load development only, include in your script:
```
require 'envyable'
Envyable.load('config/env.yml')
```

### Version control

It is not recommended that you check the yaml file in to version control. Personally, I like to check in a `env.yml.example` file that shows the required keys, but does not include any credentials. If you generate your Envyable files using the installer, `config/env.yml` will be added to your `.gitignore` file.

## Troubleshooting

If your ENV values don't update when you modify `config/env.yml`, verify whether you have Spring (or another application preloader) that isn't configured to watch and reload when you update values.  You should try configuring the preloader or just restarting it.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
