# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM php:apache

LABEL com.frapsoft.maintainer="Maik Ellerbrock" \
      com.frapsoft.version="0.0.2"

COPY ./www/* /var/www/html/

USER ${SERVICE_USER}
