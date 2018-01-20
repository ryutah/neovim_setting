let mapleader   = "\<Space>"

" Cursor move
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <S-h> ^
noremap <S-l> $
noremap <S-j> %
noremap <C-j> <S-j>

" Tab controll
nnoremap <silent> tn :tabnew<CR>
nnoremap <silent> tl :tabnext<CR>
nnoremap <silent> th :tabprevious<CR>
nnoremap <silent> tx :tabclose<CR>

" Split screen controlls
nnoremap [split] <Nop>
nmap     <Leader>s [split]
nnoremap <silent>  [split]v :vsplit<CR>
nnoremap <silent>  [split]i :split<CR>
nnoremap <silent>  [split]l <C-w>l
nnoremap <silent>  [split]h <C-w>h
nnoremap <silent>  [split]j <C-w>j
nnoremap <silent>  [split]k <C-w>k
nnoremap <silent>  [split]w <C-w>w
nnoremap <silent>  [split]o <C-w>=
nnoremap <silent>  [split]> 20<C-w>>
nnoremap <silent>  [split]< 20<C-w><
nnoremap <silent>  [split]+ 10<C-w>+
nnoremap <silent>  [split]- 10<C-w>-

" Console
nnoremap [Console]  <Nop>
nmap     <Leader>c [Console]
nnoremap <silent>  [Console]v :vs +term<CR>
nnoremap <silent>  [Console]i :split +term<CR>
nnoremap <silent>  [Console]t :tabnew +term<CR>
tnoremap <silent> <ESC> <C-\><C-n>

" caw.vim XXX Consider add any toggle.
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

" Denite.vim
nnoremap [denite] <Nop>
nmap     <Leader>u [denite]
nnoremap <silent> <Leader><Leader> :Denite file_rec -smartcase -direction=topleft<CR>
nnoremap <silent> [denite]o        :Denite outline -split=vertical<CR>
nnoremap <silent> [denite]b        :Denite buffer -smartcase -direction=topleft<CR>
nnoremap <silent> [denite]f        :Denite file file:new -smartcase -direction=topleft<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)
