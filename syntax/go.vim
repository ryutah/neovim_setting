syn keyword goTodo contained TODO FIXME XXX BUG WARNING HACK REVIEW OPTIMIZE CHANGED NOTE
highlight goErr ctermfg=11 guifg=#F29718 cterm=underline term=underline gui=underline
match goErr /\<err\>/
