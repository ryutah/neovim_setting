function! hook#source#deoplete#load() abort
  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#keyword_patterns')
    let g:deoplete#keyword_patterns  = {}
  endif
  " Default keyword patterns. This is mutch 'a-z, A-Z, 0-9, _, -'
  let g:deoplete#keyword_patterns._ = '[\w\-]*'

  " Close popup window when leave insert mode.
  autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

  " <C-h>, <BS>: close popup and delete backword char.
  inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
  inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
endfunction
