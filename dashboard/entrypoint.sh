#!/bin/bash

# remove server.pid
if test -f 'tmp/pids/server.pid'; then
  rm tmp/pids/server.pid
fi

# bundle install
bundle install

# setup database
bin/rails db:create
bin/rails db:migrate

# setup npm packages
yarn install

exec "$@"
