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
alias gs="g s"
alias co="git checkout"
alias yr="yarn run"
alias nr="npm run"
alias to="tmux detach -a"
alias td="tmux detach"
alias tda="tmux detach -a"
alias ta="tmux attach"


alias ct="ctags -R --exclude=node_modules --exclude=bower_components --exclude=dist -f ./.ctags ."

# Filesystem aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias sd="cd ~/stelladot"

# IP addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"


# Flush Directory Service cache
# alias flush="dscacheutil -flushcache"


# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

alias mkdir="mkdir -p"
alias rmrf="rm -rf"

# Empty the Trash on all mounted volumes and the main HDD
# alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

alias reseed="rake db:drop db:create db:migrate db:seed && say \"starting server\" && RAILS_ENV=development foreman start"
alias rserve="RAILS_ENV=development foreman start"
alias redisstart='sudo launchctl start io.redis.redis-server'
alias redisstop='sudo launchctl stop io.redis.redis-server'

alias p="ping -i 0.2"
alias p0="ping -i 0.2 `netstat -nr | grep -m 1 '^default' | awk '{print $2;}'`"
alias p1="p 8.8.8.8"
alias pg="postgres -D /usr/local/var/postgres"


alias da="django-admin"

alias ss="cl && source ~/.zshrc"

alias if0="sudo ifconfig en0"
alias wpw="webpack --progress --colors --watch"

function tag() {
  echo git tag -fa $1 -m $1
}

# FOR WORK
alias gtag='tag;'
alias removetag='git push origin :refs/tags/$1'
alias gpt= 'git push && git push --tags'

alias clip='clip.exe'

function dev() {
  CARD=$1 yarn run dev:start
}

function sdev() {
  BRAND=stelladot CARD=$1 yarn run dev:start
}

alias sd='dev $1';

# setsid program-name &>/dev/null
alias code='setsid /mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe /c "code" &>/dev/null'
# alias code='/mnt/c/Program\ Files/Microsoft\ VS\ Code/Code.exe /c "code"'
