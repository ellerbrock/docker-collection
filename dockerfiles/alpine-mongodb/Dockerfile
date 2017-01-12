# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:edge

MAINTAINER Maik Ellerbrock

ENV VERSION 0.0.1
ENV DUMP_INIT_VERSION 1.2.0

# Optional Configuration Parameter
ARG SYSTEM_TZ
ARG SERVICE_USER
ARG SERVICE_HOME
ARG SERVICE_PORT
ARG SERVICE_LOGFILE
ARG SERVICE_LOGLEVEL

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-mongo}
ENV SERVICE_HOME ${SERVICE_HOME:-/data}
ENV SERVICE_PORT ${SERVICE_PORT:-27017}
ENV SERVICE_LOGFILE ${SERVICE_LOGFILE:-${SERVICE_HOME}/log/mongod.log}
ENV SERVICE_LOGLEVEL ${SERVICE_LOGLEVEL:-v}

COPY ./entrypoint.sh /

RUN \
  mkdir -p ${SERVICE_HOME} $(dirname ${SERVICE_LOGFILE}) && \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME} $(dirname ${SERVICE_LOGFILE}) && \
  echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk add --no-cache \
    mongodb \
    openssl \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  wget -O /usr/bin/dumb-init \
    https://github.com/Yelp/dumb-init/releases/download/v${DUMP_INIT_VERSION}/dumb-init_${DUMP_INIT_VERSION}_amd64 && \
  chmod +x /usr/bin/dumb-init && \
  apk del tzdata openssl

USER    ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}
VOLUME  ${SERVICE_HOME}
EXPOSE  ${SERVICE_PORT}

ENTRYPOINT [ "/entrypoint.sh" ]

