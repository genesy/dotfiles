call plug#begin('~/.config/nvim/plugged')

" Plug 'L9'

" Test on windows WSL

if !exists('g:vscode')
  if has('unix')
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'bash install.sh',
        \ }
  elseif has('win32')
    Plug 'autozimu/LanguageClient-neovim', {
        \ 'branch': 'next',
        \ 'do': 'powershell -executionpolicy bypass -File install.ps1',
        \ }
  endif

  " (Optional) Multi-entry selection UI.
  Plug 'junegunn/fzf'

  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
endif



" ==============================
" TABLE OF CONTENTS
" ==============================
" 1. FORMATTING
" 2. FILE NAVIGATION
" 3. GIT
" 4. CSS
" 5. JAVASCRIPT
" 6. COLORSCHEME
" ==============================

" -1. ???
"
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment'
Plug 'kana/vim-textobj-indent'
Plug 'Julian/vim-textobj-brace'
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
Plug 'sgur/vim-textobj-parameter'

" 0. ???


if !exists('g:vscode')
  Plug 'scrooloose/syntastic'

  Plug 'christoomey/vim-tmux-navigator'
  Plug 'honza/vim-snippets'
  let g:diminactive_enable_focus = 1

  Plug 'blueyed/vim-diminactive'
  Plug 'sirver/ultisnips'
    let g:UltiSnipsEditSplit="vertical"
    let g:UltiSnipsExpandTrigger = "<C-f>"
    let g:UltiSnipsJumpForwardTrigger = "<C-f>"
    let g:UltiSnipsJumpBackwardTrigger = "<C-d>"

  Plug 'ervandew/supertab'
    " make YCM compatible with UltiSnips (using supertab)
    let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-J>']
    let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-K>']
    let g:ycm_key_invoke_completion = '<C-L>' "'<Leader><Leader>'

  Plug 'airblade/vim-gitgutter'

  Plug 'yggdroot/indentLine'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'elzr/vim-json'
  Plug 'terryma/vim-multiple-cursors'

endif

" Plug 'majutsushi/tagbar'

  let g:EasyMotion_smartcase = 1

Plug 'easymotion/vim-easymotion'

Plug 'terryma/vim-expand-region'
" Plug 'tpope/vim-abolish'
Plug 'bkad/CamelCaseMotion'
" Plug 'andrewradev/switch.vim'

" Plug 'YankRing.vim'


" Plug 'jceb/vim-orgmode'
" =========================
" 1.FORMATTING
" =========================

" [delimitMate] Automatic Closing of quotes, parenthesis, brackets, etc.
if !exists('g:vscode')
  Plug 'Raimondi/delimitMate'
  let delimitMate_expand_cr=1
endif
  " indent code when entering

" [vim-surround] Easy way to change surrounding tags to another tag from " to ' for example.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" =========================
" 2. FILE NAVIGATION
" =========================
if !exists('g:vscode')
  Plug 'rking/ag.vim'
  let g:AgSmartCase = 1
  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
  endif

  Plug 'scrooloose/nerdtree'
  " Plug 'jistr/vim-nerdtree-tabs'
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
    let g:fzf_tags_command = 'ct'

endif
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif



" =========================
" 3. GIT
" =========================

if !exists('g:vscode')
  Plug 'tpope/vim-fugitive'
endif

" =========================
" 4. CSS
" =========================
if !exists('g:vscode')
  Plug 'cakebaker/scss-syntax.vim'
  Plug 'groenewege/vim-less'
  Plug 'mattn/emmet-vim'
    let g:user_emmet_expandabbr_key='<C-e>'
    " imap <expr> <C-,> emmet#expandAbbrIntelligent("\<tab>")
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,less,scss EmmetInstall
  Plug 'ap/vim-css-color'
endif

" =========================
" 5. JAVASCRIPT
" =========================

if !exists('g:vscode')
  Plug 'jelera/vim-javascript-syntax'
  Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'moll/vim-node'
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'

  Plug 'mxw/vim-jsx'
  Plug 'isruslan/vim-es6'
  Plug 'shutnik/jshint2.vim'
endif

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }


" =========================
" 6. COLORSCHEME
" =========================

if !exists('g:vscode')
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
endif

call plug#end()

