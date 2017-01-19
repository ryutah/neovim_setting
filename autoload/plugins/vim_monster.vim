function! plugins#vim_monster#hook_source() abort
  let g:monster#completion#rcodetools#backend = "async_rct_complete"
endfunction
