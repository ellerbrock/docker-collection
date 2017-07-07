#!/usr/bin/env bash

function postgres() {
  local DB_DIR="/var/lib/docker/volumes/bitbucketpostgresql_postgres-data/_data"
  local BACKUP_DIR="/home/user/docker/backup"
  local BACKUP_FILE="postgres_$(date +%s).tar.bz2"

  sudo tar -cjvf ${BACKUP_DIR}/${BACKUP_FILE} ${DB_DIR}
}

function bitbucket() {
  local DB_DIR="/var/lib/docker/volumes/bitbucketpostgresql_bitbucket-data/_data"
  local BACKUP_DIR="/home/user/docker/backup"
  local BACKUP_FILE="bitbucket_$(date +%s).tar.bz2"

  sudo tar -cjvf ${BACKUP_DIR}/${BACKUP_FILE} ${DB_DIR}
}

function main() {
  echo "starting backup, please wait ..." && \
  docker-compose stop && \
  postgres && \
  bitbucket && \
  docker-compose up -d && \
  echo "backup done!"
}

main

