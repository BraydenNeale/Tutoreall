source 'https://rubygems.org'
ruby "2.2.2"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.2'
# Use sqlite3 as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

#Project Gems - should probably go through and specify versions for these.
gem 'devise', '~> 3.5.1'	# devise for user signups and logins
gem 'rmagick', '~> 2.15.4', require: false # image processing 
gem 'carrierwave', '~> 0.10.0' # image uploading for user profiles
gem 'mailboxer', '~> 0.13.0' 	# Used to implement messaging system
gem 'jquery-turbolinks', '~> 2.1.0' # Turbolinks
gem 'will_paginate', '~> 3.0.7'		# pagination
gem 'jquery-ui-rails', '~> 5.0.5'	# Jquery ui for dialogs and other jquery features
gem 'local_time', '~> 1.0.3'			# output utc times in local time (javascript on client)
gem 'simple_calendar', '~> 2.0.3'	# integrate lesson dates onto a calendar

gem 'braintree', '~> 2.56.0' # braintree for processing payments
gem 'figaro', '~> 1.1.1' # Figaro - secure config
gem 'gon', '~> 6.0.1'

gem "fog", '~> 1.37.0' # carrier wave amazon s3
gem 'aws-sdk', '~> 2.2.11'
gem 'sitemap_generator', '~> 5.1.0'

gem 'faker', '~> 1.6', '>= 1.6.1' # seed data

gem 'workflow', '~> 1.2' # Scheduling state machine
gem 'geocoder', '~> 1.6'
gem 'haversine', '~> 0.3.0'

# gem 'mailcatcher', '~> 0.6.1' # mail catching in dev
# gem 'chosen-rails'
# gem 'compass-rails'
# gem 'fog-aws' # carrierwave amazon s3

# Use this for clientside validations
# gem 'judge', '~> 2.1'

# For when nokogiri breaks
# sudo gem install nokogiri -v '1.6.7.1' -- --use-system-libraries --with-xml2-include=/usr/include/libxml2 --with-xml2-lib=/usr/lib

#heroku
gem 'puma', '~> 2.13.4'
gem 'rails_12factor', '~> 0.0.3', group: :production

#sweet alerts
source 'https://rails-assets.org' do
   gem 'rails-assets-sweetalert'
end
