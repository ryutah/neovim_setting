function! hook#source#neosnippet#load() abort
  let g:neosnippet#snippets_directory = expand(g:neovim_home) . '/nvim/snippets'

  imap <C-k> <Plug>(neosnippet_expand_or_jump)
  smap <C-k> <Plug>(neosnippet_expand_or_jump)
  xmap <C-k> <Plug>(neosnippet_expand_target)
endfunction
