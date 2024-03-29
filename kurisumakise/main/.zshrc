###############################################################################
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/jbustamante/.zshrc'

#autoload -Uz compinit
#compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
export HISTFILE="$HOME/.histfile"
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt appendhistory autocd extendedglob nomatch notify incappendhistory sharehistory extendedhistory
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
###############################################################################

export PROFILE=kurisumakise

# Source aliases, functions, and shortcuts
als=~/.aliases
if [ -f $als ]; then
    source $als
fi

fncs=~/.functions
if [ -f $fncs ]; then
    source $fncs
fi

envs=~/.envs
if [ -f $envs ]; then
    source $envs
fi

shrt=~/.scripts/shortcuts.sh
if [ -f $shrt ]; then
    bash $shrt
    source ~/.shortcuts
fi

# Enable zsh-completions
autoload -U compinit && compinit
fpath=($HOME/.zsh/zsh-completions/src $fpath)
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Configure command prompt
source $HOME/.zsh/zsh-git-prompt/zshrc.sh

autoload -U colors && colors
#PROMPT="%{$fg[red]%}[ %{$fg[yellow]%}%~%{$fg[red]%} ] "
PROMPT="%{$fg[red]%}[ %{$fg[yellow]%}%~%{$fg[red]%} ] "

