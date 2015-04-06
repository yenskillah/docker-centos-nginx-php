# docker-centos-nginx-php

CentOS 7, nginx, PHP-FPM: PHP 5.6.7+/Xdebug and other utiliies

## Building

```bash
git clone https://github.com/shanonvl/docker-centos-nginx-php && cd docker-centos-nginx-php
docker build --rm -t <name-of-your-image> .
e.g. docker build --rm -t centos7-nginx-php56 .
```

NOTE: You may need to ```sudo``` to run docker

## Running a container

```bash
docker run --name <container-name> -p <local-web>:80 -it <image-name>

# using -d will daemonize the container
e.g. docker run --name web1 -p 8500:80 -d centos7-nginx-56
# if you would like to see supervisor logs/launch docker in the current shell, swap with -it:
e.g. docker run --name web1 -p 8500:80 -it centos7-nginx-56
```
