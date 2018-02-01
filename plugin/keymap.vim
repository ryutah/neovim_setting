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

" Buffer controll
nnoremap [buffer] <Nop>
nmap <Leader>b [buffer]
nnoremap <silent> [buffer]n :bnext<CR>
nnoremap <silent> [buffer]p :bprevious<CR>

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
nnoremap <silent> <Leader><Leader> :Denite file_rec -smartcase -direction=topleft -highlight-mode-insert=String<CR>
nnoremap <silent> [denite]o        :Denite outline -split=vertical -highlight-mode-insert=String<CR>
nnoremap <silent> [denite]b        :Denite buffer -smartcase -direction=topleft -highlight-mode-insert=String<CR>
nnoremap <silent> [denite]f        :Denite file file:new -smartcase -direction=topleft -highlight-mode-insert=String<CR>
nnoremap <silent> [denite]g        :Denite grep -highlight-mode-insert=String<CR>

" EasyAlign
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Ale
nnoremap [ale] <Nop>
nmap <Leader>a [ale]
nmap <silent>           [ale]d <Plug>(ale_detail)
nmap <silent>           [ale]n <Plug>(ale_next)
nmap <silent>           [ale]p <Plug>(ale_previous)
nmap <silent>           [ale]N <Plug>(ale_next_wrap)
nmap <silent>           [ale]P <Plug>(ale_previous_wrap)
nnoremap <silent><expr> [ale]l <SID>toggle_location_list().'<CR>'

" Autoformat
nnoremap <silent> <Leader><C-l> :Autoformat<CR>

" Location list
nnoremap [location_list] <Nop>
nmap <Leader>l [location_list]
nnoremap <silent> [location_list]n :lnext<CR>
nnoremap <silent> [location_list]p :lprevious<CR>
nnoremap <silent><expr> [location_list]t <SID>toggle_location_list().'<CR>'

" Git keymaps
nnoremap [git] <Nop>
nmap <Leader>g [git]
nnoremap <silent> [git]s :Gstatus<CR>
nnoremap <silent> [git]d :Gdiff<CR>
nnoremap <silent> [git]w :Gwrite<CR>
nnoremap <silent> [git]l :Agit<CR>

" ref https://stackoverflow.com/questions/8061229/detecting-if-quickfix-buffer-exists-in-vim
function! s:toggle_location_list() abort
  if exists('g:location_list_open')
    unlet g:location_list_open
    return ':lclose'
  endif
  let g:location_list_open = 1
  return ':lopen'
endfunction

let g:Netrw_UserMaps = [
      \   ['o', 'Netrw_OpenTree'],
      \   ['n', 'Netrw_NewFile'],
      \ ]

function! Netrw_OpenTree(islocal) abort
  return "normal \<CR>"
endfunction

function! Netrw_NewFile(islocal) abort
  return 'normal %'
endfunction
