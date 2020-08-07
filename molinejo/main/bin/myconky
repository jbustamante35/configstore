#!/bin/sh

# Primary Screen
conky -d -c ~/.config/conky/main      &
conky -d -c ~/.config/conky/func      &
conky -d -c ~/.config/conky/alts      &
conky -d -c ~/.config/conky/todo      &
conky -d -c ~/.config/conky/shopping  &
conky -d -c ~/.config/conky/zeldatime

# Secondary Screen [right]
conky -d -c ~/.config/conky/main       -x 1940  -y 51   &
conky -d -c ~/.config/conky/func       -x -1900 -y 50   &
conky -d -c ~/.config/conky/alts       -x -1900 -y 400  &
conky -d -c ~/.config/conky/todo       -x -1850 -y 30   &
conky -d -c ~/.config/conky/shopping   -x -1400 -y 30   &
conky -d -c ~/.config/conky/zeldatime  -x 2100  -y -160

