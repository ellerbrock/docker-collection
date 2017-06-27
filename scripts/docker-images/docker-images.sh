#!/usr/bin/env bash

readonly DB_FILE="$(pwd)/images.db"
readonly IMG_DIR="$(pwd)/images"

export() {
  echo "Create ${DB_FILE}"
  echo "$(docker images|grep -v 'IMAGE ID'|awk '{printf("%s %s %s\n", $1, $2, $3)}'|column -t)" > "${DB_FILE}"
  
  echo "Read ${DB_FILE}"
  local images
  while read -r image; do
     images+=("$image"); 
  done <<< "$(cat ${DB_FILE})"

  echo "Create ${IMG_DIR}"
  if [[ ! -d "${IMG_DIR}" ]]; then
    mkdir "${IMG_DIR}"
  fi
  
  local name tag id
  for image in "${images[@]}"; do
    name=$(echo $image|awk '{print $1}')
    tag=$(echo $image|awk '{print $2}')
    id=$(echo $image|awk '{print $3}')
        
    if [[ "${id}" != "" ]]; then
      local imgPath="${IMG_DIR}/${id}.dim"

      if [[ ! -f "${imgPath}" ]] ; then
        echo "[DEBUG] save ${id} ${name}:${tag} to ${imgPath}"
        (time  docker save -o "${imgPath}" ${name}:${tag}) 2>&1 | grep real
      else
        echo "[DEBUG] ${id} ${name}:${tag} already saved"
      fi
    fi    
  done
}

import() {
  if [[ ! -f "${DB_FILE}" ]]; then
    echo "No ${DB_FILE} to read"
    exit 0
  fi

  if [[ ! -d "${IMG_DIR}" ]]; then
    echo "No ${IMG_DIR} to load images"
    exit 0
  fi

  echo "Read ${DB_FILE}"
  local images
  while read -r image; do
     images+=("$image"); 
  done <<< "$(cat ${DB_FILE})"

  local name tag id
  for image in "${images[@]}"; do
    name=$(echo $image|awk '{print $1}')
    tag=$(echo $image|awk '{print $2}')
    id=$(echo $image|awk '{print $3}')
        
    if [[ "${id}" != "" ]]; then
      local imgPath="${IMG_DIR}/${id}.dim"

      if [[ "$(docker images|grep ${id} | grep ${name} | grep ${tag})" == "" ]]; then        
        if [[ "$(docker images|grep ${id})" == "" ]]; then
          echo "[DEBUG] load ${id} ${name}:${tag} from ${imgPath}"
          docker load -i "${imgPath}"
        else
          echo "[DEBUG] tag ${id} as ${name}:${tag}"
          docker tag ${id} ${name}:${tag}
        fi
      else
        echo "[DEBUG] ${id} ${name}:${tag} already loaded"
      fi
    fi
  done
}

$@
