#!/usr/bin/env bash

# Developer: Maik Ellerbrock

function dockerfile-linter() {
  local DOCKERFILE_DIR="./dockerfiles"

  for DOCKERFILE in $(ls -R ${DOCKERFILE_DIR}/**/Dockerfile)
  do
    echo "Start Dockerfile linting for ${DOCKERFILE} ..."
    docker run -it --rm --privileged \
      -v ${PWD}:/root/:ro \
      projectatomic/dockerfile-lint \
      dockerfile_lint -f ${DOCKERFILE} # || error-exit ${DOCKERFILE}

    # docker run lukasmartinelli/hadolint:latest < ${DOCKERFILE} # || error-exit "${DOCKERFILE}"
  done
}


function docker-compose-linter() {
  local DOCKER_COMPOSE_DIR="."

  for DOCKER_COMPOSE_FILE in $(ls -R ${DOCKER_COMPOSE_DIR}/docker-compose*.yml)
  do
    echo "Start docker-compose linting for ${DOCKER_COMPOSE_FILE} ..."
    docker-compose -f ${DOCKER_COMPOSE_FILE} config --quiet || error-exit ${DOCKER_COMPOSE_FILE}
  done
}


function error-exit() {
  echo "ERROR: Docker linting failed"
  echo "Filename: ${1}"
  exit 1
}

docker-compose-linter
dockerfile-linter

