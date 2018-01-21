function! hook#add#ale#load() abort
  let g:ale_fix_on_save = 1
  let g:ale_pattern_options = {'\.min.js$': {'ale_enabled': 0}} " Disable lint on minify js.
  let g:ale_linters         = {
        \   'go': ['go build', 'go vet', 'golint'],
        \ }
  let g:ale_fixers = {
        \   'go': ['goimports'],
        \ }
endfunction
