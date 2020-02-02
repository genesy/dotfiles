call plug#begin('~/.config/nvim/plugged')

" Plug 'L9'

" Test on windows WSL
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }


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
Plug 'tomlion/vim-solidity'

" 0. ???

Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'

Plug 'easymotion/vim-easymotion'
  let g:EasyMotion_smartcase = 1

Plug 'christoomey/vim-tmux-navigator'

Plug 'blueyed/vim-diminactive'
  let g:diminactive_enable_focus = 1

Plug 'sirver/ultisnips'
  let g:UltiSnipsEditSplit="vertical"
  let g:UltiSnipsExpandTrigger = "<C-f>"
  let g:UltiSnipsJumpForwardTrigger = "<C-f>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-d>"

Plug 'honza/vim-snippets'

Plug 'ervandew/supertab'
  " make YCM compatible with UltiSnips (using supertab)
  let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-J>']
  let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-K>']
  let g:ycm_key_invoke_completion = '<C-L>' "'<Leader><Leader>'

Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
Plug 'bkad/CamelCaseMotion'
Plug 'airblade/vim-gitgutter'
Plug 'andrewradev/switch.vim'

Plug 'leafgarland/typescript-vim'

Plug 'yggdroot/indentLine'
Plug 'ntpeters/vim-better-whitespace'
Plug 'elzr/vim-json'
" Plug 'YankRing.vim'

Plug 'terryma/vim-multiple-cursors'

" Plug 'jceb/vim-orgmode'
" =========================
" 1.FORMATTING
" =========================

" [delimitMate] Automatic Closing of quotes, parenthesis, brackets, etc.
Plug 'Raimondi/delimitMate'
  " indent code when entering
  let delimitMate_expand_cr=1

" [vim-surround] Easy way to change surrounding tags to another tag from " to ' for example.
Plug 'tpope/vim-surround'

Plug 'tpope/vim-commentary'


" =========================
" 2. FILE NAVIGATION
" =========================
Plug 'rking/ag.vim'
  let g:AgSmartCase = 1
  if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor
  endif
Plug 'scrooloose/nerdtree'
  " autocmd StdinReadPre * let s:std_in=1
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


" Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
  let g:fzf_tags_command = 'ct'

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
  let g:user_emmet_expandabbr_key='<C-e>'
  " imap <expr> <C-,> emmet#expandAbbrIntelligent("\<tab>")
  let g:user_emmet_install_global = 0
  autocmd FileType html,css,less,scss EmmetInstall
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

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }


" =========================
" 6. COLORSCHEME
" =========================
Plug 'danilo-augusto/vim-afterglow'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

