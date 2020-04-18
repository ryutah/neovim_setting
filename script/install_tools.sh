#!/bin/sh
nvim_lib_dir=$HOME/.local/nvim

set -eux

###############################################
# Go
###############################################
go get -u honnef.co/go/tools/cmd/staticcheck golang.org/x/tools/cmd/...

###############################################
# JavaScript, TypeScript
###############################################
npm install -g \
  eslint \
  tslint \
  prettier \
  fixjson \
  typescript

###############################################
# Python
###############################################
pip install -U \
  python-language-server \
  autopep8 \
  flake8

###############################################
# Ruby
###############################################
gem install rubocop

###############################################
# Java
###############################################
google_java_format_version=1.7
wget -O ${nvim_lib_dir}/google-java-format.jar \
  https://github.com/google/google-java-format/releases/download/google-java-format-${google_java_format_version}/google-java-format-${google_java_format_version}-all-deps.jar
rm -rf ${nvim_lib_dir}/google_java_format
echo '#!/bin/sh\njava -jar /Users/ryuta/.local/nvim/google-java-format.jar --aosp $*' > ${nvim_lib_dir}/google_java_format
chmod +x ${nvim_lib_dir}/google_java_format

# TODO: Eclipse LSP JDT Install


###############################################
# SQL
###############################################
# go get github.com/jackc/sqlfmt/...

###############################################
# OCaml
###############################################
npm install -g ocaml-language-server

###############################################
# Markdown
###############################################
npm install -g markdownlint-cli
