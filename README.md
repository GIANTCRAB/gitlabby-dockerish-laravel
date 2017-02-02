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
Copy the following files and drop them in your Laravel base repository: 

* .env.gitlab-testing
* .gitlab-ci.sh
* .gitlab-ci.yml
