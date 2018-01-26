function! hook#source#vim_markdown#load() abort
  autocmd! AutoIndentPreWrite

  " TODO Read help and consider settings
  let g:vim_markdown_folding_disabled = 1
endfunction
