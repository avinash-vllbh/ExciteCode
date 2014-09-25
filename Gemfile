source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.4'
gem 'sass-rails', '~> 4.0.3'          # Use SCSS for stylesheets
gem 'uglifier', '>= 1.3.0'            # Use Uglifier as compressor for JavaScript assets
gem 'coffee-rails', '~> 4.0.0'        # Use CoffeeScript for .js.coffee assets and views
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
gem 'therubyracer',  platforms: :ruby
gem 'jquery-rails'                    # Use jquery as the JavaScript library
gem 'eco'                             # Embedded coffeescript template engine for backbone
gem 'js-routes'                       # Generate route url paths for javascript
gem 'jbuilder', '~> 2.0'              # Build JSON APIs with ease.
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

gem 'devise'
gem 'omniauth-github'
gem 'omniauth-twitter'
gem 'omniauth-facebook'
gem 'cancan'
gem 'pg'
gem 'cpalette'
gem 'will_paginate', '~> 3.0'

group :development do
  gem 'better_errors'
  gem 'binding_of_caller', :platforms=>[:mri_19, :mri_20, :mri_21, :rbx]
  gem 'meta_request'
  gem 'spring'                        # Spring speeds up development by keeping your application running in the background.
  #-----------Testing out new gems----------------
  gem 'bullet'                        # Gives a performance analysis on queries made
  gem 'rails_best_practices'
  gem 'rails-footnotes'
end
group :development, :test do
  gem 'rspec-rails'
  gem 'guard-rails'
end
group :test do
  gem 'faker'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'email_spec'
  gem "selenium-webdriver"
  gem "capybara-webkit"
  gem "capybara-screenshot"
end
group :production do
  gem 'unicorn' # Use unicorn as the app server in production
  # gem 'capistrano-rails', group: :development  # Use Capistrano for deployment
end

