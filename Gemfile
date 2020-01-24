source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 6.0.2', '>= 6.0.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'bootsnap', '>= 1.4.2', require: false

gem 'puma', '~> 4.1'

gem 'spring-watcher-listen', '~> 2.0.0'
gem 'rack-cors', :require => 'rack/cors'
gem "roo", "~> 2.8.0"
gem 'activerecord-import', '~> 1.0.4'
gem 'kaminari'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'awesome_print'
  gem 'pry-rails'
end

group :development do
  gem "capistrano"
  gem "capistrano3-puma", github: "seuros/capistrano-puma"
  # gem "capistrano-rails", require: false
  # gem "capistrano-bundler", require: false
  # gem 'capistrano-rvm'
  # gem 'capistrano-rbenv'
end


group :test do
  gem 'rspec-rails'
  gem 'factory_bot'
  gem 'database_cleaner'
  gem 'database_rewinder'
  gem 'rubocop'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
