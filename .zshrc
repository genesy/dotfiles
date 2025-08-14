# -- ZINIT INSTALLATION START
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# -- ZINIT INSTALLATION END

# zinit snippet OMZ::plugins/git/git.plugin.zsh
# zinit load zsh-users/zsh-history-substring-search
# zinit ice wait atload'_history_substring_search_config'

zinit light zsh-users/zsh-syntax-highlighting

zinit light zsh-users/zsh-completions
autoload -U compinit && compinit

zinit light zsh-users/zsh-autosuggestions


HISTSIZE=10000
HISTFILE=~/..zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

bindkey "^[[A" history-search-backward
bindkey "^[[B" history-search-forward

# bindkey "\t" autosuggest-accept
bindkey '\t' end-of-line

source ${HOME}/dotfiles/zsh/aliases.zsh

eval "$(starship init zsh)"

