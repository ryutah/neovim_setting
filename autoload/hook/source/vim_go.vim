function! hook#source#vim_go#load() abort
  let g:go_info_mode = 'gopls'
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_generate_tags = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_types = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_functions = 1
  let g:go_gocode_unimported_packages = 1

  " Use w0rp/ale to format code on save.
  let g:go_fmt_autosave = 0

  " Use Language Server
  let g:go_def_mapping_enabled = 0
  let g:go_doc_keywordprg_enabled = 1
endfunction
