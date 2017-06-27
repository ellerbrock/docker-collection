#!/usr/bin/env sh

#
# Run GUI Apps on MacOS with Docker
# 
# Installation:
# ------------
# brew update && brew cask install xquartz
#
# Configuration:
# --------------
#
# open -a XQuartz # open XQuarz Configuration
#
# Go to Security Tab and tick "Allow connections from network clients"
#
# Update in the run Script your Network Device and your ready to rock!
#

function main () {
  local CONTAINER_NAME="ellerbrock/alpine-chromium"
  local NETWORK_DEVICE="en1"
  local WLAN_IP=$(ifconfig ${NETWORK_DEVICE} | grep inet | awk '$1=="inet" {print $2}')

  xhost + ${WLAN_IP}

  docker run -t \
    --cap-add=SYS_ADMIN \
    -e DISPLAY=${WLAN_IP}:0 \
    ${CONTAINER_NAME}
}

main

