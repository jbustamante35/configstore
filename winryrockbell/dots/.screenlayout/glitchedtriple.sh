#!/bin/sh
xrandr \
    --output DP1 --off \
    --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output eDP1 --primary --mode 2048x1152 --pos 1920x0 --rotate normal \
    --output VIRTUAL1 --off \
    --output HDMI1 --mode 1920x1200 --pos 6384x0 --rotate normal
