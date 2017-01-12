#!/usr/bin/dumb-init /bin/ash

# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

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
  local JSON=$(curl -s \
    -X PUT "https://api.cloudflare.com/client/v4/zones/${CF_ZONEID}/dns_records/${CF_DOMAINID}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'${CF_DOMAIN_NAME}'","content":"'${EXTERNAL_IP}'","ttl":1,"proxied":false}')

 local RESULT=$(echo "${JSON}" | jq .success)

 if [[ ${RESULT} == "true" ]]; then
    echo "Cloudflare Setting updated successful ..."
    echo "DNS: ${CF_DOMAIN_NAME} => ${EXTERNAL_IP}"
    exit
  else
    echo "ERROR: Something went wrong :("
    echo "Cloudflare Result:"
    echo "------------------"
    echo ${JSON} | jq
    exit 1
  fi
}


# lets run it!
function main() {
  EXTERNAL_IP=${EXTERNAL_IP:-$(curl -s https://api.ipify.org)}

  if [[ ${EXTERNAL_IP} ]] && \
   [[ ${CF_EMAIL} ]] && \
   [[ ${CF_TOKEN} ]] && \
   [[ ${CF_ZONE_NAME} ]] && \
   [[ ${CF_DOMAIN_NAME} ]]; then
    getZoneID
    getDomainID
    updateDomain
  else
    echo "ERROR: Missing parameter:"
      [[ -z ${CF_EMAIL} ]] && echo "  - CF_EMAIL"
      [[ -z ${CF_TOKEN} ]] && echo "  - CF_TOKEN"
      [[ -z ${CF_ZONE_NAME} ]] && echo "  - CF_ZONE_NAME"
      [[ -z ${CF_DOMAIN_NAME} ]] && echo "  - CF_DOMAIN_NAME"
    exit 1
  fi
}

main

