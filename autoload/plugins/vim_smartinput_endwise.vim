function! plugins#vim_smartinput_endwise#hook_add() abort
  call smartinput_endwise#define_default_rules()
endfunction
