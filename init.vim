function! s:init() abort
  set shortmess+=c

  set clipboard+=unnamedplus
  set number

  set completeopt=noinsert,menuone,noselect
  set tabstop=4     " Tab size
  set softtabstop=2 " Space size when enter tab
  set shiftwidth=2  " Auto indent size
  set expandtab     " Use whitespace alternative <TAB>

  " Show invisible characters
  set list
  set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%

  set background=dark

  set hidden " Allow load new buffe when not saved.

  set diffopt=vertical

  filetype plugin indent on " Enable filetype plugin and indent

  " File encoding list
  set encoding=utf-8
  set fileencodings=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,euc-jp,cp932
  set fileformats=unix,dos,mac
  " This config fix 2bytes symbols display, but someting error happen when edit ascii codes.
  " set ambiwidth=double

  set ignorecase " Set command to ignore case
  set splitbelow " split horizonal screen to below

  let g:netrw_liststyle = 3 " netrw set to tree style listing

  set undofile
  execute 'set undodir=' . expand('$HOME') . '/.cache/nvim/undo'

  set updatetime=500 " swap file written time. this affect to gitgutter.

  let g:python_host_prog = expand('$PYTHON2_PATH')
  let g:python3_host_prog = expand('$PYTHON3_PATH')
  let g:neovim_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config/nvim') : expand('$XDG_CONFIG_HOME/nvim')

  " Path of third party library download path.
  " This config use by like eclipse.jdt.ls tolls.
  let g:outher_package_path = expand('$HOME/.local/nvim')
  if !isdirectory(g:outher_package_path)
    call mkdir(g:outher_package_path, "p")
  endif
  " Java formatter jar file name. Use by Autoformat
  let g:google_java_formatter = 'google-java-format-1.5-all-deps.jar'

  call s:set_trail_highlight(
        \   "py", "go", "rb", "rs", "js", "mjs",
        \   "ts", "java", "vim", "sh", "yaml", "json",
        \   "vim",
        \ )
  call s:set_colors()
endfunction

function! s:set_trail_highlight(...) abort
  augroup HighlightTrailingSpaces
    autocmd!
  augroup END

  for var in a:000
    let l:cmd = 'autocmd HighlightTrailingSpaces VimEnter,WinEnter,ColorScheme *.' . var . ' syntax match Error /\s\+$/'
    execute l:cmd
  endfor
endfunction

function! s:after_load_plugins() abort
  set termguicolors
  " For use True Colr on tmux
  " ref https://qiita.com/yami_beta/items/ef535d3458addd2e8fbb
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  let ayucolor="dark"
  colorscheme ayu
endfunction

function! s:load_dein() abort
  let dein_dir = g:neovim_home . '/dein'
  let dein_repo_dir = dein_dir . '/repos/github.com/Shougo/dein.vim'

  if !isdirectory(dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(dein_repo_dir))
  endif
  execute 'set runtimepath^=' . dein_repo_dir

  let g:dein#install_process_timeout = 1200

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

function! s:set_colors() abort
  autocmd! ColorScheme *
        \ hi Whitespace ctermfg=Gray guifg=#2C2C2C |
        \ hi link ALEErrorSign todo |
        \ hi link ALEWarningSign Identifier
endfunction

call s:init()
call s:load_dein()
call s:after_load_plugins()
