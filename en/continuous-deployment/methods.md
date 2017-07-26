# Continuous Deployment

## Methods

### Push configuration

Copy and drop the following files in your GitLab repository:

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-build.sh
* .gitlab-test.sh
* .gitlab-staging-deploy.sh

Ensure that your repository has set a Git deployment remote and you have created a SSH key for access to this remote.

Open up `.gitlab-ci.yml` and set the variables for the following: 

```
  GIT_DEPLOYMENT_URL: git@gitlab.com:woohuiren/test-laravel-project.git
  GIT_DEPLOYMENT_REMOTE: staging
  GIT_DEPLOYMENT_BRANCH: master
  SSH_PRIVATE_KEY: somethingsomethingblahblah # Recommended to put into GitLab secret variables instead
```

### Pull configuration

Copy and drop the following files in your GitLab repository: 

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-build.sh
* .gitlab-test.sh
* .gitlab-staging-pull-deploy.sh

The SSH private key is used for accessing the staging server. Please ensure that your staging server already has SSH keys necessary to pull the code from the GitLab server.

Open up `.gitlab-ci.yml` and set the variables for the following: 

```
  GIT_DEPLOYMENT_REMOTE: origin
  GIT_DEPLOYMENT_BRANCH: master
  SSH_PRIVATE_KEY: somethingsomethingblahblah # Recommended to put into GitLab secret variables instead
  STAGING_SERVER_HOSTNAME: admin@localhost
  STAGING_SERVER_DIRECTORY: /home/admin/laravel-project/public
...
stage_job:
  stage: staging_deploy
  script:
    - sh .gitlab-staging-pull-deploy.sh
```