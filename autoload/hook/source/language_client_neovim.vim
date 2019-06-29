function! hook#source#language_client_neovim#load() abort
  set hidden

  let g:LanguageClient_hoverPreview = "Always"
  let g:LanguageClient_autoStart = 1
  let g:LanguageClient_diagnosticsEnable = 0 " Turn off because it is uses ale to lint file.
  let g:LanguageClient_hasSnippetSupport=1
  let g:LanguageClient_rootMarkers = {
         \ 'go': ['go.mod', '.git'],
         \ 'scala': ['build.sbt'],
         \ }
  let g:LanguageClient_serverCommands = {
        \ "rust": ['rustup', 'run', 'stable', 'rls'],
        \ "python": ['pyls'],
        \ "javascript": ['javascript-typescript-stdio'],
        \ "typescript": ['javascript-typescript-stdio'],
        \ "javascript.jsx": ['javascript-typescript-stdio'],
        \ "vue": ['vls'],
        \ "dart": ['dart_language_server'],
        \ "ocaml": ['ocaml-language-server', '--stdio'],
        \ "haskell": ['hie-wrapper'],
        \ "go": ['gopls'],
        \ "scala": ['metals-vim'],
        \ }

  " ref https://www.eclipse.org/community/eclipse_newsletter/2017/may/article4.php
  let l:jdt_lsp_data_dir = expand(g:outher_package_path) . "/jdt-data"
  if !isdirectory(l:jdt_lsp_data_dir)
    call mkdir(l:jdt_lsp_data_dir, "p")
  endif
  let g:LanguageClient_serverCommands["java"] = [
        \ 'docker',
        \ 'run',
        \ '--rm',
        \ '-i',
        \ '-v', getcwd() . ':'. getcwd(),
        \ '-v', $HOME . '/.local/java-dev/jlsp:/root/jlsp',
        \ '-v', $HOME . '/.local/java-dev/.gradle:/root/.gradle',
        \ '-v', $HOME . '/.local/java-dev/.m2:/root/.m2',
        \ 'ryutah/openjdk:11',
        \ 'jlsp.sh']

  " TODO Consider keymap
  nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
  nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
  nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
  nnoremap <silent> <F3> :call LanguageClient_textDocument_references()<CR>
endfunction
