#!/bin/bash
# Set gamma level of eDP-1-1 [primary display]
# Usage
#	setGamma.sh <gamma>

primary_display=eDP-1-1
max=1.0
lvl=$1

if [[ "$lvl" =~ "%" ]]; then
	gamma=$(($lvl / $max))
else
	gamma=$lvl
fi

xrandr --output $primary_display --gamma $gamma:$gamma:$gamma
