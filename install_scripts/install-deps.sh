#!/usr/bin/env sh

# ---- colors ----
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
# ----------------

# ------------ cheking system ------------------------------
if [[ $(uname) != "Linux" ]]; then
    printf "$RED This is working only on Linux systems (only Arch Linux)\n$RESET"
    exit 1
fi
# ----------------------------------------------------------

# ---------------- upgrading system ------------------------
printf "$GREEN upgrading system...\n$RESET"
sudo pacman -Syu
if [ $? ]; then 
    printf "$GREEN upgrading system success $RESET[$GREEN ok $RESET]\n"
else
    printf "$RED upgrading system not success $RESET[$RED err $RESET]\n"
    exit 1
fi
# -----------------------------------------------------------

# -------------------- installing deps ----------------------------
printf "$GREEN installing deps... (vim, rofi-wayland, hyprland, waybar, ly, mako, neofetch, ranger, kitty, alacritty, hyprpaper rofimoji)\n$RESET"
sudo pacman -S vim rofi-wayland rofimoji hyprland hyprpaper waybar ly mako neofetch ranger kitty alacritty
if [ $? ]; then 
    printf "$GREEN installing deps success $RESET[$GREEN ok $RESET]\n"
else
    printf "$RED installing deps not success $RESET[$RED err $RESET]\n"
    exit 1
fi
# ------------------------------------------------------------------

# -------------- installing paru ---------------
printf "$GREEN installing paru...\n$RESET"
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
if [ $? ]; then 
    printf "$GREEN installing paru success $RESET[$GREEN ok $RESET]\n"
else
    printf "$RED installing paru not success $RESET[$RED err $RESET]\n"
    exit 1
fi
# ----------------------------------------------

# ---------------------- installing deps from AUR ------------------------
printf "$GREEN installing deps from AUR... (rofi-greenclip, hyprlock)\n$RESET"
paru -S rofi-greenclip hyprlock
if [ $? ]; then 
    printf "$GREEN installing deps from AUR success $RESET[$GREEN ok $RESET]\n"
else
    printf "$RED installing deps from AUR not success $RESET[$RED err $RESET]\n"
    exit 1
fi
# ------------------------------------------------------------------------

