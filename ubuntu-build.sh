#! /bin/sh

# fix issue with github action
export SHELL=/bin/bash

# install requirements
sudo ./ubuntu-dependencies.sh

# build workspace
cd build/workspaces/
./clean-workspaces.sh -j5
./update-workspaces.sh -j5

# build tests
cd gcc
make clean
make -j5
make test -j5

# run tests
../../../binaries/system/test
