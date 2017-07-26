# Gitlabby Dockerish Laravel

> ¿Qué sucede cuando *Dockerizas* tu ambiente de pruebas en Laravel y lo lanzas en GitLab CI?

Este repositorio incluye varios archivos requeridos para utilizar GitLab CI en tu proyecto basado en Laravel. El contenedor Docker está pre-empaquetado con las dependencias de Laravel, el cual reduce el número de archivos requeridos para ser descargados.

Esto utiliza una imágen Docker que incluye PHP para Laravel desde [este repositorio](https://github.com/GIANTCRAB/php-laravel-env).

## Soporte

Para moverse entre las versiones de Laravel, navega entre las ramas de este repositorio. La rama maestra siempre tendrá la última imágen.

| Software | Version |
| :---: | :---: |
| PHP | 7 / 7.1 |
| Laravel | 5.3 / 5.4 |
| MySQL | 5.5 |

## Traducciones

Actualmente este repositorio está disponible en sólo dos idiomas, es libre de traducir las instrucciones a otros idiomas e incluso mejorarlas ya existen.

| Idioma | Mantenedor |
| :---: | --- |
| [English](README.md) | Huiren Woo [@GIANTCRAB](https://github.com/GIANTCRAB) |
| Español | Ian Torres [@demency](https://github.com/demency) |

## Contenido

Aquí hay dos caminos los cuales puedes tomar -- para integración contínua y despliegue contínuo. 

### Integración contínua

|Capítulos|Resumen|
| --- | --- |
| [I. Introducción](/es/continuous-integration/introduction.md) | ... |
| [II. Instalación](/es/continuous-integration/installation.md) | ... |

### Despliegue contínuo

| Capítulo | Resumen |
| --- | --- |
| [I. Introducción](/es/continuous-deployment/introduction.md) | ... | 
| [II. Métodos](/es/continuous-deployment/methods.md) | ... |
