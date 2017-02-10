""""""""""""""""""""""""""""""""""""""""""""""""""
" Key Mappings
""""""""""""""""""""""""""""""""""""""""""""""""""
function! keymap#init() abort
  " Editor controlls
  nnoremap j gj
  nnoremap k gk
  nnoremap gj j
  nnoremap gk k
  noremap <S-h> ^
  noremap <S-l> $

  nnoremap <Space>cd :lcd %:p:h<CR>

  " Tab controll
  nnoremap <silent> tn :tabnew<CR>
  nnoremap <silent> tl :tabnext<CR>
  nnoremap <silent> th :tabprevious<CR>
  nnoremap <silent> tx :tabclose<CR>

  " Split screen controlls
  nnoremap [split] <Nop>
  nmap <Space>s [split]
  nnoremap <silent> [split]v :vsplit<CR>
  nnoremap <silent> [split]i :split<CR>
  nnoremap <silent> [split]l <C-w>l
  nnoremap <silent> [split]h <C-w>h
  nnoremap <silent> [split]j <C-w>j
  nnoremap <silent> [split]k <C-w>k
  nnoremap <silent> [split]w <C-w>w
  nnoremap <silent> [split]o <C-w>=
  nnoremap <silent> [split]> 10<C-w>>
  nnoremap <silent> [split]< 10<C-w><
  nnoremap <silent> [split]+ 5<C-w>+
  nnoremap <silent> [split]- 5<C-u>-

  " Unite key mapping
  nnoremap <Space><Space> :<C-u>Unite -start-insert file_rec/async<CR>
  nnoremap [unite] <Nop>
  nmap     <Space>u [unite]
  nnoremap <silent> [unite]y  :Unite history/yank<CR>
  nnoremap <silent> [unite]b  :Unite -start-insert buffer<CR>
  nnoremap <silent> [unite]t  :Unite -start-insert tab<CR>
  nnoremap <silent> [unite]m  :Unite -start-insert file_mru<CR>
  nnoremap <silent> [unite]g  :Unite -start-insert grep<CR>
  nnoremap <silent> [unite]o  :Unite -vertical -start-insert -direction=botright -winwidth=40 outline<CR>
  nnoremap <silent> [unite]r  <Plug>(unite_restart)
  nnoremap <silent> [unite]ri :Unite ref/ri<CR>
  nnoremap <silent> [unite]cs :Unite colorscheme -auto-preview<CR>
  nnoremap <silent> [unite]q  :Unite -no-quit -direction=botright quickfix<CR>

  " Open NERDTree
  nnoremap [NERDTree] <Nop>
  nmap     <Space>n [NERDTree]
  nnoremap <silent> [NERDTree]t :NERDTree<CR>

  " caw.vim
  nmap \c <Plug>(caw:zeropos:toggle)
  vmap \c <Plug>(caw:zeropos:toggle)
  nmap <C-_> <Plug>(caw:zeropos:toggle)
  vmap <C-_> <Plug>(caw:zeropos:toggle)

  " vim-quickrun
  nnoremap <expr><silent> <C-c> quickrun#is_running() ? quickrun#sweep_sessions() : "\<C-c>"

  " easy-align
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)

  " tagbar
  nnoremap [Tagbar] <Nop>
  nmap     <Space>t [Tagbar]
  nnoremap <silent> [Tagbar]t :TagbarToggle<CR>

  " format
  nnoremap [Format] <Nop>
  nmap <Space>f [Format]
  nnoremap <silent> [Format]f gg=G``
endfunction
