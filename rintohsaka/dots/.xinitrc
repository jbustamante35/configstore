#!/bin/sh
# ~/.xinitrc
# Execute with startx

if [ -d /etc/X11/xinit/xinitrc.d ]; then
	for f in /etc/X11/xinit/xinitrc.d/*; do
		[ -x "$f" ] && . "$f"
	done
	unset f
fi

# Source lightdm display manager
[ -f /etc/xprofile ] && . /etc/xprofile
[ -f ~/.xprofile ]   && . ~/.xprofile


## Statusbar loop
while true ; do
    xsetroot -name "`date '+%Y-%m-%d %H:%M.%S'` `uptime | \
        sed 's/.*,//'`"; sleep 1 ;
done &

# Autostart section
[ -f ~/.Xmodmap ] && xmodmap ~/.Xmodmap
[ -f ~/.cache/wal/colors.Xresources ] && xrdb -load  ~/.cache/wal/colors.Xresources
[ -f ~/.Xresources ]                  && xrdb -merge ~/.Xresources

/home/jbustamante/bin/touchpadctl tap 1
setxkbmap -option "caps:swapescape"
xset r rate 200 50
exec feh --bg-scale ~/.config/wall.png &
/home/jbustamante/bin/dualScreen

#exec startxfce4
exec i3
#exec dwm
