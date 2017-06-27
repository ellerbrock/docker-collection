# Docker Script

_Bash Script for Docker Tasks_

[![Open Source Love](https://badges.frapsoft.com/os/v1/open-source.svg)](https://github.com/ellerbrock/open-source-badges/) [![Gitter Chat](https://badges.gitter.im/frapsoft/frapsoft.svg)](https://gitter.im/frapsoft/frapsoft/)


```bash
#!/usr/bin/env bash

# Docker Shell Scripts
# ====================
# Version: 	0.1.1
#
# Author:   Maik Ellerbrock
# GitHub:   https://github.com/ellerbrock/docker-scripts
# Twitter:  https://twitter.com/frapsoft

# update all containers
container_update() {
  echo updating containers ...
  docker images | grep -v "REPOSITORY" | awk '{print $1":"$2}' | xargs -L1 docker pull
}

# export containers
container_export() {
  echo export containers to containers.txt ...
  docker images | grep -v "REPOSITORY" | awk '{print $1":"$2}' | xargs -L1 echo docker pull > containers.txt
}

# remove all unnamed container
container_del_unnamed() {
  echo removing unnamed containers ...
  docker rmi $(docker images | grep "^<none>" | awk '{print $3}') --force
}

# remove all dangling volumes
volumes_del_dangling() {
  echo removing dangling volumes ...
  docker volume rm $(docker volume ls -f dangling=true | grep -v "DRIVER" | awk '{print $2}')
}

echo "Docker Shell Script"
echo "==================="
echo "[1] update container"
echo "[2] export container to ./containers.txt"
echo "[3] delete unnamed container"
echo "[4] delete dangling volumes"

read -p " " -n 1 action
echo

if [[ $action == 1 ]]; then
  container_update
elif [[ $action == 2 ]]; then
  container_export
elif [[ $action == 3 ]]; then
  container_del_unnamed
elif [[ $action == 4 ]]; then
  volumes_del_dangling
else
  echo "wrong parameter"
fi

```

Find me on Docker Hub: <https://hub.docker.com/r/ellerbrock/>

### Contact / Social Media

_Get the latest News about Web Development, Open Source, Tooling, Server & Security_

[![Twitter](https://github.frapsoft.com/social/twitter.png)](https://twitter.com/frapsoft/)[![Facebook](https://github.frapsoft.com/social/facebook.png)](https://www.facebook.com/frapsoft/)[![Google+](https://github.frapsoft.com/social/google-plus.png)](https://plus.google.com/116540931335841862774)[![Gitter](https://github.frapsoft.com/social/gitter.png)](https://gitter.im/frapsoft/frapsoft/)[![Github](https://github.frapsoft.com/social/github.png)](https://github.com/ellerbrock/)
