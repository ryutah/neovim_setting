set hidden
set number
set clipboard+=unnamedplus
set ignorecase
set tabstop=4
set softtabstop=2
set shiftwidth=2
set expandtab
" Show invisible characters
set list
set listchars=tab:>.,trail:_,eol:↲,extends:>,precedes:<,nbsp:%
" File encoding list
set encoding=utf-8
set fileencodings=utf-8,euc-jp,iso-2022-jp,ucs-2le,ucs-2,euc-jp,cp932
set fileformats=unix,dos,mac
" Fold setting
set foldmethod=syntax
set foldlevelstart=99
" Undo setting
set undofile
" enable cursorline and highlight only row number
set cursorline
" allow mouse scrolling
set mouse=a

execute 'set undodir=' . stdpath('cache') . '/undo'

let g:python3_host_prog = expand('$PYTHON3_PATH')
" Too heavy
let g:polyglot_disabled = ['vue']

function s:is_run_in_wsl() abort
  return system('uname -a | grep -i microsoft') != ""
endfunction

if s:is_run_in_wsl()
  augroup myYank
    autocmd!
    autocmd TextYankPost * :call system('clip.exe', @")
  augroup END
endif

"""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')
" Neovim Extends
Plug 'jbyuki/instant.nvim'
Plug 'justinmk/vim-sneak'
Plug 'sotte/presenting.vim'

" Text Extends
Plug 'tpope/vim-surround'
Plug 'https://tpope.io/vim/repeat.git'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'

" Color Scheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'nanotech/jellybeans.vim'

" Vim UI / UX
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'miyakogi/seiya.vim'
Plug 'lambdalisue/fern.vim'
Plug 'preservim/tagbar'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/fern-git-status.vim'

" Code Extends
Plug 'editorconfig/editorconfig-vim'
Plug 'tyru/caw.vim'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'honza/vim-snippets'
Plug 'sheerun/vim-polyglot'
Plug 'skanehira/preview-markdown.vim', { 'for': 'markdown' }
Plug 'mattn/vim-maketable'
Plug 'previm/previm'
Plug 'mattn/emmet-vim'

" Git Extends
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'airblade/vim-gitgutter'

" Coc Extensions
Plug 'neoclide/coc-snippets', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-vetur', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
Plug 'josa42/coc-sh', { 'do': 'yarn install --frozen-lockfile' }
Plug 'josa42/coc-go', { 'do': 'yarn install --frozen-lockfile' }
Plug 'josa42/coc-docker', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-rust-analyzer', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-sql', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-marketplace', { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-diagnostic', { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-vimlsp', { 'do': 'yarn install --frozen-lockfile' }
Plug 'oncomouse/coc-fish', { 'do': 'yarn install --frozen-lockfile' }
Plug 'marlonfan/coc-phpls', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-java', { 'do': 'yarn install --frozen-lockfile' }
Plug 'kkiyama117/coc-toml', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-pyright', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-deno', { 'do': 'yarn install --frozen-lockfile' }
Plug 'antoinemadec/coc-fzf', { 'do': 'yarn install --frozen-lockfile' }

call plug#end()

"""""""""""""""""""""""""""""""""""""""""
" keymapping
"""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" cursor keymap
noremap j gj
noremap k gk
noremap gj j
noremap gk k
noremap <S-h> ^
noremap <S-l> $
noremap <S-f> %
nnoremap <C-h> H
nnoremap <C-l> L

" buffer moving
nnoremap [buffer] <Nop>
nmap     <Leader>b [buffer]
nnoremap <silent>  [buffer]n :bnext<CR>
nnoremap <silent>  [buffer]p :bprevious<CR>

" split screen
nnoremap [split] <Nop>
nmap     <Leader>s [split]
nnoremap <silent>  [split]s :vsplit<CR>
nnoremap <silent>  [split]i :split<CR>
nnoremap <silent>  [split]l <C-w>l
nnoremap <silent>  [split]h <C-w>h
nnoremap <silent>  [split]j <C-w>j
nnoremap <silent>  [split]k <C-w>k
nnoremap <silent>  [split]w <C-w>p
nnoremap <silent>  [split]o <C-w>=
nnoremap <silent>  [split]> 20<C-w>>
nnoremap <silent>  [split]< 20<C-w><
nnoremap <silent>  [split]+ 10<C-w>+
nnoremap <silent>  [split]- 10<C-w>-

"""""""""""""""""""""""""""""""""""""""""
" Colors
"""""""""""""""""""""""""""""""""""""""""
" colorscheme gruvbox
if has("termguicolors")
  " fix true color not work under tmux
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  " enable true color
  set termguicolors
endif

colorscheme gruvbox
" For gruvbox fix nontext color
hi NonText ctermfg=12 guifg=#2D3640

" colorscheme jellybeans

" highlight cursorline only row number
hi clear CursorLine

"""""""""""""""""""""""""""""""""""""""""
" tyru/caw.vim
"""""""""""""""""""""""""""""""""""""""""
nmap <leader>/ <Plug>(caw:hatpos:toggle)
vmap <leader>/ <Plug>(caw:hatpos:toggle)

"""""""""""""""""""""""""""""""""""""""""
" vim-airline/vim-airline
"""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='ayu_dark'

"""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader><Leader>f <cmd>Files<CR>
nnoremap <silent> <Leader><Leader>b <cmd>Buffers<CR>
nnoremap <silent> <Leader><Leader>g <cmd>Rg<CR>
" refs: https://github.com/junegunn/fzf.vim/issues/772
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-i': 'split',
      \ 'ctrl-s': 'vsplit',
      \ 'ctrl-y': { lines -> setreg('*', join(lines, "\n")) }
      \}
" refs: https://github.com/junegunn/fzf.vim/issues/609#issuecomment-549390273
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" with antoinemadec/coc-fzf
nnoremap <silent> <Leader><Leader>c :<C-u>CocFzfList<CR>
nnoremap <silent> <Leader><Leader>a :<C-u>CocFzfList diagnostics<CR>
nnoremap <silent> <Leader><Leader>d :<C-u>CocFzfList diagnostics --current-buf<CR>
nnoremap <silent> <Leader><Leader>c :<C-u>CocFzfList commands<CR>
nnoremap <silent> <Leader><Leader>l :<C-u>CocFzfList location<CR>
nnoremap <silent> <Leader><Leader>t :<C-u>CocFzfList outline<CR>

"""""""""""""""""""""""""""""""""""""""""
" neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""
set hidden
set updatetime=100

nnoremap <silent> K <cmd>call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>rf <Plug>(coc-references)
nmap <leader>gn <Plug>(coc-diagnostic-next)
nmap <leader>gp <Plug>(coc-diagnostic-prev)
inoremap <expr> <C-o> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<C-o>"
nnoremap [coc] <Nop>
nmap     <Leader>c [coc]
nnoremap <silent> [coc]l <cmd>CocList<CR>
nnoremap <silent> [coc]a <cmd>call CocAction('codeAction')<CR>

command! Format call CocAction('format')

augroup cocgroup
  autocmd!
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" coc-snippets config
let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" coc-go config
augroup cocGoGroup
  autocmd!
  autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
  autocmd BufEnter *.go :silent nnoremap <silent> <Leader>go <cmd>CocCommand go.impl.cursor<CR>
augroup END

command! GoBinaryUpdates CocCommand go.install.tools

"""""""""""""""""""""""""""""""""""""""""
" sheerun/vim-polyglot
"""""""""""""""""""""""""""""""""""""""""
" same as vim-go configuration
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_functions = 1

"""""""""""""""""""""""""""""""""""""""""
" miyakogi/seiya.vim
"""""""""""""""""""""""""""""""""""""""""
let g:seiya_auto_enable = 1
let g:seiya_target_groups = has('nvim') ? ['guibg'] : ['ctermbg']

"""""""""""""""""""""""""""""""""""""""""
" lambdalisue/fern.vim
"""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader>v <cmd>Fern . -width=40 -stay -reveal=% -drawer -toggle<CR>

augroup my-fern-highlight
  autocmd!
  autocmd User FernHighlight call s:on_highlight()
augroup END

augroup my-fern
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

function! s:on_highlight() abort
  highlight link FernRootSymbol Identifier
  highlight link FernRootText Identifier
  highlight link FernBranchText Identifier
endfunction

function! s:init_fern() abort
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> S <Plug>(fern-action-open:select)
  nmap <buffer> / <Plug>(fern-action-reveal)
endfunction

" lambdalisue/nerdfont.vim and lambdalisue/fern-renderer-nerdfont.vim configuration
let g:fern#renderer = "nerdfont"

" lambdalisue/glyph-palette.vim configuration
augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

"""""""""""""""""""""""""""""""""""""""""
" https://tpope.io/vim/fugitive.git
"""""""""""""""""""""""""""""""""""""""""
set diffopt=vertical

"""""""""""""""""""""""""""""""""""""""""
" skanehira/preview-markdown.vim
"""""""""""""""""""""""""""""""""""""""""
let g:preview_markdown_vertical = 1

"""""""""""""""""""""""""""""""""""""""""
" junegunn/vim-easy-align
"""""""""""""""""""""""""""""""""""""""""
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

"""""""""""""""""""""""""""""""""""""""""
" previm/previm
"""""""""""""""""""""""""""""""""""""""""
if s:is_run_in_wsl()
  let g:previm_open_cmd = 'explorer.exe'
  let g:previm_wsl_mode = 1
endif

"""""""""""""""""""""""""""""""""""""""""
" preservim/tagbar
"""""""""""""""""""""""""""""""""""""""""
let g:tagbar_map_showproto = ','
nnoremap <silent> <leader>t :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""
" justinmk/vim-sneak
"""""""""""""""""""""""""""""""""""""""""
let g:sneak#label = 1

"""""""""""""""""""""""""""""""""""""""""
" jbyuki/instant.nvim
"""""""""""""""""""""""""""""""""""""""""
let g:instant_username = "ryutah"
let g:sneak#f_reset = 0
