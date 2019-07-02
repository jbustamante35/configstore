#!/bin/sh
# Use screen(s) at reasonable resolution with Intel or Nvidia drivers

num="$1"
drv="$2"

case "$drv" in
    intel)
    # Get display names with Intel driver
    #me="$PRIMARYDISPLAY"
    #delS1="$SMALL_DELL1"
    #delS2="$SMALL_DELL2"
    #delL="$LARGE_DELL"
    #aoc="$AOC_HOME"

    # Fix on 06-11-2019 made display names switch
    me="$PRIMARYDISPLAY-1"
    delS1="$SMALL_DELL1-1"
    delS2="$SMALL_DELL2-1"
    delL="$LARGE_DELL-1"
    aoc="$AOC_HOME-1"
    ;;

    nvidia)
    # Get display names with Nvidia driver
    #me="$PRIMARYDISPLAY-1"
    #delS1="$SMALL_DELL1-1"
    #delS2="$SMALL_DELL2-1"
    #delL="$LARGE_DELL-1"
    #aoc="$AOC_HOME-1"

    # Fix on 06-11-2019 made display names switch
    me="$PRIMARYDISPLAY"
    delS1="$SMALL_DELL1"
    delS2="$SMALL_DELL2"
    delL="$LARGE_DELL"
    aoc="$AOC_HOME"
    ;;

*)
    # Default to no appending DISPLAY-1
    me="$PRIMARYDISPLAY"
    delS1="$SMALL_DELL1"
    delS2="$SMALL_DELL2"
    delL="$LARGE_DELL"
    aoc="$AOC_HOME"
    ;;

esac

case "$num" in
    0b)
        # VNC Display
        vnc=VNC-0
        xrandr \
            --output "$vnc" --primary --mode 1344x727 --pos 0x0 --rotate normal
        ;;
    1)
        # Primary only in lab
        xrandr \
            --output "$me" --primary --mode 2048x1152 --pos 0x0 --rotate normal \
            --output "$delS1" --off \
            --output "$delS2" --off \
            --output "$delL"  --off
        ;;
    1b)
        # Primary only at home
        xrandr \
            --output "$me"  --primary --mode 2048x1152 --pos 0x0 --rotate normal \
            --output "$aoc" --off
        ;;
    2)
        # Dell to the left in lab
        xrandr \
            --output "$delS1" --mode 1920x1080 --pos 0x0 --rotate normal \
            --output "$delS2" --off \
            --output "$me"    --primary --mode 2048x1152 --pos 1920x0 --rotate normal
        ;;
    2b)
        # AOC display at home
        xrandr \
            --output "$me"  --primary --mode 2048x1152 --pos 0x0 --rotate normal \
            --output "$aoc" --mode 1920x1080 --pos 2048x0 --rotate normal
        ;;

    3)
        # Triple setup in lab
        xrandr \
            --output "$delL"  --mode 1920x1200 --pos 5760x0 --rotate normal \
            --output "$me"    --primary --mode 2048x1152 --pos 1920x0 --rotate normal \
            --output "$delS1" --off \
            --output "$delS2" --mode 1920x1080 --pos 0x0 --rotate normal
        ;;

    *)
        # Default to primary only
        xrandr \
            --output "$me" --primary --mode 2048x1152 --pos 0x0 --rotate normal
        ;;
esac

