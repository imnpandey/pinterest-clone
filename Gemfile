source 'https://rubygems.org'

gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'turboboost'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Authentication gems
gem 'devise'
gem 'omniauth'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'dotenv-rails'

gem 'cancancan', '~> 1.10'
gem 'will_paginate'

#image upload
gem 'paperclip', '~> 4.3', '>= 4.3.6'

group :development do
  gem 'sqlite3'
  gem 'quiet_assets'
  gem "better_errors"
  gem 'binding_of_caller'
  gem "letter_opener"
  gem "bullet"
end

group :development, :test do
  gem 'spring'
  gem "awesome_print", require:"ap"
  gem "pry-rails"
end

group :test do
  gem 'database_cleaner'
  gem 'rspec-rails'
  gem 'factory_girl_rails', :require => false
  gem "json-schema"
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end
