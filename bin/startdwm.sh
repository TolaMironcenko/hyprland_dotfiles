#!/bin/sh

~/dotfiles/bin/background.sh &
setxkbmap "us,ru" -option 'grp:win_space_toggle'
dunst &
lxpolkit &
touch /tmp/wttr && slstatus &

xrdb -merge ~/dotfiles/Xresources

while true; do
	dwm 2> ~/.dwm.log &
done
