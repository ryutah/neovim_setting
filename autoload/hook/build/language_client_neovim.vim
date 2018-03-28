function! hook#build#language_client_neovim#execute() abort
  !sh install.sh

  if !executable("rls")
    !rustup component add rls-preview rust-analysis rust-src
  endif

  if !executable("javascript-typescript-stdio")
    !npm i -g javascript-typescript-langserver
  endif

  " Python linter
  if !executable("pyls")
    !pip install python-language-server
  endif

  " XXX Not test this script
  let l:jdt_lsp_path = expand(g:outher_package_path) . "/jdt-lsp"
  if !executable(l:jdt_lsp_path . "/plugins/org.eclipse.equinox.launcher_1.5.0.v20180207-1446.jar")
    call mkdir(l:jdt_lsp_path, "p")
    !wget http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.16.0-201803280253.tar.gz
    execute "!cd " . l:jdt_lsp_path
    !curl -o tmp_jdt_lsp.tar.gz http://download.eclipse.org/jdtls/snapshots/jdt-language-server-0.16.0-201803280253.tar.gz
    !tar xf tmp_jdt_lsp.tar.gz
    !rm tmp_jdt_lsp.tar.gz
  endif
endfunction

