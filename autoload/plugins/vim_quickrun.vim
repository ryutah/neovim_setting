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
  call s:go_config()
  call s:java_config()
  call s:typescript_config()
endfunction

function! s:python_config() abort
  " Python syntax check
  "   let s:flake8 = glob("$PYTHON_PATH/flake8")  ? $PYTHON_PATH . "flake8" :
  "         \        glob("$PYTHON_PATH/python3") ? $PYTHON_PATH . "python3" :
  "         \        "python"
  let g:quickrun_config["watchdogs_checker/flake8"] = {
        \   "command"     : $PYTHON_PATH . "/flake8",
        \   "cmdopt"      : "",
        \   "exec"        : "%c %o %s:p",
        \   "quickfix/errorformat" : "%f:%l:%m",
        \ }
  let g:quickrun_config["python/watchdogs_checker"] = {
        \   "type" : "watchdogs_checker/flake8",
        \ }
  "   unlet s:flake8
endfunction

function! s:ruby_config() abort
  "Ruby syntac check
  let g:quickrun_config["watchdogs_checker/rubocop"] = {
        \   "command"                 : "rubocop",
        \   "cmdopt"                  : "-fe",
        \   "exec"                    : "%c %o %s:p",
        \   "quickfix/errorformat"    : "%f:%l:%c:\ %t:\ %m",
        \ }
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

function! s:go_config() abort
  " vim-goでチェックされるため、watchdogsでのlintを解除
  let g:quickrun_config["go/watchdogs_checker"] = { "type" : "watchdogs_checker/golint" }
endfunction

function! s:java_config() abort
  let g:quickrun_config["java/watchdogs_checker"] = { "type" : "" }
endfunction

function! s:typescript_config() abort
  let g:quickrun_config["watchdogs_checker/tslint"] = {
        \   "command"                 : "tslint",
        \   "cmdopt"                  : "-t msbuild",
        \   "exec"                    : "%c %o %s:p",
        \   "quickfix/errorformat"    : "%f(%l\\,%c):\ %t%*[^:]\ %m",
        \ }
  let g:quickrun_config["typescript/watchdogs_checker"] = { "type" : "watchdogs_checker/tslint" }
endfunction
