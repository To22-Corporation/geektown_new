docker-compose run --rm app bundle install --without development test && rails assets:precompile RAILS_ENV=production
git push heroku master
heroku run rails db:migrate
