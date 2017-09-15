#!/bin/bash

set -e

# Test suite configuration
export CC_FLAGS="-std=c++98"
export DEBUG=0

# Run perf test for each branch
for branch in performance_test master dma deppart; do
#for branch in master dma deppart; do
    if [[ -d _legion_$branch ]]; then
        pushd _legion_$branch 
        git pull --ff-only 
        git reset --hard HEAD
        git clean -fdx
        popd
    else
        git clone -b $branch https://github.com/StanfordLegion/legion.git _legion_$branch
    fi
    pushd _legion_$branch
    pushd language
    ./scripts/setup_env_titan.bash
    popd
    ./test.py --test=perf
    popd
done
