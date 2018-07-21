function! hook#source#vim_markdown#load() abort
  autocmd! AutoIndentPreWrite

  " TODO Read help and consider settings
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal          = 0
endfunction
