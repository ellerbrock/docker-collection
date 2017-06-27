#!/usr/bin/env bash

# Documentation:
# https://hub.docker.com/r/library/jenkins/

function main() {
  docker volume create jenkins-data

  docker run \
    -it \
    -u root \
    -p 8080:8080 \
    -p 50000:50000 \
    -v jenkins-data:/var/jenkins_home \
  jenkins:alpine
}

main

