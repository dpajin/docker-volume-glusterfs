#!/bin/bash

set -e
set -x

#install
go get -u golang.org/x/lint/golint

#script
test -z "$(go vet ./... | grep -v vendor/ | tee /dev/stderr)"
test -z "$(golint ./... | grep -v vendor/ | tee /dev/stderr)"
test -z "$(gofmt -s -l . | grep -v vendor/ | tee /dev/stderr)"
go list ./... | go test -v
