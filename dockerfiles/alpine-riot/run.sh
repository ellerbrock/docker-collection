#!/usr/bin/env bash

function main() {
  docker run -d \
    -p 8080:8080 \
  ellerbrock/alpine-riot:latest
}

main

