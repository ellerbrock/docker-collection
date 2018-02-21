# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM ubuntu:xenial

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.0.2"

ENV DUMP_INIT_VERSION 1.2.0

# Optional Configuration Parameter
ARG SERVICE_USER
ARG SERVICE_HOME

ENV SERVICE_USER ${SERVICE_USER:-linkchecker}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}

RUN \
  useradd -d ${SERVICE_HOME} -m -s /usr/sbin/nologin -u 1000 ${SERVICE_USER} && \
  apt-get update && \
  apt-get install \
    linkchecker \
    wget -y && \
  wget -O /tmp/dumb-init.deb \
    https://github.com/Yelp/dumb-init/releases/download/v${DUMP_INIT_VERSION}/dumb-init_${DUMP_INIT_VERSION}_amd64.deb && \
  dpkg -i /tmp/dumb-init.deb && \
  apt-get remove wget -y && \
  rm -rf /tmp/* /var/lib/apt/lists/*

USER    ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}

ENTRYPOINT ["/usr/bin/dumb-init", "linkchecker" ]
