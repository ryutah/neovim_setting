function! hook#add#ncm2#load() abort
  autocmd BufEnter * call ncm2#enable_for_buffer()
  autocmd TextChangedI * call ncm2#auto_trigger()

  inoremap <c-c> <ESC>
  inoremap <expr> <CR> pumvisible() ? "\<c-y>\<cr>" : "\<CR>"
endfunction
