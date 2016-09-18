""""""""""""""""""""""""""""""""""""""""""""""""""
" Ruby Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
function! s:rb()
  " Include '?' and '!' at syntax
  setl iskeyword+=?
  setl iskeyword+=!
endfunction

function! langages#ruby#init() abort
  augroup vimrc-rb
    autocmd!
    " filetype=rb が設定された場合に関数を呼ぶ
    autocmd FileType ruby call s:rb()
  augroup END
endfunction
