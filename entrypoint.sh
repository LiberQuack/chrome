#!/bin/bash

CHROME_VERSION=$(google-chrome --version | awk '{print $3}')

Xvfb $DISPLAY -ac -screen 0 ${RESOLUTION}x24 &
sleep 1 && fluxbox &
sleep 1 && ffmpeg -f x11grab -video_size $RESOLUTION -i $DISPLAY -codec:v libx264 -r 12 -y "${VIDEO_DIRECTORY}/chrome-${CHROME_VERSION}.mkv" &
sleep 1 && exec "$@"