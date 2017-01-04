![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-mongodb

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-mongodb.svg)](https://hub.docker.com/r/ellerbrock/alpine-mongodb/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-mongodb.svg)](https://hub.docker.com/r/ellerbrock/alpine-mongodb/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-mongodb](https://hub.docker.com/r/ellerbrock/alpine-mongodb/)
- Quay: [ellerbrock/alpine-mongodb](https://quay.io/repository/ellerbrock/alpine-mongodb)

## Installation

`docker pull frapsoft/alpine-mongodb`

## Configuration Parameter

_These Settings are **optional**, if not set the default values will be used._

```
# Optional Configuration Parameter
ARG SYSTEM_TZ         # Timezone
ARG SERVICE_USER      # Mongo User
ARG SERVICE_HOME      # Mongo Database Directory
ARG SERVICE_PORT      # Mongo Port
ARG SERVICE_LOGFILE   # Mongo Logfile
ARG SERVICE_LOGLEVEL  # Mongo Loglevel

ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-mongo}
ENV SERVICE_HOME ${SERVICE_HOME:-/data/db}
ENV SERVICE_PORT ${SERVICE_PORT:-27017}
ENV SERVICE_LOGFILE ${SERVICE_LOGFILE:-/data/log/mongod.log}
ENV SERVICE_LOGLEVEL ${SERVICE_LOGLEVEL:-vvv}
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