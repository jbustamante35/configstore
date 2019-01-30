#!/bin/bash
# open terminals, chrome, and set wallpaper

dualScreen.sh ;

gnome-terminal --profile="Wolfen" ;
gnome-terminal --profile="Arwing" ;
#deepin-terminal ;


# Set colors in .Xresources to match pywal
wal -c -i ~/.config/wall.png --saturate  0.7

# Determine Audio Driver ID on startup
eval $(~/bin/audio_device_id.sh)

