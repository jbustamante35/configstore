#!/bin/bash

xrdb -load ~/.cache/wal/colors.Xresources;
sleep 1;
xrdb -merge ~/.Xresources;

