
export PATH=$PATH:~/dotfiles/bin:~/dotfiles/hypr/bin:~/dotfiles/dwm/bin/:~/.cargo/bin

#--- sys ---
alias psa='busybox ps'          # show all processes
alias c='clear'                 # clear terminal screen
alias e='echo'                  # print in terminal
alias s='source'                # source
alias kcat='kitty icat'         # show image in kitty terminal
alias ff='fastfetch'            # system data
alias una='uname -a'            # system name
alias ifcnf='ifconfig'          # ifconfig
alias p='sudo pacman'           # pacman
alias psy='sudo pacman -Sy'     # update repositories
alias psyu='sudo pacman -Syu'   # upgrade system
alias pi='sudo pacman -S'       # install package
alias psc='sudo pacman -Ss'     # search package in repository
alias ipr='ip route'            # show routes
alias ipa='ip addr'             # show addresses
alias ipl='ip link'             # show links
alias sctl='systemctl'          # systemctl
alias sctls='systemctl start'   # service start
alias sctlst='systemctl status' # service status
alias sctlp='systemctl stop'    # service stop
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
