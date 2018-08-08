# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM node:alpine

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.2.0"

RUN \
  apk add --no-cache dumb-init && \
  npm install -g yarn && \
  yarn global add gulp-cli

USER    node
WORKDIR /site
VOLUME  /site

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]
CMD [ "gulp" ]
