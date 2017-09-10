# Integración contínua

## II. Instalación

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

