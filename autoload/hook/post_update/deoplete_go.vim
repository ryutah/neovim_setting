function! hook#post_update#deoplete_go#load() abort
  make
  if executable("gocode")
    !gocode set unimported-packages true
  endif
endfunction
