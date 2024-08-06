#!/bin/sh

export GTK_THEME=Adwaita:dark
setxkbmap "us,ru" -option 'grp:win_space_toggle'
~/dotfiles/dwm/background.sh &
#dwmbar &
slstatus &
dunst &
~/dotfiles/bin/dpmsdisablexorg
~/dotfiles/dwm/slstatus/components/wttr.sh

xrdb -merge ~/dotfiles/dwm/Xresources

while true; do
    dwm 2> ~/.dwm.log
done

