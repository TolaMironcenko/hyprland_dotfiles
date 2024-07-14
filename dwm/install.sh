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
sudo make clean install &> /dev/null
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
sudo make clean install &> /dev/null
if [ $? -eq 0 ]; then
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$RED err $RESET]\n"
fi
#-------------------------------

#---------- st ------------------
printf "$GREEN installing st terminal...$RESET"
cd ~/dotfiles/dwm/st
sudo make clean install &> /dev/null
if [ $? -eq 0 ]; then
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$RED err $RESET]\n"
fi
#--------------------------------

#---------- surf ------------------
printf "$GREEN installing surf browser...$RESET"
cd ~/dotfiles/dwm/surf
sudo make clean install &> /dev/null
if [ $? -eq 0 ]; then
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$RED err $RESET]\n"
fi
#----------------------------------

