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

## I don't need to deploy anywhere
Copy the following files and drop them in your Laravel base repository: 

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-build.sh
* .gitlab-test.sh

Open up `.gitlab-ci.yml` and comment or remove the staging information: 

```
before_script:
  - bash .gitlab-key-inject.sh # Script injection for SSH keys used for deployments

...

  - staging_deploy
...
stage_job:
  stage: staging_deploy
  script:
    - bash .gitlab-staging-deploy.sh
environment:
    name: staging
```

## I need to deploy to staging or somewhere
Copy the following files and drop them in your Laravel base repository: 

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-key-inject.sh
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
