#! /bin/sh

# fix issue with github action
export SHEL=/bin/bash

# install requirements
sudo ./ubuntu-dependencies.sh

# number of CPU Core
n=`cat /proc/cpuinfo | grep "cpu cores" | uniq | awk {print $NF}`

# build workspace
set -e
cd build/workspaces/
./clean-workspaces.sh
./update-workspaces.sh --with-system-nvtt --with-system-mozjs45 --disable-atlas -j $n

# build tests
cd gcc
make clean
make -j $n
make test -j $n

# run tests
../../../binaries/system/test
