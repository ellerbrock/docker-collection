![docker](https://github.frapsoft.com/top/docker-security.jpg)

# perfkit-aws

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/perfkit-aws.svg)](https://hub.docker.com/r/ellerbrock/perfkit-aws/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/perfkit-aws.svg)](https://hub.docker.com/r/ellerbrock/perfkit-aws/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

## What's inside?

Google's [PerfKitBenchmarker](https://github.com/GoogleCloudPlatform/PerfKitBenchmarker) configured and ready to run on AWS.

## Why a Container?

You don't have to install anything on your local machine, clean and isolated in a Container ready to run.

## How to use?

There are two options:

1.) pass your credentials als environment variable to docker.  
2.) map your `~/.aws` folder inside the container

### Example with Environment Variables

You can find this script in the repository with the name `run.sh`:

```
#!/usr/bin/env bash

ACCESS_KEY_ID="your-access-key-here"
SECRET_ACCESS_KEY="your-secret-key-here"
DEFAULT_REGION="us-east-2"
DEFAULT_OUTPUT="json"

MACHINE_TYPE="t2.micro"
ZONE="us-east-2"
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
    --zones="${ZONE}" \
    --benchmarks="${BENCHMARKS}"
}

main
```

### Example with `.aws` mapping

```
#!/usr/bin/env bash

MACHINE_TYPE="t2.micro"
ZONE="us-east-2"
BENCHMARKS="iperf"

function main() {
  docker run \
    -it \
    -v "${HOME}/.aws:/home/perfkit/.aws:ro" \
  ellerbrock/perfkit-aws \
    --cloud=AWS \
    --machine_type="${MACHINE_TYPE}" \
    --zones="${ZONE}" \
    --benchmarks="${BENCHMARKS}"
}

main
```

##  Contact

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
