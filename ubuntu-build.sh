#!/bin/sh

# fix issue with github action
export SHELL=/bin/bash

# update workspace
cd build/workspaces/
./update-workspaces.sh -j5

# make project and tests
cd gcc
make clean
make -j $n

