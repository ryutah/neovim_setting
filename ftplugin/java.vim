" Set auto indent tab size
set shiftwidth=4

" javaid.vim setting
let g:java_highlight_all       = 1
let g:java_highlight_debug     = 1
let g:java_allow_cpp_keywords  = 1
let g:java_space_errors        = 1
let g:java_highlight_functions = 1
let g:EclimCompletionMethod    = 'omnifunc'
" Split screen controlls
nnoremap [java] <Nop>
nmap     <Leader>j [java]
nnoremap <silent> [java]d  :JavaDocPreview<CR>
nnoremap <silent> [java]nc :JavaNew class<Space>
nnoremap <silent> [java]ni :JavaNew interface<Space>
nnoremap <silent> [java]r  :Java<CR>
nnoremap <silent> [java]i  :JavaImport<Space>
nnoremap <silent> [java]o  :JavaImpl<CR>
nnoremap <silent> [java]f  :%JavaFormat<CR>:JavaImportOrganize<CR>
nnoremap <silent> [java]c  :JavaConstructor<CR>
nnoremap <silent> [java]e  :JavaRename<Space>
nnoremap <silent> [java]m  :JavaMove<Space>
nnoremap <silent> [java]s  :JavaSearchContext<CR>
" nnoremap <silent> [java]u  :RefactorUndo<CR>
" nnoremap <silent> [java]c  :JavaCorrect<CR>
