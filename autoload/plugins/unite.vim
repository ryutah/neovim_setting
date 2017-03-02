""""""""""""""""""""""""""""""""""""""""""""""""""
" Unite Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
function! plugins#unite#hook_add() abort
  let g:unite_source_history_yank_enable = 1

  " Use silver search to find_rec/neovim and grep
  if executable('ag')
    let g:unite_source_rec_async_command  = ['ag', '--follow',  '--nocolor', '--nogroup', '--hidden', '-g', '']
    let g:unite_source_grep_command       = 'ag'
    let g:unite_source_grep_default_opts  = '--nogroup --nocolor --column'
    let g:unite_source_grep_recursive_opt = ''
  endif

  " filterings
  call unite#custom#source('file', 'matchers', "matcher_fuzzy")
  call unite#custom#source('outline', 'matchers', "matcher_fuzzy")

  autocmd! FileType unite :call s:my_unite_settings()
endfunction

function! s:my_unite_settings() abort
  nnoremap <buffer><expr> s unite#do_action('split')
  nnoremap <buffer><expr> v unite#do_action('vsplit')
endfunction
