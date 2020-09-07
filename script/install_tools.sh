#!/bin/sh
nvim_lib_dir=$HOME/.local/nvim

set -eux

###############################################
# Go
###############################################
go get -u golang.org/x/tools/cmd/goimports
curl -sSfL https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

###############################################
# JavaScript, TypeScript
###############################################
npm install -g \
  eslint \
  prettier \
  fixjson \
  typescript

###############################################
# Python
###############################################
pip install -U \
  autopep8 \
  flake8

###############################################
# Ruby
###############################################
gem install rubocop

###############################################
# OCaml
###############################################
npm install -g ocaml-language-server

###############################################
# Markdown
###############################################
npm install -g markdownlint-cli
