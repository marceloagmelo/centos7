# Docker image for CentOS 7

### How to download the image

docker pull marceloagmelo/centos7:1.0.0

### How to use image

The image contains a control.sh script, this script has several operations.

#### help

docker run --rm -ti marceloagmelo/centos7:1.0.0 help

```
=============================================================================   
USAGE: ./control.sh COMMAND [args]                                              
  Command list:                                                                 
    - info        : execute info scripts                                        
    - shell       : execute shell scripts                                       
    - start       : execute start scripts                                       
    - status      : execute status scripts                                      
    - test        : execute test scripts 
    
=============================================================================
```


#### info

The info operation shows only image's metadafa information.

docker run --rm -ti marceloagmelo/centos7:1.0.0 info

#### shell

This operation starts the /bin/bash shell
```
docker run --rm -ti marceloagmelo/centos7:1.0.0 shell
```

#### start

The start operation initialize the node process by running `npm install && npm start` in the /opt/app directory. If no application files are found the start operation will use the default application, this application can be used for testing.

```
docker run -d -p 0.0.0.0:8000:8000 marceloagmelo/centos7:1.0.0 start
```

In this example the default application is executed.

> NOTE: In the Environment Variables section we will see all the environment variables available. In order to change the process behaviour we have to configure some environment variable when the container/pod is started.

#### status

The status operation shows information about the running proccess

docker run --rm -ti marceloagmelo/centos7:1.0.0 status

## How to create new images from Centos 7 imagen

In this example we will create new nodejs application using produban-br/centos7:1.0.0 as the base image.

Dockerfile

```
FROM marceloagmelo/centos7:1.0.0
```

```
docker build .
```

** Please ensure that you only add production dependencies to you package or your image **: You can achieve this
by running `npm prune --production` before generating the package or the image.

## Time Zone
By default this image uses the time zone "America/Sao_Paulo", if you want to change the default time zone, you should specify the environment variable TZ.
