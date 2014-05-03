source 'https://rubygems.org'

gem 'rails', '4.1.0'
gem 'sass-rails', '~> 4.0.3'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'haml'
# gem 'jquery-rails'
# gem 'turbolinks'
# gem 'jbuilder', '~> 2.0'

# docker
# gem 'docker-registry-api'
gem 'docker-api', :require => 'docker'

group :doc do
  gem 'sdoc', '~> 0.4.0'
end

group :development do
  gem 'pry'
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'sqlite3'
  gem 'annotate'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'letter_opener'
end

group :development,:test do
  gem 'dotenv-rails'
  gem "rspec-rails", "~> 2.14.0"
  gem "factory_girl_rails", "~> 4.2.1"
  gem 'guard', '~> 2'
  gem 'guard-rspec',require: false
  gem 'spring'
  gem "spring-commands-rspec"
  gem "debugger", "~> 1.6.6"
end

group :test do
  gem "faker", "~> 1.1.2"
  gem "capybara", "~> 2.1.0"
  gem "database_cleaner", "~> 1.0.1"
  gem "launchy", "~> 2.3.0"
end
