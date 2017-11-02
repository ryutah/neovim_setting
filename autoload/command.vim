function! command#init() abort
  " Reload config
  command! Reload source $XDG_CONFIG_HOME/nvim/init.vim
  " echo file type
  command! FileType echo &filetype
  " find TODO comment
  command! FindTodo :Unite grep:. -ignorecase -smartcase -input=TODO
endfunction
