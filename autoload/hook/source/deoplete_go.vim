function! hook#source#deoplete_go#load() abort
  let g:deoplete#sources#go#gocode_binary  = $GOPATH .'/bin/gocode'
  let g:deoplete#sources#go#sort_class     = ['package', 'func', 'type', 'var', 'const']
endfunction
