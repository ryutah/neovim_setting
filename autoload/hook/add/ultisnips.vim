" ultisnip configuration
"  refs: https://github.com/autozimu/LanguageClient-neovim/issues/379#issuecomment-394071180
function! hook#add#ultisnips#load() abort
  let g:UltiSnipsSnippetDirectories = [
        \ g:neovim_home . '/ultisnips',
        \ g:neovim_home . '/dein/repos/github.com/honza/vim-snippets/UltiSnips',
        \ ]
  let g:UltiSnipsListSnippets = "<C-l>"
  let g:UltiSnipsExpandTrigger = "<C-k>"
  let g:UltiSnipsJumpForwardTrigger = "<C-k>"
  let g:UltiSnipsJumpBackwardTrigger = "<C-b>"

  imap <C-o> <C-R>=ExpandLspSnippet()<CR>
endfunction

function! ExpandLspSnippet()
  call UltiSnips#ExpandSnippetOrJump()
  if !pumvisible() || empty(v:completed_item)
    return ''
  endif

  " only expand Lsp if UltiSnips#ExpandSnippetOrJump not effect.
  let l:value = v:completed_item['word']
  let l:matched = len(l:value)
  if l:matched <= 0
    return ''
  endif

  " remove inserted chars before expand snippet
  if col('.') == col('$')
    let l:matched -= 1
    exec 'normal! ' . l:matched . 'Xx'
  else
    exec 'normal! ' . l:matched . 'X'
  endif

  if col('.') == col('$') - 1
    " move to $ if at the end of line.
    call cursor(line('.'), col('$'))
  endif

  " expand snippet now.
  call UltiSnips#Anon(l:value)
  return ''
endfunction
