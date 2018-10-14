###########
# ALIASES #
###########

# source main bashrc file
alias sbc='source ~/.bashrc'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls -N --color=auto --group-directories-first'
    alias dir='dir --color=auto'
    alias vdir='vdir --color=auto'

     alias grep='grep --color=auto'
     alias fgrep='fgrep --color=auto'
     alias egrep='egrep --color=auto'
 fi

 # colored GCC warnings and errors
 export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

 # some more ls aliases
alias ls='ls -N --color=auto --group-directories-first'
alias ll='ls -alFh --group-directories-first'
alias la='ls -A --group-directories-first'
alias l='ls -CF --group-directories-first'
alias lsl='ll --group-directories-first | less'

# some cd aliases
alias ..='cd ..'
alias cdcl='cd /home/jbustamante/Dropbox/Classes/UW\ Madison/Academics/CMB'
alias cdes='cd /home/jbustamante/Dropbox/EdgarSpalding/Software'

# filesystem aliases
alias mkdir='mkdir -pv '
alias df='pydf -h '
alias nem='nautilus .'
alias mnt='mount | column -t'
alias app='sudo aptitude '

# more filesystem aliases
alias dff='df -gha'
alias duu='sudo du -ach | sort -h -r | head -$1'
alias psg='ps auxf | fgrep -v grep | fgrep -ie VSZ -e '
alias myip='curl http://ipecho.net/plain; echo'
alias svim='sudo vim '
alias rm='rm -I'
alias RM='sudo rm -Ird'

# misc aliases
alias shutr="shutter -f -e -o '/home/jbustamante/Pictures/Screenshots/%y%m%d_\$wx\$h_\$nb_name.png'"
alias matlab='matlab -nosplash'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|ta
    il -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# alias to remote to UW Madison
alias vpn2me='globalprotect connect -p uwmadison.vpn.wisc.edu -u jbustamante'
alias vnc2me='vncviewer localhost:590$1'
alias sshx_old='ssh -YC jbustamante@128.104.98.13 -p 50013'
alias sshs_old='ssh -YC -p 22 -L 50013:128.104.98.13:50013 jbustamante@128.104.98.118'
alias sshx='ssh -C jdev'
alias sshs='ssh -C submit'

