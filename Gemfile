source 'https://rubygems.org'

# ruby 2.1

gem 'rails', '4.0.0'

gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 1.2'

gem 'sorcery'
gem "compass-rails", "~> 1.1.3" #, "~> 2.0.alpha.0"     don't think this is necessary anymore
gem 'zurb-foundation', '~> 4.0.0'

gem 'forecast_io'     # for forecast.io API
gem 'geocoder'        # for (reverse) geocoding
gem 'figaro'          # for ENV variable setting
gem 'google-analytics-rails'
# gem 'gibbon'          # for Mandrill API
gem 'friendly_id', '5.0.0.beta4'

gem 'pg'
gem 'redis'
gem 'resque', "~> 1.22.0", require: 'resque/server'    # for background jobs

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
end

group :development, :test do
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'dm-transactions'
  gem 'faker'
  gem 'guard-rspec'
  gem 'launchy'
end

group :production do
  gem 'rails_12factor'
end
