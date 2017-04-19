call plug#begin('~/.config/nvim/plugged')

Plug 'L9'


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


" 0. ???

Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'blueyed/vim-diminactive'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'bkad/CamelCaseMotion'
Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/switch.vim'

Plug 'dkprice/vim-easygrep'
Plug 'leafgarland/typescript-vim'

Plug 'yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json'
Plug 'YankRing.vim'

Plug 'terryma/vim-multiple-cursors'

" Plug 'jceb/vim-orgmode'
" =========================
" 1.FORMATTING
" =========================

" [delimitMate] Automatic Closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'

" [vim-surround] Easy way to change surrounding tags to another tag from " to ' for example.
Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'


" =========================
" 2. FILE NAVIGATION
" =========================
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" =========================
" 3. GIT
" =========================
Plug 'tpope/vim-fugitive'

" =========================
" 4. CSS
" =========================
Plug 'cakebaker/scss-syntax.vim'
Plug 'groenewege/vim-less'
Plug 'mattn/emmet-vim'
Plug 'ap/vim-css-color'

" =========================
" 5. JAVASCRIPT
" =========================
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'

Plug 'moll/vim-node'
Plug 'epilande/vim-es2015-snippets'
Plug 'epilande/vim-react-snippets'

Plug 'mxw/vim-jsx'
Plug 'isruslan/vim-es6'
Plug 'shutnik/jshint2.vim'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }


" =========================
" 6. COLORSCHEME
" =========================
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

