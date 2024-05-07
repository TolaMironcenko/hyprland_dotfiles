#!/usr/bin/env sh

# ---- colors ----
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
# ----------------

interface=$1
bytes=$2

while true; do
    tx_traffic=$(cat /sys/class/net/${interface}/statistics/tx_bytes)
    rx_traffic=$(cat /sys/class/net/${interface}/statistics/rx_bytes)

    traffic_color=$GREEN
    if [[ $(echo $(($rx_traffic/1024/1024/1024))) > 5 ]]; then
        traffic_color=$YELLOW
    elif [[ $(echo $(($rx_traffic/1024/1024/1024))) > 10 ]]; then
        traffic_color=$RED
    fi

    if [[ $bytes == 'kb' ]] || [[ $bytes == 'Kb' ]]; then
        printf "$BLUE tx traffic$RESET = $(($tx_traffic/1024)) Kb\n"
        printf "$traffic_color rx traffic$RESET = $(($rx_traffic/1024)) Kb\n"
    fi

    if [[ $bytes == 'mb' ]] || [[ $bytes == 'Mb' ]]; then
        printf "$BLUE tx traffic$RESET = $(($tx_traffic/1024/1024)) Mb\n"
        printf "$traffic_color rx traffic$RESET = $(($rx_traffic/1024/1024)) Mb\n"
    fi
    
    if [[ $bytes == 'gb' ]] || [[ $bytes == 'Gb' ]]; then
        if [[ $(echo $(($tx_traffic/1024/1024/1024))) == 0 ]]; then
            printf "$BLUE tx traffic$RESET = $(($tx_traffic/1024/1024)) Mb\n"
        else
            printf "$BLUE tx traffic$RESET = $(($tx_traffic/1024/1024/1024)) Gb\n"
        fi
        if [[ $(echo $(($rx_traffic/1024/1024/1024))) == 0 ]]; then
            printf "$traffic_color rx traffic$RESET = $(($rx_traffic/1024/1024)) Mb\n"
        else
            printf "$traffic_color rx traffic$RESET = $(($rx_traffic/1024/1024/1024)) Gb\n"
        fi
    fi

    if [[ $bytes == 'b' ]] || [[ $bytes == '' ]]; then
        printf "$BLUE tx traffic$RESET = $(($tx_traffic)) b\n"
        printf "$traffic_color rx traffic$RESET = $(($rx_traffic)) b\n"
    fi
    
    sleep 1
done

