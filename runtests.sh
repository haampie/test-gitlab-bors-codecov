#!/bin/bash

BUILD_DIR=/root/build

pushd $BUILD_DIR

ctest

popd

lcov --capture --directory $BUILD_DIR --output-file coverage.info

# No need to propagate CI variables.. sarus should do that automatically
bash <(curl -s https://codecov.io/bash) -f coverage.info
