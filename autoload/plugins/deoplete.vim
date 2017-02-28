function! plugins#deoplete#hook_source() abort
  " Python3 full path
  let g:python3_host_prog           = $PYTHON_PATH . '/python'
  let g:deoplete#enable_at_startup  = 1
  let g:deoplete#enable_ignore_case = 1
  if !exists('g:deoplete#sources#omni#input_patterns')
    let g:deoplete#sources#omni#input_patterns = {}
  endif
  " required vim-monster
  let g:deoplete#sources#omni#input_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

  if !exists('g:deoplete#omni_patterns')
    let g:deoplete#omni_patterns= {}
  endif
  " for tsuquyomi
  let g:deoplete#omni_patterns.typescript = '[^. \t]\.\%(\h\w*\)\?'

  " required deoplete-go
  let g:deoplete#sources#go#gocode_binary  = $GOPATH .'/bin/gocode'
  let g:deoplete#sources#go#sort_class     = ['package', 'func', 'type', 'var', 'const']
  let g:deoplete#sources#go#use_cache      = 1
  let g:deoplete#sources#go#json_directory = $HOME . '/.cache/deoplete/go'

  " for eclim
  let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'

  " Close popup menu when leave insert mode or complete end.
  " autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
  " Close popup menu when leave insert mode
  autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
endfunction
