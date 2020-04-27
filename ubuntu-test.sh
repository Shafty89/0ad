#! /bin/sh

# fix issue with github action
export SHELL=/bin/bash

# navigate to tests
cd ../../../binaries/system

# run tests
test
