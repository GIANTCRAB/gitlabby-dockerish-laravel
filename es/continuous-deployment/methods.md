# Despliegue contínuo

## Técnicas

Hay dos tipos de técnicas de despliegue que se utilizan comúnmente, un empuje (push) y un tirón (pull). Una configuración push requiere que el punto final remoto sea un servidor Git, mientras que una configuración pull solo requiere detalles SSH. Sin embargo, existen diferentes variables necesarias para configurar estos despliegues.

### Configuración de empuje

Copie los siguientes archivos y deposítelos en su repositorio en GitLab:

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-build.sh
* .gitlab-test.sh
* .gitlab-staging-deploy.sh

Asegúrece de que su repositorio tenga configurado un despliegue de Git remoto y que haya creado una clave SSH para acceder a éste de manera remota.

Abra el archivo `.gitlab-ci.yml` y establezca las siguientes variables:

```
  GIT_DEPLOYMENT_URL: git@gitlab.com:woohuiren/test-laravel-project.git
  GIT_DEPLOYMENT_REMOTE: staging
  GIT_DEPLOYMENT_BRANCH: master
  SSH_PRIVATE_KEY: somethingsomethingblahblah # Recommended to put into GitLab secret variables instead
```

### Configuración de tirón

Copie los siguientes archivos y deposítelos en su repositorio en GitLab:

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-build.sh
* .gitlab-test.sh
* .gitlab-staging-pull-deploy.sh

La clave privada SSH es utilizada para acceder al servidor de ensayo. Asegúrese de que su servidor de staging ya tiene las claves SSH necesarias para extraer el código del repositorio en GitLab.

Abra el archivo `.gitlab-ci.yml` y establezca las siguientes variables:

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