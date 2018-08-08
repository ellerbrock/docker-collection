# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.8

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.2.0"

# Optional Configuration Parameter
ARG SERVICE_USER

# Default Settings (for optional Parameter)
ENV SERVICE_USER ${SERVICE_USER:-bench-security}

# Others
ENV GOPATH /tmp/build
ENV PATH ${PATH}:${GOPATH}/bin
ENV SRC_DIR ${GOPATH}/src/github.com/socialengine/rancher-cron

RUN \
  adduser -s /sbin/nologin -u 1000 -H -D rancher-cron && \
  apk add --no-cache \
    ca-certificates \
    dumb-init && \
  apk add --no-cache --virtual build-deps \
    build-base \
    bzr \
    git \
    go \
    make \
    mercurial && \
  mkdir -p \
    ${GOPATH}/bin \
    ${GOPATH}/pkg \
    ${GOPATH}/src/github.com/socialengine && \
  git clone https://github.com/SocialEngine/rancher-cron.git ${SRC_DIR} && \
  cd ${GOPATH}/src/github.com/socialengine/rancher-cron && \
  go get -u github.com/kardianos/govendor && \
  go get github.com/gorilla/websocket && \
  go get golang.org/x/sys/unix && \
  govendor sync && \
  make build && \
  cp ${SRC_DIR}/docker/dist/rancher-cron /usr/bin && \
  apk del build-deps && \
  rm -rf /tmp/*

USER rancher-cron

ENTRYPOINT [ "/usr/bin/dumb-init", "rancher-cron" ]
