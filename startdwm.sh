#!/bin/sh

setxkbmap "us,ru" -option 'grp:win_space_toggle'
dunst &
lxpolkit &

xrdb -merge ~/dotfiles/Xresources

while true; do
	dwm 2> ~/.dwm.log
done
