###########
# ALIASES #
###########

# source main bashrc file
alias sbc='. ~/.bashrc'

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
alias ll='ls -alFh'
alias la='ls -A'
alias l='ls -CF'
alias lsl='ll | less'

# some cd aliases
alias ..='cd ..'
alias data='cd /home/jbustamante/LabData'
alias software='cd /home/jbustamante/Software'
alias hyp='cd ~/LabData/HypoQuantyl/'

# filesystem aliases
alias mkdir='mkdir -pv '
alias df='pydf -h '
alias naut='nautilus .'
alias natu='nautilus .'
alias mnt='mount | column -t'

# disk check aliases
alias ds="sudo du -h | sort -hr | head -150"
alias duA='sudo du -ah /home | sort -nr | head -n 20'

# misc system aliases
alias dff='df -hag'
alias duu='du -ach | sort -h -r'
alias psg='ps auxf | fgrep -v grep | fgrep -ie VSZ -e '
alias myip='curl http://ipecho.net/plain; echo'
alias svim='sudo vim '
alias rm='rm -I'
alias RM='sudo rm -Ird'

# other aliases
alias ranger='python ~/Misc/ranger/ranger.py'
alias shutr="shutter -f -e -o '/home/jbustamante/Pictures/Screenshots/%y%m%d_\$wx\$h_\$nb_name.png'"
alias term='export TERM=xterm-256color'
alias medit='matlab -nodesktop -nosplash -nodisplay'
alias mconsole='matlab -nodesktop -nosplash'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|ta
    il -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# set editor and pkg-config path
export EDITOR='vim'
#export PKG_CONFIG_PATH='/usr/local/lib/x86_64-linux-gnu/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig:/usr/lib/x86_64-linux-gnu/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/home/jbustamante/anaconda3/lib/pkgconfig'

# shortcuts for starting my terminals
alias hal="gnome-terminal --profile='HAL9000'"
alias marv="gnome-terminal --profile='Marvin the Paranoid Android'"
alias ava="gnome-terminal --profile='AVA'"

