source 'https://rubygems.org'

# ruby 2.1

gem 'rails', '4.1.0'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'sorcery'
gem "foundation-rails"

gem 'forecast_io'     # for forecast.io API
gem 'geocoder'        # for (reverse) geocoding
gem 'figaro'          # for ENV variable setting

gem 'pg'
gem 'redis'
gem 'resque', "~> 1.22.0", require: 'resque/server'    # for background jobs
gem 'resque-scheduler'

gem 'unicorn'
gem 'newrelic_rpm'    # monitoring

group :doc do
  gem 'sdoc', require: false
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'annotate'
  gem 'coffee-rails-source-maps'
  gem 'letter_opener'
  gem 'spring'
  gem 'quiet_assets'
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard'
  gem 'guard-rspec'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'dm-transactions'
  gem 'faker'
  gem 'launchy'
  gem 'resque_spec'
end

group :production do
  gem 'rails_12factor'
end
