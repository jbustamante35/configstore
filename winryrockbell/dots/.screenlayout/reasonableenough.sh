#!/bin/sh
# Just use single screen at reasonable resolution

num="$1"

case "$num" in
    1)
        # Primary only
        xrandr \
            --output eDP1 --primary --mode 2048x1152 --pos 0x0 --rotate normal \
            --output DP1      --off \
            --output DP2      --off \
            --output VIRTUAL1 --off \
            --output HDMI1    --off
        ;;
    2)
        # Dell to the left
        xrandr \
            --output DP1 --mode 1920x1080 --pos 0x0 --rotate normal \
            --output DP2 --off \
            --output eDP1 --primary --mode 2048x1152 --pos 1920x0 --rotate normal
        ;;

    3)
        # Triple setup
        xrandr \
            --output DP1 --off \
            --output DP2 --mode 1920x1080 --pos 0x0 --rotate normal \
            --output eDP1 --primary --mode 2048x1152 --pos 1920x0 --rotate normal \
            --output VIRTUAL1 --off \
            --output HDMI1 --mode 1920x1200 --pos 5760x0 --rotate normal
        ;;

    *)
        # Default to primary only
        xrandr \
            --output eDP1 --primary --mode 2048x1152 --pos 0x0 --rotate normal
        ;;
esac

# TODO Scale up instead of changing resolution
