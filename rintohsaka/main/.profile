# ~/.profile: executed by the command interpreter for login shells.  This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
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

# if running fish [doesn't work because bad fish syntax]
#if [ "$SHELL" eq "/usr/bin/fish" ]; then
#    # include .fishrc if it exists
#    if [ -f "$HOME/.fishrc" ]; then
#	source "$HOME/.fishrc"
#    fi
#fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    MYPATH="$HOME/bin"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    MYBIN="$HOME/.local/bin:"
fi

#CONDAPATH=$HOME/anaconda3/bin
RUBYPATH=$HOME/.gem/ruby/2.6.0/bin
NPMPATH=$HOME/.npm_global/bin
GOPATH=$HOME/go/bin
GOROOT=/usr/lib/go/bin

export EDITOR=nvim
export TERMINAL=terminator
export BROWSER=qutebrowser
#export PATH=$PATH:$CONDAPATH:$NPMPATH:$RUBYPATH:$MYPATH:$MYBIN:$GOPATH:$GOROOT
export PATH=$PATH:$MYPATH:$MYBIN:$NPMPATH:$RUBYPATH:$GOPATH:$GOROOT


