# Developer:
# ---------
# Name:      Maik Ellerbrock
#
# GitHub:    https://github.com/ellerbrock
# Twitter:   https://twitter.com/frapsoft
# Docker:    https://hub.docker.com/u/ellerbrock
# Quay:      https://quay.io/user/ellerbrock
#
# Description:
# -----------
# Bash Shell v.4.4 with Bash-it, bats, bash-completion

FROM bash:4.4

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.1.0"

# Optional Configuration Parameter
ARG SERVICE_USER
ARG SERVICE_HOME

# Default Settings (for optional Parameter)
ENV SERVICE_USER bashit
ENV SERVICE_HOME /home/${SERVICE_USER}

RUN \
  adduser -h ${SERVICE_HOME} -s /bin/bash -u 1000 -D ${SERVICE_USER} && \
  apk add --no-cache \
    bash-completion \
    dumb-init \
    git && \
  git clone --depth 1 https://github.com/Bash-it/bash-it.git /tmp/bash_it && \
  cp -R /tmp/bash_it /root/.bash_it && \
  cp -R /tmp/bash_it ${SERVICE_HOME}/.bash_it && \
  /root/.bash_it/install.sh --silent && \
  echo -e "\n# Load bash-completion\n[ -f /usr/share/bash-completion/bash_completion  ] && source /usr/share/bash-completion/bash_completion" >> /root/.bashrc && \
  git clone --depth 1 https://github.com/sstephenson/bats.git /tmp/bats && \
    /tmp/bats/install.sh /usr/local && \
  cp -R ${SERVICE_HOME}/.bash_it /root && \
  chown -R ${SERVICE_USER}:${SERVICE_USER} ${SERVICE_HOME} && \
  sed -i -e "s/bin\/ash/bin\/bash/" /etc/passwd && \
  rm -rf /tmp/{.}* /tmp/*

USER    ${SERVICE_USER}
WORKDIR ${SERVICE_HOME}
VOLUME  ${SERVICE_HOME}

RUN \
  ${SERVICE_HOME}/.bash_it/install.sh --silent && \
  echo -e "\n# Load bash-completion\n[ -f /usr/share/bash-completion/bash_completion  ] && source /usr/share/bash-completion/bash_completion" >> ${SERVICE_HOME}/.bashrc

ENTRYPOINT [ "/usr/bin/dumb-init", "bash" ]
