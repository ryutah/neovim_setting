function! plugins#vim_quickrun#hook_source() abort
  let g:quickrun_config = {
        \   "_" : {
        \       "hook/close_unite_quickfix/enable_hook_loaded" : 1,
        \       "hook/unite_quickfix/enable_failure" : 1,
        \       "hook/unite_quickfix/enable_exit" : 1,
        \       "hook/close_quickfix/enable_exit" : 1,
        \       "hook/close_buffer/enable_failure" : 1,
        \       "outputter" : "multi:buffer:quickfix",
        \       "hook/inu/enable" : 1,
        \       "hook/inu/wait" : 2,
        \       "outputter/buffer/split" : ":botright 8sp",
        \       "outputter/buffer/close_on_empty" : 1,
        \       "hook/time/enable" : 0,
        \       "runner" : "vimproc",
        \       "runner/vimproc/updatetime" : 40,
        \   },
        \}

  let g:quickrun_config["ruby/watchdogs_checker"] = {
        \ "type" : "watchdogs_checker/rubocop",
        \ }
  if executable("eslint")
    let g:quickrun_config["javascript/watchdogs_checker"] = {
          \ "type" : "watchdogs_checker/eslint",
          \ }
    let g:quickrun_config["javascript.jsx/watchdogs_checker"] = {
          \ "type" : "watchdogs_checker/eslint",
          \ }
  endif
endfunction
