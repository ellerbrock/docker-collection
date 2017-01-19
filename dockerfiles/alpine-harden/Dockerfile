# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.5

ENV VERSION 0.1.0

# Optional Configuration Parameter
ARG SYSTEM_TZ
ARG SERVICE_USER
ARG SERVICE_HOME

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-app}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}

COPY ./harden.sh /root

RUN \
  mkdir -p ${SERVICE_HOME} && \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME} && \
  apk add --no-cache \
    dumb-init \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  apk del tzdata && \
  /root/harden.sh

WORKDIR ${SERVICE_HOME}

USER ${SERVICE_USER}

ENTRYPOINT [ "/usr/bin/dumb-init", "--" ]

