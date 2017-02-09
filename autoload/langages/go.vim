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
endfunction

function! langages#go#init()
  augroup vimrc_go
    autocmd!
    autocmd FileType go call s:go()
  augroup END
endfunction
