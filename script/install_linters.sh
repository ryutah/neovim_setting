#!/bin/sh

nvim_lib_dir=$HOME/.local/nvim
google_java_format_version=1.6

check_executable() {
  type "$1" > /dev/null 2>&1
}

# go
if ! check_executable golint; then
  go get -u github.com/golang/lint/golint
fi

# rust
if ! check_executable eslint; then
  rustup component add rustfmt-preview --toolchain=nightly
fi

# javascript typescript
if ! check_executable eslint; then
  npm i -g eslint
fi
if ! check_executable tslint; then
  npm i -g tslint
fi
if ! check_executable tsserver; then
  npm i -g tsserver
fi
if ! check_executable prettier; then
  npm i -g prettier
fi

# pythong
if ! check_executable autopep8; then
  pip install -U autopep8
fi
if ! check_executable flake8; then
  pip install -U flake8
fi

# ruby
if ! check_executable rubocop; then
  gem install rubocop
fi

# java
if [ ! -x $nvim_lib_dir/google_java_format ]; then
  wget -O $nvim_lib_dir/google-java-format.jar \
    https://github.com/google/google-java-format/releases/download/google-java-format-$google_java_format_version/google-java-format-$google_java_format_version-all-deps.jar
  echo '#!/bin/sh\njava -jar /Users/ryuta/.local/nvim/google-java-format.jar --aosp $*' > $nvim_lib_dir/google_java_format
  chmod +x $nvim_lib_dir/google_java_format
fi

# sql
if ! check_executable sqlfmt; then
  go get github.com/jackc/sqlfmt/...
fi
