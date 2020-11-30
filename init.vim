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
execute 'set undodir=' . stdpath('cache') . '/undo'

let g:python3_host_prog = expand('$PYTHON3_PATH')
" Too heavy
let g:polyglot_disabled = ['vue']

"""""""""""""""""""""""""""""""""""""""""
" plugins
"""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')
" Text Extends
Plug 'tpope/vim-surround'
Plug 'https://tpope.io/vim/repeat.git'
Plug 'junegunn/vim-easy-align'
Plug 'jiangmiao/auto-pairs'

" Color Scheme
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'

" Vim UI / UX
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'miyakogi/seiya.vim'
Plug 'lambdalisue/fern.vim'
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

" Git Extends
Plug 'https://tpope.io/vim/fugitive.git'
Plug 'airblade/vim-gitgutter'

" Coc Extensions
Plug 'neoclide/coc-snippets', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-yaml', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-vetur', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-tsserver', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-python', { 'do': 'yarn install --frozen-lockfile' }
Plug 'neoclide/coc-json', { 'do': 'yarn install --frozen-lockfile' }
Plug 'josa42/coc-sh', { 'do': 'yarn install --frozen-lockfile' }
Plug 'josa42/coc-go', { 'do': 'yarn install --frozen-lockfile' }
Plug 'josa42/coc-docker', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-rust-analyzer', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-sql', { 'do': 'yarn install --frozen-lockfile' }
Plug 'fannheyward/coc-marketplace', { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-diagnostic', { 'do': 'yarn install --frozen-lockfile' }
Plug 'iamcco/coc-vimlsp', { 'do': 'yarn install --frozen-lockfile' }
call plug#end()

"""""""""""""""""""""""""""""""""""""""""
" keymapping
"""""""""""""""""""""""""""""""""""""""""
let mapleader = "\<Space>"

" cursor keymap
noremap k gk
noremap gj j
noremap gk k
noremap <S-h> ^
noremap <S-l> $
noremap <S-f> %
nnoremap <C-h> H
nnoremap <C-l> L

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
colorscheme ayu

"""""""""""""""""""""""""""""""""""""""""
" tyru/caw.vim
"""""""""""""""""""""""""""""""""""""""""
nmap <C-_> <Plug>(caw:hatpos:toggle)
vmap <C-_> <Plug>(caw:hatpos:toggle)

"""""""""""""""""""""""""""""""""""""""""
" vim-airline/vim-airline
"""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='wombat'

"""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim
"""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> <Leader><Leader>f <cmd>Files<CR>
nnoremap <silent> <Leader><Leader>b <cmd>Buffers<CR>
nnoremap <silent> <Leader><Leader>g <cmd>Rg<CR>
nnoremap <silent> <Leader><Leader>t <cmd>BTags<CR>
" refs: https://github.com/junegunn/fzf.vim/issues/772
let g:fzf_action = {
\ 'ctrl-t': 'tab split',
\ 'ctrl-i': 'split',
\ 'ctrl-s': 'vsplit',
\ 'ctrl-y': { lines -> setreg('*', join(lines, "\n")) }
\}

"""""""""""""""""""""""""""""""""""""""""
" neoclide/coc.nvim
"""""""""""""""""""""""""""""""""""""""""
set hidden
set updatetime=300

nnoremap <silent> K :call <SID>show_documentation()<CR>
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
inoremap <expr> <C-o> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<C-o>"
nnoremap [coc] <Nop>
nmap     <Leader>c [coc]
nnoremap <silent>  [coc]l <cmd>CocList<CR>

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
