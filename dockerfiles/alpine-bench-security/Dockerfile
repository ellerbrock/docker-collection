# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.6

MAINTAINER Maik Ellerbrock

ENV VERSION 0.1.0

# Optional Configuration Parameter
ARG SYSTEM_TZ

# Default Settings (for optional Parameter)
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}

RUN \
  apk add --no-cache \
    docker \
    dumb-init \
    git \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  rm -rf /usr/bin/docker-* /usr/bin/dockerd && \
  git clone https://github.com/docker/docker-bench-security.git /tmp/bench-security && \
  cp /tmp/bench-security/*.sh /usr/local/bin && \
  cp -R /tmp/bench-security/tests /usr/local/bin && \
  apk del tzdata && \
  rm -rf /tmp/*

WORKDIR /usr/local/bin

ENTRYPOINT [ "/usr/bin/dumb-init", "docker-bench-security.sh" ]

