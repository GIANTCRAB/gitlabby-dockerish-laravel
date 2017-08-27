# Continuous Deployment

We currently support two deployment method, feel free to add your own method and contribute to this repository.

## Methods

oth methods require the configuration of secrets variables from the repository settings panel. So let's configure this first:

#### Create and authorize a private key

If you execute `ssh-keygen` in your local environment this will start to make a private and public key, this command will prompt for a save directory. 

> If you leave the directory empty, this will overwrite your currently installed keys! 

#### Grant authorization to the private key

The `id_rsa` file must be added on `authorized_keys` file on `.ssh` folder of the deployment server user directory, for example purpose we use `developer` user. Remember set `600` permissions with `chmod` command to `authorized_keys` file. 

#### Add private key as secret variable

You must copy the `id_rsa` content and paste into a secret variable on your GitLab repository settings. Learn more about this nice feature on this [documentation](https://docs.gitlab.com/ee/ci/variables/)

#### Grant user permissions to application folder

Be sure to add the appropriate permissions to perform the deployment commands. Read more this StackOverflow [thread](https://serverfault.com/questions/124800/how-to-setup-linux-permissions-for-the-www-folder).

### Push method

It consists of pushing the changes to a remote branch of a bare-type remote repository.

#### Checklist

- [ ] Create a issue as `Add GitLab CD`.
- [ ] Create a merge request and branch related to the issue.
- [ ] Follow the installation steps.
- [ ] Close  the issue via merge request.

#### Installation steps

1.	Pull your remote branch related of the issue.
2.  Checkout into related issue branch.
2.  Copy the [Push method](../../scripts/continuous-deployment/push-method) files and drop them into your local repository.
3.	Add and commit the recent added files.
4.	Push your local changes to origin.

#### Secrets variables

> The `GIT_DEPLOYMENT_URL` must be remote [bare repository](http://www.saintsjd.com/2011/01/what-is-a-bare-git-repository/), this let you [add possibilities](https://www.digitalocean.com/community/tutorials/how-to-use-git-hooks-to-automate-development-and-deployment-tasks) and require user permissions and configurations. 

| Variables | Description |
| --- | --- |
| GIT_DEPLOYMENT_URL | Remote Git url, by default `git@example.com/namespace/repository.git` |
| GIT_DEPLOYMENT_REMOTE | Remote Git repository, by default must be `origin` |
| GIT_DEPLOYMENT_BRANCH | Remote Git branch, by default must be `master` |

### Pull method

It consists of connecting to a remote server to bring all the changes and execute the laravel configurations.

#### Checklist

- [ ] Create a issue as `Add GitLab CD`.
- [ ] Create a merge request and branch related to the issue.
- [ ] Follow the installation steps.
- [ ] Close  the issue via merge request.

#### Installation steps

1.	Pull your remote branch related of the issue.
2.  Checkout into related issue branch.
2.  Copy the [Pull method](../../scripts/continuous-deployment/pull-method) files and drop them into your local repository.
3.	Add and commit the recent added files.
4.	Push your local changes to origin.

#### Secrets variables

There variables must be added as secrets variables, remember change these values with your own production environment. 

| Variables | Description |
| --- | --- |
| GIT_DEPLOYMENT_REMOTE | Remote Git repository, by default must be `origin`  |
| GIT_DEPLOYMENT_BRANCH | Remote Git branch, by default must be `master` |
| STAGING_SERVER_HOSTNAME | Deployment hostname server with username, for example `developer@yourdomain.com` |
| STAGING_SERVER_DIRECTORY | Deployment server application directory, for example `/var/www/yourdomain.com` |
