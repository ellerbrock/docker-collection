#!/usr/local/bin/dumb-init /bin/sh

# Developer: Maik Ellerbrock <opensource@frapsoft.com>
#
# GitHub:  https://github.com/ellerbrock
# Twitter: https://twitter.com/frapsoft
# Docker:  https://hub.docker.com/u/ellerbrock
# Quay:    https://quay.io/user/ellerbrock

EXTERNAL_IP=${EXTERNAL_IP:-$(curl -s https://api.ipify.org)}

function updateDNS() {
  echo "Start updating DNS Settings ..."
  echo -e "DNS: ${CF_DOMAIN} => ${EXTERNAL_IP}\n"
  echo "Cloudflare Result:"

  curl -s \
    -X PUT "https://api.cloudflare.com/client/v4/zones/${CF_ZONEID}/dns_records/${CF_DOMAINID}" \
    -H "X-Auth-Email: ${CF_EMAIL}" \
    -H "X-Auth-Key: ${CF_TOKEN}" \
    -H "Content-Type: application/json" \
    --data '{"type":"A","name":"'${CF_DOMAIN}'","content":"'${EXTERNAL_IP}'","ttl":1,"proxied":false}'
}

if [[ ${EXTERNAL_IP} ]] && \
   [[ ${CF_EMAIL} ]] && \
   [[ ${CF_TOKEN} ]] && \
   [[ ${CF_ZONEID} ]] && \
   [[ ${CF_DOMAIN} ]] && \
   [[ ${CF_DOMAINID} ]]; then
  updateDNS
else
  echo "ERROR: Missing parameter:"
      [[ -z ${CF_EMAIL} ]] && echo "  - CF_EMAIL"
      [[ -z ${CF_TOKEN} ]] && echo "  - CF_TOKEN"
      [[ -z ${CF_ZONEID} ]] && echo "  - CF_ZONEID"
      [[ -z ${CF_DOMAIN} ]] && echo "  - CF_DOMAIN"
      [[ -z ${CF_DOMAINID} ]] && echo "  - CF_DOMAINID"
fi

