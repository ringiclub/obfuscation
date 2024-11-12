#!/bin/bash

set -e

passes=("bogus-control-flow" "flattening" "mba-obfuscation" "substitution" "indirect-call" "global-encryption")
mkdir -p src/dump/pluto

for pass in "${passes[@]}"; do
    pass_dir="${pass/pluto-/}"
    mkdir -p "src/dump/pluto/$pass_dir"
done

clang main.c -o src/dump/pluto/main
clang -c -S -emit-llvm -O1 main.c -o src/dump/pluto/main.ll

# I recommend using llvm 16, because 17 and 18 used to segfault a lot
for pass in "${passes[@]}"; do
    pass_dir="${pass/pluto-/}"
        
    echo "Running pass: pluto-$pass"
    opt -load-pass-plugin=./lib/libpasses-$(llvm-config --version | cut -d'.' -f1).so -passes "pluto-$pass" src/dump/pluto/main.ll -S -o "src/dump/pluto/$pass_dir/$pass_dir.ll" -debug-pass-manager

    if [ $? -ne 0 ]; then
        echo "Error running pass: pluto-$pass"
        exit 1
    fi
done

for pass in "${passes[@]}"; do
    pass_dir="${pass/pluto-/}"
    ll_file="src/dump/pluto/$pass_dir/$pass_dir.ll"
    output_file="src/dump/pluto/$pass_dir/$pass_dir"
    
    echo "Compiling $ll_file to $output_file"
    clang "$ll_file" -o "$output_file"
    
    if [ $? -ne 0 ]; then
        echo "Error compiling $ll_file"
        exit 1
    fi
done

mkdir -p src/dump/pluto/example

# Hardcoded pass
opt -load-pass-plugin=./lib/libpasses-$(llvm-config --version | cut -d'.' -f1).so -passes "example-pass" src/dump/pluto/main.ll -S -o "src/dump/pluto/example/example.ll" -debug-pass-manager

if [ $? -ne 0 ]; then
    echo "Error running pass: example-pass"
    exit 1
fi

ll_file="src/dump/pluto/example/example.ll"
output_file="src/dump/pluto/example/example"

echo "Compiling $ll_file to $output_file"
clang "$ll_file" -o "$output_file"

if [ $? -ne 0 ]; then
    echo "Error compiling $ll_file"
    exit 1
fi

echo "All pluto passes ran successfully"