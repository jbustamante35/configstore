# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
	    . "$HOME/.bashrc"
    fi
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    # include .zshrc if it exists
    if [ -f "$HOME/.zshrc" ]; then
	    source "$HOME/.zshrc"
    fi
fi

## set PATH so it includes user's private bin if it exists
#if [ -d "$HOME/.local/bin" ] ; then
#    MYPATH="$HOME/.local/bin"
#fi
#
#if [ -d "$HOME/bin" ]; then
#	MYBIN="$HOME/bin"
#fi

# My custom paths
MYPATH="$HOME/.local/bin"
MYBIN="$HOME/bin"

# set miscellaneous paths
GOROOT='/usr/lib/go'
GOPATH=$HOME/go
RUBYPATH=$HOME/.gem/ruby/2.6.0
R_USER_WORKSPACE=$HOME/Documents/R
JULIAPATH=/usr/local/lib/julia-1.3.1

export TERMINAL=urxvt
export BROWSER=brave
export EDITOR=nvim
export R_HISTFILE=$HOME/.Rhistory
export PATH=$PATH:$MYPATH:$MYBIN:$GOROOT/bin:$GOPATH/bin:$RUBYPATH/bin:$JULIAPATH/bin

# Hue Hub Alias
HUEHUB=eaglesnest
HUELIGHTS=$(huecli get-lighting "$HUEHUB" | wc | awk '{print $1}')

# Display names for monitors in intel mode
export PRIMARYDISPLAY="eDP1"
export AOC_HOME="HDMI1"
export SMALL_DELL1="DP1"
export SMALL_DELL2="DP2"
export LARGE_DELL="HDMI1"

# Swap CAPSLOCK and ESCAPE
# Xorg
setxkbmap -option "caps:swapescape"

# Wayland
#gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"

# vim: filetype=sh
