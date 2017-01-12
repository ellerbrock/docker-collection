![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-cloudflare-dyndns

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-cloudflare-dyndns.svg)](https://hub.docker.com/r/ellerbrock/alpine-cloudflare-dyndns/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-cloudflare-dyndns.svg)](https://hub.docker.com/r/ellerbrock/alpine-cloudflare-dyndns/) [![Quay Status](https://quay.io/repository/ellerbrock/alpine-cloudflare-dyndns/status "Docker Repository on Quay")](https://quay.io/repository/ellerbrock/alpine-cloudflare-dyndns)[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

- Docker: [ellerbrock/alpine-cloudflare-dyndns](https://hub.docker.com/r/ellerbrock/alpine-cloudflare-dyndns/)
- Quay: [ellerbrock/alpine-cloudflare-dyndns](https://quay.io/repository/ellerbrock/alpine-cloudflare-dyndns)

## Installation

`docker pull ellerbrock/alpine-cloudflare-dyndns`

## About the Container

As Base Image i use [Alpine Linux](https://alpinelinux.org/) which is lightweight Distribution with a small surface area for security concerns, but with enough functionality for development and interactive debugging.

To prevent zombie reaping processes i run [dumb-init](https://github.com/Yelp/dumb-init) as PID 1 which forwards signals to all processes running in the container. 

## Parameter

- `EXTERNAL_IP`: optional, if not set it uses the current external ip addr
- `CF_EMAIL`: required, your cloudflare login email
- `CF_TOKEN`: required, your cloudflare api key (you can find it under [Settings](https://www.cloudflare.com/a/account/my-account) -> `API Key` -> `Global API Key`)
- `CF_ZONE_NAME` required, your root domain name (eg. example.tld)
- `CF_DOMAIN_NAME` required, your domain or subdomain name you want to update (eg. subdomain.example.tld)

## How to use

```bash
docker run -it \
  -e EXTERNAL_IP=OPTIONAL-YOUR-IP \
  -e CF_EMAIL=REQUIRED-YOUR-CLOUDFLARE-EMAIL \
  -e CF_TOKEN=REQUIRED-YOUR-CLOUDFLARE-API-KEY \
  -e CF_ZONE_NAME=REQUIRED-YOUR-CLOUDFLARE-ZONE-NAME \
  -e CF_DOMAIN_NAME=REQUIRED-YOUR-DOMAIN-OR-SUBDOMAIN-NAME-TO-UPDATE \
ellerbrock/alpine-cloudflare-dyndns
```

or via `docker-compose up` (define your configuration in the `.env` file)

## Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
