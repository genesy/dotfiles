" vim:fdm=marker
" auto install Plug


" Use Vim settings, rather then Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible
filetype off                  " required

" === GENERAL CONFIG =============

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
" set foldmethod=syntax
set foldmethod=indent
set cursorline                  "highlight current line

filetype indent on              "load filetype specific indent files

set wildmenu                    " visual autocomplete for command menu
set wildmenu
set wildmode=longest:full,full

set showmatch                   " highlight matching [{()}]

set incsearch                   " search as characters are entered
set hlsearch                    " highlight matches

" This makes vim act like all other editors, buffers can
" exist in the background without being in a window.
" http://items.sjbach.com/319/configuring-vim-right
set hidden

"turn on syntax highlighting
syntax on

set suffixesadd+=.js
set path+=$PWD/node_modules

" === VUNDLE INITIALIZATION  ======================
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/dotfiles/vim/plugins.vim"))
  source ~/dotfiles/vim/plugins.vim
endif


if filereadable(expand("~/dotfiles/vim/mappings.vim"))
  source ~/dotfiles/vim/mappings.vim
endif


if filereadable(expand("~/dotfiles/vim/styles.vim"))
  source ~/dotfiles/vim/styles.vim
endif
" === Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:•
set list          " display whitespace

set shortmess+=A


"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

" disables cursor blinking
set t_vb=

" allows copying to OSX clipboard
set clipboard=unnamed

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/,*/platforms/,*/ios/*,*/android/*

" only have emmet on certain files
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,less EmmetInstall
" autocmd FileType html,css,scss,less imap <TAB> <plug>(emmet-expand-abbr)
autocmd BufEnter * stopinsert

" indent code when entering
let delimitMate_expand_cr=1


if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
endif

let g:EasyMotion_smartcase = 1
let g:diminactive_enable_focus = 1

let g:javascript_conceal_function = "ƒ"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = '<C-l>'
let g:ycm_key_list_previous_completion = '<C-k>'
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

let g:UltiSnipsEditSplit="vertical"

let g:fzf_tags_command = 'ct'

set completeopt-=preview

let g:org_agenda_files = ['~/stelladot/*.org']
let g:AgSmartCase = 1

cmap w!! w !sudo tee % > /dev/null
