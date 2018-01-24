function! hook#add#vim_autoformat#load() abort
  augroup AutoIndentPreWrite
    autocmd!
    autocmd BufWrite * :Autoformat
  augroup END

  let g:autoformat_remove_trailing_spaces = 1

  " Custom formatter
  let g:formatdef_prettier    = '"prettier"'

  " Formatter setting
  let g:formatters_go         = ['goimports']
  let g:formatters_rust       = ['rustfmt']
  let g:formatters_python     = ['autopep8']
  let g:formatters_javascript = ['prettier', 'eslint_local']
  let g:formatters_typescript = ['prettier']
  let g:formatters_css        = ['prettier']
  let g:formatters_scss       = ['prettier']
  let g:formatters_json       = ['prettier']
  let g:formatters_ruby       = ['rubocop']
  let g:formatters_html       = ['htmlbeautify']
endfunction
