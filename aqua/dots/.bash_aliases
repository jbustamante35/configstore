###########
# ALIASES #
###########

# source main bashrc file
alias sbc='source ~/.bashrc'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

     alias grep='grep --color=auto'
     alias fgrep='fgrep --color=auto'
     alias egrep='egrep --color=auto'
 fi
 
 # colored GCC warnings and errors
 export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
 
 # some more ls aliases
alias ls='ls -N --group-directories-first'
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lsl='ll | less'

# some cd aliases
alias ..='cd ..'

# filesystem aliases
alias ruut='echo /data/data/com.termux/files'
alias lsruut='ls /data/data/com.termux/files'
alias cdruut='cd /data/data/com.termux/files'
alias termux='echo $HOME/storage/shared/Termux'
alias lstermux='ls $HOME/storage/shared/Termux'
alias cdtermux='cd $HOME/storage/shared/Termux'
alias mkdir='mkdir -pv '

# misc system aliases
alias dff='df -Ha'
alias duu='du -ach | sort -h -r'
alias psg='ps auxf | fgrep -v grep | fgrep -ie VSZ -e '
alias myip='curl http://ipecho.net/plain; echo'
alias rm='rm -I'
alias RM='rm -Ird'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|ta
    il -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# alias to vpn to UW Madison
alias sshx_old='ssh -Y jbustamante@128.104.98.13 -p 50013'
alias ssh2sub_old='ssh -Y jbustamante@128.104.98.118 -p 22 -L 50013:128.104.98.13:50013'
alias sshx='ssh -C jdev'
alias sshs='ssh -C submit'
