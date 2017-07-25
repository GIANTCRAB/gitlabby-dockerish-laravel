# Gitlabby Dockerish Laravel

> ¿Qué sucede cuando *Dockerizas* tu ambiente de pruebas en Laravel y lo lanzas en GitLab CI?

Este repositorio incluye varios archivos requeridos para utilizar GitLab CI en tu proyecto basado en Laravel. El contenedor Docker está pre-empaquetado con las dependencias de Laravel, el cual reduce el número de archivos requeridos para ser descargados.

Esto utiliza una imágen Docker que incluye PHP para Laravel desde [este repositorio](https://github.com/GIANTCRAB/php-laravel-env).

## Soporte
* PHP 7/7.1
* Laravel 5.3/5.4
* MySQL 5.5

Para moverse entre las versiones de Laravel, navega entre las ramas de este repositorio. La rama maestra siempre tendrá la última imágen.

# Utilización

Aquí hay dos caminos los cuales puedes tomar -- para integración contínua y despliegue contínuo. 

## Integración contínua

Copie los siguientes archivos y deposítelos en su repositorio en GitLab:

* .env.gitlab-testing
* .gitlab-ci.yml
* .gitlab-build.sh
* .gitlab-test.sh

Abra el archivo `.gitlab-ci.yml` y comente o elimine la información de la puesta en escena o *staging*: 

```
...
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

## Despliegue contínuo

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
