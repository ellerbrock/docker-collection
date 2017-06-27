#!/usr/bin/env bash

function main() {
  local BITBUCKET_REPO_DIR="bitbucket-repos"
  local BITBUCKET_VERSION="4.14"
  
  docker volume create --name ${BITBUCKET_REPO_DIR}
  
  docker run --name="bitbucket" \
    -v ${BITBUCKET_REPO_DIR}:/var/atlassian/application-data/bitbucket \
    -p 80:7990 \
    -p 7999:7999 \
      atlassian/bitbucket-server:${BITBUCKET_VERSION}
}

main

