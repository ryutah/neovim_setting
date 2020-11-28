#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

# Update Go tools
go get -u all
cat ./tools/tools.go | awk -F"\"" '/_/ {print $2}' | xargs -tI {} go install {}

# Update Node tools
npm update
ls ./node_modules/.bin | xargs -tI {} ln -f -s $(pwd)/node_modules/.bin/{} ${HOME}/.local/bin/
