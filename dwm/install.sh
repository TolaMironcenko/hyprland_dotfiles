#!/bin/sh

# ---- colors ----
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
# ----------------

# -------- dwm ---------
printf "$GREEN installing dwm...$RESET"
cd ~/dotfiles/dwm/dwm
make &> /dev/null
sudo make install &> /dev/null
if [ $? -eq 0 ]; then
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$RED err $RESET]\n"
fi
# ----------------------

# ------- dwmbar -------
printf "$GREEN installing dwmbar...$RESET"
cd ~/dotfiles/dwm/dwmbar
sudo ./install.sh &> /dev/null
if [ $? -eq 0 ]; then
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$RED err $RESET]\n"
fi
# ----------------------

#--------- slstatus ------------
printf "$GREEN installing slstatus...$RESET"
cd ~/dotfiles/dwm/slstatus
sudo make install &> /dev/null
if [ $? -eq 0 ]; then
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$RED err $RESET]\n"
fi
#-------------------------------

