#! /bin/sh

# fix issue with github action
export SHELL=/bin/bash

# navigate to test bundle
cd build/workspaces/gcc/

# run tests
../../../binaries/system/test
