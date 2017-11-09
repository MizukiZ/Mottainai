source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
# for .env file
gem 'dotenv-rails', groups: [:development, :test]
# login system and user model
gem 'devise'
# devise for windows user
gem 'bcrypt', git: 'https://github.com/codahale/bcrypt-ruby.git', :require => 'bcrypt'
# bootstrap
gem 'bootstrap', '~> 4.0.0.beta2.1'
gem 'jquery-rails'
# uploader
gem 'carrierwave', '~> 1.0'
# rize images
gem 'rmagick'
# for AWS
gem 'fog'
# font awesome
gem "font-awesome-rails"
# for country code and currency code
gem 'countries'
# for gettign altitude and longitude
 # gem 'geocoder'
# form select
gem 'country_select'
# for handling currency
gem 'money'
# for api usage
 gem 'httparty'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
# payment system
gem 'stripe'
# mail functionality
gem 'mailgun-ruby', '~>1.1.6'
# user restrictions admin
gem "pundit"
# pagenation
gem 'kaminari', '~> 0.17.0'
gem 'bootstrap4-kaminari-views'

group :development, :test do
  # for testing
  gem 'rspec-rails', '~> 3.6'
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
