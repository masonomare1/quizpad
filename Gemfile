source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.6'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.7'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Environment variables
gem 'dotenv-rails', '~> 2.7.6'

gem "pundit", "~> 2.2"
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# factory_bot_rails provides integration between factory_bot and rails 4.2 or newer
gem "factory_bot_rails", "~> 5.2.0"
# A library for generating fake data such as names, addresses, and phone numbers.
gem "faker", "~> 2.10.0"

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem 'devise_token_auth'
gem "hashid-rails", "~> 1.0"

# Pagination
gem 'pagy', '~> 5.10'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'pry', '~> 0.13.1'
  # rspec-rails is a testing framework for Rails 5+.
  gem "rspec-rails", "~> 4.0.1"
end

group :development do
  gem 'listen', '~> 3.3'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'rubocop', '~> 1.30.1', require: false
  gem 'rubocop-rails', '~> 2.15.0', require: false
  gem 'rubocop-rspec', '~> 2.11.1', require: false
end

group :test do
  gem 'rspec-json_expectations', '~> 2.2.0'
  gem 'shoulda-matchers', '~> 5.1.0'
  gem 'simplecov', '~> 0.21.2'
  gem 'webmock', '~> 3.14.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

