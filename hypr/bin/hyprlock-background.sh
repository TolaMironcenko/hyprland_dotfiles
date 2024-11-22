#!/bin/sh

background=$(ls ~/Pictures/wallpaper/*.png | shuf -n 1)
sed -i "s|.*Pictures.*|\tpath = $background|" ../hyprlock.conf
sleep 1
hyprlock
