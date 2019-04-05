#!/bin/sh
# xrandr setup for triple monitors, with Nathan's large Dell to the right
xrandr \
    --output HDMI1    --mode 1920x1200 --pos 3968x0     --rotate normal \
    --output eDP1     --primary        --mode 2048x1152 --pos 1920x0      --rotate normal \
    --output DP2      --mode 1920x1080 --pos 0x0        --rotate normal \
    --output VIRTUAL1 --off \
    --output DP1      --off
