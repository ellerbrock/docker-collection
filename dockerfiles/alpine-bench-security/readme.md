![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-bench-security

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-bench-security.svg)](https://hub.docker.com/r/ellerbrock/alpine-bench-security/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-bench-security.svg)](https://hub.docker.com/r/ellerbrock/alpine-bench-security/) [![Quay Status](https://quay.io/repository/ellerbrock/alpine-bench-security/status)](https://quay.io/repository/ellerbrock/alpine-bench-security/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-bench-security](https://hub.docker.com/r/ellerbrock/alpine-bench-security/)
- Quay: [ellerbrock/alpine-bench-security](https://quay.io/repository/ellerbrock/alpine-bench-security)

## Installation

`docker pull ellerbrock/alpine-bench-security`

## How to use

```
docker run -it \
  --net host \
  --pid host \
  --cap-add audit_control \
  --label docker_bench_security \
  -v /var/lib:/var/lib \
  -v /var/run/docker.sock:/var/run/docker.sock \
  -v /usr/lib/systemd:/usr/lib/systemd \
  -v /etc:/etc \
ellerbrock/alpine-bench-security
```

Check the [official Repository](https://github.com/docker/docker-bench-security) for further Informations.

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
