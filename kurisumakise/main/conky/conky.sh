#!/bin/sh
ydown='30'

case "$1" in
    1) dsp="$DISPLAY" ;;
    *) dsp=":0" ;;
esac

# Primary Screen
conky -X "$dsp"  -c "$HOME"/.config/conky/main      -d & \
conky -X "$dsp"  -c "$HOME"/.config/conky/func      -d & \
conky -X "$dsp"  -c "$HOME"/.config/conky/alts      -d & \
conky -X "$dsp"  -c "$HOME"/.config/conky/todo      -d & \
conky -X "$dsp"  -c "$HOME"/.config/conky/shopping  -d & \
conky -X "$dsp"  -c "$HOME"/.config/conky/time      -d ;


## Secondary Screen [right]
#conky -d -c ~/.config/conky/main       -x 1940  -y 51   &
#conky -d -c ~/.config/conky/func       -x -1900 -y 50   &
#conky -d -c ~/.config/conky/alts       -x -1900 -y 400  &
#conky -d -c ~/.config/conky/todo       -x -1850 -y 30   &
#conky -d -c ~/.config/conky/shopping   -x -1400 -y 30   &
#conky -d -c ~/.config/conky/zeldatime  -x 2100  -y -160
#
#
## Tertiary Screen [left]
#conky -d -c ~/.config/conky/main       -x -1900  -y 51   &
#conky -d -c ~/.config/conky/func       -x 1950   -y 50   &
#conky -d -c ~/.config/conky/alts       -x 1950   -y 400  &
#conky -d -c ~/.config/conky/todo       -x 1980   -y 40   &
#conky -d -c ~/.config/conky/shopping   -x 2400   -y 40   &
#conky -d -c ~/.config/conky/zeldatime  -x -1700  -y -160

# LG Screen [left]
#conky -d -c ~/.config/conky/main       -x -2530  -y 51   &
#conky -d -c ~/.config/conky/func       -x 1950   -y 50   &
#conky -d -c ~/.config/conky/alts       -x 1950   -y 400  &
#conky -d -c ~/.config/conky/todo       -x 1980   -y 40   &
#conky -d -c ~/.config/conky/shopping   -x 2400   -y 40   &
#conky -d -c ~/.config/conky/zeldatime  -x -2100  -y -70
