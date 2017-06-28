![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-chromium

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-chromium.svg)](https://hub.docker.com/r/ellerbrock/alpine-chromium/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-chromium.svg)](https://hub.docker.com/r/ellerbrock/alpine-chromium/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

## Run GUI Apps on MacOS with Docker

### OSX Setup

- `brew update && brew cask install xquartz`
- `open -a XQuartz` => Go to Security Tab and tick "Allow connections from network clients"

```
  NETWORK_DEVICE="en1" # update to your network device
  IP=$(ifconfig ${NETWORK_DEVICE} | grep inet | awk '$1=="inet" {print $2}')

  xhost + ${IP}

  docker run -t \
    --cap-add=SYS_ADMIN \
    -e DISPLAY=${IP}:0 \
    ellerbrock/alpine-chromium
```

##  Contact

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
