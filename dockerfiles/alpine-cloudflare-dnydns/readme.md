![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-cloudflare-dyndns

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-cloudflare-dnydns.svg)](https://hub.docker.com/r/ellerbrock/alpine-cloudflare-dnydns/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-cloudflare-dnydns.svg)](https://hub.docker.com/r/ellerbrock/alpine-cloudflare-dnydns/) [![Quay Status](https://quay.io/repository/ellerbrock/alpine-cloudflare-dnydns/status "Docker Repository on Quay")](https://quay.io/repository/ellerbrock/alpine-cloudflare-dnydns)[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-cloudflare-dyndns](https://hub.docker.com/r/ellerbrock/alpine-cloudflare-dyndns/)
- Quay: [ellerbrock/alpine-cloudflare-dyndns](https://quay.io/repository/ellerbrock/alpine-cloudflare-dyndns)

## Installation

`docker pull ellerbrock/alpine-cloudflare-dyndns`

## Configuration Parameter

### Required Parameter:

You can get most Values directly on the Cloudflare Website.  
The only Parameter i could not find was the DomainID so i wrote [cloudflare-api.sh](https://github.com/ellerbrock/docker-collection/blob/master/dockerfiles/alpine-cloudflare-dnydns/cloudflare-api.sh) where you can get all the values to update your DNS Settings.

- `CF_EMAIL`: Your Email used for Cloudflare
- `CF_TOKEN`: Cloudflare API Token (you can find it under [Settings](https://www.cloudflare.com/a/account/my-account) -> `API Key` -> `Global API Key`
- `CF_ZONEID`: Click on your Domain you want to update (Key under `Overview` -> `Domain Summary` -> `Zone ID`)
- `CF_DOMAINID` - Your DomainID for the Domain / Subdomain you want to update (i could not find where to get this info on the Cloudflare Website. You can get the value using: [cloudflare-api.sh](https://github.com/ellerbrock/docker-collection/blob/master/dockerfiles/alpine-cloudflare-dnydns/cloudflare-api.sh)
- `CF_DOMAIN` - your Domainname or Subdomain you want to update to the new IP

### Optional Parameter:

- `SERVICE_USER` - the username the process is running with (default: `cloudflare`)
- `SERVICE_HOME` - Home directory for the user (default: `/home/cloudflare`)
- `SYSTEM_TZ` - Timezone (default: `Europe/Berlin`)
- `EXTERNAL_IP` - IP Adress for the Domain (when not set it uses the current external IP)
  
## How to use

### Dockerfile

#### Pass Configuration via Docker Enviroment Variables

Download [run.sh](https://github.com/ellerbrock/docker-collection/blob/master/dockerfiles/alpine-cloudflare-dnydns/run.sh) and add your configuration settings and run it.

```
#!/usr/bin/env sh

function main () {
  
  # Configuration
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
```

## docker-compose

Add your configuration values in the [.env](https://github.com/ellerbrock/docker-collection/blob/master/dockerfiles/alpine-cloudflare-dnydns/.env) file, the build and run via `docker-compose up`.

```
# Optional Parameter
SERVICE_USER=cloudflare
SERVICE_HOME=/home/cloudflare
SYSTEM_TZ=Europe/Berlin
EXTERNAL_IP=

# Required Parameter
CF_EMAIL=
CF_TOKEN=
CF_ZONEID=
CF_DOMAINID=
CF_DOMAIN=
```

## Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
