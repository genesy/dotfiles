set nocompatible
filetype off                  " required

" === GENERAL CONFIG =============

if exists('*GuiClipboard')
  :call GuiClipboard()
endif


" disables cursor blinking
if !exists('g:vscode')
  :autocmd InsertEnter * set cul
  :autocmd InsertLeave * set nocul
  set scrolloff=10                "Keeps cursor a few lines
  set t_vb=                       "Disable beeping"
  set number                      "Show current line number
  set relativenumber              "Show relative line numbers
  set backspace=indent,eol,start  "Allow backspace in insert mode
  set history=1000                "Store lots of :cmdline history
  set showcmd                     "Show incomplete cmds down the bottom
  set showmode                    "Show current mode down the bottom
  set visualbell                  "No sounds
  set autoread                    "Reload files changed outside vim

  set foldenable                  "enables folding
  set foldlevelstart=10           " open most folds by default
  set foldmethod=indent
  " set cursorline                  "highlight current line

  filetype indent on              "load filetype specific indent files

  set wildmenu                    " visual autocomplete for command menu

  set showmatch                   " highlight matching [{()}]

  set incsearch                   " search as characters are entered
  set hlsearch                    " highlight matches

  " This makes vim act like all other editors, buffers can
  " exist in the background without being in a window.
  " http://items.sjbach.com/319/configuring-vim-right
  set hidden

endif

set suffixesadd+=.js            "make gf go to es6 import file path"
set suffixesadd+=.ts
set suffixesadd+=.jsx
set suffixesadd+=.tsx

if has('unix')
  source ~/dotfiles/nvim/plugins.vim
  source ~/dotfiles/nvim/mappings.vim
  source ~/dotfiles/nvim/cocsettings.vim
  set path+=$PWD/node_modules     "include node_modules in path"
elseif has('win32')
  source $USERPROFILE\dotfiles\nvim\plugins.vim
  source $USERPROFILE\dotfiles\nvim\mappings.vim
  source $USERPROFILE\dotfiles\nvim\cocsettings.vim
  execute 'set path+=' . getcwd() . '\\**\\*'
endif

set ignorecase
set smartcase
if exists('g:vscode')
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

else
  set guicursor=a:blinkon100

endif
"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

set clipboard=unnamed       "allows copying to osx clipboard

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/,*/platforms/,*/ios/*,*/android/*

set completeopt-=preview

"cmap w!! w !sudo tee % > /dev/null

"" Stylings
syntax enable
set background=dark
set termguicolors
colorscheme base16-material-darker
" colorscheme material

" let g:material_theme_style = 'darker'
" let g:material_theme_style = 'default' | 'palenight' | 'ocean' | 'lighter' | 'darker'
let g:enable_bold_font = 1
filetype plugin indent on

" Check if NERDTree is open or active
" function! IsNERDTreeOpen()        
"   return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
" endfunction

" " Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" " file, and we're not in vimdiff
" function! SyncTree()
"   if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
"     NERDTreeFind
"     wincmd p
"   endif
" endfunction

" " Highlight currently open buffer in NERDTree
" autocmd BufEnter * call SyncTree()
