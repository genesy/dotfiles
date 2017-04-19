let mapleader = "\<Space>"
nnoremap ; :
noremap ;; ;

" fix for neovim ctrl H tmux split navigation
nnoremap <silent> <BS> <C-h> :TmuxNavigateLeft<cr>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>e :Buffers<CR>
nnoremap <Leader>p :FZF<CR>
nnoremap <silent> <expr> <Leader>p (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<CR>"

nnoremap <Leader>f :Ag!<CR>

noremap <Leader>r :so ~/.vimrc<CR>
noremap <Leader>R :e ~/.vimrc<CR>

noremap <C-k>b :NERDTreeToggle<CR>
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


" map <Leader>s :Switch<CR>
vmap v <Plug>(expand_region_expand)
vmap V <Plug>(expand_region_shrink)

" fix for bug when enter doesnt indent
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"
