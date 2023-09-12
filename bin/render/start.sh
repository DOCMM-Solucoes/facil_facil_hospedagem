#!/usr/bin/env bash
# exit on error
set -o errexit

rm Gemfile.lock
gem install rake -v '12.2'
gem install bundler -v 2.1.4
gem update --system

bundle update
bundle install
npm install
bundle exec rake assets:precompile
bundle exec rake assets:clean
rails db:migrate