# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.6

MAINTAINER Maik Ellerbrock (https://github.com/ellerbrock)

RUN \
  adduser -h /sass -s /sbin/nologin -D sass && \
  apk add --no-cache \
    dumb-init \
    libsass \
    sassc && \
  rm -f /tmp/* /etc/apk/cache/*

WORKDIR /sass

VOLUME /sass

ENTRYPOINT [ "/usr/bin/dumb-init", "sassc" ]

CMD [ "--help" ]

