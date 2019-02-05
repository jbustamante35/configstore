###########
# abbrES #
###########

# source main bashrc and zshrc files
abbr sfc 'source ~/.fishrc'

# colored GCC warnings and errors
set -x GCC_COLORS 'error 01;31:warning 01;35:note 01;36:caret 01;32:locus 01:quote 01'

# some more ls abbres
abbr ls 'ls -N --color=auto --group-directories-first'
abbr ll 'ls -alFh'
abbr la 'ls -A'
abbr l 'ls -CF'
abbr lsl 'll | less'

# some cd abbres
abbr .. 'cd ..'
abbr cdcl 'cd /home/jbustamante/Dropbox/Classes/UW\ Madison/Academics/CMB'
abbr cdes 'cd /home/jbustamante/Dropbox/EdgarSpalding/Software'
abbr cdra 'cd /home/jbustamante/Dropbox/ResearchArticles'

# filesystem abbres
abbr mkdir 'mkdir -pv '
abbr df 'pydf -h '
abbr naut 'nautilus .'
abbr natu 'nautilus .'
abbr mnt 'mount | column -t'
abbr pping 'prettyping '
abbr app 'sudo dnf'

# misc system abbres
abbr dff 'pydf -gha'
abbr duu 'sudo du -hs ; and sudo du -ah | sort -r | head -$1'
abbr psg 'ps auxf | fgrep -v grep | fgrep -ie VSZ -e '
abbr myip 'curl http://ipecho.net/plain; echo'
abbr rm 'rm -I'
abbr RM 'sudo rm -Ird'

# Add an "alert" abbr for long running commands.  Use like so:
#   sleep 10; alert
abbr alert 'notify-send --urgency low -i "$([ $?   0 ] ; and echo terminal ; or echo error)" "$(history|ta
    il -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'


# abbres to vpn to UW Madison
abbr vpn2me 'globalprotect connect -p uwmadison.vpn.wisc.edu --username jbustamante'
abbr vnc2me 'vncviewer localhost:5902'

# abbres to ssh with  X11 port forwarding
abbr ssh2me 'ssh -C -p 50013 jbustamante@128.104.98.13 -L 5902:localhost:5902'
abbr ssh2off 'ssh -YC -p 50118 -L 50013:128.104.98.13:50013 jbustamante@128.104.98.118'
abbr ssh2off2 'ssh -YC -p 22 -L 50013:128.104.98.13:50013 jbustamante@128.104.98.118'
abbr sshx 'ssh jdev'
abbr sshy 'ssh -XC jdev'
abbr ssh2sub 'ssh submit'

# misc abbres
abbr vim 'nvim'
abbr svim 'sudo vim'
abbr shutr "shutter -f -e -o '/home/jbustamante/Pictures/screenshots/%y%m%d_\$wx\$h_\$nb_name.png'"
abbr term 'set -x TERM xterm-256color'
abbr bat 'bat --color=auto'

