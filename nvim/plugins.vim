call plug#begin('~/.config/nvim/plugged')

" Plug 'L9'

" Test on windows WSL

Plug 'yuki-ycino/fzf-preview.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
" vim-sleuth adjusts indentation
Plug 'tpope/vim-sleuth'


if !exists('g:vscode')
  " use rg by default
  if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*" --glob "!android/*" --glob "!ios/*"'
    set grepprg=rg\ --vimgrep
    let g:fzf_preview_filelist_command = 'rg --files --hidden --follow --no-messages -g \!"* *"' " Installed ripgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --glob "!android/*" --glob "!ios/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  endif

  " Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
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

" -1. TEXT OBJECTS
"
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment' " ic or ac
Plug 'kana/vim-textobj-indent' " ii or ai
Plug 'Julian/vim-textobj-brace' " ij or aj
" Plug 'kana/vim-textobj-function'
" Plug 'thinca/vim-textobj-function-javascript'
Plug 'sgur/vim-textobj-parameter'

" 0. ???


if !exists('g:vscode')
  Plug 'scrooloose/syntastic'
  Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

  Plug 'christoomey/vim-tmux-navigator'
  let g:vim_json_syntax_conceal = 0
  Plug 'elzr/vim-json'
  let g:diminactive_enable_focus = 1

  " Plug 'honza/vim-snippets'
  Plug 'blueyed/vim-diminactive'
  " Plug 'sirver/ultisnips'
  "   let g:UltiSnipsEditSplit="vertical"
  "   let g:UltiSnipsExpandTrigger = "<C-f>"
  "   let g:UltiSnipsJumpForwardTrigger = "<C-f>"
  "   let g:UltiSnipsJumpBackwardTrigger = "<C-d>"


  Plug 'airblade/vim-gitgutter'

  Plug 'yggdroot/indentLine'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'terryma/vim-multiple-cursors'

endif

" Plug 'majutsushi/tagbar'

  let g:EasyMotion_smartcase = 1

" Plug 'asvetliakov/vim-easymotion'

Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-abolish'
" Plug 'bkad/CamelCaseMotion'
Plug 'genesy/CamelCaseMotion'
" Plug 'file://' . expand('~/projects/CamelCaseMotion')
" Plug 'file://' . expand('~/projects/whid')

" Plug 'andrewradev/switch.vim'

" Plug 'YankRing.vim'


" Plug 'jceb/vim-orgmode'
" =========================
" 1.FORMATTING
" =========================

" [delimitMate] Automatic Closing of quotes, parenthesis, brackets, etc.

  Plug 'Raimondi/delimitMate'
  let delimitMate_expand_cr=1
  " let delimitMate_expand_space=1
  " let delimitMate_jump_expansion = 1
  " indent code when entering

" [vim-surround] Easy way to change surrounding tags to another tag from " to ' for example.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'

" =========================
" 2. FILE NAVIGATION
" =========================
if !exists('g:vscode') && !has('gui_vimr')
  " Plug 'rking/ag.vim'
  " let g:AgSmartCase = 1
  " if executable('ag')
  "   set grepprg=ag\ --nogroup\ --nocolor
  " endif

  Plug 'scrooloose/nerdtree'
 " Plug 'jistr/vim-nerdtree-tabs'
  " autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  " Plug 'junegunn/fzf.vim'
    " let g:fzf_tags_command = 'ct'

endif
  " autocmd StdinReadPre * let s:std_in=1



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
  " Plug 'jelera/vim-javascript-syntax'
  " Plug 'othree/javascript-libraries-syntax.vim'
  Plug 'leafgarland/typescript-vim'

  Plug 'peitalin/vim-jsx-typescript'

  Plug 'moll/vim-node'
  Plug 'epilande/vim-es2015-snippets'
  Plug 'epilande/vim-react-snippets'

  Plug 'yuezk/vim-js'
  " Plug 'sheerun/vim-polyglot'
  Plug 'pangloss/vim-javascript'
  Plug 'maxmellon/vim-jsx-pretty'
  " let g:vim_jsx_pretty_template_tags = []
  let g:vim_jsx_pretty_colorful_config = 1
  let g:vim_jsx_pretty_highlight_close_tag = 1
  Plug 'isruslan/vim-es6'
  " Plug 'shutnik/jshint2.vim'
  Plug 'chemzqm/vim-jsx-improve'
endif

" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }


" =========================
" 6. COLORSCHEME
" =========================

if !exists('g:vscode')
  Plug 'prettier/vim-prettier', { 'do': 'yarn install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
  let g:prettier#autoformat = 1
  autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'chriskempson/base16-vim'
  Plug 'tbastos/vim-lua'
  Plug 'kaicataldo/material.vim'
endif

call plug#end()

