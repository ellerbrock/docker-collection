# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM golang:alpine

MAINTAINER Maik Ellerbrock

ENV VERSION 0.0.1

# Optional Configuration Parameter
ARG SYSTEM_TZ

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}

RUN \
  adduser -H -h /go -s /sbin/nologin -u 1000 -D go && \
  apk add --no-cache \
    git \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  apk del tzdata && \
  go get -u -v github.com/spf13/hugo

USER     go
WORKDIR /go

ENTRYPOINT [ "hugo" ]
CMD        [ "--help" ]

