#!/bin/sh

setxkbmap "us,ru" -option 'grp:win_space_toggle'
feh --bg-fill ~/Pictures/hyprpaper/images/beautiful-nature-landscape-with-mountains-lake.png
picom -b
dwmbar

while true; do
    dwm 2> ~/.dwm.log
done

