#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

# Path informations
wd=$(pwd)
bin_path=${HOME}/.local/bin
config_path=${XDG_CONFIG_HOME:-$HOME/.config}
data_path=${XDG_DATA_HOME:-$HOME/.local/share}

################################################################
# setup nvim config
################################################################
if [[ ! -d ${config_path}/nvim ]]; then
  ln -sf ${wd} ${config_path}/nvim
fi
################################################################

################################################################
# Install vim-plug
################################################################
if [[ ! -f ${data_path}/nvim/site/autoload/plug.vim ]]; then
  sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim \
    --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
fi
################################################################

mkdir -p ${bin_path}

################################################################
# create symlinks
################################################################
# create neovim synlink to XDG_CONFIG_HOME
if [[ ! -d ${HOME}/.config/nvim ]]; then
  cd ${config_path} && ln -sf ${wd}/ nvim
fi
# create symlink for vimspector
cd ${HOME} && ln -sf ${wd}/.vimspector.json

cd ${wd}

# Make simlink to extends scripts
ls ./script/extends | xargs -tI {} ln -f -s ${wd}/script/extends/{} ${bin_path}/
################################################################

################################################################
# install plugins and tools
################################################################
source ./script/versions.sh

# Install neovim extends
#   - pynvim
#     - neovim plugin
#   - autopep8
#     - python linter
#   - black
#     - python linter
#   - sqlfluff
#     - linter and formatter of sql, dbt, etc
pip install -U pynvim autopep8 black sqlfluff

# Install Go tools
#   - golangci-lint-langserver
#     - for lsp of golangci-lint
#   - shfmt
#     - for shell script formatter
#   - gore
#     - golang REPL
#   - gocode
#     - auto completion for gore
#   - bufls
#     - lsp server for protocol buffer
go install github.com/nametake/golangci-lint-langserver@latest
go install mvdan.cc/sh/v3/cmd/shfmt@latest
go install github.com/go-delve/delve/cmd/dlv@latest
go install github.com/mdempsky/gocode@latest
go install github.com/x-motemen/gore/cmd/gore@latest
go install github.com/bufbuild/buf-language-server/cmd/bufls@latest

# install golangci-lint
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin ${GOLANGCI_LINT_VERSION}

# Install Node tools
npm install -g yarn
npx npm-check-updates -u
npm install
ls ./node_modules/.bin | xargs -tI {} ln -f -s $(pwd)/node_modules/.bin/{} ${bin_path}/

# work with tmp directory
mkdir -p tmp && cd tmp

# for terraform lsp
terraform_lsp_file="terraform-ls_${TERRAFORM_LSP_VERSION}_linux_amd64"
wget https://releases.hashicorp.com/terraform-ls/${TERRAFORM_LSP_VERSION}/${terraform_lsp_file}.zip
unzip ${terraform_lsp_file}.zip
mv terraform-ls ${bin_path}/

# for plantuml
wget https://github.com/plantuml/plantuml/releases/download/v${PLANT_UML_VERSION}/plantuml-${PLANT_UML_VERSION}.jar
mv plantuml-${PLANT_UML_VERSION}.jar ${bin_path}/plantuml.jar
chmod +x ${bin_path}/plantuml.jar

# install rust tools

cargo install tree-sitter-cli

# move to working directory and remove tmp directory
cd ${wd} && rm -rf tmp

####################################################################

################################################################
# coc settins
################################################################
# create symlink of coc
#  1. snippets
#  2. extentions
coc_config_path=${config_path}/coc
mkdir -p ${coc_config_path}
mkdir -p ${coc_config_path}/extensions
ln -f -s ${wd}/snippets/ultisnips ${coc_config_path}/
ln -f -s ${wd}/coc-package.json ${coc_config_path}/extensions/package.json

# install coc extentions
cd ${coc_config_path}/extensions && npm install
################################################################
################################################################
