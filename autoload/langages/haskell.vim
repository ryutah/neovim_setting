""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:hs()
  set tags=tags;/,codex.tags;/
endfunction

function! langages#haskell#init() abort
  augroup vimrc-haskell
    autocmd!
    autocmd FileType haskell call s:hs()
  augroup END
endfunction
