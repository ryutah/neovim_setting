command! LoadHelp call s:load_help()
command! TodoList call denite#start([{'name': 'grep', 'args': ['', '', 'TODO']}], {'direction': 'topleft'})

function! s:load_help() abort
  packloadall
  silent! helptags ALL
endfunction
