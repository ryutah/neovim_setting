" Include '?' and '!' at syntax
setl iskeyword+=?
setl iskeyword+=!
" Rspec syntax on
autocmd BufNewFile,BufRead *_foo.rb set syntax=rspec
