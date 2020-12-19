#!/bin/bash
ydown='30'
#dsp="$1"
dsp="$DISPLAY"

# Run both conky configuration scripts
conky -X "$dsp" -c ~/.config/conky/main            -d -q & \
conky -X "$dsp" -c ~/.config/conky/func            -d -q & \
conky -X "$dsp" -c ~/.config/conky/alts            -d -q & \
conky -X "$dsp" -c ~/.config/conky/todo            -d -q & \
conky -X "$dsp" -c ~/.config/conky/shopping        -d -q & \
conky -X "$dsp" -c ~/.config/conky/bladerunnertime -d -q ;

# On 2nd monitor [right]
#conky -X "$dsp" -c ~/.config/conky/main      -x 2070  -y $ydown -d & \
#conky -X "$dsp" -c ~/.config/conky/func      -x -1900 -y $ydown -d & \
#conky -X "$dsp" -c ~/.config/conky/alts      -x -1900 -y 400    -d & \
#conky -X "$dsp" -c ~/.config/conky/todo      -x -1850 -y 100    -d & \
#conky -X "$dsp" -c ~/.config/conky/shopping  -x -1400 -y 100    -d & \
#conky -X "$dsp" -c ~/.config/conky/bladerunnertime -x 2100  -y -100   -d ;

# On 3rd monitor [left]
conky -X "$dsp" -c ~/.config/conky/main      -x -1900 -y $ydown       -d -q & \
conky -X "$dsp" -c ~/.config/conky/func      -x 2070  -y $ydown       -d -q & \
conky -X "$dsp" -c ~/.config/conky/alts      -x 2070  -y 350          -d -q & \
conky -X "$dsp" -c ~/.config/conky/todo      -x 2080  -y 100          -d -q & \
conky -X "$dsp" -c ~/.config/conky/shopping  -x 2400  -y 100          -d -q & \
conky -X "$dsp" -c ~/.config/conky/bladerunnertime -x -1450 -y -150   -d -q ;
