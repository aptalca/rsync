FROM lsiobase/ubuntu:bionic

LABEL maintainer="aptalca"

RUN \
 apt-get update && \
 apt-get install -y \
	logrotate \
	rsync && \
 rm -rf \
	/tmp/* \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY /root /
