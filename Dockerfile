ARG DEBIAN_VERSION=stretch-slim 

##### Building stage #####
FROM debian:${DEBIAN_VERSION} as builder
MAINTAINER huiping192 <huiping192@gmail.com>

# Versions of ffmpeg 
ARG  FFMPEG_VERSION=4.2.1


##### Building the final image #####
#FROM debian:${DEBIAN_VERSION}


RUN apt-get update && apt-get install -y git && apt-get install -y ffmpeg

RUN git config --global pull.ff only \
    && git clone -b main https://github.com/huiping192/VideoRTMPPublish.git /VideoRTMPPublish --recurse-submodule \
    && git config --global --add safe.directory /VideoRTMPPublish \
    && chmod 777 /VideoRTMPPublish/publish.sh

# Copy files from build stage to final stage	
#COPY --from=builder /video /video

VOLUME ["/video"]
ENTRYPOINT ["/VideoRTMPPublish/publish.sh"]