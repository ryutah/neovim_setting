function! hook#post_update#language_client_neovim#load() abort
  !./install.sh
  !rustup component add rls-preview rust-analysis rust-src
  !npm i -g javascript-typescript-langserver vue-language-server
  !pip install python-language-server

  let l:jdt_lsp_path = expand(g:outher_package_path) . "/jdt-lsp"
  if !executable(l:jdt_lsp_path . "/plugins/org.eclipse.equinox.launcher_1.5.0.v20180512-1130.jar")
    !wget -O /tmp/tmp_jdt_lsp.tar.gz http://download.eclipse.org/jdtls/milestones/0.20.0/jdt-language-server-0.20.0-201806010139.tar.gz
    call mkdir(l:jdt_lsp_path, "p")
    execute "!tar xf /tmp/tmp_jdt_lsp.tar.gz -C " . l:jdt_lsp_path
    !rm /tmp/tmp_jdt_lsp.tar.gz
  endif
endfunction
