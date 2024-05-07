# This is my Hyprland dotfiles

## To install all configs you need to create backup your configurations and start
```bash
./install_scripts/install.sh
```
### or
```bash
~/dotfiles/install_scripts/install.sh
```
## Full install commands
```bash
cd ~/
git clone https://github.com/TolaMironcenko/hyprland_dotfiles.git dotfiles
cd ~/dotfiles/install_scripts
./install.sh
```

## Keybinds
| key | doing |
| --- | ----- |
| mainMod | alt |
| mainMod + q | close window |
| mainMod + v | toggle floating window |
| mainMod + return | open terminal (kitty as default) |
| mainMod + d | open rofi launcher |
| mainMod + shift + p | open rofi powermenu |
| mainMod + c | open rofi greenclip |
| mainMod + b | open hyprlock |
| mainMod + shift + c | do screenshot in clipboard |
| mainMod + [1 ... 0] | open workspase [1 ... 10] |
| mainMod + x | open xpad |
| mainMod + shift + x | open new note in xpad |
| mainMod + a | open telegram-desktop |
| mainMod + g | open google-chrome-stable |

## To install system (Arch Linux) you can change file install_scripts/install-arch.sh
### and start
```bash
./install-arch.sh
```
