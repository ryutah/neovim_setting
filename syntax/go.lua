vim.cmd [[ syn keyword goTodo contained TODO FIXME XXX BUG WARNING HACK REVIEW OPTIMIZE CHANGED NOTE ]]
vim.cmd [[ highlight goErr ctermfg=11 guifg=#F29718 cterm=bold term=bold gui=bold ]]
vim.cmd [[ match goErr /\<err\>/ ]]
