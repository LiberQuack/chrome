#!/bin/bash

sudo apt update &&
sudo apt list --upgradable | grep google-chrome-stable &&
sudo apt upgrade google-chrome-stable