""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
let g:unite_source_history_yank_enable = 1

try
  let g:unite_source_rec_async_command = ['ag', '--follow',  '--nocolor',
        \ '--nogroup', '--hidden', '-g', '']
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
