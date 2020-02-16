" vim:fdm=marker
" auto install Plug
" ~/dotfiles/nvim/plugins.vim
" ~/dotfiles/nvim/mappings.vim
" ~/dotfiles/nvim/styles.vim

" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

" === GENERAL CONFIG =============

" disables cursor blinking
set t_vb=

set number                      "Show current line number
set relativenumber              "Show relative line numbers
set backspace=indent,eol,start  "Allow backspace in insert mode
set history=1000                "Store lots of :cmdline history
set showcmd                     "Show incomplete cmds down the bottom
set showmode                    "Show current mode down the bottom
set gcr=a:blinkon0              "Disable cursor blink
set visualbell                  "No sounds
set autoread                    "Reload files changed outside vim
set tags=./.ctags

set foldenable                  "enables folding
set foldlevelstart=10           " open most folds by default
set foldmethod=indent
set cursorline                  "highlight current line

filetype indent on              "load filetype specific indent files

set wildmenu                    " visual autocomplete for command menu

set showmatch                   " highlight matching [{()}]

set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

syntax on                       "turn on syntax highlighting

set suffixesadd+=.js            "make gf go to es6 import file path"
set path+=$PWD/node_modules     "include node_modules in path"

if filereadable(expand("~/dotfiles/nvim/plugins.vim"))
  source ~/dotfiles/nvim/plugins.vim
endif

if filereadable(expand("~/dotfiles/nvim/mappings.vim"))
  source ~/dotfiles/nvim/mappings.vim
endif

if filereadable(expand("~/dotfiles/nvim/styles.vim"))
  source ~/dotfiles/nvim/styles.vim
endif

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:•"
set list          " display whitespace

set shortmess+=A

"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set clipboard=unnamed       "allows copying to osx clipboard

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/,*/platforms/,*/ios/*,*/android/*

set completeopt-=preview

cmap w!! w !sudo tee % > /dev/null
