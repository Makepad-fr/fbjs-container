FROM centos:centos8

# Install dependencies
RUN dnf install -y git epel-release dnf-plugins-core \
  && dnf install -y https://rpms.remirepo.net/enterprise/remi-release-8.rpm \
  && dnf install -y yum-utils \
  && dnf module install -y php:remi-7.4 nodejs:13/default \
  && dnf install -y php-zip php-json

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
  && php composer-setup.php \
  && rm composer-setup.php \
  && mv composer.phar /usr/local/bin/composer \
  && chmod +x /usr/local/bin/composer

RUN npm i https://github.com/Makepad-fr/fbjs facebook-group-posts-scraper -g --unsafe-perm

# https://github.com/Makepad-fr/fbjs/issues/19
RUN dnf install -y libX11-xcb libXcomposite libXcursor libXdamage libXi libXtst cups libXScrnSaver alsa-lib atk at-spi2-atk pango gtk3

COPY facebook-group-posts-scraper.json /root/.config/configstore
COPY fgps /root
RUN chmod +x /root/fgps

WORKDIR /root/

# Start running
ENTRYPOINT ["bash"]
CMD []
