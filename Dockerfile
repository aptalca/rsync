FROM lsiobase/ubuntu:bionic

LABEL maintainer="aptalca"

RUN \
 apt-get update && \
 apt-get install -y \
	logrotate \
	rsync && \
 echo "**** fix logrotate ****" && \
 sed -i "s#/var/log/messages {}.*# #g" /etc/logrotate.conf && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /
