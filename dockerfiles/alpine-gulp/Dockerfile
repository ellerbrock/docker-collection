# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM node:8.1-alpine

MAINTAINER Maik Ellerbrock (https://github.com/ellerbrock)

ENV VERSION 0.0.1

COPY src/entrypoint.sh /

RUN \
  apk add --no-cache dumb-init && \
  npm install -g yarn && \
  yarn global add gulp-cli

USER node

WORKDIR /site

VOLUME /site

ENTRYPOINT [ "/entrypoint.sh" ]

