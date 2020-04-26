#!/bin/sh

# fix the fucking error with stupid github action
export SHELL=/bin/bash

# install dependencies
sudo ./ubuntu-dependencies.sh

# local variable (number of CPU cores)
n=`cat /proc/cpuinfo | grep "cpu cores" | uniq | awk '{print $NF}'`

# build workspace
set -e
cd build/workspaces/
./clean-workspaces.sh
./update-workspaces.sh --with-system-nvtt --with-system-mozjs45 --disable-atlas -j $n

# build tests
cd gcc
make clean
make -j $n

# run tests
cd ../../../binaries/system
test
