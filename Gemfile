require 'rbconfig'
HOST_OS = RbConfig::CONFIG['host_os']

source 'https://rubygems.org'

gem 'rails', '3.2.12'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'mysql2'
gem 'active_model_serializers'
gem 'haml-rails'
gem 'devise'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

guard_notifications = false
group :development do
  case HOST_OS
  when /darwin/i
    gem 'rb-fsevent'
    gem 'ruby_gntp' if guard_notifications
  when /linux/i
    gem 'libnotify'
    gem 'rb-inotify'
  when /mswin|windows/i
    gem 'rb-fchange'
    gem 'win32console'
    gem 'rb-notifu' if guard_notifications
  end
end

group :development do
  gem "yajl-ruby"
  gem "guard-bundler"
  gem "guard-cucumber"
  gem "guard-rspec"
  gem "binding_of_caller"
  gem "better_errors"
  gem "powify"
end

group :development, :test do
  gem "rspec-rails"
  gem "rspec"
  gem "capybara"
  gem "cucumber-rails", :require => false
  gem "database_cleaner"
  gem 'factory_girl_rails'
  gem "fivemat"
  gem "pry"
  gem "awesome_print"
end

group :assets do
  gem "twitter-bootstrap-rails"
  gem "less-rails"
  gem "therubyracer"
end

gem "simple_form"
