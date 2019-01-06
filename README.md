# Gitlabby Dockerish Laravel
What happens when you Dockerize your Laravel testing environment and throw it at Gitlab CI?

This repository includes several files required to run the Gitlab CI for your Laravel. The Docker container is pre-packaged with Laravel vendor dependecies, which reduces the number of files required to be downloaded. 

It pulls the PHP Laravel image from [this repository](https://github.com/GIANTCRAB/php-laravel-env).

## Support
* PHP 7.1/7.2/7.3
* Laravel 5.6/5.7
* MySQL 5.5
* Redis (Your Laravel will require `predis/predis` composer package)
* Laravel Dusk (UI automated testing)

# Usage

There are several deployment techniques available: SSH and Cloudfoundry

## SSH Deployment

Copy the files in the ssh directory and drop them to the base of your GitLab repo.

Ensure that your repository has set a Git deployment remote and you have created a SSH key for access to this remote.

Open up `.gitlab-ci.yml` and set the variables for the following: 

```
  GIT_DEPLOYMENT_URL: git@gitlab.com:woohuiren/test-laravel-project.git
  GIT_DEPLOYMENT_REMOTE: staging
  GIT_DEPLOYMENT_BRANCH: master
  SSH_PRIVATE_KEY: somethingsomethingblahblah # Recommended to put into GitLab secret variables instead
```

## Cloudfoundry

Copy the files in the cloudfoundry directory and drop them to the base of your GitLab repo.

Set the secret variables accordingly.