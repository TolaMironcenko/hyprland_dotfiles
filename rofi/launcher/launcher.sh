#!/bin/sh

dir="~/dotfiles/rofi/launcher"
theme='launchpad'

## Run
rofi \
    -show drun \
    -theme ${dir}/${theme}.rasi
