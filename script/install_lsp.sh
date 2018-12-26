#!/bin/sh

set -e

hie_version=8.4.4

cd $HOME/.local/nvim

git clone https://github.com/haskell/haskell-ide-engine --recursive
cd haskell-ide-engine

make hie-${hie_version}
stack --stack-yaml stack-${hie_version}.yaml exec hoogle generate
