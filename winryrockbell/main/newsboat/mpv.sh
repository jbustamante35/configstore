#!/bin/sh


####!/usr/bin/env bash
# TODO: consider <https://i3wm.org/docs/userguide.html#no_focus>.

screen -X screen -t "mpv $1" bash -c 'mpv --keep-open -- '\'"$1"\'' || read' &&
# The previous command switched to the newly created window.  Undo that.
screen -X other

# Using tmux
#tmux a -t mpv "mpv $1" zsh -c 'mpv --keep-open -- '\'"$1"\'' || read' &&
# The previous command switched to the newly created window.  Undo that.
#tmux a -t main

# My simpleton way
#urxvtc -e "mpv $1"

#notify-send "Test Newsboat" "This script ran"
