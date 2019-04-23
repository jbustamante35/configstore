# vim: filetype=fish
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

# filesystem abbres
abbr mkdir 'mkdir -pv '
abbr df 'pydf -h '
abbr thn 'thunar .'
abbr tha 'thunar .'
abbr mnt 'mount | column -t'
abbr pin 'sudo pacman -S'
abbr psr 'pacman -Ss'
abbr prm 'sudo pacman -Rsu'
abbr yin 'yay -S'
abbr ysr 'yay -Ss'
abbr yrm 'yay -Rsu'
abbr ain 'yaourt -S'
abbr asr 'yaourt -Ss'
abbr arm 'yaourt -Rsu'

# misc system abbres
abbr dff 'pydf -gha'
abbr duu 'sudo du -hs ; and sudo du -ah | sort -r | head -$1'
abbr psg 'ps auxf | fgrep -v grep | fgrep -ie VSZ -e '
abbr myip 'curl http://ipecho.net/plain; echo'
abbr db 'sudo updatedb'
abbr rm 'rm -I'
abbr RM 'sudo rm -Ird'
abbr kl 'RM (pwd)/*/.git'
abbr kll 'RM (pwd)/*/*/.git'
abbr klll 'RM (pwd)/*/*/*/.git'

# misc abbres
abbr vim 'nvim'
abbr svim 'sudo vim'
abbr sl 'sl -e'
abbr wf 'sudo wifi-menu'
abbr bt 'bluetoothctl'
abbr pping 'prettyping'
abbr shutr "shutter -f -e -o '/home/jbustamante/Pictures/screenshots/%y%m%d_\$wx\$h_\$nb_name.png'"
abbr term 'set -x TERM xterm-256color'
abbr bat 'bat --color=auto'
abbr zt 'zathura'
abbr prnt 'xdg-open http://localhost:631/admin'
abbr rtv 'rtv --enable-media'
abbr wali '/home/jbustamante/.local/bin/wal -i ~/.config/wall.png --saturate 0.6'

# Add an "alert" abbr for long running commands.  Use like so:
#   sleep 10; alert
abbr alert 'notify-send --urgency low -i "$([ $?   0 ] ; and echo terminal ; or echo error)" "$(history|ta
    il -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# abbres to vpn to UW Madison
abbr vnc2me 'vncviewer localhost:5901'

# abbres to ssh with  X11 port forwarding
abbr sshs 'ssh sub'
abbr sshj 'ssh jdev'
abbr vpnj 'sudo openconnect --protocol=gp uwmadison.vpn.wisc.edu -u jbustamante -b'
abbr ssh2me 'ssh -C -p 50013 jbustamante@128.104.98.13 -L 5902:localhost:5902'
abbr ssh2off 'ssh -YC -p 50118 -L 50013:128.104.98.13:50013 jbustamante@128.104.98.118'
abbr ssh2off2 'ssh -YC -p 22 -L 50013:128.104.98.13:50013 jbustamante@128.104.98.118'
abbr sshx 'ssh jdev'
abbr sshy 'ssh -XC jdev'
abbr ssh2sub 'ssh sub'

# VimWiki aliases
abbr jrnl 'vim ~/Documents/jbwiki/journal.wiki/index.wiki'
abbr labn 'vim ~/Documents/jbwiki/labnotes.wiki/index.wiki'
abbr ojrnl 'xdg-open ~/Documents/jbwiki/journal.wiki_html/index.html'
abbr olabn 'xdg-open ~/Documents/jbwiki/labnotes.wiki_html/index.html'

# dwm aliases
abbr rst 'sudo make clean install -C ~/Documents/suckless/dwm-6.1'

# Neomutt aliases
abbr gmdl 'offlineimap -a gmailjb'
abbr gma 'neomutt -f ~/.mail/gmailjb/[Gmail].All\ Mail/'
abbr gmi 'neomutt -f ~/.mail/gmailjb/[Gmail].Important/'
abbr gmd 'neomutt -f ~/.mail/gmailjb/[Gmail].Drafts/'
abbr gms 'neomutt -f ~/.mail/gmailjb/[Gmail].Sent\ Mail/'
abbr wmdl 'offlineimap -a wiscjb'
abbr wma 'neomutt -f ~/.mail/wiscjb/INBOX/'
abbr wmd 'neomutt -f ~/.mail/wiscjb/Drafts/'
abbr wms 'neomutt -f ~/.mail/wiscjb/Sent\ Items/'


