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
	    . "$HOME/.zshrc"
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
GOROOT='/usr/lib/go-1.10'
GOPATH=/home/jbustamante/go
PYTHON=/usr/bin/python
JUPYTER=/usr/local/bin/jupyter

#export TERMINAL="gnome-terminal --profile=Din"
export TERMINAL=gnome-terminal
export EDITOR=vim
export PATH=$PATH:$MYPATH:$MYBIN:$GOROOT/bin:$GOPATH/bin

