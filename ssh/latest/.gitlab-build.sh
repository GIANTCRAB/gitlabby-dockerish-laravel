#!/bin/bash
# Ensure we fail fast if there is a problem.
set -eo pipefail

# Ensure that php is working
php -v

# Install project dependencies based on composer lock file info
composer install

# Copy over testing configuration. This configuration is used for Gitlab CI unit testing
cp -v .env.gitlab-testing .env

# Generate an application key. Clear config and cache route
php artisan key:generate
php artisan config:clear
#php artisan route:cache # Uncomment this if you do not use closures in your route files as this helps to improve performance
