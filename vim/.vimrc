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
set foldmethod=syntax
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

"turn on syntax highlighting
syntax on

let mapleader = "\<Space>"

set suffixesadd+=.js
set path+=$PWD/node_modules

" === VUNDLE INITIALIZATION  ======================
" This loads all the plugins specified in ~/.vim/vundles.vim
" Use Vundle plugin to manage all other plugins
if filereadable(expand("~/dotfiles/vim/plugins.vim"))
  source ~/dotfiles/vim/plugins.vim
endif

" === Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.

if has('persistent_undo') && !isdirectory(expand('~').'/.vim/backups')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif

" === Indentation ======================

set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,spaces:␣

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<,space:•
set list          " display whitespace


set shortmess+=A

syntax enable
set background=dark
colorscheme hybrid_reverse

let g:enable_bold_font = 1

"NeoVim handles ESC keys as alt+key, set this to solve the problem
if has('nvim')
  set ttimeout
  set ttimeoutlen=0
endif

" disables cursor blinking
set t_vb=

" allows copying to OSX clipboard
set clipboard=unnamed

set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/.DS_Store,*/vendor,*/node_modules/,*/platforms/

" only have emmet on certain files
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,less EmmetInstall
" autocmd FileType html,css,scss,less imap <TAB> <plug>(emmet-expand-abbr)
autocmd BufEnter * stopinsert

" TODO: find out why this doesn't work. 
" let g:user_emmet_settings = webapi#json#decode(join(readfile(expand('~/dotfiles/emmet/emmet_snippets.json')), "\n"))

" autocmd FileType html,css,scss echo 'yep'
" autocmd FileType html,css,scss let g:user_emmet_expandabbr_key = '<tab>' 



" "=== CtrlP settings ===========
" let g:ctrlp_match_window = 'bottom,ord:her:ttb'
" let g:ctrlp_switch_buffer = 0
" let g:ctrlp_working_path_mode = 0
" ctrp_user_command makes ctrlp_custom_ignore and ctrlp_show_hidden not work.
" use .agignore instead
" let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
" let g:ctrlp_use_caching = 0


" indent code when entering
let delimitMate_expand_cr=1

" fix for bug when enter doesnt indent
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor

  " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
" else
  " let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  " let g:ctrlp_prompt_mappings = {
  "   \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
  "   \ }
endif


let g:airline_theme='powerlineish'
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline_section_z=''
let g:airline#extensions#tabline#enabled = 1

" [CtrlK + B] opens sidebar
noremap <C-k>b :NERDTreeToggle<CR>
nnoremap <Leader>1 :NERDTreeToggle<CR>

nnoremap <Leader>w :w<CR>

" nnoremap <Leader>e :CtrlPBuffer<CR>
nnoremap <Leader>e :Buffers<CR>
nnoremap <Leader>p :FZF<CR>
nnoremap <Leader>f :Ag<CR>

noremap <Leader>r :so ~/.vimrc<CR>
noremap <Leader>R :e ~/.vimrc<CR>
nnoremap ; :

vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

nmap ? :nohl<CR><Plug>(easymotion-sn)
nmap / :nohl<CR><Plug>(easymotion-sn)
nmap N <Plug>(easymotion-prev)
nmap n <Plug>(easymotion-next)
nmap <Tab> <Plug>(easymotion-next)
nmap <S-Tab> <Plug>(easymotion-prev)

map <Leader>j <Plug>GitGutterNextHunk
map <Leader>k <Plug>GitGutterPrevHunk
map <Leader><BS> :nohl<CR>

nmap <silent> w <Plug>CamelCaseMotion_w
nmap <silent> b <Plug>CamelCaseMotion_b
nmap <silent> e <Plug>CamelCaseMotion_e
nmap <silent> ge <Plug>CamelCaseMotion_ge

omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

" let g:ctrlp_working_path_mode = 'ra'

let g:airline_powerline_fonts = 1


set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11

" quits nerd tree when opening a file
let NERDTreeQuitOnOpen = 0

" prevent ctrlp still opened when opening file
" let g:ctrlp_dont_split = 'nerdtree'
" let g:user_emmet_expandabbr_key = '<tab>'

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

let g:UltiSnipsSnippetDirectories=["~/dotfiles/vim/UltiSnips"]

let g:fzf_tags_command = 'ct'

map <Leader>s :Switch<CR>

let g:switch_definitions = 
  \ [
  \   {
  \      'function\((.*)\)': '(\1) =>',
  \      '\((.*)\)\s?=>': 'function(\1)'
  \   },
  \   ['let', 'const', 'var']
  \ ]

let g:indentLine_enabled = 1
" let g:indentLine_setColors = 0
" let g:indentLine_color_term = 239

set conceallevel=1
set completeopt-=preview

" fix for neovim ctrl H tmux split navigation
nnoremap <silent> <BS> <C-h> :TmuxNavigateLeft<cr>

cmap w!! w !sudo tee % > /dev/null
