source 'http://rubygems.org'

gem 'rails', git: 'https://github.com/rails/rails', branch: '3-1-stable'
gem 'sprockets', git: 'https://github.com/sstephenson/sprockets.git'
gem 'pg'
gem 'decent_exposure'
gem 'haml'
gem 'compass'
gem 'html5-boilerplate'
gem 'dynamic_form'
# gem 'newrelic_rpm'

group :asset do
  gem 'coffee-script'
  gem 'uglifier'
  gem 'sass'
end

group :production do
  gem 'therubyracer-heroku'
end

group :development, :test do
  gem 'capybara', '~> 1.0'
  gem 'cucumber'
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'evergreen', require: 'evergreen/rails'
  gem 'fabrication'
  gem 'faker'
  gem 'launchy'
  gem 'rspec', '~> 2.6.0'
  gem 'rspec-rails', '~> 2.6.1'
  gem 'ruby-debug19', :require => 'ruby-debug'
  gem 'shoulda', git: "https://github.com/thoughtbot/shoulda.git"
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-cucumber'
  gem 'sqlite3'
end
