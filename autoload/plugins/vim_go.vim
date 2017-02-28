function! plugins#vim_go#hook_source() abort
  " hilight
  let g:go_hightlight_functions         = 1
  let g:go_hightlight_methods           = 1
  let g:go_hightlight_structs           = 1
  let g:go_hightlight_interfaces        = 1
  let g:go_hightlight_operators         = 1
  let g:go_hightlight_build_constraints = 1
  let g:go_term_mode                    = "10split"
  let g:go_fmt_command                  = "goimports"
  let g:go_fmt_fail_silently            = 1
"   let g:go_metalinter_autosave          = 1

  " Key mapping go
  nnoremap [vim-go] <Nop>
  nmap     <Space>g [vim-go]
  nnoremap <silent> [vim-go]f :GoFmt<CR>
  nnoremap <silent> [vim-go]i :GoImport<Space>
  nnoremap <silent> [vim-go]s :GoImports<CR>
  nnoremap <silent> [vim-go]m :GoImpl<Space>
  nmap     <silent> [vim-go]r <Plug>(go-run)
  nmap     <silent> [vim-go]b <Plug>(go-build)
  nmap     <silent> [vim-go]t <Plug>(go-test)
  nmap     <silent> [vim-go]d <Plug>(go-doc)
  nmap     <silent> [vim-go]g <Plug>(go-def-tab)
  nmap     <silent> [vim-go]n <Plug>(go-info)
  nmap     <silent> [vim-go]e <Plug>(go-rename)
endfunction
