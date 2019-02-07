# Docker-Angular Runtime Variables

This is the demo repo for my guide: [https://danielhabenicht.github.io/docker/angular/2019/02/06/angular-nginx-runtime-variables.html](https://danielhabenicht.github.io/docker/angular/2019/02/06/angular-nginx-runtime-variables.html)

A guide for setting up runtime variables for an Angular App which is hosted in a Nginx Docker container (or any else). What’s special about this? It does not need another file to be loaded before bootstrapping the app, neither to be included via the docker run command. It simply lets you set variables in you angular app via Environment variables passed to docker by `docker run -p 80:80 -e TEST_ENV="This really works!" -it danielhabenicht/docker-angular-runtime-variables`.

# Quick Guide

> For a more in depth guide, follow my [guide](https://danielhabenicht.github.io/docker/angular/2019/02/06/angular-nginx-runtime-variables.html).

1. Have a look at the [Dockerfile](./Dockerfile)
   - Notice the [ENTRYPOINT Script](./substitute_env_variables_multi.sh), it substitutes the variables in any or the given files with the variables in your Environment
2. `docker build . -t runtime-env-image`
3. `docker run --rm -e "TEST_ENV=That was fast!" -it runtime-env-image`
