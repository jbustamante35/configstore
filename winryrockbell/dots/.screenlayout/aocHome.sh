#!/bin/sh
# XRandR setup for AOC display at home with Intel or Nvidia drivers

drv="$1"
case "$drv" in
    intel)
    # Get display names with Intel driver
    me="$PRIMARYDISPLAY"
    aoc="$AOC_HOME"
    ;;

    nvidia)
    # Get display names with Nvidia driver
    me="$PRIMARYDISPLAY-1"
    aoc="$AOC_HOME-1"
    ;;
*)
    # Default to intel
    me="$PRIMARYDISPLAY"
    aoc="$AOC_HOME"
    ;;
esac

xrandr \
    --output "$me"  --primary --mode 2048x1152 --pos 0x0 --rotate normal \
    --output "$aoc" --mode 1920x1080 --pos 2048x0 --rotate normal


