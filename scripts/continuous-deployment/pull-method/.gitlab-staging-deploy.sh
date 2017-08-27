#!/bin/sh
# Ensure we fail fast if there is a problem.
set -eo pipefail

# Make a pull deploy consists on:
# 1. Go to application folder
# 2. Reset git repository to HEAD
# 3. Checkout to master branch
# 4. Get origin changes
# 5. Install composer dependencies
# 6. Execute artisan optimize
# 7. Execute the migrations
if [ "$CI_BUILD_REF_NAME" = "$GIT_DEPLOYMENT_BRANCH" ]; then
    ssh "$STAGING_SERVER_HOSTNAME" "cd $STAGING_SERVER_DIRECTORY; git reset --hard HEAD; git checkout $CI_BUILD_REF_NAME; git pull $GIT_DEPLOYMENT_REMOTE; composer install; php artisan optimize; php artisan migrate --force"
fi