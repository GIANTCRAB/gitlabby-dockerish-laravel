#!/bin/bash
# Ensure we fail fast if there is a problem.
set -eo pipefail

# Deploy via Git
git push "$GIT_DEPLOYMENT_REMOTE" HEAD:"$GIT_DEPLOYMENT_BRANCH"