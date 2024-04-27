#!/usr/bin/env zsh

theme=~/dotfiles/rofi/clipboard/clipboard.rasi
mode="clipboard:greenclip print"

rofi -modi $mode -show clipboard -run-command '{cmd}' -theme $theme

