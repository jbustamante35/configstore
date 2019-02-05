# Set profile for this device
export PROFILE=archer

# Load shortcuts and aliases
als=~/.aliases
if [ -f ${als} ]; then
	source ${als}
fi

fnc=~/.functions
if [ -f ${fnc} ]; then
	source ${fnc}
fi

shr=~/.scripts/shortcuts.zsh
if [ -f ${shr} ]; then
	. ${shr}
	source ~/.shortcuts
fi

# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]} l:|=* r:|=*' 'r:|[._-]=** r:|=**'
zstyle :compinstall filename '/home/jbustamante/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
setopt appendhistory autocd extendedglob nomatch notify
unsetopt beep
# End of lines configured by zsh-newuser-install
