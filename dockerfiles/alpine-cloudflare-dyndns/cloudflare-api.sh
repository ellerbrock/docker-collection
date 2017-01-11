#!/usr/bin/env sh

# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

# Required Parameter
CF_EMAIL=""
CF_TOKEN=""
CF_ZONE_NAME=""
CF_DOMAIN_NAME=""

# Optional Parameter
EXTERNAL_IP=$(curl -s https://api.ipify.org)

# we get them automatically for you
CF_ZONEID=""
CF_DOMAINID=""

function getZoneID() {
  CF_ZONEID=$(curl -s \
    -X GET "https://api.cloudflare.com/client/v4/zones?name=${CF_ZONE_NAME}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json" | \
    jq -r .result[0].id)
}

function getDomainID() {
  CF_DOMAINID=$(curl -s \
    -X GET "https://api.cloudflare.com/client/v4/zones/${CF_ZONEID}/dns_records?name=${CF_DOMAIN_NAME}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json" | \
  jq -r .result[0].id)
}

function updateDomain() {
  curl -s \
    -X PUT "https://api.cloudflare.com/client/v4/zones/${CF_ZONEID}/dns_records/${CF_DOMAINID}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'${CF_DOMAIN_NAME}'","content":"'${EXTERNAL_IP}'","ttl":1,"proxied":false}'
}

getZoneID
getDomainID
updateDomain

