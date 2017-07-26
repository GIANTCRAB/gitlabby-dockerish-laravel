# Continuous Integration

## Installation

Copy the following files and drop them in your GitLab repository: 

  - .env.gitlab-testing
  - .gitlab-ci.yml
  - .gitlab-build.sh
  - .gitlab-test.sh

Open up `.gitlab-ci.yml` and comment or remove the staging information: 

```
before_script:
  - 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )'
  - eval $(ssh-agent -s)
  - ssh-add <(echo "$SSH_PRIVATE_KEY")
  - mkdir -p ~/.ssh
  - echo -e "Host *\n\tStrictHostKeyChecking no\n\n" > ~/.ssh/config
...
  - staging_deploy
...
stage_job:
  stage: staging_deploy
  script:
    - sh .gitlab-staging-deploy.sh
  environment:
    name: staging
```