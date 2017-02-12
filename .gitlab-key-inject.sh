#!/bin/bash
# Ensure we fail fast if there is a problem.
set -eo pipefail

# For more information, view https://docs.gitlab.com/ce/ci/ssh_keys/README.html

# Install openssh agent based on distribution
if command -v apt-get >/dev/null 2>&1; then
   apt-get update -y && apt-get install openssh-client -y
elif command -v yum >/dev/null 2>&1; then
   yum update -y && yum install openssh-client -y
fi

eval $(ssh-agent -s)

ssh-add <(echo "$SSH_PRIVATE_KEY")
echo "$SSH_PRIVATE_KEY" > ~/.ssh/staging_deploy_private_key
chmod 400 ~/.ssh/staging_deploy_private_key

mkdir -p ~/.ssh
[[ -f /.dockerenv ]] && echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config