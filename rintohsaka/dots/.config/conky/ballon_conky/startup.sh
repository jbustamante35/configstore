#!/bin/sh

# attendo il caricamento
 #(CORRECT WITH YOUR PATH!!)
sleep 20

conky -c ~/.config/conky/conkyrc0 &
conky -c ~/.config/conky/conkyrc1 &

exit

