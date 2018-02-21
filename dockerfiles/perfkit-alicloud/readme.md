![alibaba cloud](https://upload.wikimedia.org/wikipedia/commons/4/40/Alibaba-cloud-logo-grey-2-01.png)

# perfkit-alicloud

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/perfkit-alicloud.svg)](https://hub.docker.com/r/ellerbrock/perfkit-alicloud/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/perfkit-alicloud.svg)](https://hub.docker.com/r/ellerbrock/perfkit-alicloud/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)


## What's inside?


Google's [PerfKitBenchmarker](https://github.com/GoogleCloudPlatform/PerfKitBenchmarker) configured and ready to run for the [Alibaba Cloud](https://www.alibabacloud.com/).

## Why a Container?

I had some weird problems on Mac having multiple Python version installed and wasted quite some time to figure out what was going on since I'm not a Python Developer.

The current setup for the AliCloud Provider did not work for me so i made the decision to fix it and build it in a way other can use it.

## How to use?

I assume you have the [aliyun-cli](https://github.com/aliyun/aliyun-cli) tools installed and configured for the current running user.

In the first release i map `${HOME}/.aliyuncli` inside the container to run without passing any credentials.

Here how to run a quick test with `iperf`:

```
docker run \
  -it \
  -v "${HOME}/.aliyuncli:/home/perfkit/.aliyuncli:ro" \
ellerbrock/perfkit-alicloud \
  --cloud=AliCloud \
  --machine_type=ecs.sn1.medium \
  --zones=eu-central-1a \
  --benchmarks=iperf
```

In the repository you can find a `run.sh` where i made machine type, zone and benchmark variable:

```
#!/usr/bin/env bash

MACHINE_TYPE="ecs.sn1.medium"
ZONE="eu-central-1a"
BENCHMARKS="iperf"

function main() {
  docker run \
    -it \
    -v "${HOME}/.aliyuncli:/home/perfkit/.aliyuncli:ro" \
  ellerbrock/perfkit-alicloud \
    --cloud=AliCloud \
    --machine_type=${MACHINE_TYPE} \
    --zones=${ZONE} \
    --benchmarks=${BENCHMARKS}
}

main
```

## Info

I'm currently developing on this project and will make further optimization.   
So stay tuned and check for new releases ...

## Try Alibaba Cloud

[Sign up](http://ow.ly/YKQe30hHgp8) today and get $300 valid for the first 60 days to try Alibaba Cloud.


## Contact

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
