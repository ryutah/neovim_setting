#!/bin/sh
set -eux

go get -u golang.org/x/lint/golint honnef.co/go/tools/cmd/staticcheck golang.org/x/tools/...
