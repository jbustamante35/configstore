#!/usr/bin/env bash
# Load profile for this device
export PROFILE=rintohsaka

# Load Xresources
#xrdb -load ~/.Xresources

# Load Bash It
#source ~/.scripts/shortcuts.sh
#source ~/.shortcuts

# Source aliases, functions, and shortcuts
als=~/.aliases
if [ -f $als ]; then
    . $als
fi

fncs=~/.functions
if [ -f $fncs ]; then
    . $fncs
fi

shrt=~/.scripts/shortcuts.sh
if [ -f $shrt ]; then
    . $shrt
fi

