# Dockerfile for Plesk

Dockerfile for building Plesk images.

# How To Build And Test

Here is an example on how to build the image manually:

    docker build -t nodetemple/plesk:17.0 .

Create a container to test the image:

    docker run --privileged -d -it -p 8880:8880 nodetemple/plesk:17.0

Open IP:8880 URL using browser.

Default login and password: admin / changeme 

# Known Issues

#### Unable to start the container

Symptoms:

    Container dies after start.

Right now it is necessary to run the containers in the priviledged mode using "--privileged" option.

#### Error during building of the image

Symptoms:

    ===> Cumulative APS controller upgrade (final stage) has been started.
    Killed

Starting from Docker 1.10 it is not possible to build the image, sorry. We are working on this problem.

#### Error after initial configuration

Symptoms:

    Unable to configure control panel: reconfig failed: Error while rename file /etc/hosts.tmp:
    Device or resource busy.

Ignore the error and refresh the page in browser (F5).

#### Error after license upload

Symptoms:

    502 Bad Gateway

Ignore the error and refresh the page in browser (F5). 
