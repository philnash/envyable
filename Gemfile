source 'https://rubygems.org'

# Specify your gem's dependencies in envyable.gemspec
gemspec

group :test do
  gem "codeclimate-test-reporter", :require => nil
  gem "simplecov", "~> 0.12", :require => nil
end

platforms :rbx do
  gem 'racc'
  gem 'rubysl', '~> 2.0'
  gem 'psych'
end
