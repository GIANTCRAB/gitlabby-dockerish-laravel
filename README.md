# Gitlabby Dockerish Laravel
What happens when you Dockerize your Laravel testing environment and throw it at Gitlab CI?

This repository includes several files required to run the Gitlab CI for your Laravel. The Docker container is pre-packaged with Laravel vendor dependecies, which reduces the number of files required to be downloaded. 

## Support
* PHP 7
* Laravel 5.3
* MySQL 5.5

# Usage
Copy the following files and drop them in your Laravel base repository: 

* .env.gitlab-testing
* .gitlab-ci.sh
* .gitlab-ci.yml
