#!/bin/sh

setxkbmap "us,ru" -option 'grp:win_space_toggle'
~/dotfiles/dwm/background.sh &
picom -b
dwmbar &
dunst &

xrdb -merge ~/dotfiles/dwm/Xresources

while true; do
    dwm 2> ~/.dwm.log
done

