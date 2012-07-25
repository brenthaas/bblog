source 'https://rubygems.org'

gem 'rails', '3.2.3'
gem 'bootstrap-sass'
gem 'simple_form'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.4'
  gem 'coffee-rails', '~> 3.2.2'
  gem 'uglifier', 		'>= 1.2.3'
end

gem 'jquery-rails'

group :test do
	gem 'capybara'
	gem 'launchy'
	gem 'factory_girl_rails'
end

group :test, :development do
	gem 'rspec-rails'
 	gem 'ruby-debug19', :require => 'ruby-debug'
end

group :development do
	gem 'sqlite3'
  gem 'annotate', '~> 2.4.1.beta'
end

group :production do
  gem 'pg'
end

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

