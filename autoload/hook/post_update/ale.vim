function! hook#post_update#ale#load() abort
  " Go linter
  if !executable("golint")
    !go get -u github.com/golang/lint/golint
  endif

  " Rust linter
  if !executable("rustfmt")
    !rustup component add rustfmt-preview --toolchain=nightly
  endif

  " Javascript linter
  if !executable("eslint")
    !npm i -g eslint
  endif

  if !executable("tslint")
    !npm i -g tslint
  endif

  if !executable("tsserver")
    !npm i -g typescript
  endif

  " Python linter
  if !executable("autopep8")
    !pip install -U autopep8
  endif
  if !executable("flake8")
    !pip install -U flake8
  endif

  " Ruby linter
  if !executable("rubocop")
    !gem install rubocop
  endif

  " Java formatter
  if !executable(g:outher_package_path . "/google_java_format")
    execute "!wget -O " . expand(g:outher_package_path) . "/google-java-format.jar https://github.com/google/google-java-format/releases/download/google-java-format-1.6/google-java-format-1.6-all-deps.jar"
    execute "!echo '#!/bin/sh\njava -jar /Users/ryuta/.local/nvim/google-java-format.jar --aosp $*' > " . expand(g:outher_package_path) "/google_java_format"
    execute "!chmod +x ". expand(g:outher_package_path) "/google_java_format"
  endif

  " SQL formatter
  if !executable("sqlfmt")
    execute "!go get github.com/jackc/sqlfmt/..."
  endif
endfunction
