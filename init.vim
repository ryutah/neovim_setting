" dein settings {{{
if &compatible
  set nocompatible
endif

augroup MyAutoCmd
  autocmd!
augroup END

let s:cache_home    = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : expand('$XDG_CONFIG_HOME/nvim')
let s:dein_dir      = s:cache_home . '/dein'
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if !isdirectory(s:dein_repo_dir)
  call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
endif
execute 'set runtimepath^=' . s:dein_repo_dir

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " TOML files written plugins
  let s:toml      = s:dein_dir . '/dein.toml'
  let s:lazy_toml = s:dein_dir . '/dein_lazy.toml'

  " Load plugins from toml at start nvim
  call dein#load_toml(s:toml, { 'lazy': 0 })
  " Load lazy plugin from toml at insert mode
  call dein#load_toml(s:lazy_toml, { 'lazy': 1 })

  call dein#end()
endif

if dein#check_install()
  call dein#install()
endif

" Common settings
call common#init()
" Key maps
call keymap#init()
" ruby settings
call langages#ruby#init()
" go settings
call langages#go#init()
