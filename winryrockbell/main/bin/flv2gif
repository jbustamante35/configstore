#!/bin/sh
# Converts FLV video to GIF
# Usage:
#	~/bin/flv2gif.sh video.flv anim.gif

start_time="$1"
duration="$2"
fin="$3"
fout="$4"

palette="/home/jbustamante/Videos/screenrecordings/gifconvert/pallete.png"
filters="fps=15,scale=420:-1:flags=lanczos"

ffmpeg -v warning -ss $start_time -t $duration -i $fin -vf "$filters,palettegen" -y $palette
ffmpeg -v warning -ss $start_time -t $duration -i $fin -i $palette -lavfi "$filters [x]; [x][1:v] paletteuse" -y $fout



