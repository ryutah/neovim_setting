function! s:init() abort
  set clipboard+=unnamedplus
  set number

  set tabstop=4     " Tab size
  set softtabstop=2 " Space size when enter tab
  set shiftwidth=2  " Auto indent size
  set expandtab     " Use whitespace alternative <TAB>

  " Show invisible characters
  set list
  set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

  set background=dark
  colorscheme jellybeans

  set hidden " Allow load new buffe when not saved.

  filetype plugin indent on " Enable filetype plugin and indent

  " File encoding list XXX Read Documents
  set encoding=utf-8
  set fileencodings=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,euc-jp,cp932
  set fileformats=unix,dos,mac

  set ignorecase " Set command to ignore case

  augroup buf_write_pre
    autocmd!
    autocmd BufWritePre * call s:trim()
  augroup END
endfunction

function! s:load_dein() abort
  let cache_home    = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : expand('$XDG_CONFIG_HOME/nvim')
  let dein_dir      = cache_home . '/dein'
  let dein_repo_dir = dein_dir . '/repos/github.com/Shougo/dein.vim'

  if !isdirectory(dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(dein_repo_dir))
  endif
  execute 'set runtimepath^=' . dein_repo_dir

  let dein#install_process_timeout = 600

  if dein#load_state(dein_dir)
    call dein#begin(dein_dir)

    " TOML files written plugins
    let toml = dein_dir . '/dein.toml'
    let toml_lazy = dein_dir . '/dein_lazy.toml'

    " Load plugins from toml at start nvim
    call dein#load_toml(toml, { 'lazy': 0 })
    call dein#load_toml(toml_lazy, { 'lazy': 1 })

    call dein#end()
  endif

  if dein#check_install()
    call dein#install()
  endif
endfunction

function! s:trim() abort
  if 'markdown' == &filetype
    return
  endif

  " Delete line
  if getline('$') == ""
    $delete _
  endif
  :%s/\s\+$//ge " Trim trail space
endfunction

call s:load_dein()
call s:init()
