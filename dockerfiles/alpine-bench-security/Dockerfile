# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.8

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.1.0"

# Switch to the HTTPS endpoint for the apk repositories
# https://github.com/gliderlabs/docker-alpine/issues/184
RUN \
  sed -i 's/http\:\/\/dl-cdn.alpinelinux.org/https\:\/\/alpine.global.ssl.fastly.net/g' /etc/apk/repositories && \
  apk add --no-cache \
    docker \
    dumb-init && \
  rm -rf /usr/bin/docker?*

COPY ./*.sh /usr/local/bin/
COPY ./tests/*.sh /usr/local/bin/tests/

HEALTHCHECK CMD exit 0

WORKDIR /usr/local/bin

ENTRYPOINT [ "/usr/bin/dumb-init", "docker-bench-security.sh" ]
