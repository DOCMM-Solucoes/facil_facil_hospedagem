#!/usr/bin/env bash
# exit on error
set -o errexit

gem install bundler
gem update --system

bundle install
npm install
bundle exec rake assets:precompile
bundle exec rake assets:clean
rails db:migrate