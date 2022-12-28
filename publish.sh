#!/bin/bash

while true; do
	cd /video
	for video in *; do
		ffmpeg -re -i "$video" -preset ultrafast -vcodec libx264 -g 60 -b:v 6000k -c:a aac -b:a 128k -strict -2 -f flv "$STREAM_URL/$STREAM_KEY"
	done
done