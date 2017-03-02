syntax keyword goErr err
syntax match goAssign /:=/

autocmd ColorScheme * highlight goErr cterm=bold ctermfg=214
highlight goErr cterm=bold ctermfg=214
highlight link goAssign Constant
highlight link goBrace Function
