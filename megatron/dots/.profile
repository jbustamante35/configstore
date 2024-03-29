#!/bin/bash
# Profile file. Runs on login.

# Adds `~/.scripts` and all subdirectories to $PATH
export PATH="$(du "$HOME/.scripts/" | cut -f2 | tr '\n' ':')$PATH"
export EDITOR="vvim"
export TERMINAL="st"
export BROWSER="qutebrowser"
export READER="zathura"
export BIB="$HOME/Documents/LaTeX/uni.bib"
export REFER="$HOME/.referbib"

# PIX is here I have LARBS keep icons. Subject to change, hence a variable.
export PIX="$HOME/.scripts/pix"
export SUDO_ASKPASS="$HOME/.scripts/tools/dmenupass"

# less/man colors
export LESS=-R
export LESS_TERMCAP_mb=$'\E[1;31m'     # begin bold
export LESS_TERMCAP_md=$'\E[1;36m'     # begin blink
export LESS_TERMCAP_me=$'\E[0m'        # reset bold/blink
export LESS_TERMCAP_so=$'\E[01;44;33m' # begin reverse video
export LESS_TERMCAP_se=$'\E[0m'        # reset reverse video
export LESS_TERMCAP_us=$'\E[1;32m'     # begin underline
export LESS_TERMCAP_ue=$'\E[0m'        # reset underline

[ ! -f ~/.shortcuts ] && shortcuts >/dev/null 2>&1

# Start graphical server if i3 not already running.
[ "$(tty)" = "/dev/tty1" ] && ! pgrep -x i3 >/dev/null && exec startx

# Switch escape and caps and use wal colors if tty:
sudo -n loadkeys ~/.scripts/ttymaps.kmap 2>/dev/null

## Mine
# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    #PATH="$HOME/bin:$PATH"
    MYPATH="$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    # PATH="$HOME/.local/bin:$PATH"
    MYBIN="$HOME/.local/bin:"
fi

RUBYPATH=$HOME/.gem/ruby/2.5.0
RUBYBIN=$RUBYPATH/bin
#export EDITOR=nvim
#export TERMINAL=urxvt
#export BROWSER=qutebrowser
export PATH=$PATH:$MYPATH:$MYBIN:$RUBYPATH:$RUBYBIN
export PROFILE=megatron

