#!/usr/bin/env bash

ACCESS_KEY_ID="your-access-key-here"
SECRET_ACCESS_KEY="your-secret-key-here"
DEFAULT_REGION="us-east-2"
DEFAULT_OUTPUT="json"

MACHINE_TYPE="t2.micro"
BENCHMARKS="iperf"

function main() {
  docker run \
    -it \
    -e AWS_ACCESS_KEY_ID="${ACCESS_KEY_ID}" \
    -e AWS_SECRET_ACCESS_KEY="${SECRET_ACCESS_KEY}" \
    -e AWS_DEFAULT_REGION="${DEFAULT_REGION}" \
    -e AWS_DEFAULT_OUTPUT="${DEFAULT_OUTPUT}" \
  ellerbrock/perfkit-aws \
    --cloud=AWS \
    --machine_type="${MACHINE_TYPE}" \
    --zones="${AWS_DEFAULT_REGION}" \
    --benchmarks="${BENCHMARKS}"
}

main

