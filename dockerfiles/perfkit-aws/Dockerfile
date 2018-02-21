# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM python:2.7

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.0.1"

ENV PERFKIT_USER perfkit
ENV PERFKIT_VERSION 1.13.0
ENV PERFKIT_DIR /home/${PERFKIT_USER}


RUN \
  useradd -M -u 1000 perfkit && \
  git clone https://github.com/GoogleCloudPlatform/PerfKitBenchmarker.git "${PERFKIT_DIR}" && \
  cd "${PERFKIT_DIR}" && \
  git checkout "tags/v${PERFKIT_VERSION}" -b dockerized && \
  chmod +x pkb.py && \
  pip install -r perfkitbenchmarker/providers/aws/requirements.txt && \
  chown -R "${PERFKIT_USER}:${PERFKIT_USER}" "${PERFKIT_DIR}"

USER        ${PERFKIT_USER}
WORKDIR     ${PERFKIT_DIR}
ENTRYPOINT  [ "./pkb.py" ]

