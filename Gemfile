source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 6.0.3', '>= 6.0.3.2'
# Use Puma as the app server
gem 'puma', '~> 4.1'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false
# HTML, XML, SAX, and Reader parser
gem 'nokogiri'
# Mongoid is an ODM (Object Document Mapper) Framework for MongoDB
gem 'mongoid', '~> 7.0.5'
# Create JSON structures via a Builder-style DSL
gem 'jbuilder'
# Flexible authentication solution for Rails with Warden
gem 'devise'
# Simple (but safe) token authentication for Rails apps or API with Devise
gem 'simple_token_authentication', '~> 1.0'
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'
# A rack middleware for throttling and blocking abusive requests
gem 'rack-attack'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '~> 3.2'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
