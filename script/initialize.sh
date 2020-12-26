#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

# Install Go tools
cat ./tools/tools.go | awk -F"\"" '/_/ {print $2}' | xargs -tI {} go install {}

# Install Node tools
mkdir -p ${HOME}/.local/bin
npm ci
ls ./node_modules/.bin | xargs -tI {} ln -f -s $(pwd)/node_modules/.bin/{} ${HOME}/.local/bin/

# create symlink of snippets
coc_config_path=${XDG_CONFIG_HOME:-$HOME/.config}/coc
mkdir -p ${coc_config_path}
ln -f -s $(pwd)/snippets/ultisnips ${coc_config_path}/ultisnips

curl -L -o $HOME/.local/bin/mdr https://github.com/MichaelMure/mdr/releases/download/v0.2.5/mdr_darwin_amd64
chmod +x $HOME/.local/bin/mdr

pip install -U pynvim

mkdir -p tmp; cd tmp
# wget https://github.com/llvm/llvm-project/releases/download/llvmorg-11.0.0/clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz
tar xvf clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04.tar.xz
mv clang+llvm-11.0.0-x86_64-linux-gnu-ubuntu-20.04/bin/clang-format $HOME/.local/bin/
cd ..; rm -rf tmp
