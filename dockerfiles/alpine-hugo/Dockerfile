# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.6

LABEL maintainer "Maik Ellerbrock <opensource@frapsoft.com>"

ENV GOPATH /go
ENV PATH $GOPATH/bin:$PATH

RUN \
  adduser -h /site -s /sbin/nologin -u 1000 -D hugo && \
  apk add --no-cache \
    dumb-init && \
  apk add --no-cache --virtual .build-deps \
	gcc \
	musl-dev \
	go \
    git && \
  mkdir -p \
    ${GOPATH}/bin \
    ${GOPATH}/pkg \
    ${GOPATH}/src && \
  go get github.com/kardianos/govendor && \
  govendor get github.com/gohugoio/hugo && \
  cd $GOPATH/src/github.com/gohugoio/hugo && \
  go install && \
  cd $GOPATH && \
  rm -rf pkg src .cache bin/govendor && \
  apk del .build-deps

USER    hugo
WORKDIR /site
VOLUME  /site
EXPOSE  1313

ENTRYPOINT ["/usr/bin/dumb-init", "--", "hugo"]
CMD [ "--help" ]

