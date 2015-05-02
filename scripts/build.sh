#!/usr/bin/env bash

set -o pipefail

CMAKEOPTIONS=${CMAKEOPTIONS:-false}
rm -rf build
mkdir -p build
cd build
if [[ ${CMAKEOPTIONS} == false ]]; then
    cmake ../ -DCMAKE_INSTALL_PREFIX=${MASON_HOME} \
        -DCMAKE_CXX_COMPILER="${CXX}" \
        -DBoost_NO_SYSTEM_PATHS=ON \
        -DTBB_INSTALL_DIR=${MASON_HOME} \
        -DCMAKE_INCLUDE_PATH=${MASON_HOME}/include \
        -DCMAKE_LIBRARY_PATH=${MASON_HOME}/lib \
        -DCMAKE_BUILD_TYPE=Release
else
    cmake ../ ${CMAKEOPTIONS} -DBUILD_TOOLS=1
fi
