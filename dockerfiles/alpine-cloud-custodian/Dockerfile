# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock

FROM python:2.7-alpine

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.0.1"

ARG SERVICE_USER
ARG SERVICE_HOME

ENV SERVICE_USER ${SERVICE_USER:-custodian}
ENV SERVICE_HOME ${SERVICE_HOME:-/${SERVICE_USER}}
RUN \
  adduser -h ${SERVICE_HOME} -s /sbin/nologin -u 1000 -D ${SERVICE_USER} && \
  pip install virtualenv && \
  virtualenv --python=python2 custodian && \
  . custodian/bin/activate && \
  pip install c7n

ENV PATH "/${SERVICE_USER}/bin:${PATH}"

USER    ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}
VOLUME  ${SERVICE_HOME}

ENTRYPOINT 	[ "custodian" ]
CMD 		[ "--help" ]
