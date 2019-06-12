#!/bin/sh
# XRandR setup for triple displays in lab with Intel or Nvidia drivers

drv="$1"
case "$drv" in
    intel)
    # Get display names with Intel driver
    me="$PRIMARYDISPLAY"
    delS1="$SMALL_DELL1"
    delS2="$SMALL_DELL2"
    delL="$LARGE_DELL"
    ;;

    nvidia)
    # Get display names with Nvidia driver
    me="$PRIMARYDISPLAY-1"
    delS1="$SMALL_DELL1-1"
    delS2="$SMALL_DELL2-1"
    delL="$LARGE_DELL-1"
    ;;

*)
    # Default to intel
    me="$PRIMARYDISPLAY"
    delS1="$SMALL_DELL1"
    delS2="$SMALL_DELL2"
    delL="$LARGE_DELL"
    ;;

esac

xrandr \
    --output "$delL" --mode 1920x1200 --pos 3968x0 --rotate normal \
    --output "$me" --primary --mode 2048x1152 --pos 1920x48 --rotate normal \
    --output "$delS1" --off \
    --output "$delS2" --mode 1920x1080 --pos 0x0 --rotate normal

