# App

## Status

[![Dependency Status](https://gemnasium.com/wrburgess/rails-api-template.png)](https://gemnasium.com/wrburgess/rails-api-template)  
[![Code Climate](https://codeclimate.com/github/wrburgess/rails-api-template.png)](https://codeclimate.com/github/wrburgess/rails-api-template)  
[![Build Status](https://travis-ci.org/wrburgess/rails-api-template.png?branch=master)](https://travis-ci.org/wrburgess/rails-api-template)


## To Do

1. Install Devise  
1. Install ActiveAdmin  
1. Install JSON responses  

## References

* Link to [Rails 4 Bootstrap Gist](https://gist.github.com/wrburgess/7199751)
* figaro: *secure env variables*, [gem](http://rubygems.org/gems/figaro) | [repo](https://github.com/laserlemon/figaro)
* devise: *auth system*, [gem](http://rubygems.org/gems/devise) | [repo](https://github.com/plataformatec/devise)
* active_admin: *quick admin dashboard*, [gem](http://rubygems.org/gems/activeadmin) | [repo](https://github.com/gregbell/active_admin) | [site](http://activeadmin.info/)
* gemnasium: [site](https://gemnasium.com/wrburgess/rails-api-template) | [dashboard](https://gemnasium.com/dashboard)
* code climate: [site](https://codeclimate.com/github/wrburgess/rails-api-template)
* travis-ci: [site](travis-ci.com) | [profile](https://travis-ci.org/wrburgess/rails-api-template)

## Initial Tasks

1. Conduct a Search & Replace for all instances of "AppName" and "appname" and replace with your own application name.
1. Change the database names in the ```config/database.yml``` file
1. Change the app name in the ```config/initializers/session_store.rb``` file (if necessary)
1. Rename the custom rake task for dev rebuild in ```lib/tasks/app.rake```
1. Edit the initial database migration file as appropriate at ```db/migrate```
1. Install figaro gem with ```rails generate figaro:install```
1. Run ```rake secret``` and add secret key to ```config/application.yml``` file for ```APP_SECRET_KEY_BASE```
1. Edit ```.gitignore``` as appropriate to hide secure variables
1. Change the ```.travis.yml``` file for the db name
1. Change the email domains for devise in the ```development.rb, staging.rb, production.rb``` env files
1. Change the devise email address in ```config/initializers/devise.rb``` file

## Create Staging Environment on Heroku

1. Copy env file: ```cp config/environments/production.rb config/environments/staging.rb```
1. Set up git config: ```git config heroku.remote staging```
1. Set up env vars on Heroku: ```heroku config:set RACK_ENV=staging RAILS_ENV=staging```

## Set up Environment Variables on Heroku

1. Push environment vars to heroku: ```rake figaro:heroku --remote [remote_name]```

## Custom Tasks

* deploy to staging: ```rake deploy:staging```
* deploy to production: ```rake deploy:production```
* teardown/rebuild dev: ```rake app:rebuild```
* lint Travis setup: ```travis-lint```
* scan gems for security: ```hakiri gemfile:scan```
* scan code for quality: ```rubocop```
* scan code for security: ```brakeman```
