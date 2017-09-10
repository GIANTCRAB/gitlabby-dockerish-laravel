#!/bin/bash
# Ensure we fail fast if there is a problem.
set -eo pipefail

if [ "$CI_BUILD_REF_NAME" = "$GIT_DEPLOYMENT_BRANCH" ]; then

    # Setup Git remote
    git remote add "$GIT_DEPLOYMENT_REMOTE" "$GIT_DEPLOYMENT_URL"

    # Deploy via Git
    git push "$GIT_DEPLOYMENT_REMOTE" HEAD:"$CI_BUILD_REF_NAME"

fi