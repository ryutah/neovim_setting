#!/usr/bin/env bash

set -eu

cd $(dirname $0)/..

# Install Go tools
cat ./tools/tools.go | awk -F"\"" '/_/ {print $2}' | xargs -tI {} go install {}
#
# # Install Node tools
npm ci
ls ./node_modules/.bin | xargs -tI {} ln -f -s $(pwd)/node_modules/.bin/{} ${HOME}/.local/bin/
