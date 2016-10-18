call plug#begin('~/.config/nvim/plugged')

Plug 'L9'
Plug 'tpope/vim-fugitive'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

Plug 'scrooloose/nerdtree'


Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }

" Plug 'Xuyuanp/nerdtree-git-plugin'

"CtrlP
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'gcmt/taboo.vim'                      "good to have


" Plug 'tomtom/tcomment_vim'                 "must have
Plug 'Raimondi/delimitMate'                 "must have
" delimitMate - closing of quotes, parenthesis, brackets


" auto close brackets and quotes
" Plug 'tpope/vim-repeat'

" Plug 'xolox/vim-misc' " required by vim session
" Plug 'xolox/vim-session'                   "must have
Plug 'tpope/vim-surround'

" SYNTAX
Plug 'cakebaker/scss-syntax.vim'
Plug 'jelera/vim-javascript-syntax'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'pangloss/vim-javascript'
Plug 'burnettk/vim-angular'
Plug 'leafgarland/typescript-vim'
Plug 'isruslan/vim-es6'

Plug 'shutnik/jshint2.vim'

" Plug 'vim-scripts/YankRing.vim'

" Plug 'mattn/emmet-vim'
" Plug 'mattn/webapi-vim'

" Plug 'rking/ag.vim'
" Plug 'othree/html5.vim'
" Plug 'scrooloose/syntastic'                "must have
" Plug 'ryanoasis/vim-devicons'
" Plug 'nathanaelkane/vim-indent-guides'

" Plug 'bling/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'Valloric/YouCompleteMe'
" Plug 'marijnh/tern_for_vim'

" Plug 'easymotion/vim-easymotion'

" Plug 'christoomey/vim-tmux-navigator'
" Plug 'terryma/vim-expand-region'
" Plug 'mhinz/vim-startify'
" 
"

"----- "
" Track the engine.
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'
"-----"


call plug#end()

