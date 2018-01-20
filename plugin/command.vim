command! LoadHelp call s:load_help()

function! s:load_help() abort
  packloadall
  silent! helptags ALL
endfunction
