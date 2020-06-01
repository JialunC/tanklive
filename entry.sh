#!/bin/bash

echo Live-stream secret: $1

for i in {1..100000}; do printf "file '%s'\n" /audio/audio.mp3 >> list.txt; done

raspivid -o - -t 0 -w 1920 -h 1080 -fps 40 -b 8000000 -g 40 | ffmpeg \
    -re -f concat -i list.txt -f h264 \
    -i pipe:0 -c:v copy -c:a aac -ab 128k -g 40 -strict experimental \
    -f flv -r 30 rtmp://a.rtmp.youtube.com/live2/$1