#!/usr/bin/env bash

function main() {

  # Registry Configuration:
  # /etc/docker/registry/config.yml \

  docker volume create registry-data

  docker run \
    -it \
    -v registry-data:/var/lib/registry \
    -p 5000:5000 \
  registry:latest
}

main

