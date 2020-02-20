let mapleader = "\<Space>"
nnoremap ; :
noremap ;; ;


imap jk <Esc>

" fix for neovim ctrl H tmux split navigation
nnoremap <silent> <BS> <C-h> :TmuxNavigateLeft<cr>

" nnoremap <Leader>s :sp<CR>
" nnoremap <Leader>v :vs<CR>
"
nnoremap <Leader>o o<Esc>
nnoremap <Leader>O O<Esc>


if exists('g:vscode')
  nnoremap <Leader>f :call VSCodeNotify("workbench.action.findInFiles")<CR>;
  nnoremap <Leader>p :call VSCodeNotify("workbench.action.quickOpen")<CR>;
  nnoremap <Leader>P :call VSCodeNotify("workbench.action.quickOpen", "> ")<CR>;
  nnoremap <Leader>w :call VSCodeNotify("workbench.action.files.save")<CR>;
  nnoremap <Leader>q :call VSCodeNotify("workbench.action.closeWindow")<CR>;
  nnoremap <Leader>Q :call VSCodeNotify("workbench.action.closeWindow")<CR>;
  nnoremap <Leader>e :call VSCodeNotify("workbench.action.quickOpen", "edt ")<CR>;
  nnoremap <Leader>r :call VSCodeNotify("workbench.action.reloadWindow")<CR>;
  nnoremap <Leader>\ :call VSCodeNotify("workbench.action.splitEditor")<CR>
  nnoremap <Leader>- :call VSCodeNotify("workbench.action.splitEditorOrthogonal")<CR>
else
  nnoremap <Leader>f :Ag<Space>
  nnoremap <Leader>p :FZF<CR>
  nnoremap <Leader>w :w<CR>
  nnoremap <Leader>q :q<CR>
  nnoremap <Leader>Q :q!<CR>
  nnoremap <Leader>e :Buffers<CR>
  nnoremap <silent> <Leader>r :so $MYVIMRC<CR>
  nnoremap <Leader>\ :vsp<CR>
  nnoremap <Leader>- :sp<CR>
  nnoremap <silent> <Leader>ev :edit $MYVIMRC
endif

" nnoremap <Leader>f :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>

noremap <Leader>R :e ~/dotfiles<CR>

nnoremap <Leader>1 :NERDTreeToggle<CR>

if !has('g:vscode')
  " nmap ? :nohl<CR><Plug>(easymotion-s)
  " nmap / :nohl<CR><Plug>(easymotion-sn)
  " nmap N <Plug>(easymotion-prev)
  " nmap n <Plug>(easymotion-next)

  nmap <Leader>j <Plug>(GitGutterNextHunk)
  nmap <Leader>k <Plug>(GitGutterPrevHunk)
else
  nmap <Leader>j :call VSCodeNotify("workbench.action.editor.nextChange")<CR>
  nmap <Leader>k :call VSCodeNotify("workbench.action.editor.previousChange")<CR>
endif


map <Leader>c :nohl<CR>

map <silent> w <Plug>CamelCaseMotion_w
map <silent> b <Plug>CamelCaseMotion_b
map <silent> e <Plug>CamelCaseMotion_e
omap <silent> iw <Plug>CamelCaseMotion_iw
xmap <silent> iw <Plug>CamelCaseMotion_iw
omap <silent> ib <Plug>CamelCaseMotion_ib
xmap <silent> ib <Plug>CamelCaseMotion_ib
omap <silent> ie <Plug>CamelCaseMotion_ie
xmap <silent> ie <Plug>CamelCaseMotion_ie

omap <silent> ih <Plug>GitGutterTextObjectInnerPending
omap <silent> ah <Plug>GitGutterTextObjectOuterPending
xmap <silent> ih <Plug>GitGutterTextObjectInnerVisual
xmap <silent> ah <Plug>GitGutterTextObjectOuterVisual

" map <Leader>s :Switch<CR>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" fix for bug when enter doesnt indent
if !exists('g:vscode')
  imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
endif
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
endif
