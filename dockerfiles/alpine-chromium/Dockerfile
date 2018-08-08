# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM alpine:3.8

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.1.0"

# Optional Configuration Parameter
ARG SERVICE_USER
ARG SERVICE_HOME

# Default Settings
ENV SERVICE_USER ${SERVICE_USER:-chromium}
ENV SERVICE_HOME ${SERVICE_HOME:-/home/${SERVICE_USER}}


RUN \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  apk add --no-cache \
    chromium \
    dumb-init \
    dbus-x11 \
    udev \
    mesa-gl \
    mesa-dri-swrast \
    ttf-freefont

USER ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}
VOLUME ${SERVICE_HOME}

ENTRYPOINT [ "/usr/bin/dumb-init", "/usr/bin/chromium-browser" ]
CMD [ "https://github.com/ellerbrock" ]
