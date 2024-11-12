#!/bin/bash

passes=("bogus-control-flow" "flattening" "mba-obfuscation" "substitution" "indirect-call" "global-encryption")
mkdir -p src/dump/pluto

for pass in "${passes[@]}"; do
    pass_dir="${pass/pluto-/}"
    mkdir -p "src/dump/pluto/$pass_dir"
done

clang src/analysis/main.c -o src/dump/pluto/main
clang -c -S -emit-llvm -O1 src/analysis/main.c -o src/dump/pluto/main.ll

# I recommend using llvm 16, because 17 and 18 used to segfault a lot
for pass in "${passes[@]}"; do
    pass_dir="${pass/pluto-/}"
        
    echo "Running pass: pluto-$pass"
    opt -load-pass-plugin=./resources/lib/libpasses-"$(llvm-config --version | cut -d'.' -f1)".so -passes "pluto-$pass" src/dump/pluto/main.ll -S -o "src/dump/pluto/$pass_dir/$pass_dir.ll" -debug-pass-manager

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
opt -load-pass-plugin=./resources/lib/libpasses-"$(llvm-config --version | cut -d'.' -f1)".so -passes "example-pass" src/dump/pluto/main.ll -S -o "src/dump/pluto/example/example.ll" -debug-pass-manager

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

mkdir -p src/dump/tigress
mkdir -p src/dump/tigress/mba src/dump/tigress/opaquePredicate src/dump/tigress/flattening src/dump/tigress/bogus

tigress \
  --Environment=x86_64:Linux:Gcc:"$(gcc --version | grep -oP '\d+\.\d+\.\d+')" \
   --Transform=InitOpaque \
   --Functions=* \
   src/analysis/main.c \
   --out=src/dump/tigress/opaquePredicate/initOpaque.c

tigress \
  --Environment=x86_64:Linux:Gcc:"$(gcc --version | grep -oP '\d+\.\d+\.\d+')" \
  --Transform=EncodeArithmetic \
  --Functions=* \
  --EncodeArithmeticKinds=* \
  src/analysis/main.c \
  --out=src/dump/tigress/mba/mba.c

tigress \
  --Environment=x86_64:Linux:Gcc:"$(gcc --version | grep -oP '\d+\.\d+\.\d+')" \
  --Transform=Flatten \
  --Functions=* \
  --FlattenSplitBasicBlocks=true \
  --FlattenRandomizeBlocks=true \
  src/analysis/main.c \
  --out=src/dump/tigress/flattening/flattening.c

tigress \
  --Environment=x86_64:Linux:Gcc:"$(gcc --version | grep -oP '\d+\.\d+\.\d+')" \
  --Transform=Flatten \
  --Functions=* \
  --AntiAliasAnalysisObfuscateIndex=true \
  --AntiAliasAnalysisBogusEntries=true \
    src/analysis/main.c \
  --out=src/dump/tigress/bogus/antiAliasAnalysis.c

echo "All tigress passes ran successfully"

# gcc src/dump/tigress/opaquePredicate/initOpaque.c -o src/dump/tigress/opaquePredicate/initOpaque
# gcc src/dump/tigress/mba/mba.c -o src/dump/tigress/mba/mba
# gcc src/dump/tigress/flattening/flattening.c -o src/dump/tigress/flattening/flattening
# gcc src/dump/tigress/bogus/antiAliasAnalysis.c -o src/dump/tigress/bogus/antiAliasAnalysis