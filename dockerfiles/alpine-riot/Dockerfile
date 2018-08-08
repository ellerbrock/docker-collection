# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM node:alpine

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.1.0"

RUN \
  apk add --no-cache \
    dumb-init \
    git \
    libevent \
    libffi \
    libjpeg-turbo \
    libssl1.0 \
    sqlite-libs && \
  git clone https://github.com/vector-im/riot-web.git /riot && \
  cd /riot && \
  npm update && \
  npm install -g webpack http-server && \
  npm install && \
  npm run build && \
  apk del git

USER node

WORKDIR /riot/webapp

EXPOSE 8080

ENTRYPOINT [ "dumb-init", "--", "http-server" ]

# Add additional Configuration values like SSL Certs
# Docs: https://www.npmjs.com/package/http-server

# CMD [ "" ]
