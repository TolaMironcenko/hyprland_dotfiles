
#--- path ---
export PATH=$PATH:~/dotfiles/bin:~/dotfiles/hypr/bin:~/dotfiles/dwm/bin/:~/.cargo/bin
export GTK2_RC_FILES=~/.config/gtk-2.0/gtkrc
#------------

#--- sys ---
alias psa='busybox ps'          # show all processes
alias c='clear'                 # clear terminal screen
alias e='echo'                  # print in terminal
alias s='source'                # source
alias kcat='kitty icat'         # show image in kitty terminal
alias ff='fastfetch'            # system data
alias una='uname -a'            # system name
alias ifcnf='ifconfig'          # ifconfig
#--- pacman ---
alias p='sudo pacman'           # pacman
alias psy='sudo pacman -Sy'     # update repositories
alias psyu='sudo pacman -Syu'   # upgrade system
alias pi='sudo pacman -S'       # install package
alias psc='sudo pacman -Ss'     # search package in repository
alias pqdtq='sudo pacman -Qdtq' # list files without dependencies
alias pq='sudo pacman -Q'       # list installed packages
alias pql='sudo pacman -Ql'     # list files in packages
alias prm='sudo pacman -R'      # delete pacman package
alias prns='sudo pacman -Rns'   # delete pacman package with all dependencies
#--------------
#--- apt ---
alias aptu='sudo apt update'             # update apt repositories
alias apti='sudo apt install -y'         # install apt package
alias aptui='sudo apt upgrade -y'        # upgrade apt packages
alias aptrm='sudo apt remove -y'         # remove apt package
alias aptautorm='sudo apt autoremove -y' # remove apt package with dependencies
#-----------
alias ipr='ip route'            # show routes
alias ipa='ip addr'             # show addresses
alias ipl='ip link'             # show links
alias sctl='systemctl'          # systemctl
alias sctls='systemctl start'   # service start
alias sctlst='systemctl status' # service status
alias sctlp='systemctl stop'    # service stop
alias H='Hyprland'              # start Hyprland
alias sx='startx'               # startx - start xorg
#-----------

#--- git ---
alias g='git'                              # git
alias ga='git add'                         # add unstaged changes
alias gaa='git add --all'                  # add all unstaged changes
alias gb='git branch'                      # create branch
alias gba='git branch --all'               # list all branches
alias gbd='git branch --delete'            # delete branch
alias gbD='git branch --delete --force'    # force delete branch
alias gco='git checkout'                   # checkout to another branch
alias gcb='git checkout -b'                # checkout and create branch
alias gc='git clone'                       # clone from remote repository
alias gcl='git clone --recursive'          # clone recursive with submodules
alias gcam='git commit --all --message'    # commit with commit message
alias gd='git diff'                        # create diff
alias gcf='git config --list'              # show config
alias gf='git fetch'                       # fetch from remote repository
alias ghh='git help'                       # help
alias glgg='git log --graph'               # log with graph
alias glg='git log --stat'                 # log with stat
alias gm='git merge'                       # merge branches
alias gl='git pull'                        # pull from upstream repository
alias gpr='git pull --rebase'              # pull from upstream repository  and rebase local changes
alias gp='git push'                        # push to upstream repository
alias gpo='git push --set-upstream origin' # push to upstream repository and set upstream branch
alias gra='git remote add'                 # add remote repository
alias grrm='git remote remove'             # remove remote repository
alias gstall='git stash --all'             # stash all in repository
alias gstc='git stash clear'               # clear git stash
alias gst='git status'                     # status repository
#-----------

#--- docker ---
alias dpa='docker ps -a'            # list all docker containers
alias dp='docker ps'                # list active docker containers
alias dia='docker images -a'        # list all docker images
alias di='docker images'            # list docker images
alias dcrm='docker container rm'    # remove docker container
alias dirm='docker image rm'        # remove docker image
alias dr='docker run'               # run docker image as container
alias ds='docker start'             # start docker container
alias dst='docker stop'             # stop docker container
alias dspa='docker system prune -a' # delete all docker data
alias dcaq='docker ps -aq'          # stop all containers
#--------------
