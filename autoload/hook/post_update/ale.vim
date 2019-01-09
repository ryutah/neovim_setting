function! hook#post_update#ale#load() abort
  execute "!" . g:neovim_home . "/script/install_linters.sh"
endfunction
