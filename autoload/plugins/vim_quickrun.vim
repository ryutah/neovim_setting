function! plugins#vim_quickrun#hook_source() abort
  let g:quickrun_config = {
        \   "_" : {
        \     "hook/close_unite_quickfix/enable_hook_loaded" : 1,
        \     "hook/unite_quickfix/enable_failure"           : 1,
        \     "hook/close_quickfix/enable_exit"              : 1,
        \     "hook/close_buffer/enable_failure"             : 1,
        \     "hook/close_buffer/enable_empty_data"          : 1,
        \     "outputter"                                    : "multi:buffer:quickfix",
        \     "hook/inu/enable"                              : 1,
        \     "hook/inu/wait"                                : 2,
        \     "outputter/buffer/split"                       : ":botright 8sp",
        \     "outputter/buffer/close_on_empty"              : 1,
        \     "hook/time/enable"                             : 0,
        \     "runner"                                       : "vimproc",
        \     "runner/vimproc/updatetime"                    : 40,
        \   },
        \ }

  call s:python_config()
  call s:ruby_config()
  call s:js_config()
  call s:haskell_config()
endfunction

function! s:python_config() abort
  " Python syntax check
  let s:pyflakes = executable("pyflakes3") ? "pyflakes3" :
        \          executable("python3")   ? "python3" :
        \          executable("pyflakes")  ? "pyflakes" :
        \          "python"
  let s:cmdopt = executable("pyflakes3") ? "" :
        \        executable("python3")   ? "-m pyflakes" :
        \        executable("pyflakes")  ? "" :
        \        "-m pyflakes"
  let g:quickrun_config["watchdogs_checker/pyflakes3"] = {
        \   "command"     : s:pyflakes,
        \   "cmdopt"      : s:cmdopt,
        \   "exec"        : "%c %o %s:p",
        \   "errorformat" : "%f:%l:%m"
        \ }
  let g:quickrun_config["python/watchdogs_checker"] = {
        \   "type" : "watchdogs_checker/pyflakes3"
        \ }
  unlet s:pyflakes
  unlet s:cmdopt
endfunction

function! s:ruby_config() abort
  "Ruby syntac check
  let g:quickrun_config["ruby/watchdogs_checker"] = {
        \   "type" : "watchdogs_checker/rubocop",
        \ }

endfunction

function! s:js_config() abort
  " Javascript syntax check
  if executable("eslint")
    let g:quickrun_config["javascript/watchdogs_checker"] = {
          \   "type" : "watchdogs_checker/eslint",
          \ }
    let g:quickrun_config["javascript.jsx/watchdogs_checker"] = {
          \   "type" : "watchdogs_checker/eslint",
          \ }
  endif
endfunction

function! s:haskell_config() abort
  let g:quickrun_config["haskell"] = { "type" : "haskell/stack" }
  let g:quickrun_config["haskell/stack"] = {
        \   "command" : "stack",
        \   "exec"    : "%c %o %s %a",
        \   "cmdopt"  : "runghc",
        \ }
endfunction
