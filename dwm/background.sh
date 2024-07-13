#!/bin/sh

directory=~/Pictures/wallpaper

while true; do
    if [ -d "$directory" ]; then
        random_background=$(ls $directory/* | shuf -n 1)

        feh --bg-fill $random_background
    fi
    sleep 60
done

