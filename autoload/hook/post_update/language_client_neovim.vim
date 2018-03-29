function! hook#post_update#language_client_neovim#load() abort
  !./install.sh
  !rustup component add rls-preview rust-analysis rust-src
  !npm i -g javascript-typescript-langserver
  !pip install python-language-server

  let l:jdt_lsp_path = expand(g:outher_package_path) . "/jdt-lsp"
  if !executable(l:jdt_lsp_path . "/plugins/org.eclipse.equinox.launcher_1.5.0.v20180207-1446.jar")
    !curl -o /tmp/tmp_jdt_lsp.tar.gz http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.16.0-201803280253.tar.gz
    call mkdir(l:jdt_lsp_path, "p")
    execute "!tar xf /tmp/tmp_jdt_lsp.tar.gz -C " . l:jdt_lsp_path
    !rm /tmp/tmp_jdt_lsp.tar.gz
  endif
endfunction
