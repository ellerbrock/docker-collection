![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-nodejs

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-nodejs.svg)](https://hub.docker.com/r/ellerbrock/alpine-nodejs/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-nodejs.svg)](https://hub.docker.com/r/ellerbrock/alpine-nodejs/) [![Quay Status](https://quay.io/repository/ellerbrock/alpine-bash-it/status)](https://quay.io/repository/ellerbrock/alpine-nodejs/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-nodejs](https://hub.docker.com/r/ellerbrock/alpine-nodejs/)
- Quay: [ellerbrock/alpine-nodejs](https://quay.io/repository/ellerbrock/alpine-nodejs)

## Installation

`docker pull ellerbrock/alpine-nodejs`


## About the Container

As Base Image i use [Alpine Linux](https://alpinelinux.org/) which is lightweight Distribution with a small surface area for security concerns, but with enough functionality for development and interactive debugging.

To prevent zombie reaping processes i run [dumb-init](https://github.com/Yelp/dumb-init) as PID 1 which forwards signals to all processes running in the container. 

## Example Usage

**Run Node.js in the current local folder:**

`docker run -v $(PWD):/home/nodejs ellerbrock/alpine-nodejs`

This will start index.js in your current folder.


**Pass an Command to Node.js:**

Lets say you want to run src/run.js (which is in the current directory):

`docker run -v $(PWD):/home/nodejs ellerbrock/alpine-nodejs src/run.js`


**Run an app from a Volume:**

`docker run -v my-app-name:/home/nodejs ellerbrock/alpine-nodejs`


## Configuration Parameter

_These Settings are **optional**, if not set the default values will be used._

```
# Optional Configuration Parameter
ARG SYSTEM_TZ         # Timezone (default: Europe/Berlin)
ARG SERVICE_USER      # Node.js User (default: nodejs)
ARG SERVICE_HOME      # Node.js Home Directory (default: /home/nodejs)

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-nodejs}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}
```

### Dockerfile example:

```
docker build \
  --build-arg SERVICE_USER=ellerbrock \
  -t ellerbrock/alpine-nodejs .
```
Documentation: <https://docs.docker.com/engine/reference/builder/#/arg>

### docker-compose example: 

```
  args:
    SERVICE_USER: ellerbrock
    ...
```

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
