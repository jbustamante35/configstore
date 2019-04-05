#!/bin/sh
# xrandr setup for two displays with Dell monitor to the left
xrandr \
    --output HDMI1 --off \
    --output VIRTUAL1 --off \
    --output DP1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output eDP1 --primary --mode 2048x1152 --pos 1920x0 --rotate normal \
    --output DP2 --off
