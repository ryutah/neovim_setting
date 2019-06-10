function! hook#add#ale#load() abort
  let g:ale_sign_error = '✖'
  let g:ale_sign_warning = '⚠'
  let g:ale_sign_info = 'ℹ"'
  let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}} " Disable lint on minify js.
  let g:ale_rust_rustc_options = "-Z no-codegen"
  let g:ale_fix_on_save = 1

  let g:ale_javascript_prettier_options = '--tab-width="' . shiftwidth() . '" --trailing-comma es5 --arrow-parens=always'
  let g:ale_java_google_java_format_executable = g:outher_package_path . '/google_java_format'
  let g:ale_sql_pgformatter_options = '-s 2 -u 2'

  " Set to use merlin
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"

  let g:ale_fixers = {
        \   'go': ['goimports'],
        \   'rust': ['rustfmt'],
        \   'javascript': ['prettier', 'eslint'],
        \   'typescript': ['prettier', 'tslint'],
        \   'json': ['fixjson'],
        \   'yaml': ['prettier'],
        \   'ruby': ['rubocop'],
        \   'java': ['google_java_format'],
        \   'dart': ['dartfmt'],
        \   'html': ['prettier'],
        \   'python': ['autopep8'],
        \   'css': ['prettier'],
        \   'scss': ['prettier'],
        \   'haskell': ['hfmt'],
        \   'sql': ['pgformatter'],
        \ }

  let g:ale_linters = {
        \   'go': ['goimports', 'go build', 'go vet', 'golint'],
        \   'rust': ['rls'],
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint', 'tsserver'],
        \   'python': ['autopep8', 'flake8'],
        \   'dart': ['dartanalyzer', 'dartfmt'],
        \   'ocaml': ['merlin'],
        \ }
endfunction
