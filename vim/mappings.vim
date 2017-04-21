let mapleader = "\<Space>"
nnoremap ; :
noremap ;; ;

" fix for neovim ctrl H tmux split navigation
nnoremap <silent> <BS> <C-h> :TmuxNavigateLeft<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :Buffers<CR>
nnoremap <Leader>p :FZF<CR>
nnoremap <Leader>s :sp<CR>
nnoremap <Leader>v :vs<CR>

nnoremap <Leader>f :Ag! 

noremap <Leader>r :so ~/.vimrc<CR>
noremap <Leader>R :e ~/.vimrc<CR>

nnoremap <Leader>1 :NERDTreeToggle<CR>

nmap ? :nohl<CR><Plug>(easymotion-s)
nmap / :nohl<CR><Plug>(easymotion-sn)
nmap N <Plug>(easymotion-prev)
nmap n <Plug>(easymotion-next)

map <Leader>j <Plug>GitGutterNextHunk
map <Leader>k <Plug>GitGutterPrevHunk

map <Leader><Leader> :FZF<CR>
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
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
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

