#!/bin/sh

while true; do
    BAT=$(acpi -S | cut -d' ' -f4 | sed 's/.$//')

    if [ $BAT -le 9 ]; then
        notify-send "Низкий заряд батареи!!!" -u critical
        sleep 60s
    fi 
    sleep 5s
done &