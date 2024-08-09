#!/bin/sh

export GTK_THEME=Adwaita:dark
setxkbmap "us,ru" -option 'grp:win_space_toggle'
~/dotfiles/dwm/background.sh &
# dwmbar &
# ~/dotfiles/dwm/bin/picom
~/dotfiles/dwm/bin/wttrd &
while [ ! -f /tmp/wttr ]; do
    sleep 1
done
slstatus &
dunst &
~/dotfiles/bin/dpmsdisablexorg

xrdb -merge ~/dotfiles/dwm/Xresources

while true; do
    dwm 2> ~/.dwm.log
done

