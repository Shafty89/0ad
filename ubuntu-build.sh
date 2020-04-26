#!/bin/sh

# build workspace
set -e
cd build/workspaces/
./clean-workspaces.sh
./update-workspaces.sh -j5

cd gcc
make clean
make -j5
make test -j5

# run tests
cd ../../../binaries/system
test
