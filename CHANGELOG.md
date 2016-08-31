# ChangeLog

## 1.1.0 / 2016-08-31

* [FEATURE] New envyable executable with a single command: `envyable install`. Will setup a good default for envyable, including `config/env.yml` and `config/env.yml.example` files and gitignoring the `config/env.yml` file.
* [ENHANCEMENT] Adds code coverage report
* [ENHANCEMENT] Adds Code Climate score and coverage report badges to README

## 1.0.0 / 2016-01-24

* [FEATURE] If you have gems that require variables to be set earlier, then place `envyable` in the `Gemfile` before those gems and require `envyable/rails-now`. Thanks to @mikelkew.

## 0.2.0 / 2015-03-16

* [FEATURE] Allows user to add default values and then override on an environment by environment basis
* [ENHANCEMENT] Uses `Pathname#join` to form file name in Railtie

## 0.1.0 / 2015-01-22

* [BUGFIX] Stops the loader from choking on a file if the environment requested is not present

## 0.0.2 / 2014-02-02

* [ENHANCEMENT] Tidies up Loader class
* [ENHANCEMENT] Adds more tests
* [ENHANCEMENT] Adds TravisCI

## 0.0.1 / 2014-01-06

* Initial version
