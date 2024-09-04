#!/bin/sh

. ~/dotfiles/hypr/bin/colors.sh

kitty -e /bin/sh -c "printf '$BLUE==>$UGREEN Starting update system packages $BLUE<==$RESET\n'; sudo pacman -Syu; printf '$BLUE==>$UGREEN Successfull $BLUE<==$RESET\n';sleep 10;"
