#!/bin/sh
# Just use single screen at reasonable resolution
xrandr --output eDP1 --primary --mode 2048x1152 --pos 0x0 --rotate normal

# TODO Scale up instead of changing resolution
#xrandr --output eDP1 --primary --mode 2048x1152 --pos 0x0 --rotate normal

# Original triple desktops
#xrandr --output eDP-1-1 --primary --mode 2048x1152 --pos 0x0 --rotate normal \
#    --output HDMI-1-1 --off \
#    --output DP-1-1 --off --output DP-1-2 --off

