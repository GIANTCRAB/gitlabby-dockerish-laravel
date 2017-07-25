# Gitlabby Dockerish Laravel
What happens when you Dockerize your Laravel testing environment and throw it at Gitlab CI?

This repository includes several files required to run the Gitlab CI for your Laravel. The Docker container is pre-packaged with Laravel vendor dependecies, which reduces the number of files required to be downloaded. 

It pulls the PHP Laravel image from [this repository](https://github.com/GIANTCRAB/php-laravel-env).

## Support
* PHP 7/7.1
* Laravel 5.3/5.4
* MySQL 5.5

To switch between Laravel versions, change this repository's branch. Master branch will always have the latest image. 

# Usage

There are two ways which this can be used -- for continuous integration and continuous deployment. 

## Continuous Integration
Copy the following files and drop them in your Laravel base repository: 

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-build.sh
* .gitlab-test.sh

Open up `.gitlab-ci.yml` and comment or remove the staging information: 

```
before_script:
  # For more information, view https://docs.gitlab.com/ce/ci/ssh_keys/README.html
  # install ssh-agent
  - 'which ssh-agent || ( apt-get update -y && apt-get install openssh-client -y )'
  # run ssh-agent
  - eval $(ssh-agent -s)
  # add ssh key stored in SSH_PRIVATE_KEY variable to the agent store
  - ssh-add <(echo "$SSH_PRIVATE_KEY")
  # disable host key checking (NOTE: makes you susceptible to man-in-the-middle attacks)
  # WARNING: use only in docker container, if you use it with shell you will overwrite your user's ssh config
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

## Continuous Deployment

There are two types of deployment techniques that are commonly used, a push and pull. A push configuration requires the remote endpoint to be a Git server whereas a pull configuration would only require SSH details. Nevertheless, there are different variables required for setting these deployments.

### Push configuration

Copy the following files and drop them in your Laravel base repository: 

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

Copy the following files and drop them in your Laravel base repository: 

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
