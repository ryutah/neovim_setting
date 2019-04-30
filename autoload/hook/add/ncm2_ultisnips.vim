function! hook#add#ncm2_ultisnips#load() abort
  imap <expr> <c-o> ncm2_ultisnips#expand_or("\<Plug>(ultisnips_expand)", 'm')
  smap <c-u> <Plug>(ultisnips_expand)
endfunction
