#!/usr/bin/env sh
directory=~/Pictures/wallpaper
monitors=`hyprctl monitors | grep Monitor | awk '{print $2}'`

echo $(ls $directory/*)

while [ true ]; do
    if [ -d "$directory" ]; then
        for monitor in $monitors; do
            random_background=$(ls $directory/* | shuf -n 1)

            hyprctl hyprpaper unload all
            hyprctl hyprpaper preload $random_background
            hyprctl hyprpaper wallpaper "$monitor, $random_background"
            sleep 2
        done
    fi
    sleep 60
done

