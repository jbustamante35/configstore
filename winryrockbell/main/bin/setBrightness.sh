#!/bin/bash
# Set brightness level of eDP-1-1 [primary display]
# Usage
#	setBrightness.sh <brightness>

primary_display=eDP-1-1
max=1.0
lvl=$1

if [[ "$lvl" =~ "%" ]]; then
	brightness=$(($lvl / $max))
else
	brightness=$lvl
fi

xrandr --output $primary_display --brightness $brightness
