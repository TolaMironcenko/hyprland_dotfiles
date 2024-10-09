#!/bin/sh

if [ -f /etc/samba/smb.conf ]; then
    printf "please create copy of your old config /etc/samba/smb.conf and delete file /etc/samba/smb.conf\n"
    exit 1
fi

if [ ! -d ~/dotfiles ]; then
    printf "please rename your directory of hyprland_dotfiles repository to ~/dotfiles\n"
    exit 1
fi
sudo -E ln -sv ~/dotfiles/samba/smb.conf /etc/samba/
