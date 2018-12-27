docker-compose run --rm app rails assets:precompile RAILS_ENV=production
git push heroku master
heroku run rails db:migrate
