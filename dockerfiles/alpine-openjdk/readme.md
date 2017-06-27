![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-openjdk

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-openjdk.svg)](https://hub.docker.com/r/ellerbrock/alpine-openjdk/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-openjdk.svg)](https://hub.docker.com/r/ellerbrock/alpine-openjdk/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-openjdk](https://hub.docker.com/r/ellerbrock/alpine-openjdk/)

## Installation

`docker pull ellerbrock/alpine-openjdk`

## About the Container

Base image is [Alpine Linux](https://alpinelinux.org/) which is a lightweight Distribution with a small surface area for security concerns, but with enough functionality for development and interactive debugging.  

To prevent zombie reaping i run [dumb-init](https://github.com/Yelp/dumb-init) as PID 1 which forwards signals to all processes running in the container.

To increase security the container runs as a unprivileged User.  
In case you need to run for some reason stuff as root you can do this via `docker run -it -u root ellerbrock/alpine-openjdk ...`.

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

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
