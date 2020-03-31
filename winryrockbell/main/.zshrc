###############################################################################
# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*' use-compctl true
zstyle :compinstall filename '/home/jbustamante/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=400000
SAVEHIST=400000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
bindkey -v
# End of lines configured by zsh-newuser-install
###############################################################################

zmodload zsh/zprof

export PROFILE=winryrockbell
export WALEND=haishoku

## Source aliases, functions, and shortcuts
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

# Source aliases, functions, and shortcuts
shrt=~/.scripts/shortcuts.sh
if [ -f $shrt ]; then
    bash $shrt
    source ~/.shortcuts
fi

# Enable zsh-completions
autoload -U compinit && compinit
fpath=($HOME/.zsh/zsh-completions/src $fpath)
source $HOME/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Configure command prompt
source $HOME/.zsh/zsh-git-prompt/zshrc.sh

autoload -U colors && colors
PROMPT="%{$fg[red]%}<< %{$fg[yellow]%}%~%{$fg[red]%} >> "

