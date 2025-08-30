alias reload='source ~/.zshrc'

alias vi="nvim"
alias cl="clear"
alias dc="docker compose"
alias g="git"
alias ga="git add"
alias gc="git commit"
alias gcn="git commit --no-verify"
alias gd="git diff"
alias gignore="git update-index --assume-unchanged"
alias glh="git log -1 --pretty-format:%h"
alias gps="git push"
alias gpl="git pull"
alias gs="g status"
alias tm="tmux"
alias y="yarn"
alias yi="yarn install"
alias co="git checkout"
alias nr="npm run"
alias zj="zellij"
alias xx="exit"

if command -v eza >/dev/null 2>&1; then
  # alias ls='eza --long --git --smart-group'
  alias ls='eza --hyperlink --icons --all'
  alias lst='ls --tree'
else
  alias ls='ls --color=auto'  # or just 'ls'
  alias lst='ls'
fi

# filesystem aliases
alias cd..='cd ..'
alias ..='cd ..'
alias ...='cd ../..'
alias ....="cd ../../.."
alias .....="cd ../../../.."

# ip addresses
alias ip="dig +short myip.opendns.com @resolver1.opendns.com"
alias localip="ipconfig getifaddr en1"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"


alias mkdir="mkdir -p"
alias rmrf="rm -rf"

alias p="ping -i 0.2"
# alias p0="ping -i 0.2 `netstat -nr | grep -m 1 '^default' | awk '{print $2;}'`"
alias pg="p 8.8.8.8"
alias p1="p 192.168.1.1"
alias p2="p 192.168.1.2"
alias p3="p 192.168.1.3"

alias ss="cl && source ~/.zshrc"

alias gpss='git push -u origin HEAD'

