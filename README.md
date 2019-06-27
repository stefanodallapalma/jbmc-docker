# jbmc-docker
A Docker image based on openjdk:8-jdk-alpine for the CProver JBMC.

## How to use

```docker pull stefadp/jbmc:latest```

In your Dokerfile add ```FROM stefadp/jbmc:latest``` as base image.

Run ```docker run -it <your-image:tag>``` and then ```jbmc --help```.
