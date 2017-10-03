# frozen_string_literal: true

ruby '~> 2.4'

source 'https://rubygems.org'

gem 'activerecord',         '~> 5.1'
gem 'pg',                   '~> 0.21'
gem 'rake',                 '~> 12.1'
gem 'sinatra',              '~> 2.0'
gem 'sinatra-activerecord', '~> 2.0'
gem 'sinatra-contrib',      '~> 2.0'
gem 'uuid',                 '~> 2.3'

# For linting
gem 'rubocop', '~> 0.50', require: false

# For production deployment
gem 'puma', '~> 3.10'
