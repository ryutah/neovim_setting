function! plugins#deoplete#hook_source() abort
  let g:deoplete#enable_at_startup = 1
  let g:deoplete#enable_ignore_case = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif

  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endfunction
