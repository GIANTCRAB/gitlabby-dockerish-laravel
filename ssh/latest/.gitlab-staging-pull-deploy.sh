#!/bin/sh
# Ensure we fail fast if there is a problem.
set -eo pipefail

# SSH into the staging server and execute the git pull
ssh -i ~/.ssh/staging_deploy_private_key "$STAGING_SERVER_HOSTNAME" "cd $STAGING_SERVER_DIRECTORY; git reset --hard HEAD; git checkout $GIT_DEPLOYMENT_BRANCH; git pull $GIT_DEPLOYMENT_REMOTE; composer install; composer update; php artisan optimize; php artisan migrate --seed"
