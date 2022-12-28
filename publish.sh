#!/bin/bash

while true
do
	cd /video
	for video in $(ls)
	do
		ffmpeg -re -i "$video" -preset ultrafast -vcodec libx264 -g 60 -b:v 6000k -c:a aac -b:a 128k -strict -2 -f flv "rtmp://192.168.11.1:1935/live/test"
	done
done