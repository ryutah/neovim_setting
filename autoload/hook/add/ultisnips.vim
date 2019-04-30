function! hook#add#ultisnips#load() abort
  let g:UltiSnipsExpandTrigger = "<Plug>(ultisnips_expand)"
  let g:UltiSnipsJumpForwardTrigger = "<c-j>"
  let g:UltiSnipsJumpBackwardTrigger = "<c-k>"
  let g:UltiSnipsRemoveSelectModeMappings = 0
  let g:UltiSnipsSnippetDirectories = [
        \ g:neovim_home . '/snippets/ultisnips',
        \ g:neovim_home . '/dein/repos/github.com/honza/vim-snippets/UltiSnips',
        \ ]
endfunction
