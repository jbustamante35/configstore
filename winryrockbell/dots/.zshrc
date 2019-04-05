# TODO [ write some documentation here ]
#  And maybe a corny ascii art symbol

export PROFILE=winryrockbell # Set profile for device
export ZSH="/home/jbustamante/.oh-my-zsh" # Path to your oh-my-zsh installation.

# Set name of the theme to load
ZSH_THEME="nanotech"

# Which plugins would you like to load? Add wisely, as too many plugins slow down shell startup.
plugins=(
    extract
    web-search
    vagrant
    cp
    vi-mode
    colorize
    web-search
    #git
    #git-extras
    #git-prompt
    #sublime
    #rsync
)

source $ZSH/oh-my-zsh.sh

# Aliases
als=~/.aliases
if [ -f ${als} ]; then
    . ${als}
fi

# Functions
funcs=~/.functions
if [ -f ${funcs} ]; then
    . ${funcs}
fi

# Shortcuts
shrt=~/.scripts/shortcuts.zsh
if [ -f ${shrt} ]; then
    . ${shrt}
    . ~/.shortcuts
fi

# source additional configs
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
#export PATH="/home/jbustamante/anaconda3/bin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id"
source ~/.shortcuts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#ZSH_THEME_RANDOM_CANDIDATES= ( "robbyrussell" "agnoster" ) # Set list of themes to pick from when loading at random
#DISABLE_AUTO_TITLE= "true"                                 # Uncomment the following line to disable auto-setting terminal title.
#HIST_STAMPS= "mm/dd/yyyy"                                  # Uncomment the following line if you want to change the command execution time stamp shown in the history command output.
#export LANG= en_US.UTF-8                                   # You may need to manually set your language environment
ENABLE_CORRECTION= "true"                                  # Uncomment the following line to enable command auto-correction.
COMPLETION_WAITING_DOTS= "true"                            # Uncomment the following line to display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY= "true"                      # Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories much, much faster.


# Set-up local NPM package directory
export NPM_PACKAGES="/home/jbustamante/.npm-packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules${NODE_PATH:+:$NODE_PATH}"
export PATH="$NPM_PACKAGES/bin:$PATH"
# Unset manpath so we can inherit from /etc/manpath via the `manpath`
# command
unset MANPATH  # delete if you already modified MANPATH elsewhere in your config
export MANPATH="$NPM_PACKAGES/share/man:$(manpath)"
