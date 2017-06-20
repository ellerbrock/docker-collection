![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-hugo

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-hugo.svg)](https://hub.docker.com/r/ellerbrock/alpine-hugo/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-hugo.svg)](https://hub.docker.com/r/ellerbrock/alpine-hugo/) [![Quay Status](https://quay.io/repository/ellerbrock/alpine-hugo/status)](https://quay.io/repository/ellerbrock/alpine-hugo/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-hugo](https://hub.docker.com/r/ellerbrock/alpine-hugo/)
- Quay: [ellerbrock/alpine-hugo](https://quay.io/repository/ellerbrock/alpine-hugo)

## Installation

`docker pull ellerbrock/alpine-hugo`

## Example

Run inside your local hugo folder and bind to localhost interface:

```
docker run -it \
  -p 127.0.0.1:1313:1313 \
  -v ${PWD}:/site \
ellerbrock/alpine-hugo server --bind 0.0.0.0 -w
```

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
