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
endfunction

