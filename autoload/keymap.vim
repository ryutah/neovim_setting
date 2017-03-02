""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
function! keymap#init() abort
  " Editor controlls
  nnoremap j gj
  nnoremap k gk
  nnoremap gj j
  nnoremap gk k
  noremap  <S-h> ^
  noremap  <S-l> $
  noremap  <S-j> %
  noremap  <C-j> <S-j>

  nnoremap <Leader>cd :lcd %:p:h<CR>

  " Tab controll
  nnoremap <silent> tn :tabnew<CR>
  nnoremap <silent> tl :tabnext<CR>
  nnoremap <silent> th :tabprevious<CR>
  nnoremap <silent> tx :tabclose<CR>

  " Split screen controlls
  nnoremap [split] <Nop>
  nmap     <Leader>s [split]
  nnoremap <silent> [split]v :vsplit<CR>
  nnoremap <silent> [split]i :split<CR>
  nnoremap <silent> [split]l <C-w>l
  nnoremap <silent> [split]h <C-w>h
  nnoremap <silent> [split]j <C-w>j
  nnoremap <silent> [split]k <C-w>k
  nnoremap <silent> [split]w <C-w>w
  nnoremap <silent> [split]x <C-w>x
  nnoremap <silent> [split]o <C-w>=
  nnoremap <silent> [split]> 20<C-w>>
  nnoremap <silent> [split]< 20<C-w><
  nnoremap <silent> [split]+ 10<C-w>+
  nnoremap <silent> [split]- 10<C-w>-

  " Unite key mapping
  nnoremap <Leader><Leader> :<C-u>Unite -start-insert file_rec/neovim -ignorecase -smartcase<CR>
  nnoremap [unite] <Nop>
  nmap     <Leader>u [unite]
  nnoremap <silent> [unite]y  :Unite history/yank<CR>
  nnoremap <silent> [unite]b  :Unite -start-insert buffer -ignorecase -smartcase<CR>
  nnoremap <silent> [unite]t  :Unite -start-insert tab -ignorecase -smartcase<CR>
  nnoremap <silent> [unite]r  :Unite -start-insert file_mru -ignorecase -smartcase<CR>
  nnoremap <silent> [unite]g  :Unite -start-insert grep:. -ignorecase -smartcase<CR>
  nnoremap <silent> [unite]o  :Unite -vertical -start-insert -direction=botright -winwidth=40 outline -ignorecase -smartcase<CR>
  nnoremap <silent> [unite]rs  <Plug>(unite_restart)
  nnoremap <silent> [unite]ri :Unite ref/ri<CR>
  nnoremap <silent> [unite]cs :Unite colorscheme -auto-preview<CR>
  nnoremap <silent> [unite]q  :Unite -no-quit -direction=botright quickfix<CR>
  nnoremap <silent> [unite]f  :Unite -start-insert file file/new -ignorecase -smartcase<CR>
  nnoremap <silent> [unite]m  :Unite -start-insert bookmark file/new -ignorecase -smartcase -default-action=open<CR>

  " Open NERDTree
  " nnoremap [NERDTree] <Nop>
  " nmap     <Leader>n  [NERDTree]
  " nnoremap <silent>   [NERDTree]t :NERDTree<CR>

  " Open VimFiler
  nnoremap [Vimfiler] <Nop>
  nmap     <Leader>n [VimFiler]
  nnoremap <silent> [VimFiler]t :VimFilerSimple -explorer<CR>

  " caw.vim
  nmap <C-_> <Plug>(caw:zeropos:toggle)
  vmap <C-_> <Plug>(caw:zeropos:toggle)

  " vim-quickrun
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

  " easy-align
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  " tagbar
  nnoremap [Tagbar]  <Nop>
  nmap     <Leader>t [Tagbar]
  nnoremap <silent>  [Tagbar]t :TagbarToggle<CR>

  " format
  nnoremap [Format]  <Nop>
  nmap     <Leader>f [Format]
  nnoremap <silent>  [Format]a :Autoformat<CR>
  nnoremap <silent>  [Format]f gg=G``

  " Console
  nnoremap [Console]  <Nop>
  nmap     <Leader>c [Console]
  nnoremap <silent>  [Console]v :vs +term<CR>
  nnoremap <silent>  [Console]i :split +term<CR>
  nnoremap <silent>  [Console]t :tabnew +term<CR>

  tnoremap <silent> <ESC> <C-\><C-n>
endfunction
