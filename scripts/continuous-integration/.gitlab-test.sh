#!/bin/sh
# Ensure we fail fast if there is a problem.
set -eo pipefail

# Ensure that php is working
php -v

# Ensure that mysql server is up and running
ping -c 3 mysql

# Run unit testing with PHPUnit
php vendor/bin/phpunit --coverage-text --colors=never