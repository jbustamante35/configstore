#!/bin/bash
# Return pulsemixer ID of dominant audio device
# for i3 volume control
# If bluetooth speaker is on, ID is 2
# It should get the actual ID [ ID = n ] but I'm
# too stupid to figure out how to do that

speaker="JBL Flip 4"
fout=$HOME/.config/devID
sinks=$(pulsemixer --list-sinks)
speaker_on=$(echo $sinks | grep -iEc "${speaker}")

if [[ $speaker_on = 1 ]]; then
		id=2
else
		id=0
fi

if [[ ! -f "$fout" ]]; then
		#echo "Created $fout"
		touch $fout
fi

#echo "$id > $fout"
echo $id > $fout

#export AUDIO_DEVICE_ID=$id
#echo "export AUDIO_DEVICE_ID=$id"

