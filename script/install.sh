#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

# Path informations
wd=$(pwd)
bin_path=${HOME}/.local/bin
config_path=${XDG_CONFIG_HOME:-$HOME/.config}
data_path=${XDG_DATA_HOME:-$HOME/.local/share}

# Install vim-plug
if [[ ! -f ${data_path}/nvim/site/autoload/plug.vim ]]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi

mkdir -p ${bin_path}

# create neovim synlink to XDG_CONFIG_HOME
if [[ ! -d ${HOME}/.config/nvim ]]; then
  cd ${config_path} && ln -sf ${wd}/ nvim
fi
# create symlink for vimspector
cd ${HOME} && ln -sf ${wd}/.vimspector.json

cd ${wd}

source ./script/versions.sh

# Make simlink to extends scripts
ls ./script/extends | xargs -tI {} ln -f -s $(pwd)/script/extends/{} ${bin_path}/

# Install neovim extends
pip install -U pynvim autopep8

# Install Go tools
#   - golangci-lint-langserver
#     - for lsp of golangci-lint
#   - shfmt
#     - for shell script formatter
go install github.com/nametake/golangci-lint-langserver@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/mdempsky/gocode@latest
go install github.com/x-motemen/gore/cmd/gore@latest

# Install Node tools
npx npm-check-updates -u
npm install
ls ./node_modules/.bin | xargs -tI {} ln -f -s $(pwd)/node_modules/.bin/{} ${bin_path}/

# create symlink of snippets
coc_config_path=${config_path}/coc
mkdir -p ${coc_config_path}
ln -f -s $(pwd)/snippets/ultisnips ${coc_config_path}/

####################################################################
# work with tmp directory
####################################################################
mkdir -p tmp && cd tmp

# for protocol buffer formatter
clang_llvm_file="clang+llvm-${CLANG_LLVM_VERSION}-x86_64-linux-gnu-ubuntu-${OS_VERSION}"
wget https://github.com/llvm/llvm-project/releases/download/llvmorg-${CLANG_LLVM_VERSION}/${clang_llvm_file}.tar.xz
tar xvf ${clang_llvm_file}.tar.xz
mv ${clang_llvm_file}/bin/clang-format ${bin_path}/

# for terraform lsp
terraform_lsp_file="terraform-ls_${TERRAFORM_LSP_VERSION}_linux_amd64"
wget https://releases.hashicorp.com/terraform-ls/${TERRAFORM_LSP_VERSION}/${terraform_lsp_file}.zip
unzip ${terraform_lsp_file}.zip
mv terraform-ls ${bin_path}/

# for plantuml
wget https://github.com/plantuml/plantuml/releases/download/v${PLANT_UML_VERSION}/plantuml-${PLANT_UML_VERSION}.jar
mv plantuml-${PLANT_UML_VERSION}.jar ${bin_path}/plantuml.jar
chmod +x ${bin_path}/plantuml.jar

# move to working directory and remove tmp directory
cd ${wd} && rm -rf tmp

####################################################################
