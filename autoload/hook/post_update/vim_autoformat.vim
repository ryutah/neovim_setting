function! hook#post_update#vim_autoformat#load() abort
  " Go formatter
  if !executable("goimports")
    !go get golang.org/x/tools/cmd/goimports
  endif

  " Rust formatter
  if !executable("rustfmt")
    !rustup component add rustfmt-preview --toolchain=nightly
  endif

  " Javascript formatter
  if !executable("eslint")
    !npm i -g eslint
  endif
  if !executable("prettier")
    !npm i -g prettier
  endif

  " Python formatter
  if !executable("autopep8")
    !pip install -U autopep8
  endif

  " Ruby formatter
  if !executable("rubocop")
    !gem install rubocop
  endif

  " HTML formatter
  if !executable("html-beautify")
    !npm i -g js-beautify
  endif

  " JSON formatter
  if !executable("fixjson")
    !npm i -g fixjson
  endif

  " Java formatter
  let l:google_java_formatter = expand(g:outher_package_path) . "/google-java-format-1.5-all-deps.jar"
  if !executable(l:google_java_formatter)
    execute "!wget https://github.com/google/google-java-format/releases/download/google-java-format-1.5/google-java-format-1.5-all-deps.jar -P " . expand(g:outher_package_path)
  endif
endfunction
