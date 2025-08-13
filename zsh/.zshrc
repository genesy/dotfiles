# -- ZINIT INSTALLATION START
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
# -- ZINIT INSTALLATION END

# --- History size & behavior ---
HISTSIZE=100000          # in‑memory history
SAVEHIST=100000          # saved to file
HISTFILE=~/.zsh_history

setopt INC_APPEND_HISTORY       # write new commands to $HISTFILE as you run them
setopt SHARE_HISTORY            # share history across sessions
setopt HIST_IGNORE_DUPS         # don't record an entry if it's a duplicate of the last
setopt HIST_FIND_NO_DUPS        # when searching, skip duplicates in results
setopt HIST_REDUCE_BLANKS       # trim extra spaces
setopt HIST_IGNORE_SPACE        # commands starting with a space won't be saved
setopt HIST_VERIFY              # don't execute immediately when expanded from history

# Arrow keys
bindkey '^[[A' history-beginning-search-backward  # Up
bindkey '^[[B' history-beginning-search-forward   # Down

# Optional: also map Ctrl+P / Ctrl+N
bindkey '^P' history-beginning-search-backward
bindkey '^N' history-beginning-search-forward

source ${HOME}/dotfiles/zsh/aliases.zsh

eval "$(starship init zsh)"

