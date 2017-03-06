#!/bin/bash
ffmpeg -r 30 -f image2 -i %d.jpeg -vcodec libx264 -crf 25 -pix_fmt yuv420p time-lapse.mp4

# If your first image isn't 000000.jpeg, set a start_number:
#ffmpeg -r 30 -f image2 -start_number 10000 -i %d.jpeg -vcodec libx264 -crf 25 -pix_fmt yuv420p time-lapse.mp4
