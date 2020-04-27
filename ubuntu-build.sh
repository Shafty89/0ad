#! /bin/sh

# fix issue with github action
export SHELL=/bin/bash

# update workspace
cd build/workspaces/
./clean-workspaces.sh -j5
./update-workspaces.sh -j5

# make project and tests
cd gcc
make clean
make -j5
make test -j5
