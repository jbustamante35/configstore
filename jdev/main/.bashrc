#!/usr/bin/env bash

# Set profile name for device
export PROFILE=jdev

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Aliases
als=~/.aliases
if [ -f ${als} ]; then
    . ${als}
fi

# Function definitions
funcs=~/.functions
if [ -f ${funcs} ]; then
    . ${funcs}
fi

# Shortcut bindings
shrt=~/.scripts/shortcuts.sh
if [ -f ${shrt} ]; then
    . ${shrt}
fi

source ~/.shortcuts
