#!/bin/bash
# -o File name
# -s Image size
# -j JPEG quality - 100 = 100%
# -r sample rate - 1 = 1 shot per second. 0.1 = 10 shots per second
# -t number of frames or hh:mm:ss
streamer -o 000000.jpeg -s 1280x720 -j 100 -r 1 -t 24:00:00
