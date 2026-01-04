#!/bin/bash
set -e

mkdir -p build
cd build

if [ "$1" = "win" ]; then
    echo "making windows clang tools"
    cmake -G "MinGW Makefiles" \
        -DCMAKE_BUILD_TYPE=Release\
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"\
        -DLLVM_STATIC_CLANG_FORMAT\
        -DLLVM_STATIC_CLANG_TIDY\
        ../llvm
    mingw32-make.exe -j8
else
    echo "making unix clang tools"
    cmake -G "Ninja" \
        -DCMAKE_BUILD_TYPE=Release\
        -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra"\
        -DLLVM_STATIC_CLANG_FORMAT\
        -DLLVM_STATIC_CLANG_TIDY\
        ../llvm
    ninja -j8
fi
