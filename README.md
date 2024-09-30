# Obfuscation analysis

# Table of contents
- [Introduction](#introduction)
  - [LLVM Obfuscation](#obfuscation-analysis)

## Introduction
As part of my work-study program as a reverse engineer, I'm in charge of analyzing the various layers of obfuscation in compiled code through the interfaces of the Tigress and OLLVM compilers.
The final rendering is a GUI overlay for three types of decompiler (IDA Pro, Ghidra and Binary Ninja) to enable real-time code clean-up with a native C plugin or an external Python script (which I'll have to justify with a benchmark).

## LLVM obfuscation
LLVM is a compiler infrastructure. To understand what it is exactly we need to dive into compilation <br>
process (this is most accurate for unmanaged code like C/C++).

We can distinguish three steps of assembly generation from the source code:

1. Front end, which includes:
    * lexer, which performs lexical analysis of the raw code and produces tokens (strings with certain meaning)
    * parser, which produces an abstract syntax tree (tokens grouped in a tree which represents the actual algorithm implemented in the source code)
    * semantic analysis (mainly type checking), during which the AST is checked for errors like wrong use of types or use of variables before initialization
    * generation of intermediate representation (IR), usually based on AST
2. Middle-end, which aims at reducing code complexity for example by precalculating stuff. It must not change the algorithm/program itself.
3. Back end, which translates the intermediate representation to expected output (assembly or bytecode).

The core of LLVM is the optimizer but the project also includes a compiler front end - clang - which is intended to be used with the LLVM toolchain.

![LLVM-ASM](assets/llvm-asm.png)