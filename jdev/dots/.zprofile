# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# the default umask is set in /etc/profile; for setting the umask
# for ssh logins, install and configure the libpam-umask package.
#umask 022

export PROFILE=jdev

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

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    MYPATH="$HOME/.local/bin"
fi

if [ -d "$HOME/bin" ]; then
    MYBIN="$HOME/bin"
fi

# set miscellaneous paths
#GOROOT='/usr/lib/go'
#GOPATH=/home/jbustamante/go
RUBYPATH=/home/jbustamante/.gem/ruby/2.5.0
#PYTHON=/usr/bin/python
#JUPYTER=/usr/local/bin/jupyter

export TERMINAL=urxvt
export BROWSER=brave-browser-beta
export EDITOR=nvim
export MPD_PORT=6000
#export PATH=$PATH:$MYPATH:$MYBIN:$GOROOT/bin:$GOPATH/bin:$RUBYPATH/bin
export PATH=$PATH:$MYPATH:$MYBIN:$RUBYPATH/bin

# Swap CAPSLOCK and ESCAPE
#setxkbmap -option "caps:swapescape"

