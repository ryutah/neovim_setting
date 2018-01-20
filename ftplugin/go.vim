setlocal tabstop=4
setlocal softtabstop=4
setlocal shiftwidth=4
setlocal expandtab&

nnoremap <Leader><C-i> :GoImport<Space>
nnoremap <Leader><C-l> :GoFmt<CR>
nnoremap <Leader><C-o> :GoImpl<Space>
nnoremap <Leader><C-r> :GoRun<CR>
nnoremap <Leader><C-t> :GoTest<CR>

nnoremap <silent> [denite]o :Denite decls -split=vertical<CR>

highlight goErr cterm=bold ctermfg=214
match goErr /\<err\>/
