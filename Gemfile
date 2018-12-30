source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'coffee-rails', '~> 4.2'
gem 'devise', '~> 4.5'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem "paperclip", ">= 5.2.0"
gem 'pg','~> 0.19','>= 0.19.0'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'sass-rails', '~> 5.0', '>= 5.0.7'
gem 'simple_form', '~> 4.1'
gem 'turbolinks', '~> 5.2'
gem 'uglifier', '~> 4.1', '>= 4.1.20'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'capybara'
  gem 'factory_bot_rails', '~> 4.11', '>= 4.11.1'
  gem 'pry-byebug'
  gem 'rspec-rails'
  gem "rubocop", ">= 0.49.0", require: false
end

group :test do
  gem 'simplecov', require: false
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

gem 'rails_12factor', group: :production
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
