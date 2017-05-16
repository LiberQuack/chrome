#!/usr/bin/env bash

# Install google chrome
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add - &&
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list' &&
sudo apt update &&
sudo apt install -y google-chrome-stable curl

# Register crontab
sudo cp ./chrome-verify-updates-job.sh /etc/cron.daily/ &&
chmod +x /etc/cron.daily/chrome-verify-updates-job.sh &&
/etc/cron.daily/chrome-verify-updates-job.sh