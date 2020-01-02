FROM lsiobase/alpine:3.11

LABEL maintainer="aptalca"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
        logrotate \
        openssh-client \
        rsync && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \
 sed -i 's,/usr/sbin/logrotate /etc/logrotate.conf,/usr/sbin/logrotate /etc/logrotate.conf -s /config/logrotate.status,g' \
        /etc/periodic/daily/logrotate && \
 rm -rf \
        /tmp/*

# add local files
COPY /root /
