#!/bin/bash

echo Live-stream secret: $1

raspivid -o - -t 0 -w 1920 -h 1080 -fps 40 -b 8000000 -g 40 | ffmpeg \
    -re -stream_loop -1 -f mp3 -i /audio/audio.mp3 -f h264 \
    -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental \
    -f flv -r 30 rtmp://a.rtmp.youtube.com/live2/$1