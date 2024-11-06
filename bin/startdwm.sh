#!/bin/sh

export GTK_THEME=Adwaita:dark
export GTK2_RC_FILES=/usr/share/themes/Adwaita-dark/gtk-2.0/gtkrc
gsettings set org.gnome.desktop.interface gtk-theme Adwaita-dark
gsettings set org.gnome.desktop.interface icon-theme Papirus-Dark
~/dotfiles/bin/background.sh &
setxkbmap "us,ru" -option 'grp:win_space_toggle'
dunst &
lxpolkit &
touch /tmp/wttr && slstatus &

xrdb -merge ~/dotfiles/Xresources

while true; do
	dwm 2> ~/.dwm.log &
done
