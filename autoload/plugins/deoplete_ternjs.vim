function! plugins#deoplete_ternjs#hook_source() abort
  " Use tern_for_vim.
  let g:tern#command = ["tern"]
  let g:tern#arguments = ["--persistent"]
endfunction
