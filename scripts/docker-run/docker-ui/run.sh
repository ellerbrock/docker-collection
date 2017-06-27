#!/usr/bin/env bash

function main() {
  docker run \
    --privileged \
    --network=secnet \
    -p 127.0.0.1:9000:9000 \
    -v /var/run/docker.sock:/var/run/docker.sock \
  uifd/ui-for-docker
}

main

