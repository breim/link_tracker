# frozen_string_literal: true

source 'https://rubygems.org'

ruby '3.2.2'

gem 'puma', '>= 5.0'
gem 'rails', '~> 7.1.2'
gem 'sqlite3', '~> 1.4'

gem 'bootsnap', require: false
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'debug', platforms: %i[mri windows]
end

group :development do
  gem 'rubocop', '~> 1.59', require: false
  gem 'rubocop-rails', require: false
end
