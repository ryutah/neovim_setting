function! plugins#yajs#hook_add() abort
  autocmd BufRead,BufNewFile *.es6 setfiletype javascript
endfunction
