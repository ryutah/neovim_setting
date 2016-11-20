function! plugins#vim_go#hook_source() abort
  " Key mapping go
  nnoremap [vim-go] <Nop>
  nmap <Space>g [vim-go]
  nnoremap <silent> [vim-go]f :GoFmt<CR>
  nnoremap <silent> [vim-go]im :GoImports<CR>
  nmap <silent> [vim-go]r <Plug>(go-run)
  nmap <silent> [vim-go]b <Plug>(go-build)
  nmap <silent> [vim-go]t <Plug>(go-test)
  nmap <silent> [vim-go]ds <Plug>(go-def-split)
  nmap <silent> [vim-go]dv <Plug>(go-def-vertical)
  nmap <silent> [vim-go]dt <Plug>(go-def-tab)
  nmap <silent> [vim-go]gd <Plug>(go-doc)
  nmap <silent> [vim-go]gb <Plug>(go-doc-browser)
  nmap <silent> [vim-go]in <Plug>(go-info)
  nmap <silent> [vim-go]e <Plug>(go-rename)
endfunction
