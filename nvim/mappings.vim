let mapleader = "\<Space>"
" nnoremap ; :
" noremap ;; ;


imap jk <Esc>

" fix for neovim ctrl H tmux split navigation
nnoremap <silent> <BS> <C-h> :TmuxNavigateLeft<cr>

" nnoremap <Leader>s :sp<CR>
" nnoremap <Leader>v :vs<CR>
"
" nnoremap <Leader>o o<Esc>
" nnoremap <Leader>O O<Esc>

function! FZFOpen(command_str)
  if (expand('%') =~# 'NERD_tree' && winnr('$') > 1)
    exe "normal! \<c-w>\<c-w>"
  endif
  exe 'normal! ' . a:command_str . "\<cr>"
endfunction

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
  nnoremap mm :call VSCodeNotify("bookmarks.toggle")<CR>
  nnoremap mi :call VSCodeNotify("bookmarks.toggleLabeled")<CR>
  nnoremap mn :call VSCodeNotify("bookmarks.jumpToNext")<CR>
  nnoremap mp :call VSCodeNotify("bookmarks.jumpToPrevious")<CR>
  nnoremap ma :call VSCodeNotify("bookmarks.listFromAllFiles")<CR>
  nnoremap mc :call VSCodeNotify("bookmarks.clear")<CR>
  nnoremap mx :call VSCodeNotify("bookmarks.clearFromAllFiles")<CR>

  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine

  vnoremap <C-n> mi

else

  omap <silent> ih <Plug>GitGutterTextObjectInnerPending
  omap <silent> ah <Plug>GitGutterTextObjectOuterPending
  xmap <silent> ih <Plug>GitGutterTextObjectInnerVisual
  xmap <silent> ah <Plug>GitGutterTextObjectOuterVisual
  nnoremap <silent> <C-H> :TmuxNavigateLeft<cr>
  nnoremap <silent> <C-J> :TmuxNavigateDown<cr>
  nnoremap <silent> <C-K> :TmuxNavigateUp<cr>
  nnoremap <silent> <C-L> :TmuxNavigateRight<cr>
  " nnoremap <Leader>f :call FZFOpen(':Rg')<CR>
  nnoremap <Leader>f :FzfPreviewProjectGrep<space>
  nnoremap <Leader>p :FzfPreviewDirectoryFiles<CR>
  nnoremap <Leader>w :w<CR>
  nnoremap <Leader>qq :q!<CR>
  nnoremap <Leader>e :FzfPreviewAllBuffers<CR>
  nnoremap <silent> <Leader>r :so $MYVIMRC<CR>
  nnoremap <Leader>\ :vsp<CR>
  nnoremap <Leader>- :sp<CR>
  " nnoremap <Leader>ga :Git add %:p<CR><CR>
  " nnoremap <Leader>gs :Gstatus<CR>
  " nnoremap <Leader>gc :Gcommit -v -q<CR>
  " nnoremap <Leader>gt :Gcommit -v -q %:p<CR>
  " nnoremap <Leader>gd :Gdiff<CR>
  " nnoremap <Leader>ge :Gedit<CR>
  " nnoremap <Leader>gr :Gread<CR>
  " nnoremap <Leader>gw :Gwrite<CR><CR>
  " nnoremap <Leader>gl :silent! Glog<CR>:bot copen<CR>
  " nnoremap <Leader>gp :Ggrep<Space>
  " nnoremap <Leader>gm :Gmove<Space>
  " nnoremap <Leader>gb :Git branch<Space>
  " nnoremap <Leader>go :Git checkout<Space>
  " nnoremap <Leader>gps :Dispatch! git push<CR>
  " nnoremap <Leader>gpl :Dispatch! git pull<CR>
  "
  nmap <silent> <Leader>kk <Plug>(coc-diagnostic-prev)
  nmap <silent> <Leader>jj <Plug>(coc-diagnostic-next)
  nmap <silent> gd <Plug>(coc-definition)
  nmap <silent> gy <Plug>(coc-type-definition)
  nmap <silent> gi <Plug>(coc-implementation)
  nmap <silent> gr <Plug>(coc-references)
  nmap <leader>rn <Plug>(coc-rename)

  nnoremap <silent> K :call <SID>show_documentation()<CR>

  function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
      execute 'h '.expand('<cword>')
    else
      call CocAction('doHover')
    endif
  endfunction

  nmap <leader>qf  <Plug>(coc-fix-current)
  xmap if <Plug>(coc-funcobj-i)
  xmap af <Plug>(coc-funcobj-a)
  omap if <Plug>(coc-funcobj-i)
  omap af <Plug>(coc-funcobj-a)

  nmap <silent> <TAB> <Plug>(coc-range-select)
  xmap <silent> <TAB> <Plug>(coc-range-select)
  noremap <silent> <space>ce  :<C-u>CocList extensions<cr>
  nnoremap <silent> <space>cc  :<C-u>CocList commands<cr>
  nnoremap <silent> <space>cs  :<C-u>CocList -I symbols<cr>
  nnoremap <silent> <space>cp  :<C-u>CocListResume<CR>
  nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
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


" map <Leader>s :Switch<CR>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" fix for bug when enter doesnt indent
" if !exists('g:vscode')
"   imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
" endif
let g:tmux_navigator_no_mappings = 1

" nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
"
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>
function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction


