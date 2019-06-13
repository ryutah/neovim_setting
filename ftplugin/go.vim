setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab&

nnoremap <Leader><C-i> :GoImport<Space>
nnoremap <Leader><C-o> :GoImpl<Space>
nnoremap <Leader><C-r> :GoRun<CR>
nnoremap <Leader><C-t> :GoTest<CR>
nnoremap <Leader><C-d> :GoInfo<CR>
" TODO Consider keymap
nnoremap <silent><F3> :GoReferrers<CR>

highlight goErr ctermfg=11 guifg=#F29718 cterm=bold term=bold gui=bold
match goErr /\<err\>/

execute 'setlocal dictionary+=' . g:neovim_home . '/dict/go.dict'

nnoremap <silent> [denite]d :Denite decls -direction=topleft -highlight-mode-insert=String<CR>
