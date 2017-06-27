#!/usr/bin/env bash

function main() {
  # Port 8500 WebGUI

  docker volume create consul-data

  docker run \
    -it \
    -p 8300:8300/tcp \
    -p 8301:8301/tcp \
    -p 8301:8301/udp \
    -p 8302:8302/tcp \
    -p 8302:8302/udp \
    -p 8400:8400/tcp \
    -p 8500:8500/tcp \
    -p 8600:8600/tcp \
    -p 8600:8600/udp \
    -v consul-data:/consul \
  consul:latest
}

main

