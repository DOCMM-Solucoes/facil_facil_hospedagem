#!/usr/bin/env bash
# exit on error
set -o errexit

gem install bundler -v 2.1.4
gem update --system

bundle install
npm install
bundle exec rake assets:precompile
bundle exec rake assets:clean
rails db:migrate