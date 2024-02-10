#!/bin/sh
set -e

echo "Run db:create"
bundle exec rake db:create

echo "Run db:migrate"
bundle exec rake db:migrate

exec "$@"