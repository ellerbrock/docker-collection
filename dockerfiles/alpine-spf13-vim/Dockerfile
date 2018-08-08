# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.8

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.2.0"

# Optional Configuration Parameter
ARG SERVICE_USER
ARG SERVICE_HOME

# Default Settings
ENV SERVICE_USER ${SERVICE_USER:-vim}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}
ENV TERM xterm-256color

RUN \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  apk add --no-cache \
    dumb-init \
    vim \
    lua && \
  apk add --no-cache --virtual .build-deps \
    bash \
    git \
    curl \
    openssl && \
  curl https://j.mp/spf13-vim3 -L > /tmp/spf13-vim.sh && \
  bash -c "source /tmp/spf13-vim.sh" && \
  rm -rf /root/.spf13-vim-3/.git && \
  cp -LR /root/.vim* ${SERVICE_HOME} && \
  cp -R /root/.spf13* ${SERVICE_HOME} && \
  chown -R ${SERVICE_USER}.${SERVICE_USER} ${SERVICE_HOME} && \
  apk del .build-deps && \
  rm -rf /tmp/*

USER    ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}
VOLUME  ${SERVICE_HOME}

ENTRYPOINT [ "/usr/bin/dumb-init", "vim" ]
CMD        [ ".vimrc" ]
