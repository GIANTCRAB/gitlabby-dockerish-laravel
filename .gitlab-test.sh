#!/bin/bash
# Ensure we fail fast if there is a problem.
set -eo pipefail

# Run unit testing with PHPUnit
php vendor/bin/phpunit --colors