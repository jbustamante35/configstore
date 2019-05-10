#!/bin/bash
ydown='-20'

# Run both conky configuration scripts
conky -c ~/.config/conky/main -d & \
conky -c ~/.config/conky/func -d & \
conky -c ~/.config/conky/alts -d ;

# On 2nd monitor [right]
conky -c ~/.config/conky/main -x 2070  -y $ydown -d & \
conky -c ~/.config/conky/func -x -1900 -y $ydown -d & \
conky -c ~/.config/conky/alts -x -1900 -d ;

# On 3rd monitor [left]
conky -c ~/.config/conky/main -x -1900 -y $ydown -d & \
conky -c ~/.config/conky/func -x 2070 -y $ydown -d & \
conky -c ~/.config/conky/alts -x 2070 -y 150 -d ;

