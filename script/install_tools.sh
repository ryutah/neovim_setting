#!/bin/sh
nvim_lib_dir=$HOME/.local/nvim

set -eux

###############################################
# Go
###############################################
go get -u golang.org/x/lint/golint honnef.co/go/tools/cmd/staticcheck

# Extend tool for golang.org/x/tools/cmd/gopls
export GO111MODULE=on
git clone -b bingo https://github.com/saibing/tools.git
pushd tools/cmd/gopls && go install
popd && rm -rf tools && export GO111MODULE=auto


###############################################
# Rust
###############################################
rustup component add \
  rls \
  rust-analysis \
  rust-src \
  rustfmt


###############################################
# JavaScript, TypeScript
###############################################
npm install -g \
  javascript-typescript-langserver \
  vue-language-server \
  eslint \
  tslint \
  prettier \
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
go get github.com/jackc/sqlfmt/...


###############################################
# Haskell
###############################################
hie_version="8.4.4 8.6.3"

cd ${nvim_lib_dir}
wd=`pwd`

git clone https://github.com/haskell/haskell-ide-engine --recursive
pushd haskell-ide-engine

echo ${hie_version} | xargs -n 1 -I VERSION stack ./install.hs hie-VERSION
echo ${hie_version} | xargs -n 1 -I VERSION stack ./install.hs build-doc

popd && rm -rf haskell-ide-engine


###############################################
# OCaml
###############################################
npm install -g ocaml-language-server


###############################################
# Scala
###############################################
coursier bootstrap \
  --java-opt -Xss4m \
  --java-opt -Xms100m \
  --java-opt -Dmetals.client=coc.nvim \
  org.scalameta:metals_2.12:0.7.0 \
  -r bintray:scalacenter/releases \
  -r sonatype:snapshots \
  -o $HOME/.local/bin/metals-vim -f

coursier bootstrap \
  org.scalameta:scalafmt-cli_2.12:2.0.0 \
  -r sonatype:snapshots \
  -o $HOME/.local/bin/scalafmt \
  --standalone \
  --main org.scalafmt.cli.Cli
