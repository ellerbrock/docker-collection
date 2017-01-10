#!/usr/bin/env sh

# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock


EXTERNAL_IP=$(curl -s https://api.ipify.org)

# Required
CF_EMAIL=""
CF_TOKEN=""
CF_DOMAIN=""
CF_SUBDOMAIN=""

# getAllZones to select your ZoneID
CF_ZONEID=""

# getDomainID to get your DomainID
# (you need setup ZoneID first)
CF_DOMAINID=""


function getAllZones() {
  curl -s \
    -X GET "https://api.cloudflare.com/client/v4/zones" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json"
}

function getZoneIDforDomain() {
  curl -s \
  -X GET "https://api.cloudflare.com/client/v4/zones?name=${CF_DOMAIN}" \
  -H "X-Auth-Email: ${CF_EMAIL}" \
  -H "X-Auth-Key: ${CF_TOKEN}" \
  -H "Content-Type: application/json"
}

function getZoneDetails() {
  curl -s \
    -X GET "https://api.cloudflare.com/client/v4/zones/${CF_ZONEID}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json"
}

function getDomainID() {
  curl -s \
    -X GET "https://api.cloudflare.com/client/v4/zones/${CF_ZONEID}/dns_records?name=${CF_SUBDOMAIN}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json"
}

function updateDomain() {
  curl -s \
    -X PUT "https://api.cloudflare.com/client/v4/zones/${CF_ZONEID}/dns_records/${CF_DOMAINID}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'${CF_SUBDOMAIN}'","content":"'${EXTERNAL_IP}'","ttl":1,"proxied":false}'
}

# getAllZones
# getZoneIDforDomain
# getZoneDetails
# getDomainID
# updateDomain

