function! hook#post_update#language_client_neovim#load() abort
  !sh install.sh

  if !executable("rls")
    !rustup component add rls-preview rust-analysis rust-src
  endif

  " if !executable("javascript-typescript-stdio")
  "   !npm i -g javascript-typescript-langserver
  " endif

  " Python linter
  if !executable("pyls")
    !pip install python-language-server
  endif
endfunction
