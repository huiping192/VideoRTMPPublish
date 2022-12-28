# Versions of ffmpeg 
ARG  FFMPEG_VERSION=4.2.1
ARG DEBIAN_VERSION=stretch-slim 

FROM debian:${DEBIAN_VERSION}
MAINTAINER huiping192 <huiping192@gmail.com>

# streaming settings
ENV STREAM_URL ""
ENV STREAM_KEY ""

# video folder
VOLUME ["/video"]

RUN apt-get update && apt-get install -y git && apt-get install -y ffmpeg

RUN git config --global pull.ff only \
    && git clone -b main https://github.com/huiping192/VideoRTMPPublish.git /VideoRTMPPublish --recurse-submodule \
    && git config --global --add safe.directory /VideoRTMPPublish \
    && chmod 777 /VideoRTMPPublish/publish.sh


ENTRYPOINT ["/VideoRTMPPublish/publish.sh"]