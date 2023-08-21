#!/bin/bash

while true
do

# working uncropped
# ffmpeg -f lavfi -i anullsrc -thread_queue_size 512 -rtsp_transport tcp -i rtsp://[CAMERA-URL]/live -vcodec copy -codec:a aac -f flv  -r 30 "rtmp://a.rtmp.youtube.com/live2/[YOUTUBE-KEY]"

# broken crop
# ffmpeg -f lavfi -i anullsrc -thread_queue_size 512 -rtsp_transport tcp -i rtsp://[CAMERA-URL]/live -vcodec copy -codec:a aac -filter:v "crop=1280:720:704:400"  -f flv  -r 30 "rtmp://a.rtmp.youtube.com/live2/[YOUTUBE-KEY]"

# working crop but too small
# ffmpeg -f lavfi -i anullsrc -thread_queue_size 512 -rtsp_transport tcp -i rtsp://[CAMERA-URL]/live  -filter:v "crop=1280:720:704:400" -g 60 -c:a aac -b:a 128k -ar 44100 -f flv  "rtmp://a.rtmp.youtube.com/live2/[YOUTUBE-KEY]"

# view crop still broken
# ffmpeg -f lavfi -i anullsrc -thread_queue_size 512 -rtsp_transport tcp -i rtsp://[CAMERA-URL]/live -vf "crop=1280:720:704:400" -vcodec copy -codec:a aac -f flv  -r 30 "rtmp://a.rtmp.youtube.com/live2/[YOUTUBE-KEY]"

# another go
# ffmpeg -an -rtsp_transport tcp -i rtsp://[CAMERA-URL]/live  -tune zerolatency -vcodec libx264 -t 12:00:00 -pix_fmt + -c:v copy -f flv rtmp://a.rtmp.youtube.com/live2/[YOUTUBE-KEY]

# include metadata for YouTube to apply cropping
  ffmpeg -f lavfi -i anullsrc -thread_queue_size 512 -rtsp_transport tcp -i rtsp://[CAMERA-URL]/live -bsf:v h264_metadata=crop_left=732:crop_right=0:crop_top=0:crop_bottom=440 -vcodec copy -codec:a aac -f flv  -r 20 "rtmp://a.rtmp.youtube.com/live2/[YOUTUBE-KEY]"

sleep 2
done

