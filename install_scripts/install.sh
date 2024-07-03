#!/bin/sh

# ---- colors ----
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
# ----------------

# ---------------- cheking system ---------------------------
if [[ $(uname) != "Linux" ]]; then
    printf "$RED This is working only on Linux systems (only Arch Linux)\n$RESET"
    exit 1
fi
# ----------------------------------------------------------

# -------------- ~/.config/hypr ----------------------------
printf "$GREEN installing hyprland configuration...$RESET"
if [ ! -d ~/.config/hypr ]; then
    ln -sv ~/dotfiles/hypr ~/.config/hypr &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -----------------------------------------------------------

# ---------------------- ~/.config/waybar -------------------
printf "$GREEN installing waybar configuration...$RESET"
if [ ! -d ~/.config/waybar ]; then
    ln -sv ~/dotfiles/waybar ~/.config/waybar &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -----------------------------------------------------------

# -------------- ~/.config/mako -----------------------------
printf "$GREEN installing mako configuration...$RESET"
if [ ! -d ~/.config/mako ]; then
    ln -sv ~/dotfiles/mako ~/.config/mako &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -----------------------------------------------------------

# -------------------- /etc/ly/config.ini -------------------
printf "$GREEN installing ly configuration...$RESET"
if [ ! -f /etc/ly/config.ini ]; then
    sudo ln -sv ~/dotfiles/ly/config.ini /etc/ly/config.ini &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -----------------------------------------------------------

# ----------------- ~/.config/cava --------------------------
printf "$GREEN installing cava configuration...$RESET"
if [ ! -d ~/.config/cava ]; then
    ln -sv ~/dotfiles/cava ~/.config/cava &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -----------------------------------------------------------

# --------------- ~/.config/greenclip.toml ------------------
printf "$GREEN installing greenclip configuration...$RESET"
if [ ! -f ~/.config/greenclip.toml ]; then
    ln -sv ~/dotfiles/greenclip/greenclip.toml ~/.config/greenclip.toml &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -----------------------------------------------------------

# ------------------------ ~/.config/alacritty --------------
printf "$GREEN installing alacritty configuration...$RESET"
if [ ! -d ~/.config/alacritty ]; then
    ln -sv ~/dotfiles/alacritty ~/.config/alacritty &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# ------------------------------------------------------------

# -------------------- ~/.vimrc ------------------------------
printf "$GREEN installing vim configuration...$RESET"
if [ ! -f ~/.vimrc ]; then
    ln -sv ~/dotfiles/vimrc ~/.vimrc &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -------------------------------------------------------------

# -------------------- ~/.config/neofetch ------------------------------
printf "$GREEN installing neofetch configuration...$RESET"
if [ ! -d ~/.config/neofetch ]; then
    ln -sv ~/dotfiles/neofetch ~/.config/neofetch &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -------------------------------------------------------------

# -------------------- ~/.config/ranger ------------------------------
printf "$GREEN installing ranger configuration...$RESET"
if [ ! -d ~/.config/ranger ]; then
    ln -sv ~/dotfiles/ranger ~/.config/ranger &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -------------------------------------------------------------

# -------------------- ~/.config/kitty ------------------------------
printf "$GREEN installing kitty configuration...$RESET"
if [ ! -d ~/.config/kitty ]; then
    ln -sv ~/dotfiles/kitty ~/.config/kitty &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -------------------------------------------------------------

# -------------------- ~/.config/rofimoji.rc ------------------------------
printf "$GREEN installing rofimoji configuration...$RESET"
if [ ! -f ~/.config/rofimoji.rc ]; then
    ln -sv ~/dotfiles/rofi/emoji/rofimoji.rc ~/.config/rofimoji.rc &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -------------------------------------------------------------

# -------------------- ~/.config/fastfetch ------------------------------
printf "$GREEN installing fastfetch configuration...$RESET"
if [ ! -d ~/.config/fastfetch ]; then
    ln -sv ~/dotfiles/fastfetch ~/.config/fastfetch &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -------------------------------------------------------------

# ------------------- ~/.config/picom -------------------------
printf "$GREEN installing picom configuration...$RESET"
if [ ! -d ~/.config/picom ]; then
    ln -sv ~/dotfiles/picom ~/.config/picom &> /dev/null
    printf "[$GREEN ok $RESET]\n"
else
    printf "[$YELLOW warn $RESET]\n$YELLOW backup your configuration, delete the folder and try again$RESET\n"
fi
# -------------------------------------------------------------
