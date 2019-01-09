#!/bin/sh

nvim_lib_dir=$HOME/.local/nvim
google_java_format_version=1.6

# go
if !type "golint" > /dev/null 2>&1; then
  go get -u github.com/golang/lint/golint
fi

# rust
if !type "rustfmt" > /dev/null 2>&1; then
  rustup component add rustfmt-preview --toolchain=nightly
fi

# javascript typescript
if !type "eslint" > /dev/null 2>&1; then
  npm i -g eslint
fi
if !type "tslint" > /dev/null 2>&1; then
  npm i -g tslint
fi
if !type "tsserver" > /dev/null 2>&1; then
  npm i -g tsserver
fi

# pythong
if !type "autopep8" > /dev/null 2>&1; then
  pip install -U autopep8
fi
if !type "flake8" > /dev/null 2>&1; then
  pip install -U flake8
fi

# ruby
if !type "rubocop" > /dev/null 2>&1; then
  gem install rubocop
fi

# java
if [ ! -x $nvim_lib_dir/google_java_format ]; then
  wget -O $nvim_lib_dir/google-java-format.jar \
    https://github.com/google/google-java-format/releases/download/google-java-format-$google_java_format_version/google-java-format-$google_java_format_version-all-deps.jar
  echo '#!/bin/sh\njava -jar /Users/ryuta/.local/nvim/google-java-format.jar --aosp $*' > $nvim_lib_dir/google_java_format
  chmod +x $nvim_lib_dir/google-java-format
fi

# sql
if !type "sqlfmt" > /dev/null 2>&1; then
  go get github.com/jackc/sqlfmt/...
fi
