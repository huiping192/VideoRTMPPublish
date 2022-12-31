# VideoRTMPPublish
Docker image for video streaming client. Auto publish video file to steaming server like youtube live,twitch,etc..


# Description
This Docker image can be use for auto streaming video files to rtmp server. Using ffmpeg to transcode and publish.

# Usage
To run the server
```
docker run -d -v {your video directory}:/video -e STREAM_URL={streaming url} -e STREAM_KEY={streaming key}  huiping192/video_rtmp_publish
```

# Copyright
Released under MIT license.

