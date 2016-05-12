FROM linuxserver/baseimage
MAINTAINER aptalca
ARG DEBIAN_FRONTEND="noninteractive"

ENV APTLIST="rsync"

#Applying stuff
RUN apt-get update -q && \
apt-get install $APTLIST -qy && \
apt-get clean && rm -rf /tmp/* /var/lib/apt/lists/* /var/tmp/*

#Adding Custom files
COPY init/ /etc/my_init.d/
COPY cron/ /etc/cron.d/
COPY app/script/ /app/script/
RUN chmod -v +x /etc/service/*/run /etc/my_init.d/*.sh /app/script/*.sh
