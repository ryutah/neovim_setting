function! plugins#auto_ctags#hook_source() abort
  if isdirectory('.git')
    let g:auto_ctags_directory_list = ['.git']
  endif
endfunction
