function! hook#add#language_client_neovim#load() abort
  let g:LanguageClient_autoStart                        = 1 " XXX Auto start is not work...
  let g:LanguageClient_diagnosticsEnable                = 0 " Turn off because it is uses ale to lint file.
  let g:LanguageClient_serverCommands                   = {}
  let g:LanguageClient_serverCommands["rust"]           = ['rustup', 'run', 'nightly', 'rls']
  let g:LanguageClient_serverCommands["python"]         = ['pyls']
  let g:LanguageClient_serverCommands["javascript"]     = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands["typescript"]     = ['javascript-typescript-stdio']
  let g:LanguageClient_serverCommands["javascript.jsx"] = ['javascript-typescript-stdio']

  " ref https://www.eclipse.org/community/eclipse_newsletter/2017/may/article4.php
  let g:LanguageClient_serverCommands["java"] = [
        \ 'java',
        \ '-agentlib:jdwp=transport=dt_socket,server=y,suspend=n,address=1044',
        \ '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \ '-Dosgi.bundles.defaultStartLevel=4',
        \ '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \ '-Dlog.protocol=true',
        \ '-Dlog.level=ALL',
        \ '-noverify',
        \ '-Xmx1G',
        \ '-jar',
        \ expand(g:outher_package_path) . '/jdt-lsp/plugins/org.eclipse.equinox.launcher_1.5.0.v20180207-1446.jar',
        \ '-configuration',
        \ expand(g:outher_package_path) . '/jdt-lsp/config_mac',
        \ '-data',
        \ expand("%:p:h")]

  " TODO Consider keymap
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
  nnoremap <silent> <F3> :call LanguageClient_textDocument_references()<CR>
endfunction
