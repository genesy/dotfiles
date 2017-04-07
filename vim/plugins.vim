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
" 
" ==============================


" 0. ???

Plug 'easymotion/vim-easymotion'
Plug 'christoomey/vim-tmux-navigator'
Plug 'blueyed/vim-diminactive'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'
Plug 'terryma/vim-expand-region'
" Plug 'tpope/vim-abolish'
Plug 'bkad/CamelCaseMotion'
Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/switch.vim'

" TODO: test this out
" Plug 'dkprice/vim-easygrep'

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

