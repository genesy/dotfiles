alias reload!='source ~/.zshrc'

alias cl="clear"
alias vi="nvim"
alias vim="nvim"
alias vg="vagrant"
alias vgsh="vagrant ssh"

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


alias is="ionic serve"
alias ira="ionic run android && say \"done\" -v good"
alias reseed="rake db:drop db:create db:migrate db:seed && say \"starting server\" && RAILS_ENV=development foreman start"
alias rserve="RAILS_ENV=development foreman start"
alias redisstart='sudo launchctl start io.redis.redis-server'
alias redisstop='sudo launchctl stop io.redis.redis-server'

alias p="ping -i 0.2"
alias p0="ping -i 0.2 `netstat -nr | grep -m 1 '^default' | awk '{print $2;}'`"
alias p1="p 8.8.8.8"
alias pg="postgres -D /usr/local/var/postgres"

alias g="git"
alias co="git checkout"

alias da="django-admin"

alias ss="source ~/.zshrc"

alias if0="sudo ifconfig en0"
alias wpw="webpack --progress --colors --watch"
