#!/bin/sh

# Primary Screen
conky -d -c ~/.config/conky/conky_main    &
conky -d -c ~/.config/conky/conky_func    &
conky -d -c ~/.config/conky/conky_notepad &
conky -d -c ~/.config/conky/conky_shopping

# Secondary Screen
conky -d -c ~/.config/conky/conky_main     -x 1940 -y 30     &
conky -d -c ~/.config/conky/conky_func     -x -1900 -y 30     &
conky -d -c ~/.config/conky/conky_notepad  -x -1850 -y 30     &
conky -d -c ~/.config/conky/conky_shopping -x -1400 -y 30


