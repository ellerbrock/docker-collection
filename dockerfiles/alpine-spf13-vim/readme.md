![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-spf13-vim

_The Ultimate Vim Distribution_

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-spf13-vim.svg)](https://hub.docker.com/r/ellerbrock/alpine-spf13-vim/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-spf13-vim.svg)](https://hub.docker.com/r/ellerbrock/alpine-spf13-vim/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-spf13-vim](https://hub.docker.com/r/ellerbrock/alpine-spf13-vim/)

![alpine-spf13-vim](https://github.frapsoft.com/top/alpine-spf13-vim.png)

## Installation

`docker pull ellerbrock/alpine-spf13-vim`

Please check the [spf13-vim](http://vim.spf13.com/) website for further information how to use and setup.

## Configuration Parameter

_These Settings are **optional**, if not set the default values will be used._

```
# Optional Configuration Parameter
ARG SYSTEM_TZ
ARG SERVICE_USER
ARG SERVICE_HOME

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}

```

### Dockerfile example:

```
docker build \
  --build-arg SYSTEM_TZ=Europe/Berlin \
  -t ellerbrock/alpine-spf13-vim:latest .
```
Documentation: <https://docs.docker.com/engine/reference/builder/#/arg>

### docker-compose example: 

```
  args:
    SYSTEM_TZ: Europe/Berlin
    ...
```

Documentation: <https://docs.docker.com/compose/compose-file/#/args>

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
