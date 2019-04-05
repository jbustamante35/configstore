# Set profile name for this device
export PROFILE=jdev

# Path to your oh-my-zsh installation.
export ZSH="/home/jbustamante/.oh-my-zsh"
ZSH_THEME="refined"

plugins=(
    zsh-autosuggestions
    extract
    web-search
    cp
    vagrant
    vi-mode
    colorize
)

# Skip sourcing of potentially unsafe directories
ZSH_DISABLE_COMPFIX="true"
source $ZSH/oh-my-zsh.sh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

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
shrt=~/.scripts/shortcuts.zsh
if [ -f ${shrt} ]; then
    . ${shrt}
    . ~/.shortcuts
fi

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"
