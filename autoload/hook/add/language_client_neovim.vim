function! hook#add#language_client_neovim#load() abort
  let g:LanguageClient_autoStart                = 1 " XXX Auto start is not work...
  let g:LanguageClient_diagnosticsEnable        = 0 " Turn off because it is uses ale to lint file.
  let g:LanguageClient_serverCommands           = {}
  let g:LanguageClient_serverCommands["rust"]   = ['rustup', 'run', 'nightly', 'rls']
  let g:LanguageClient_serverCommands["python"] = ['pyls']
  " let g:LanguageClient_serverCommands["javascript"] = ['javascript-typescript-stdio'] " XXX it has not been confirmed to LSP is working well yet.

  " TODO Consider keymap
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
endfunction
