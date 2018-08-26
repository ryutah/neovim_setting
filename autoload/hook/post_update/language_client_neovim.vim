function! hook#post_update#language_client_neovim#load() abort
  !./install.sh
  !rustup component add rls-preview rust-analysis rust-src
  !npm i -g javascript-typescript-langserver vue-language-server
  !pip install python-language-server
endfunction
