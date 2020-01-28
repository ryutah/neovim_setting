command! LoadHelp call s:load_help()
command! TodoList call denite#start([{'name': 'grep', 'args': ['', '', 'TODO']}], {'direction': 'topleft'})
command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))| w

function! s:load_help() abort
  packloadall
  silent! helptags ALL
endfunction
