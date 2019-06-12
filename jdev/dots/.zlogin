# Get the aliases and functions
if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# Get the aliases and functions
if [ -n "$ZSH_VERSION" ]; then
    if [ -f "$HOME/.zshrc" ]; then
        source "$HOME/.zshrc"
    fi
fi

# include USER path
if [ -d "$HOME/.local/bin" ]; then
    MYPATH="$HOME/.local/bin"
fi

if [ -d "$HOME/bin" ]; then
    MYBIN="$HOME/bin"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

RUBYPATH="$HOME/.rvm/bin"
CONDAPATH="$HOME/anaconda3/bin"
CARGOPATH="$HOME/.cargo/bin"

export EDITOR=vim
export BROWSER=firefox
export PATH=$PATH:$CONDAPATH:$CARGOPATH:$RUBYPATH:$MYPATH:$MYBIN
