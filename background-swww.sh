#!/bin/sh
directory=~/Pictures/hyprpaper
monitors=`hyprctl monitors | grep Monitor | awk '{print $2}'`

while [ true ]; do
    if [ -d "$directory" ]; then
        for monitor in $monitors; do
            random_background=$(ls $directory/* | shuf -n 1)
            
            extention="${random_background##*.}"
            echo $extention
            if [[ "$extention" == "jpg" ]]; then
                swww img -o $monitor $random_background --transition-type random
            elif [[ "$extention" == "mp4" ]]; then
                mpvpaper $monitor $random_background
            fi
        done
    fi
    sleep 30
done

#swww img -o VGA-1 /home/tola/Pictures/hyprpaper/calder-moore-aliencrack-01-copy.jpg --transition-type wipe
