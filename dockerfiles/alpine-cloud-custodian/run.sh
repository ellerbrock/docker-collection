#!/usr/bin/env bash

function main () {
  docker run \
    -it \
    -v "${HOME}/.aws:/custodian/.aws:ro" \
    -v "${PWD}/logs:/tmp" \
    -v "${PWD}/.cache:/custodian/.cache" \
    -v "${PWD}/policies:/custodian/policies:ro" \
  ellerbrock/cloud-custodian run --output-dir=/tmp \
    policies/my-policy.yml
}

main

