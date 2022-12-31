FROM jrottenberg/ffmpeg
MAINTAINER huiping192 <huiping192@gmail.com>

# streaming settings
ENV STREAM_URL ""
ENV STREAM_KEY ""

# video folder
VOLUME ["/video"]

COPY . . 

ENTRYPOINT ["./publish.sh"]
