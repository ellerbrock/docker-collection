#!/usr/bin/env bash

function main() {
  docker volume create gitlab-config
  docker volume create gitlab-data
  docker volume create gitlab-log

  docker run \
    -d \
    -p 4000:80 \
    -v gitlab-config:/etc/gitlab \
    -v gitlab-data:/var/opt/gitlab \
    -v gitlab-log:/var/log/gitlab \
  gitlab/gitlab-ce:latest
}

main

