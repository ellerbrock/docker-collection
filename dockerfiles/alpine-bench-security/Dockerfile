# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.5

MAINTAINER Maik Ellerbrock

ENV VERSION 0.0.1

RUN \
  apk add --no-cache \
    docker \
    dumb-init \
    git && \
  git clone https://github.com/docker/docker-bench-security.git /tmp/bench-security && \
  cp /tmp/bench-security/*.sh /usr/local/bin && \
  cp -R /tmp/bench-security/tests /usr/local/bin && \
  rm -rf /tmp/*

WORKDIR /usr/local/bin

ENTRYPOINT [ "/usr/bin/dumb-init", "docker-bench-security.sh" ]

