# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.5

MAINTAINER Maik Ellerbrock

ENV VERSION 0.0.1
ENV DUMP_INIT_VERSION 1.2.0

# Optional Configuration Parameter
ARG SYSTEM_TZ
ARG SERVICE_USER
ARG SERVICE_HOME

# Default Settings
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-nodejs}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}

RUN \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  apk add --no-cache \
    nodejs \
    openssl \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  wget -O /usr/bin/dumb-init \
    https://github.com/Yelp/dumb-init/releases/download/v${DUMP_INIT_VERSION}/dumb-init_${DUMP_INIT_VERSION}_amd64 && \
  chmod +x /usr/bin/dumb-init && \
  apk del tzdata

USER    ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}

ENTRYPOINT ["/usr/bin/dumb-init", "node" ]
CMD [ "." ]

