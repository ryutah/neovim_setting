function! plugins#vim_markdown#hook_add() abort
  let g:vim_markdown_frontmatter      = 1
  let g:vim_markdown_math             = 1
  let g:vim_markdown_folding_disabled = 1
  let g:vim_markdown_conceal          = 0
endfunction
