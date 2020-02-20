call plug#begin('~/.config/nvim/plugged')

" Plug 'L9'

" Test on windows WSL


let g:hardtime_default_on = 1
Plug 'takac/vim-hardtime'
Plug 'wakatime/vim-wakatime'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" vim-sleuth adjusts indentation
Plug 'tpope/vim-sleuth'


if !exists('g:vscode')

  " (Optional) Multi-entry selection UI.
  function! CreateCenteredFloatingWindow()
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "╭" . repeat("─", width - 2) . "╮"
    let mid = "│" . repeat(" ", width - 2) . "│"
    let bot = "╰" . repeat("─", width - 2) . "╯"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
  endfunction
  let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
  let g:skim_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
  Plug 'junegunn/fzf'

  " use rg by default
  if executable('rg')
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
    set grepprg=rg\ --vimgrep
    command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
  endif

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

" -1. TEXT OBJECTS
"
Plug 'kana/vim-textobj-user'
Plug 'glts/vim-textobj-comment' " ic or ac
Plug 'kana/vim-textobj-indent' " ii or ai
Plug 'Julian/vim-textobj-brace' " ij or aj
Plug 'kana/vim-textobj-function'
Plug 'thinca/vim-textobj-function-javascript'
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

  " Plug 'ervandew/supertab'
    " make YCM compatible with UltiSnips (using supertab)
    " let g:ycm_key_list_select_completion = ['<TAB>', '<Down>', '<C-J>']
    " let g:ycm_key_list_previous_completion = ['<S-TAB>', '<Up>', '<C-K>']
    " let g:ycm_key_invoke_completion = '<C-L>' "'<Leader><Leader>'

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
  Plug 'kaicataldo/material.vim'
  Plug 'danilo-augusto/vim-afterglow'
  Plug 'kristijanhusak/vim-hybrid-material'
  Plug 'bling/vim-airline'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'chriskempson/base16-vim'
endif

call plug#end()

