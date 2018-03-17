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
  " Java LSP command example. This is not move expected move.
  " let g:LanguageClient_serverCommands["java"] = [
  "       \ 'java',
  "       \ '-Declipse.application=org.eclipse.jdt.ls.core.id1',
  "       \ '-Dosgi.bundles.defaultStartLevel=4',
  "       \ '-Declipse.product=org.eclipse.jdt.ls.core.product',
  "       \ '-noverify',
  "       \ '-Xmx1G',
  "       \ '-XX:+UseG1GC',
  "       \ '-XX:+UseStringDeduplication',
  "       \ '-jar',
  "       \ '/Users/ryuta/Downloads/plugins/org.eclipse.equinox.launcher_1.4.0.v20161219-1356.jar',
  "       \ '-configuration',
  "       \ '/Users/ryuta/Downloads/config_mac',
  "       \ '-data',
  "       \ '/Users/ryuta/hoge']

  " TODO Consider keymap
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endfunction
