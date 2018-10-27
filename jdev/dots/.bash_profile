# Get the aliases and functions                                                                                    
if [ $(echo $SHELL) = /bin/bash ]; then
	echo "Hellow thair!"
	if [ -f ~/.bashrc ]; then
        echo "General $SHELL!"
		. ~/.bashrc
	fi
fi
        
# Get the aliases and functions                                                                                    
if [ $(echo $SHELL) = /bin/zsh ]; then
	echo "Hellow thair!"
	if [ -f ~/.zshrc]; then
        echo "General $SHELL!"
		. ~/.zshrc
	fi
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
