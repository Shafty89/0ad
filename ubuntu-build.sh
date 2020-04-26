#!/bin/sh

# fix the fucking error with stupid github action
export SHELL=/bin/bash

# install dependencies
sudo ./ubuntu-dependencies.sh

# build workspace
cd build/workspaces/
./clean-workspaces.sh
./update-workspaces.sh -j5

# build tests
cd gcc
make clean
make test -j5

# run tests
cd ../../../binaries/system
test
