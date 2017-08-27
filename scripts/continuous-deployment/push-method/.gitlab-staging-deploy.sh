#!/bin/bash
# Ensure we fail fast if there is a problem.
set -eo pipefail

# Setup Git remote
git remote add "$GIT_DEPLOYMENT_REMOTE" "$GIT_DEPLOYMENT_URL"
# Deploy via Git
git push "$GIT_DEPLOYMENT_REMOTE" HEAD:"$GIT_DEPLOYMENT_BRANCH"