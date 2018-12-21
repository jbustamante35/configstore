# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load
ZSH_THEME="norm"

# Source aliases, functions, and shortcuts
als=~/.aliases
if [ -f $als ]; then
    source $als
fi

fncs=~/.functions
if [ -f $fncs ]; then
    source $fncs
fi

shrt=~/.scripts/shortcuts.sh
if [ -f $shrt ]; then
    bash $shrt
    source ~/.shortcuts
fi

# Which plugins would you like to load?
plugins=(
    git
    zsh-completions
    vagrant
)

source $ZSH/oh-my-zsh.sh

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=7

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Enable zsh-autocompletions
autoload -U compinit && compinit
source ~/.oh-my-zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

