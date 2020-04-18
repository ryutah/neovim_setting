function! hook#add#ale#load() abort
  let g:ale_sign_error = '✖'
  let g:ale_sign_warning = '⚠'
  let g:ale_sign_info = 'ℹ"'
  let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}} " Disable lint on minify js.
  let g:ale_fix_on_save = 1

  let g:ale_javascript_prettier_options = '--tab-width="' . shiftwidth() . '" --trailing-comma es5 --arrow-parens=always'
  let g:ale_java_google_java_format_executable = g:outher_package_path . '/google_java_format'
  let g:ale_sql_pgformatter_options = '-s 2 -u 2 -B'
  let g:ale_go_staticcheck_lint_package = 1
  let g:ale_lint_on_text_changed = 'never'

  " Set to use merlin
  if executable("opam")
    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"
  endif

  call s:markdownlint_define()

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
        \   'graphql': ['prettier'],
        \ }

  let g:ale_linters = {
        \   'go': ['go build', 'go vet', 'staticcheck', 'golangci-lint'],
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint', 'tsserver'],
        \   'python': ['autopep8', 'flake8'],
        \   'dart': ['dartanalyzer', 'dartfmt'],
        \   'markdown': ['mymarkdownlint'],
        \ }
endfunction

function! s:markdownlint_define() abort
  call ale#linter#Define('markdown', {
  \   'name': 'mymarkdownlint',
  \   'executable': 'markdownlint',
  \   'lint_file': 1,
  \   'output_stream': 'both',
  \   'command': 'markdownlint %s',
  \   'callback': 'hook#add#ale#markdownlint_handle'
  \})
endfunction

function! hook#add#ale#markdownlint_handle(buffer, lines) abort
  let l:pattern = ':\(\d*\) \(MD\d\{3}\)\(\/\)\([A-Za-z0-9-]\+\)\(.*\)$'
  let l:output = []

  for l:match in ale#util#GetMatches(a:lines, l:pattern) 
    call add(l:output, {
        \ 'lnum': l:match[1] + 0,
        \ 'text': '(' . l:match[2] . l:match[3] . l:match[4] . ')' . l:match[5],
        \ 'type': 'W',
        \ })
  endfor

  return l:output
endfunction
