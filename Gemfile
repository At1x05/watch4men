source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.1'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'bcrypt', '3.1.7'

gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bootstrap-sass' #enable bootstrap
gem 'autoprefixer-rails' #related to bootstrap (vendor css)
gem 'haml-rails' #haml instead of erb language- less code 
gem 'carrierwave' #uploading images
gem 'mini_magick'#uploading images
gem 'puma' #different web server (instead of webricks)
#gem 'devise'
gem 'country_select' #Gem which allows us to choose every single country

group :test do
  gem 'minitest-rails' 
  gem 'factory_girl_rails'
end

group :development do
  gem 'html2haml'
end

group :development, :test do
  gem 'byebug'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'pry-rails'
end

group :production do
  gem 'pg'
  gem 'rails_12factor', '0.0.2'
end