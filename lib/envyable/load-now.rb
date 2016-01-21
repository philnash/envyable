# For gems that require environment variables to be set before application is
# loaded, then place `envyable` in the `Gemfile` before those gems and
# require `envyable/load-now`, e.g.
#   gem 'envyable', require: 'envyable/load-now'
#   gem 'gem-that-requires-env-variables'

require 'envyable/railtie'
Envyable::Railtie.load
