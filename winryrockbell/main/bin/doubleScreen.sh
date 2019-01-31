#!/bin/sh
case $1 in
lab)
	xrandr --output eDP-1-1 --primary --mode 2048x1152 --pos 1920x0 --rotate normal --output HDMI-1-1 --off --output DP-1-1 --off --output DP-1-2 --mode 1920x1080 --pos 0x0 --rotate normal
	;;
home)
	xrandr --output eDP-1-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI-1-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off
	;;
*)
	xrandr --output eDP-1-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output HDMI-1-1 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP-1-1 --off --output DP-1-2 --off
	;;
esac
