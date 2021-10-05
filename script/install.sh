#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..
wd=$(pwd)

mkdir -p ${HOME}/.config/nvim
mkdir -p ${HOME}/.local/bin
cd ${HOME}/.config/nvim && ln -sf ${wd}/init.vim

cd ${wd}

source ./script/versions.sh

# Make simlink to extends scripts
ls ./script/extends | xargs -tI {} ln -f -s $(pwd)/script/extends/{} ${HOME}/.local/bin/

# Install neovim extends
pip install -U pynvim

# Install Go tools
#   - golangci-lint-langserver
#     - for lsp of golangci-lint
#   - shfmt
#     - for shell script formatter
go install github.com/nametake/golangci-lint-langserver@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest

# Install Node tools
mkdir -p ${HOME}/.local/bin
npx npm-check-updates -u
npm install
ls ./node_modules/.bin | xargs -tI {} ln -f -s $(pwd)/node_modules/.bin/{} ${HOME}/.local/bin/

# create symlink of snippets
coc_config_path=${XDG_CONFIG_HOME:-$HOME/.config}/coc
mkdir -p ${coc_config_path}
ln -f -s $(pwd)/snippets/ultisnips ${coc_config_path}/

mkdir -p tmp && cd tmp

# for protocol buffer formatter
clang_llvm_file="clang+llvm-${CLANG_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-${OS_VERSION}"
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-${CLANG_LLVM_VERSION}/${clang_llvm_file}.tar.xz
tar xvf ${clang_llvm_file}.tar.xz
mv ${clang_llvm_file}/bin/clang-format $HOME/.local/bin/

# for terraform lsp
terraform_lsp_file="terraform-ls_${TERRAFORM_LSP_VERSION}_linux_amd64"
wget https://releases.hashicorp.com/terraform-ls/${TERRAFORM_LSP_VERSION}/${terraform_lsp_file}.zip
unzip ${terraform_lsp_file}.zip
mv terraform-ls $HOME/.local/bin/

cd .. && rm -rf tmp
