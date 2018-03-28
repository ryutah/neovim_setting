function! hook#add#vim_autoformat#load() abort
  augroup AutoIndentPreWrite
    autocmd!
    autocmd BufWrite *.go :Autoformat
    autocmd BufWrite *.rb :Autoformat
    autocmd BufWrite *.rs :Autoformat
    autocmd BufWrite *.py :Autoformat
    autocmd BufWrite *.js :Autoformat
    autocmd BufWrite *.mjs :Autoformat
    autocmd BufWrite *.ts :Autoformat
    autocmd BufWrite *.vim :Autoformat
    autocmd BufWrite *.html :Autoformat
    autocmd BufWrite *.json :Autoformat
    autocmd BufWrite *.css :Autoformat
    autocmd BufWrite *.scss :Autoformat
    autocmd BufWrite *.sass :Autoformat
    autocmd BufWrite *.less :Autoformat
  augroup END

  let g:autoformat_remove_trailing_spaces = 1

  " Custom formatter
  let g:formatdef_prettier        = '"prettier"'
  let g:formatdef_prettierjs      = '"prettier --trailing-comma es5 --arrow-parens=always"'
  let g:formatdef_nightly_rustfmt = '"rustup run nightly rustfmt"'

  " Formatter setting
  let g:formatters_go         = ['goimports']
  let g:formatters_rust       = ['nightly_rustfmt']
  let g:formatters_python     = ['autopep8']
  let g:formatters_javascript = ['prettierjs', 'eslint_local']
  let g:formatters_typescript = ['prettierjs']
  let g:formatters_css        = ['prettier']
  let g:formatters_scss       = ['prettier']
  let g:formatters_ruby       = ['rubocop']
  let g:formatters_html       = ['htmlbeautify']
  let g:formatters_json       = ['fixjson']
endfunction
