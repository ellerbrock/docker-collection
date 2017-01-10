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
ARG SERVICE_USER
ARG SERVICE_HOME
ARG SYSTEM_TZ
ARG EXTERNAL_IP

# Required Parameter
ARG CF_EMAIL
ARG CF_TOKEN
ARG CF_ZONEID
ARG CF_DOMAINID
ARG CF_DOMAIN

# Default Settings (for optional Parameter)
ENV SYSTEM_TZ ${SYSTEM_TZ:-Europe/Berlin}
ENV SERVICE_USER ${SERVICE_USER:-cloudflare}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}

ENV EXTERNAL_IP ${EXTERNAL_IP}
ENV CF_EMAIL ${CF_EMAIL}
ENV CF_TOKEN ${CF_TOKEN}
ENV CF_DOMAIN ${CF_DOMAIN}
ENV CF_DOMAINID ${CF_DOMAINID}
ENV CF_ZONEID ${CF_ZONEID}

COPY ./entrypoint.sh /

RUN \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  apk add --no-cache \
    curl \
    openssl \
    tzdata && \
  cp /usr/share/zoneinfo/${SYSTEM_TZ} /etc/localtime && \
  echo "${SYSTEM_TZ}" > /etc/TZ && \
  curl -L -o /usr/local/bin/dumb-init \
    https://github.com/Yelp/dumb-init/releases/download/v${DUMP_INIT_VERSION}/dumb-init_${DUMP_INIT_VERSION}_amd64 && \
  chmod +x /usr/local/bin/dumb-init && \
  apk del tzdata

USER    ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}
ENTRYPOINT [ "/entrypoint.sh" ]

