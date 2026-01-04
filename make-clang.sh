#!/bin/bash
mkdir -p build
cd build

if [ "$1" = "win"]; then
    cmake -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" ../llvm
    mingw32-make.exe -j8
else
    cmake -G "Ninja" -DCMAKE_BUILD_TYPE=Release -DLLVM_ENABLE_PROJECTS="clang;clang-tools-extra" ../llvm
    ninja -j8
fi

