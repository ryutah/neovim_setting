command! LoadHelp call s:load_help()
command! TodoList call denite#start([{'name': 'grep', 'args': ['', '', 'TODO']}], {'direction': 'topleft'})
command! DisableAutoIndent autocmd! AutoIndentPreWrite
command! EnableAutoIndent autocmd AutoIndentPreWrite BufWrite * :Autoformat

function! s:load_help() abort
  packloadall
  silent! helptags ALL
endfunction
