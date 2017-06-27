# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

FROM php:apache

LABEL maintainer "Maik Ellerbrock <opensource@frapsoft.com>"

ENV VERSION 0.0.1

COPY ./www/* /var/www/html/

USER ${SERVICE_USER}
