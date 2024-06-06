source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.1.2"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.0.7"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "sprockets-rails"

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"

# Use the Puma web server [https://github.com/puma/puma]
gem "puma", "~> 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "stimulus-rails"

# Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "tailwindcss-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"

# Annotates Rails/ActiveRecord Models, routes, fixtures, and others based on the database schema.
gem 'annotate', '~> 3.1', '>= 3.1.1'


#Devise gem for authentication
gem 'devise', '~> 4.9', '>= 4.9.3'

#cancancan gem for authorization
gem 'cancancan', '~> 3.5'

# to run async code
gem 'sidekiq', '~> 7.0', '>= 7.0.2'

gem "omniauth-rails_csrf_protection", "~> 1.0"

# login with facebook
gem 'omniauth-facebook', '7.0'

# login with google
gem 'omniauth-google-oauth2'


# Use Redis adapter to run Action Cable in production
# gem "redis", "~> 4.0"

# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"

# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false

# Use Sass to process CSS
# gem "sassc-rails"

# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
# gem "image_processing", "~> 1.2"

gem 'letter_opener_web', '~> 2.0'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri mingw x64_mingw ]
  gem 'pry', '~> 0.14.2'
  gem 'byebug', '~> 11.1', '>= 11.1.3'
  # Great Ruby debugging companion: pretty print Ruby objects to visualize their structure. Supports custom object formatting via plugins
  gem 'awesome_print', '~> 1.9', '>= 1.9.2'

  #to save environment variables
  gem 'dotenv-rails'
end

group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  gem 'rubocop', require: false
  gem 'rubocop-rails', require: false
  # Want to add rubocop to graphql api code?
  gem 'rubocop-graphql', require: false
  # Want to add rucocop to RSpec code?
  gem 'rubocop-rspec', require: false

  gem "faker"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"

  gem "rspec-rails"
  gem "factory_bot_rails"
end
