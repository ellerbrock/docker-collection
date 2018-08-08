# GitHub:       https://github.com/gohugoio/
# DockerHub:    https://hub.docker.com/r/gohugoio/
# Quay:         https://quay.io/user/gohugoio
# Twitter:      https://twitter.com/gohugoio
# Website:      https://gohugo.io/

FROM golang:alpine AS build

ENV CGO_ENABLED=0
ENV GOOS=linux

RUN \
  apk add --no-cache git && \
  go get golang.org/x/tools/cmd/cover && \
  go get github.com/mattn/goveralls && \
  go get gopkg.in/check.v1 && \
  go get github.com/droundy/goopt && \
  go get github.com/alyu/configparser && \
  go get github.com/aliyun/aliyun-oss-go-sdk/oss && \
  go get github.com/syndtr/goleveldb/leveldb && \
  go build

# ---

FROM alpine:3.8

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.1.0"

COPY --from=build /go/bin/ /bin/

WORKDIR /bin

ENTRYPOINT [ "/bin/ossutil" ]
CMD [ "--help" ]
