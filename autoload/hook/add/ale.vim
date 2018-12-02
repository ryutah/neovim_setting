function! hook#add#ale#load() abort
  let g:ale_sign_error = '✖'
  let g:ale_sign_warning = '⚠'
  let g:ale_sign_info = 'ℹ"'
  let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}} " Disable lint on minify js.
  let g:ale_rust_rustc_options = "-Z no-codegen"

  " Set to use merlin
  let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
  execute "set rtp+=" . g:opamshare . "/merlin/vim"

  let g:ale_linters = {
        \   'go': ['go build', 'go vet', 'golint'],
        \   'rust': ['cargo', 'rustc', 'rustfmt'],
        \   'javascript': ['eslint'],
        \   'typescript': ['tslint', 'tsserver'],
        \   'python': ['autopep8', 'flake8'],
        \   'dart': ['dartanalyzer', 'dartfmt'],
        \   'ocaml': ['merlin'],
        \ }
endfunction
