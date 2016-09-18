function! plugins#vim_monster#hook_source() abort
  let g:monster#completion#rcodetools#backend = "async_rct_complete"
  let g:deoplete#sources#omni#input_patterns = {
        \   "ruby" : '[^. *\t]\.\w*\|\h\w*::',
        \}
endfunction
