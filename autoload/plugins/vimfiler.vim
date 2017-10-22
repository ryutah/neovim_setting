function! plugins#vimfiler#hook_add() abort
  let g:vimfiler_as_default_explorer = 1
  call unite#custom_action('file', 'my_split', s:my_vimfiler_split)
  call unite#custom_action('file', 'my_vsplit', s:my_vimfiler_vsplit)

  autocmd! FileType vimfiler call s:my_vimfiller_settings()
endfunction

function! s:my_vimfiller_settings() abort
  nunmap <buffer><Space>
  nmap , <Plug>(vimfiler_toggle_mark_current_line)
  nnoremap <silent><buffer><expr> <C-s>  vimfiler#do_action('my_split')
  nnoremap <silent><buffer><expr> <C-v>  vimfiler#do_action('my_vsplit')
  nnoremap <silent><buffer><expr> <C-t> vimfiler#do_action('tabsplit')
endfunction

let s:my_vimfiler_split = { 'is_selectable': 1 }
function! s:my_vimfiler_split.func(condidates) abort
  wincmd p
  exec 'split' . a:condidates[0].action__path
endfunction

let s:my_vimfiler_vsplit = { 'is_selectable': 1 }
function! s:my_vimfiler_vsplit.func(condidates) abort
  wincmd p
  exec 'vsplit' . a:condidates[0].action__path
endfunction