FROM ubuntu:16.04
MAINTAINER Thiago Martins <rogue.thiago@gmail.com>

ENV DISPLAY=:0
ENV RESOLUTION=1366x768
ENV VIDEO_DIRECTORY=/session

WORKDIR /session

RUN apt-get -y update && \
    apt-get -y install xvfb fluxbox wget ffmpeg

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
    sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' && \
    apt update && \
    apt install -y google-chrome-stable

ADD entrypoint.sh /
ADD chrome-launcher.sh /opt/google/chrome/google-chrome

RUN chmod +x /entrypoint.sh
RUN chmod +x /opt/google/chrome/google-chrome

ENTRYPOINT ["/entrypoint.sh"]