FROM node:8.11.1

MAINTAINER Evgeniy Cheban <mister.cheban@gmail.com>

LABEL name="node-chrome-xvfb"

# Install Chrome

RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/chrome.list

RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -

RUN set -x \
    && apt-get update \
    && apt-get install -y \
        google-chrome-stable \
        xvfb

ENV CHROME_BIN /usr/bin/google-chrome

# Log versions

RUN set -x \
    && node -v \
    && npm -v \
    && google-chrome --version

RUN Xvfb :99 -ac -screen 0 1024x768x16

ENV DISPLAY :99.0
