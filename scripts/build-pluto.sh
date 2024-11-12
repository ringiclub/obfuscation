#!/bin/bash

set -e

LLVM_VERSIONS=("16" "17" "18") # or you can also use $(llvm-config --version | cut -d'.' -f1) to get installed version
ARTIFACTS_DIR="artifacts"
RELEASE_DIR="release_files"

sudo apt-get update
sudo apt-get install -y git wget libseccomp-dev zip

git clone --recurse-submodules https://github.com/expend20/llvm-ob-passes
cd llvm-ob-passes

for LLVM_VERSION in "${LLVM_VERSIONS[@]}"; do
  wget https://apt.llvm.org/llvm.sh && chmod +x llvm.sh
  sudo ./llvm.sh "$LLVM_VERSION"

  sudo ln -sf /usr/bin/clang-"$LLVM_VERSION" /usr/bin/clang
  sudo ln -sf /usr/bin/clang++-"$LLVM_VERSION" /usr/bin/clang++
  sudo ln -sf /usr/bin/opt-"$LLVM_VERSION" /usr/bin/opt

  clang --version
  opt --version

  cmake -B build -DLLVM_DIR=/usr/lib/llvm-"$LLVM_VERSION"/cmake \
    -DCMAKE_C_COMPILER=clang-"$LLVM_VERSION" \
    -DCMAKE_CXX_COMPILER=clang++-"$LLVM_VERSION"
  cmake --build build

  mkdir -p "$ARTIFACTS_DIR"
  cp build/libpasses.so "$ARTIFACTS_DIR/libpasses-$LLVM_VERSION.so"
  cp build/wrapper "$ARTIFACTS_DIR/wrapper-$LLVM_VERSION"
done

mkdir -p "$RELEASE_DIR"
cp "$ARTIFACTS_DIR"/libpasses-*.so "$RELEASE_DIR/"
cp "$ARTIFACTS_DIR/wrapper-18" "$RELEASE_DIR/wrapper"

cd "$RELEASE_DIR"
zip -r ../libpasses.zip *
cd ..