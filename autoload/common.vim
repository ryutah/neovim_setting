""""""""""""""""""""""""""""""""""""""""""""""""""
" Common Settings
""""""""""""""""""""""""""""""""""""""""""""""""""
function! common#init() abort
  " Display row number
  set number
  " Open vim help By Shift-k
  set keywordprg=:help
  " Yank in clipboard
  set clipboard+=unnamedplus
  " restore filetype
  filetype plugin indent on
  syntax on
  " Set tab size
  set tabstop=4
  " Set auto indent tab size
  set shiftwidth=2
  " Use whitespace alternative <TAB>
  set expandtab
  " Display invisible charcters.
  set list
  set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
  " File encoding list
  set encoding=utf-8
  set fileencodings=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,euc-jp,cp932
  set fileformats=unix,dos,mac
  " diff split screen direction
  set diffopt=vertical
  " ファイルオープン時に自動でカレントディレクトリを切り替え
  " Note: 動作に問題が発生する場合はオフにすること
  " set autochdir

  " Theme
  set background=dark
  " colorscheme 設定は source 後に行う必要があるので VimEnter で行う。
  " 但し Colorscheme イベントの発生が抑制されないよう nented を付ける。
  au MyAutoCmd VimEnter * nested colorscheme hybrid

  " Remove traing white space and lise white line
  autocmd BufWritePre * call s:remove_last_white_space_and_line_in_last()

  " use undo file
  set undofile
  set undodir=~/.config/nvim/undo
  " ウィンドウ縦分割の際に下側に設定する
  set splitbelow
endfunction

function! s:remove_last_white_space_and_line_in_last() abort
  if getline('$') == ""
    $delete _
  endif
  :%s/\s\+$//ge
endfunction
