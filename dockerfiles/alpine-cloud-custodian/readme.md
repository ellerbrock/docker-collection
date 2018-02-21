![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-cloud-custodian

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-cloud-custodian.svg)](https://hub.docker.com/r/ellerbrock/alpine-cloud-custodian/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-cloud-custodian.svg)](https://hub.docker.com/r/ellerbrock/alpine-cloud-custodian/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

## What is it?

Cloud Custodian is a tool that unifies the dozens of tools and scripts most organizations use for managing their AWS accounts into one open source tool. It’s a stateless rules engine for policy definition and enforcement, with metrics and detailed reporting for AWS.

Organizations can use Custodian to manage their AWS environments by ensuring compliance to security policies, tag policies, garbage collection of unused resources, and cost management via off-hours resource management, all from the same place. Custodian policies are written in simple YAML configuration files that specify given resource types and are constructed from a vocabulary of filters and actions.

Please go for further information to the [official documentation](http://www.capitalone.io/cloud-custodian/docs/index.html).

## Installation

`docker pull ellerbrock/alpine-cloud-custodian`

## Usage


### aws-cli

If you have the [aws-cli](https://github.com/aws/aws-cli) configured your ready to run.  
We can mapp your `~/.aws` folder in readOnly mode inside the Container.

```
#!/usr/bin/env bash

function main () {
  docker run \
    -it \
    -v "${HOME}/.aws:/custodian/.aws:ro" \
    -v "${PWD}/logs:/tmp" \
    -v "${PWD}/.cache:/custodian/.cache" \
    -v "${PWD}/policies:/custodian/policies:ro" \
  ellerbrock/cloud-custodian run --output-dir=/tmp \
    policies/my-policy.yml
}

main
```
### Environment Variables

Export `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY` so that we can pass them on in the next step inside the Container.

```
#!/usr/bin/env bash

export AWS_ACCESS_KEY_ID="your-key-here" 
export AWS_SECRET_ACCESS_KEY="your-sec-key-here"
```

```
#!/usr/bin/env bash

function main () {
  docker run \
    -it \
    -e AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    -e AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    -v "${PWD}/logs:/tmp" \
    -v "${PWD}/.cache:/custodian/.cache" \
    -v "${PWD}/policies:/custodian/policies:ro" \
  ellerbrock/cloud-custodian run --output-dir=/tmp \
    policies/my-policy.yml
}

main
```

## Folder Structure

Since we run in a Container the logfiles are in the container and non of our policies is in there. Copying or build it each time is not an option, so what we do we simply map the folder inside the Container and have them in the same folder.

`policies`: here is the place to store your policies and run them like in the example with your name.

`logs`: all output logs get's stored there

`.cache`: is needed by the program

## Links

- [Cloud Custodian Website](https://developer.capitalone.com/opensource-projects/cloud-custodian)
- [Cloud Custodian Docs](http://www.capitalone.io/cloud-custodian/docs/index.html)
- [Github Repository](https://github.com/capitalone/cloud-custodian)


##  Contact

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
