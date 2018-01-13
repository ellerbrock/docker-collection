![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-aliyuncli

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-aliyuncli.svg)](https://hub.docker.com/r/ellerbrock/alpine-aliyuncli/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-aliyuncli.svg)](https://hub.docker.com/r/ellerbrock/alpine-aliyuncli/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

Please check the [official Repository](https://github.com/aliyun/aliyun-cli) for further Information.

## Installation

`docker pull ellerbrock/alpine-aliyuncli`

## Usage

### Export your credentials

```
export ALICLOUD_ACCESS_KEY="your-access-key-here"
export ALICLOUD_SECRET_KEY="your-secret-key-here"
export ALICLOUD_REGION="your-region-here"

```

#### Run Docker

```
docker run \
  -e "ALICLOUD_ACCESS_KEY=${ALICLOUD_ACCESS_KEY}" \
  -e "ALICLOUD_SECRET_KEY=${ALICLOUD_SECRET_KEY}" \
  -e "ALICLOUD_REGION=${ALICLOUD_REGION}" \
ellerbrock/alpine-aliyuncli
```

*You can pass the variables directly without first exporting them,
but since i will use this later with Travis CI and encrypted environment variables
this speraration makes it later more easy for me.*

##  Contact

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
