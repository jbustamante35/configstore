#!/bin/sh
# open terminals, chrome, and set wallpaper

# Set resolutions for two screens
dualScreen.sh ;

# Set wallpaper
feh --bg-scale ~/.config/wall.png ;

# Set colors in .Xresources to match pywal
wal -c -i ~/.config/wall.png --saturate  0.8 ;
sleep 2 ;

# Set colors from pywal and Xresources
colorsource.sh ;

