""""""""""""""""""""""""""""""""""""""""""""""""""
" GitGutter Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
function! plugins#gitgutter#hook_add() abort
  let g:gitgutter_sign_added = '✚'
  let g:gitgutter_sign_modified = '➜'
  let g:gitgutter_sign_removed = '✘'
endfunction
