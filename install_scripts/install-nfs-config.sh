#!/bin/sh

if [ -f /etc/exports ]; then
    printf "please create copy of your old config /etc/exports and delete file /etc/exports\n"
    exit 1
fi

if [ ! -d ~/dotfiles ]; then
    printf "please rename your directory of hyprland_dotfiles repository to ~/dotfiles\n"
    exit 1
fi
sudo -E ln -sv ~/dotfiles/nfs/exports /etc/

