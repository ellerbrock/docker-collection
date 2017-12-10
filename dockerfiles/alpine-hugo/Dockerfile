# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM golang:1.10-rc-alpine3.7 AS build

RUN \
  apk add --no-cache \
    git \
    musl-dev && \
  go get github.com/golang/dep/cmd/dep && \
  go get github.com/kardianos/govendor && \
  govendor get github.com/gohugoio/hugo && \
  cd /go/src/github.com/gohugoio/hugo && \
  dep ensure && \
  go install -ldflags '-s -w'

# ---

FROM alpine:3.7

COPY --from=build /go/bin/hugo /bin/hugo

RUN \
  adduser -h /site -s /sbin/nologin -u 1000 -D hugo && \
  apk add --no-cache dumb-init

USER    hugo
WORKDIR /site
VOLUME  /site
EXPOSE  1313

ENTRYPOINT [ "/usr/bin/dumb-init", "--", "hugo" ]
CMD [ "--help" ]

