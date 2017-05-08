#!/bin/bash

sudo apt update &&
sudo apt list --upgradable | grep google-chrome-stable &&
sudo apt upgrade google-chrome-stable &&
CHROME_VERSION=$(google-chrome --version | awk '{print $3}') &&
curl --user username:token \
    --header "Accept: application/vnd.github.manifold-preview" \
    --data "tag_name=${CHROME_VERSION}" \
    "https://api.github.com/repos/martinsthiago/chrome/releases"