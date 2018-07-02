function! hook#add#ultisnips#load() abort
  let g:UltiSnipsSnippetDirectories  = [g:neovim_home . '/ultisnips']
  let g:UltiSnipsListSnippets        = "<C-l>"
  let g:UltiSnipsExpandTrigger       = "<C-k>"
  let g:UltiSnipsJumpForwardTrigger  = "<C-k>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-b>"
endfunction
