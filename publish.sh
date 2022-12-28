#!/bin/bash
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH

while true
do
	cd /video
	for video in $(ls *.mp4)
	do
		ffmpeg -re -i "$video" -preset ultrafast -vcodec libx264 -g 60 -b:v 6000k -c:a aac -b:a 128k -strict -2 -f flv "rtmp://192.168.11.1:1935/live/test"
	done
done