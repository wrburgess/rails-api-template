# App

## To Do

- [ ] Install Devise
- [ ] Install ActiveAdmin
- [ ] Install Travis
- [ ] Install Code Climate
- [ ] Tests passing
 
## References

* Link to [Rails 4 Bootstrap Gist](https://gist.github.com/wrburgess/7199751)
* figaro gem *secure env variables* [repo](https://github.com/laserlemon/figaro) [gem](http://rubygems.org/gems/figaro)
* devise *auth* [gem](http://rubygems.org/gems/devise) [repo](https://github.com/plataformatec/devise)
* active_admin *quick admin dashboard* [gem](http://rubygems.org/gems/activeadmin) [repo](https://github.com/gregbell/active_admin) [site](http://activeadmin.info/)

## Initial Tasks

[ ] Conduct a Search & Replace for all instances of "AppName" and "appname" and replace with your own application name.
[ ] Change the database names in the ```config/database.yml``` file
[ ] Change the app name in the ```config/initializers/session_store.rb``` file
[ ] Rename the custom rake task for dev rebuild in ```lib/tasks/appname.rake```
[ ] Edit the initial database migration file as appropriate at ```db/migrate```
[ ] Install figaro gem with ```rails generate figaro:install```
[ ] Run ```rake secret``` and add secret key to ```config/application.yml``` file for ```APP_SECRET_KEY_BASE``` 
[ ] Create ```.rspec``` file to hold rspec config

## Create Staging Environment on Heroku

[ ] Copy env file: ```cp config/environments/production.rb config/environments/staging.rb```
[ ] Set up git config: ```git config heroku.remote staging```
[ ] Set up env vars on Heroku: ```heroku config:set RACK_ENV=staging RAILS_ENV=staging```

## Set up Environment Variables on Heroku

[ ] Push environment vars to heroku: ```rake figaro:heroku --remote [remote_name]```


