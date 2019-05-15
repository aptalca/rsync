FROM lsiobase/alpine:3.9

LABEL maintainer="aptalca"

RUN \
 echo "**** install runtime packages ****" && \
 apk add --no-cache --upgrade \
        logrotate \
        openssh-client \
        rsync && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \
 rm -rf \
        /tmp/*

# add local files
COPY /root /
