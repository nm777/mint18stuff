#!/bin/bash
# Diffusion youtube avec ffmpeg

# Configurer youtube avec une résolution 720p. La vidéo n'est pas scalée.

YOUTUBE_URL="rtmp://a.rtmp.youtube.com/live2"
SOURCE="-f x11grab -i :0.0"
AUDIO="-f lavfi -i anullsrc"
KEY="ad8x-u4ae-k8w1-c9c6"
FPS=30
INRES="1920x1080"

ffmpeg -thread_queue_size 50 -an -r $FPS -s $INRES $SOURCE $AUDIO -c:v libx264 -x264-params keyint=60:no-scenecut=1 -vf scale=iw*sar:ih -b:v 4000k -minrate 4000k -maxrate 4000k -bufsize 1835k -pix_fmt yuv420p -c:a aac -f flv -rtmp_live live $YOUTUBE_URL/$KEY
