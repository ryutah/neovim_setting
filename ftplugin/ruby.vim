" Set tab size
set tabstop=4
" Set auto indent tab size
set shiftwidth=2
" Use whitespace alternative <TAB>
set expandtab
" Display invisible charcters.
" Include '?' and '!' at syntax
setl iskeyword+=?
setl iskeyword+=!
" Rspec syntax on
autocmd BufNewFile,BufRead *_foo.rb set syntax=rspec
