function! plugins#emmet_vim#hook_source() abort
  let g:user_emmet_mode = 'i'
  " let g:user_emmet_leader_key='<C-E>'
  let g:use_emmet_complete_tag = 1
  let g:user_emmet_settings = {
        \   'variables': {
        \     'lang': "ja"
        \   },
        \   'indentation': '    '
        \ }
endfunction
