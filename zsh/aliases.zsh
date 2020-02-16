alias reload='source ~/.zshrc'

alias vi="nvim"
alias svi="sudo -E nvim"
# alias ls="ls -a"
alias cl="clear"
alias vg="vagrant"
alias vgsh="vagrant ssh"
alias vgup="vagrant up"
alias gpush="git push"
alias gcn="git commit --no-verify"
alias gps="git push"
alias gpl="git pull"
alias gpul="git pull"
alias gpull="git pull"
alias glh="git log -1 --pretty-format:%h"
alias y="yarn"
alias yi="yarn install"
alias yl="yarn link"
alias yul="yarn unlink"
alias g="git"
alias gs="g status"
alias co="git checkout"
alias nr="npm run"
alias to="tmux detach -a"
alias td="tmux detach"
alias tda="tmux detach -a"
alias ta="tmux attach"
# alias chrome="\"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome\" --user-data-dir=~/XChrome &"

chrome () {
  nohup /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --user-data-dir=$HOME/XChrome $* 2>&1 &
}

alias ct="ctags -r --exclude=node_modules --exclude=bower_components --exclude=dist -f ./.ctags ."

# filesystem aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias sd="cd ~/stelladot"

# ip addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"


# flush directory service cache
# alias flush="dscacheutil -flushcache"


# recursively delete `.ds_store` files
alias cleanup="find . -name '*.ds_store' -type f -ls -delete"

alias mkdir="mkdir -p"
alias rmrf="rm -rf"

# empty the trash on all mounted volumes and the main hdd
# alias emptytrash="sudo rm -rfv /volumes/*/.trashes; rm -rfv ~/.trash"

alias p="ping -i 0.2"
alias p0="ping -i 0.2 `netstat -nr | grep -m 1 '^default' | awk '{print $2;}'`"
alias pg="p 8.8.8.8"
# alias pg="postgres -d /usr/local/var/postgres"


alias ss="cl && source ~/.zshrc"

alias if0="sudo ifconfig en0"
alias wpw="webpack --progress --colors --watch"

alias removetag='git push origin :refs/tags/$1'
alias gpt= 'git push && git push --tags'

alias clip='clip.exe'

alias sd='dev $1';

# setsid program-name &>/dev/null
# alias code='setsid /mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe /c "code" &>/dev/null'
# alias code='/mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe /c "code"'
