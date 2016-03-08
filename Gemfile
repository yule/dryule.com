source 'https://rubygems.org'

# Core
gem 'rails', '~> 4.2.0'
gem 'pg', '~>0.16.0'
gem 'simple-navigation', '~>3.11.0'
gem 'devise'
gem 'exception_notification'

# Assets
gem 'sass-rails', '~> 4.0.3'
gem 'less-rails'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'haml-rails'
gem 'bourbon'
gem 'twitter-bootstrap-rails'

# Turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'

# App specific
gem 'postmarkdown'

group :development do
  #  Lightweight web server
  gem 'thin'
  # Nice errors
  gem 'quiet_assets'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'shog' # color logs
  # Guard
  gem 'guard-bundler'
  gem 'listen'
  gem 'libnotify'
  gem 'guard-livereload'
  gem 'guard-rubocop'
  gem 'rack-livereload'
  gem 'guard-rails'
  # Capistrano
  gem 'capistrano', '~> 3.3.0', require: false
  gem 'capistrano-passenger', '0.0.1', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-bundler', require: false
end

group :development, :test do
  gem 'guard-rspec'
  gem 'rspec-rails', '~> 3.1'
  gem 'factory_girl', '4.4.0'
  gem 'factory_girl_rails', '4.4.1'
  gem 'spring-commands-rspec'
  gem 'reek', '1.6.3'
  gem 'database_cleaner'
  gem 'sqlite3'
end

group :test do
  gem 'timecop'
  gem 'simplecov', '>= 0.3.8', require: false
  gem 'shoulda'
  gem 'shoulda-matchers', '2.8.0', require: false
end
