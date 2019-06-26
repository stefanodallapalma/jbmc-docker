# Base Alpine Linux based image with OpenJDK JRE only
FROM openjdk:8-jdk-alpine
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

# Set the working directory to /docker-jbmc
WORKDIR /usr/src/docker-jbmc

# Copy the current directory contents into the container at /app
COPY . ${WORKDIR}

RUN apk update

# General env dependencies
RUN apk add --no-cache git

# JBMC Dependencies
RUN apk add --no-cache bison
RUN apk add --no-cache flex
RUN apk add --no-cache make
RUN apk add --no-cache maven
RUN apk add --no-cache g++

# Installing JBMC
RUN git clone https://github.com/diffblue/cbmc.git \
    && cd cbmc \
    && make -C src DOWNLOADER=wget minisat2-download \
    && make -C jbmc/src setup-submodules \
    && make -C jbmc/src \
    && cd ${WORKDIR}

RUN cp /usr/src/docker-jbmc/cbmc/jbmc/src/jbmc/jbmc /usr/bin 