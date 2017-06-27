![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-git

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-git.svg)](https://hub.docker.com/r/ellerbrock/alpine-git/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-git.svg)](https://hub.docker.com/r/ellerbrock/alpine-git/) [![Quay Status](https://quay.io/repository/ellerbrock/alpine-git/status)](https://quay.io/repository/ellerbrock/alpine-git/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-git](https://hub.docker.com/r/ellerbrock/alpine-git/)
- Quay: [ellerbrock/alpine-git](https://quay.io/repository/ellerbrock/alpine-git)

## Installation

`docker pull ellerbrock/alpine-git`

## Example Usage

Clone a Repository in the current folder:

```
docker run -it \
  -v ${PWD}:/home/git \
ellerbrock/alpine-git clone https://github.com/ellerbrock/docker-collection.git
```

## Configuration Parameter

_These Settings are **optional**, if not set the default values will be used._

```
# Optional Configuration Parameter
ARG SERVICE_USER
ARG SERVICE_HOME

# Default Settings
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}

```

Documentation: <https://docs.docker.com/compose/compose-file/#/args>

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
