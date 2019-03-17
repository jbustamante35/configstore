#!/bin/bash

# Run both conky configuration scripts
conky -c ~/.config/conky/main -d & \
conky -c ~/.config/conky/func -d ;

# On 2nd monitor [right]
conky -c ~/.config/conky/main -x 3850  -y 30 -d & \
conky -c ~/.config/conky/func -x -1900 -y 30 -d ;

# On 3rd monitor [left]
#conky -c ~/.config/conky/main -x 3850  -y 30 -d & \
#conky -c ~/.config/conky/func -x -1900 -y 30 -d ;

