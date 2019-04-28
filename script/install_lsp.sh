#!/bin/sh

set -e

###############################################
# Go
###############################################
go get golang.org/x/tools/cmd/gopls


###############################################
# Rust
###############################################
rustup component add rls rust-analysis rust-src


###############################################
# JavaScript, TypeScript
###############################################
npm install -g javascript-typescript-langserver


###############################################
# Python
###############################################
pip install -U python-language-server


###############################################
# Haskell
###############################################
hie_version="8.4.4 8.6.3"

cd $HOME/.local/nvim
wd=`pwd`

git clone https://github.com/haskell/haskell-ide-engine --recursive
cd haskell-ide-engine

echo ${hie_version} | xargs -n 1 -I VERSION make hie-VERSION
echo ${hie_version} | xargs -n 1 -I VERSION stack --stack-yaml stack-VERSION.yaml exec hoogle generate
