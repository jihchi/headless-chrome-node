FROM node:8
MAINTAINER Jih-Chi Lee <achi@987.tw>

RUN set -x \
	&& apt-get update \
  && apt-get install -y --no-install-recommends \
    sudo curl wget unzip git \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list' \
  && apt-get update \
  && DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    google-chrome-unstable \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN sudo adduser node sudo

RUN mkdir -p /usr/src/app
RUN chown node:node /usr/src/app
WORKDIR /usr/src/app

EXPOSE 9222

COPY chromeuser-script.sh /
RUN chmod +x /chromeuser-script.sh

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]