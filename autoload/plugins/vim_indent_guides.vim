function! plugins#vim_indent_guides#hook_source() abort
  let g:indent_guides_auto_colors       = 1
  let g:indent_guides_guide_size        = 1
  let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
  autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=grey
  autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=darkgrey
endfunction
