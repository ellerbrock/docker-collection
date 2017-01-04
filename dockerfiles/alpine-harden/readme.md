![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-harden

_Alpine Linux 3.5 harden with an unprivileged user_ 

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-harden.svg)](https://hub.docker.com/r/ellerbrock/alpine-harden/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-harden.svg)](https://hub.docker.com/r/ellerbrock/alpine-harden/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-harden](https://hub.docker.com/r/ellerbrock/alpine-harden/)
- Quay: [ellerbrock/alpine-harden](https://quay.io/repository/ellerbrock/alpine-harden)

## Installation

`docker pull ellerbrock/alpine-harden`

## Configuration Parameter

_These Settings are **optional**, if not set the default values will be used._

```
# Optional Configuration Parameter
ARG SYSTEM_TZ     # Timezone
ARG SERVICE_USER  # Username
ARG SERVICE_HOME  # User Home Directory

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}
```

### Dockerfile example:

```
docker build \
  --build-arg SERVICE_USER=ellerbrock \
  -t ellerbrock/alpine-harden:latest .
```
Documentation: <https://docs.docker.com/engine/reference/builder/#/arg>

### docker-compose example: 

```
  args:
    SERVICE_USER: ellerbrock
    ...
```

Documentation: <https://docs.docker.com/compose/compose-file/#/args>

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
