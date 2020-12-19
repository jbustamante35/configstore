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
    [ -f "$HOME/.bashrc" ] && . "$HOME/.bashrc"
fi

# if running zsh
if [ -n "$ZSH_VERSION" ]; then
    [ -f "$HOME/.zshrc" ] && source "$HOME/.zshrc"
fi

# My custom paths
[ -d "$HOME/.local/bin" ] && MYPATH="$HOME/.local/bin"
[ -d "$HOME/bin" ]        && MYBIN="$HOME/bin"

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
export PRIMARYDISPLAY="eDP-1"
export AOC_HOME="HDMI-1"
export SMALL_DELL1="DP-1"
export SMALL_DELL2="DP-2"
export LARGE_DELL="HDMI-1"

# Swap CAPSLOCK and ESCAPE
# Xorg
setxkbmap -option "caps:swapescape"

# Wayland
#gsettings set org.gnome.desktop.input-sources xkb-options "['caps:ctrl_modifier']"

# vim: filetype=sh
