#!/usr/bin/env bash

input=$(cat)

cwd=$(echo "$input" | jq -r '.workspace.current_dir // .cwd // empty')
model=$(echo "$input" | jq -r '.model.display_name // empty')
used=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
vim_mode=$(echo "$input" | jq -r '.vim.mode // empty')

# Shorten the directory path
short_dir=$(echo "$cwd" | sed "s|$HOME|~|")

# Get git branch (skip optional locks)
git_branch=""
if git -C "$cwd" rev-parse --git-dir > /dev/null 2>&1; then
  branch=$(git -C "$cwd" branch --show-current 2>/dev/null)
  if [ -n "$branch" ]; then
    git_branch=" \033[0;35m($branch)\033[0m"
  fi
fi

# Context usage indicator
ctx_info=""
if [ -n "$used" ] && [ "$used" != "null" ]; then
  used_int=${used%.*}
  if [ "$used_int" -ge 80 ]; then
    ctx_color="\033[0;31m"
  elif [ "$used_int" -ge 50 ]; then
    ctx_color="\033[0;33m"
  else
    ctx_color="\033[0;32m"
  fi
  ctx_info=" ${ctx_color}ctx:${used_int}%\033[0m"
fi

# Vim mode indicator
vim_info=""
if [ -n "$vim_mode" ]; then
  if [ "$vim_mode" = "NORMAL" ]; then
    vim_info=" \033[0;34m[NORMAL]\033[0m"
  else
    vim_info=" \033[0;36m[INSERT]\033[0m"
  fi
fi

printf "\033[0;33m%s\033[0m%s \033[0;37m%s\033[0m%s%s" \
  "$short_dir" \
  "$git_branch" \
  "$model" \
  "$ctx_info" \
  "$vim_info"
