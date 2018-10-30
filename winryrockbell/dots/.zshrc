# TODO [ write some documentation here ]
#  And maybe a corny ascii art symbol

export PROFILE=winryrockbell # Set profile for device
export ZSH="/home/jbustamante/.oh-my-zsh" # Path to your oh-my-zsh installation.
# export PATH=$HOME/bin:/usr/local/bin:$PATH # If you come from bash you might have to change your $PATH.

# Set name of the theme to load
ZSH_THEME="half-life"
#ZSH_THEME="powerlevel9k/powerlevel9k"

# Which plugins would you like to load? Add wisely, as too many plugins slow down shell startup.
plugins=(
    zsh-autosuggestions
    git
    git-extras
    git-prompt
    extract
    web-search
    vagrant
    cp
    vi-mode
    colorize
    sublime
    rsync 
)

source $ZSH/oh-my-zsh.sh

# Aliases
#als=~/.zsh_aliases
als=~/.aliases
if [ -f ${als} ]; then
    . ${als}
fi

# Functions
#funcs=~/.zsh_functions
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

# Powerlevel9k configurations
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND=’red’
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir rbenv vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX="%f"

# Visual customisation of the second prompt line
local user_symbol="$"
if [[ $(print -P "%#") =~ "#" ]]; then
    user_symbol = "#"
fi
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="%{%B%F{black}%K{yellow}%} $user_symbol%{%b%f%k%F{yellow}%} %{%f%}"


# source additional configs
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
export PATH="/home/jbustamante/anaconda3/bin:$PATH"
export SSH_KEY_PATH="~/.ssh/rsa_id"
source ~/.shortcuts
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#ZSH_THEME_RANDOM_CANDIDATES= ( "robbyrussell" "agnoster" ) # Set list of themes to pick from when loading at random
#CASE_SENSITIVE= "true"                                     # Uncomment the following line to use case-sensitive completion.
#HYPHEN_INSENSITIVE= "true"                                 # Uncomment the following line to use hyphen-insensitive completion. Case-sensitive completion must be off. _ and - will be interchangeable.
#DISABLE_AUTO_UPDATE= "true"                                # Uncomment the following line to disable bi-weekly auto-update checks.
#export UPDATE_ZSH_DAYS= 13                                 # Uncomment the following line to change how often to auto-update (in days).
#DISABLE_LS_COLORS= "true"                                  # Uncomment the following line to disable colors in ls.
#DISABLE_AUTO_TITLE= "true"                                 # Uncomment the following line to disable auto-setting terminal title.
#HIST_STAMPS= "mm/dd/yyyy"                                  # Uncomment the following line if you want to change the command execution time stamp shown in the history command output.
#ZSH_CUSTOM= /path/to/new-custom-folder                     # Would you like to use another custom folder than $ZSH/custom?
#export MANPATH= "/usr/local/man:$MANPATH"                  # User configuration
#export LANG= en_US.UTF-8                                   # You may need to manually set your language environment
#export ARCHFLAGS= "-arch x86_64"                           # Compilation flags
ENABLE_CORRECTION= "true"                                  # Uncomment the following line to enable command auto-correction.
COMPLETION_WAITING_DOTS= "true"                            # Uncomment the following line to display red dots whilst waiting for completion.
DISABLE_UNTRACKED_FILES_DIRTY= "true"                      # Uncomment the following line if you want to disable marking untracked files under VCS as dirty. This makes repository status check for large repositories much, much faster.

# Preferred editor for local and remote sessions
#if [[ -n $SSH_CONNECTION ]]; then
#  export EDITOR='vim'
#else
#  export EDITOR='mvim'
#fi



