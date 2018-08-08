# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM python:2-alpine3.8

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.1.0"

ARG SERVICE_USER

ENV SERVICE_USER ${SERVICE_USER:-aliyun}

COPY requirements.txt /tmp

RUN \
  adduser -s /sbin/nologin -u 1000 -H -D ${SERVICE_USER} && \
  apk add --no-cache build-base && \
  pip install aliyuncli && \
  pip install --no-cache-dir -r /tmp/requirements.txt && \
  apk del build-base && \
  rm -rf /tmp/*

USER ${SERVICE_USER}

WORKDIR /usr/local/bin

ENTRYPOINT [ "aliyuncli" ]

CMD        [ "--help" ]
