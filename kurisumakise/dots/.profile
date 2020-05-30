# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login exists.

export PROFILE=kurisumakise
export WALEND=schemer

# if running bash
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then
        source "$HOME/.zshrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    MYPATH="$HOME/.local/bin"
fi

if [ -d "$HOME/bin" ]; then
    MYBIN="$HOME/bin"
fi

# set miscellaneous paths
GOROOT='/usr/lib/go'
GOPATH=/home/jbustamante/go
RUBYPATH=/home/jbustamante/.gem/ruby/2.6.0
#PYTHON=/usr/bin/python
MEDNAFEN_HOME=$HOME/.config/mednafen

export GTK2_RC_FILES="$HOME/.gtkrc-2.0"
export TERMINAL=urxvt
export BROWSER=firefox
export EDITOR=nvim
export PATH=$PATH:$MYPATH:$MYBIN:$GOROOT/bin:$GOPATH/bin:$RUBYPATH/bin

# Swap CAPSLOCK and ESCAPE
setxkbmap -option "caps:swapescape"

