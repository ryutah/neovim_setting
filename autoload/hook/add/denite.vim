function! hook#add#denite#load() abort
  " Key maps
  call denite#custom#map('normal', 'o', '<denite:do_action:default>', 'noremap')
  call denite#custom#map('normal', 'v', '<denite:do_action:vsplit>', 'noremap')
  call denite#custom#map('normal', 's', '<denite:do_action:split>', 'noremap')

  " Set file_rec command
  if executable('fd')
    call denite#custom#var('file_rec', 'command', ['fd', '-t', 'f', '-c', 'never', ''])
  elseif executable('ag')
    call denite#custom#var('file_rec', 'command', ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
  endif

  " Set grep command
  if executable('ag')
    call denite#custom#var('grep', 'command', ['ag'])
    call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
    call denite#custom#var('grep', 'recursive_opts', [])
    call denite#custom#var('grep', 'pattern_opt', [])
    call denite#custom#var('grep', 'separator', ['--'])
    call denite#custom#var('grep', 'final_opts', [])
  endif
endfunction
