""""""""""""""""""""""""""""""""""""""""""""""""""
" Go Settings """"""""""""""""""""""""""""""""""""""""""""""""""
function! s:go()
  :highlight goErr cterm=bold ctermfg=214
  :match goErr /\<err\>/
  " hilight
  let g:go_hightlight_functions         = 1
  let g:go_hightlight_methods           = 1
  let g:go_hightlight_structs           = 1
  let g:go_hightlight_interfaces        = 1
  let g:go_hightlight_operators         = 1
  let g:go_hightlight_build_constraints = 1

  " Auto import at save file
  let g:go_fmt_command = "goimports"

  " Key mapping go
"   nnoremap [vim-go] <Nop>
"   nmap <Space>g [vim-go]
"   nnoremap <silent> [vim-go]f :GoFmt<CR>
"   nnoremap <silent> [vim-go]im :GoImports<CR>
"   nnoremap <silent> [vim-go]r <Plug>(go-run)
"   nnoremap <silent> [vim-go]b <Plug>(go-build)
"   nnoremap <silent> [vim-go]t <Plug>(go-test)
"   nnoremap <silent> [vim-go]ds <Plug>(go-def-split)
"   nnoremap <silent> [vim-go]dv <Plug>(go-def-vertical)
"   nnoremap <silent> [vim-go]dt <Plug>(go-def-tab)
"   nnoremap <silent> [vim-go]gd <Plug>(go-doc)
"   nnoremap <silent> [vim-go]gb <Plug>(go-doc-browser)
"   nnoremap <silent> [vim-go]in <Plug>(go-info)
"   nnoremap <silent> [vim-go]e <Plug>(go-rename)
endfunction

function! langages#go#init()
  augroup vimrc_go
    autocmd!
    autocmd FileType go call s:go()
  augroup END
endfunction
