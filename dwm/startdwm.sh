#!/bin/sh

setxkbmap "us,ru" -option 'grp:win_space_toggle'
~/dotfiles/dwm/background.sh &
#dwmbar &
slstatus &
dunst &
~/dotfiles/bin/dpmsdisablexorg

xrdb -merge ~/dotfiles/dwm/Xresources

while true; do
    dwm 2> ~/.dwm.log
done

