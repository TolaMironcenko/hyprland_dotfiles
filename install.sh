#!/usr/bin/env sh

# ---- colors ----
RESET='\033[0m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
# ----------------

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
    ln -sv ~/dotfiles/greenclip.toml ~/.config/greenclip.toml &> /dev/null
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
