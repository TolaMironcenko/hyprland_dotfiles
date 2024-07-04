#!/bin/sh

setxkbmap "us,ru" -option 'grp:win_space_toggle'
~/dotfiles/dwm/background.sh &
picom -b
dunst &

while true; do
    sowm 2> ~/.sowm.log
done

