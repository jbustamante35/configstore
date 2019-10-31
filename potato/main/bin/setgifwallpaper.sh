#!/bin/bash
# Kill current gifbg.sh
# Start new gifbg.sh with gif in ~/.config/wall.gif

speed="$1"
gifbg="/home/jbustamante/bin/gifbg.sh"
PID=$(ps aux | grep $gifbg | awk '{print $2}')


if [ $PID > 0 ]; then
    kill $PID
fi

$gifbg $speed ~/.config/wall.gif &


