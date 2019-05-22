#!/bin/sh
# xrandr setup for AOC display at home
xrandr \
    --output eDP1 --primary --mode 2048x1152 --pos 0x0 --rotate normal \
    --output HDMI1 --mode 1920x1080 --pos 3840x0 --rotate normal
