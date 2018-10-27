# Get the aliases and functions                                                                                    
if [ -n "$BASH_VERSION" ]; then
	echo "Running .profile as bash"
	if [ -f ~/.bashrc ]; then
        echo "Hellow thair! General $SHELL!"
        echo "Sourcing $HOME/.bashrc"
		. $HOME/.bashrc
	fi
fi
        
# Get the aliases and functions                                                                                    
if [ -n "$ZSH_VERSION" ]; then
	echo "Running .profile as zsh"
	if [ -f ~/.zshrc]; then
        echo "Hellow thair! General $SHELL!"
		source $HOME/.zshrc
	fi
fi

# include USER path
if [ -d "$HOME/.local/bin" ]; then
	echo "Sourcing $HOME/.local/bin"
	MYPATH="$HOME/.local/bin"
fi

if [ -d "$HOME/bin" ]; then
	echo "Sourcing $HOME/bin"
	MYBIN="$HOME/bin"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
echo "Adding $HOME/.rvm/bin and $HOME/anaconda3/bin"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
RUBYPATH="$HOME/.rvm/bin"
CONDAPATH="$HOME/anaconda3/bin"

export PATH=$PATH:$CONDAPATH:$RUBYPATH:$MYPATH:$MYBIN
export EDITOR=vim
