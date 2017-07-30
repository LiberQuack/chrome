#!/bin/bash

docker run busybox echo "Checking if there is a new chrome version..."
sudo apt update &&
sudo apt list --upgradable | grep google-chrome-stable &&
docker run busybox echo "Found new chrome version..." &&
sudo apt install -y google-chrome-stable &&
CHROME_VERSION=$(google-chrome --version | awk '{print $3}') &&
docker run busybox echo "Sending tag ${CHROME_VERSION} to github..." &&
curl --user username:token \
    --header "Accept: application/vnd.github.manifold-preview" \
    --data "{\"tag_name\":\"${CHROME_VERSION}\"" \
    "https://api.github.com/repos/martinsthiago/chrome/releases"
