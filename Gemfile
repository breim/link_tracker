# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'active_model_serializers'
gem 'bootsnap', require: false
gem 'browser'
gem 'figaro'
gem 'geoip', '~> 1.4.0'
gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'responders', '~> 3.0'
gem 'sqlite3', '~> 1.4'
gem 'tzinfo-data', platforms: %i[windows jruby]
gem 'will_paginate', '~> 3.3'

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
  gem 'factory_bot_rails'
  gem 'rails-controller-testing'
  gem 'rspec-rails', '6.1.1'
  gem 'simplecov', require: false, group: :test
end

group :development do
  gem 'rubocop', '~> 1.59', require: false
  gem 'rubocop-rails', require: false
  gem 'ruby-lsp', require: false
  gem 'yard'
end
