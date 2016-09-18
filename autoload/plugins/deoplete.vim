function! plugins#deoplete#hook_add() abort
  " <TAB> で補完を選択
  inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
endfunction

function! plugins#deoplete#hook_source() abort
  let g:deoplete#enable_at_startup = 1
  if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
  endif

  inoremap <expr><tab> pumvisible() ? "\<C-n>" :
        \ neosnippet#expandable_or_jumpable() ?
        \    "\<Plug>(neosnippet_expand_or_jump)" : "\<tab>"

  autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
endfunction
