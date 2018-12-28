#!/bin/sh

set -e

hie_version="8.4.4 8.6.3"

cd $HOME/.local/nvim

git clone https://github.com/haskell/haskell-ide-engine --recursive
cd haskell-ide-engine

echo ${hie_version} | xargs -n 1 -I VERSION make hie-VERSION
echo ${hie_version} | xargs -n 1 -I VERSION stack --stack-yaml stack-VERSION.yaml exec hoogle generate
