FROM node:current-alpine

RUN apk add git libxcb libxcursor libxdamage libxi libxtst cups libxscrnsaver alsa-lib atk at-spi2-atk pango gtk+3.0

RUN npm i https://github.com/Makepad-fr/fbjs facebook-group-posts-scraper -g --unsafe-perm \
    && mkdir --parents --verbose /root/.config/configstore

COPY facebook-group-posts-scraper.json /root/.config/configstore
COPY fgps /root
RUN chmod -c +x /root/fgps

WORKDIR /root/

# Start running
ENTRYPOINT ["sh"]
CMD []
