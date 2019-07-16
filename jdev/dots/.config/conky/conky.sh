#!/bin/sh
ygap=30
dsp="$DISPLAY"

# Primary Screen
conky -X "$dsp" -d -c ~/.config/conky/main      &
#conky -X "$dsp" -d -c ~/.config/conky/func      &
#conky -X "$dsp" -d -c ~/.config/conky/alts      &
conky -X "$dsp" -d -c ~/.config/conky/todo      &
conky -X "$dsp" -d -c ~/.config/conky/shopping  &
conky -X "$dsp" -d -c ~/.config/conky/zeldatime


