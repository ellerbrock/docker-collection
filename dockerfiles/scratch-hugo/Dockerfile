# GitHub:  https://github.com/gohugoio/
# Docker:  https://hub.docker.com/r/gohugoio/
# Twitter: https://twitter.com/gohugoio

FROM golang:1.10-alpine AS build

ENV CGO_ENABLED=0
ENV GOOS=linux

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

FROM scratch

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.0.2"

COPY --from=build /go/bin/hugo /bin/hugo

WORKDIR /site

EXPOSE  1313

ENTRYPOINT [ "/hugo" ]
CMD [ "--help" ]
