#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

# Install Go tools
cat ./tools/tools.go | awk -F"\"" '/_/ {print $2}' | xargs -tI {} go install {}

# Install Node tools
npm ci
ls ./node_modules/.bin | xargs -tI {} ln -f -s $(pwd)/node_modules/.bin/{} ${HOME}/.local/bin/

# create symlink of snippets
coc_config_path=${XDG_CONFIG_HOME:-$HOME/.config}/coc
mkdir -p ${coc_config_path}
ln -f -s $(pwd)/snippets/ultisnips ${coc_config_path}/ultisnips
