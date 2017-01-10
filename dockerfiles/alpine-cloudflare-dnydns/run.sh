#!/usr/bin/env sh

# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

function main () {
  local EXTERNAL_IP=$(curl -s https://api.ipify.org) || (echo "ERROR: Can't get external IP address"; exit 1)
  local CF_EMAIL=
  local CF_TOKEN=
  local CF_ZONEID=
  local CF_DOMAINID=
  local CF_DOMAIN=

  docker run -it \
    -e EXTERNAL_IP=${EXTERNAL_IP} \
    -e CF_EMAIL=${CF_EMAIL} \
    -e CF_TOKEN=${CF_TOKEN} \
    -e CF_ZONEID=${CF_ZONEID} \
    -e CF_DOMAIN=${CF_DOMAIN} \
    -e CF_DOMAINID=${CF_DOMAINID} \
  ellerbrock/alpine-cloudflare-dyndns
}

main
