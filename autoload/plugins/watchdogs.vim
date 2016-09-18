function! plugins#watchdogs#hook_source() abort
  " 書き込み後にシンタックスチェックを行う
  let g:watchdogs_check_BufWritePost_enable = 1
  let g:watchdogs_check_BufWritePost_enable_on_wq = 0
endfunction

function! plugins#watchdogs#hook_post_source() abort
  call watchdogs#setup(g:quickrun_config)
endfunction
