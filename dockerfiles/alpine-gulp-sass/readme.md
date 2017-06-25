![docker](https://github.frapsoft.com/top/docker-security.jpg)

# alpine-gulp-sass

_Compiling SASS has never been more easy ..._

[![Docker Automated Build](https://img.shields.io/docker/automated/ellerbrock/alpine-gulp-sass.svg)](https://hub.docker.com/r/ellerbrock/alpine-gulp-sass/) [![Docker Pulls](https://img.shields.io/docker/pulls/ellerbrock/alpine-gulp-sass.svg)](https://hub.docker.com/r/ellerbrock/alpine-gulp-sass/) [![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)

## Installation

`docker pull ellerbrock/alpine-gulp-sass`

## Configuration

### Volume Mappings

- `DIR_SASS`: map your local SASS folder inside the Container
- `DIR_CSS`: map your local CSS folder inside the Container

### SASS Files

- `FILES_SASS`: define what SASS files you want to use
	- `**/*.sass` uses all sass files in the folder and all subfolders (default)
	- `*.sass` uses the sass files in your current sass folder
	- `main.sass` uses only the main.sass file
	- `*.+(sass|scss)` uses all sass and scss files in the current folder

## Examples

### docker run

- maps the `sass` folder from your current directory
- maps the `css` folder from your current directory
- compiles all `*.sass` and `*.scss` files in your `sass` folder

```
docker run -it \
  -v ${PWD}/sass:/site/sass \
  -v ${PWD}/css:/site/css \
  -e SASS='*.+(sass|scss)' \
ellerbrock/alpine-gulp-sass
```

### docker-compose

`.env`

```
DIR_SASS=./style/sass
DIR_CSS=./style/css
FILES_SASS=**/*.+(sass|scss)
GULP_DEBUG=true
```

`docker-compose.yml`

```
version: '3'

services:

  gulp:
    image: ellerbrock/alpine-gulp-sass:latest
    volumes:
      - ${DIR_SASS}:/site/sass
      - ${DIR_CSS}:/site/css
    environment:
      - SASS=${FILES_SASS}
      - CSS=${DIR_CSS}
      - - GULP_DEBUG=${GULP_DEBUG}
    networks:
      - webdev

networks:
  webdev:
    driver: bridge
```

##  Contact

[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)[![Docker](https://github.frapsoft.com/social/docker.png)](https://hub.docker.com/u/ellerbrock/)[![npm](https://github.frapsoft.com/social/npm.png)](https://www.npmjs.com/~ellerbrock)[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)
