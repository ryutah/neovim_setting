let mapleader = "\<Space>"

function! s:set_cursor_keymap() abort
  " Cursor move
  noremap j gj
  noremap k gk
  noremap gj j
  noremap gk k
  noremap <S-h> ^
  noremap <S-l> $
  noremap <S-j> %
  noremap <C-j> <S-j>
  nnoremap <C-h> H
  nnoremap <C-l> L
endfunction

function! s:set_tab_keymap() abort
  " Tab controll
  nnoremap <silent> tn :tabnew<CR>
  nnoremap <silent> tl :tabnext<CR>
  nnoremap <silent> th :tabprevious<CR>
  nnoremap <silent> tx :tabclose<CR>
endfunction

function! s:set_buffer_keymap() abort
  " Buffer controll
  nnoremap [buffer] <Nop>
  nmap <Leader>b [buffer]
  nnoremap <silent> [buffer]n :bnext<CR>
  nnoremap <silent> [buffer]p :bprevious<CR>
endfunction

function! s:set_split_keymap() abort
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
endfunction

function! s:set_console_keymap() abort
  " Console
  nnoremap [Console]  <Nop>
  nmap     <Leader>c [Console]
  nnoremap <silent>  [Console]v :vs +term<CR>
  nnoremap <silent>  [Console]i :split +term<CR>
  nnoremap <silent>  [Console]t :tabnew +term<CR>
  tnoremap <silent> <ESC> <C-\><C-n>
endfunction

function! s:set_caw_keymap() abort
  " caw.vim XXX Consider add any toggle.
  nmap <C-_> <Plug>(caw:hatpos:toggle)
  vmap <C-_> <Plug>(caw:hatpos:toggle)
endfunction

function! s:set_denite_keymap() abort
  " Denite.vim
  nnoremap [denite] <Nop>
  nmap     <Leader>u [denite]
  nnoremap <silent> <Leader><Leader> :Denite file_rec -smartcase -direction=topleft -highlight-mode-insert=String<CR>
  nnoremap <silent> [denite]o        :Denite outline -split=vertical -highlight-mode-insert=String<CR>
  nnoremap <silent> [denite]b        :Denite buffer -smartcase -direction=topleft -highlight-mode-insert=String<CR>
  nnoremap <silent> [denite]f        :Denite file file:new -smartcase -direction=topleft -highlight-mode-insert=String<CR>
  nnoremap <silent> [denite]g        :Denite grep -highlight-mode-insert=String<CR>
  nnoremap <silent> [denite]m        :Denite file_mru -direction=topleft -highlight-mode-insert=String<CR>
endfunction

function! s:set_easy_align_keymap() abort
  " EasyAlign
  xmap ga <Plug>(EasyAlign)
  nmap ga <Plug>(EasyAlign)
endfunction


function! s:set_ale_keymap() abort
  " Ale
  nnoremap [ale] <Nop>
  nmap <Leader>a [ale]
  nmap <silent>           [ale]d <Plug>(ale_detail)
  nmap <silent>           [ale]n <Plug>(ale_next)
  nmap <silent>           [ale]p <Plug>(ale_previous)
  nmap <silent>           [ale]N <Plug>(ale_next_wrap)
  nmap <silent>           [ale]P <Plug>(ale_previous_wrap)
  nnoremap <silent><expr> [ale]l <SID>toggle_location_list().'<CR>'
endfunction

function! s:set_autoformat_keymap() abort
  " Autoformat
  nnoremap <silent> <Leader><C-l> :Autoformat<CR>
endfunction

function! s:set_location_list_keymap() abort
  " Location list
  nnoremap [location_list] <Nop>
  nmap <Leader>l [location_list]
  nnoremap <silent> [location_list]n :lnext<CR>
  nnoremap <silent> [location_list]p :lprevious<CR>
  nnoremap <silent><expr> [location_list]t <SID>toggle_location_list().'<CR>'
endfunction


function! s:set_git_keymap() abort
  " Git keymaps
  nnoremap [git] <Nop>
  nmap <Leader>g [git]
  nnoremap <silent> [git]s :Gstatus<CR>
  nnoremap <silent> [git]d :Gdiff<CR>
  nnoremap <silent> [git]w :Gwrite<CR>
  nnoremap <silent> [git]l :Agit<CR>
  autocmd User Fugitive nnoremap <silent> <Leader>m :MerginalToggle<CR>
endfunction

function! s:set_netrw_keymap() abort
  let g:Netrw_UserMaps = [
        \   ['o', 'Netrw_OpenTree'],
        \   ['n', 'Netrw_NewFile'],
        \ ]
endfunction

function! Netrw_OpenTree(islocal) abort
  return "normal \<CR>"
endfunction

function! Netrw_NewFile(islocal) abort
  return 'normal %'
endfunction

" ref https://stackoverflow.com/questions/8061229/detecting-if-quickfix-buffer-exists-in-vim
function! s:toggle_location_list() abort
  if exists('g:location_list_open')
    unlet g:location_list_open
    return ':lclose'
  endif
  let g:location_list_open = 1
  return ':lopen'
endfunction

function! s:set_ctags_keymap() abort
  nnoremap <C-]> g<C-]>
endfunction

call s:set_cursor_keymap()
call s:set_tab_keymap()
call s:set_buffer_keymap()
call s:set_split_keymap()
call s:set_console_keymap()
call s:set_denite_keymap()
call s:set_caw_keymap()
call s:set_easy_align_keymap()
call s:set_ale_keymap()
call s:set_autoformat_keymap()
call s:set_location_list_keymap()
call s:set_git_keymap()
call s:set_netrw_keymap()
call s:set_ctags_keymap()
