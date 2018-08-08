# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.8

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.3.0"

# Optional Configuration Parameter
ARG SERVICE_USER
ARG EXTERNAL_IP

# Required Parameter
ARG CF_EMAIL
ARG CF_TOKEN
ARG CF_ZONE_NAME
ARG CF_DOMAIN_NAME

# Default Settings (for optional Parameter)
ENV SERVICE_USER ${SERVICE_USER:-cloudflare}

ENV EXTERNAL_IP ${EXTERNAL_IP}
ENV CF_EMAIL ${CF_EMAIL}
ENV CF_TOKEN ${CF_TOKEN}
ENV CF_ZONE_NAME ${CF_ZONE_NAME}
ENV CF_DOMAIN_NAME ${CF_DOMAIN_NAME}

COPY ./entrypoint.sh /

RUN \
  adduser -s /sbin/nologin -u 1000 -H -D ${SERVICE_USER} && \
  apk add --no-cache \
    curl \
    dumb-init \
    jq \
    openssl

USER ${SERVICE_USER}

ENTRYPOINT [ "/entrypoint.sh" ]
