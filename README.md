# Dockerfile for Plesk

Dockerfile for building Plesk images.

# How To Build And Test

Here is an example on how to build the image manually:

    docker build -t nodetemple/plesk:17.0 https://github.com/nodetemple/plesk.git#master:17.0

Create a container to test the image:

    docker run -d -it --name=plesk --privileged -p 8880:8880 -p 8447:8447 nodetemple/plesk:17.0

Open IP:8880 URL using browser.

Default login and password: admin / changeme
