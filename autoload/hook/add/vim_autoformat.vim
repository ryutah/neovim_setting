function! hook#add#vim_autoformat#load() abort
  let g:autoformat_remove_trailing_spaces = 1

  " Custom formatter
  let g:formatdef_prettierjs            = '"prettier --stdin --stdin-filepath ".expand("%:p").(&textwidth ? " --print-width ".&textwidth : "")." --tab-width=".shiftwidth()." --trailing-comma es5 --arrow-parens=always"'
  let g:formatdef_prettierts            = '"prettier --single-quote --stdin --stdin-filepath ".expand("%:p").(&textwidth ? " --print-width ".&textwidth : "")." --tab-width=".shiftwidth()." -parser typescript --trailing-comma all --arrow-parens=always"'
  let g:formatdef_nightly_rustfmt       = '"rustup run nightly rustfmt"'
  let g:formatdef_google_java_formatter = '"java -jar ' . g:outher_package_path . '/' . g:google_java_formatter . ' - --aosp"'

  " Formatter setting
  let g:formatters_go         = ['goimports']
  let g:formatters_rust       = ['nightly_rustfmt']
  let g:formatters_python     = ['autopep8']
  let g:formatters_javascript = ['prettierjs', 'eslint_local']
  let g:formatters_typescript = ['prettierts']
  let g:formatters_css        = ['prettier']
  let g:formatters_scss       = ['prettier']
  let g:formatters_ruby       = ['rubocop']
  let g:formatters_html       = ['htmlbeautify']
  let g:formatters_json       = ['fixjson']
  let g:formatters_java       = ['google_java_formatter']

  call s:set_autoformat("go", "rb", "rs", "py", "js", "mjs", "ts", "vim", "html", "json", "css", "scss", "sass", "less", "java")
endfunction

function! s:set_autoformat(...) abort
  augroup AutoIndentPreWrite
    autocmd!
  augroup End

  for var in a:000
    let l:cmd = 'autocmd AutoIndentPreWrite BufWrite *.' . var . ' :Autoformat'
    execute l:cmd
  endfor
endfunction
