#!/bin/sh
# Ensure we fail fast if there is a problem.
set -eo pipefail

# For more information, view https://docs.gitlab.com/ce/ci/ssh_keys/README.html

eval $(ssh-agent -s)

ssh-add <(echo "$SSH_PRIVATE_KEY")
echo "$SSH_PRIVATE_KEY" > ~/.ssh/staging_deploy_private_key
chmod 400 ~/.ssh/staging_deploy_private_key

mkdir -p ~/.ssh
[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config