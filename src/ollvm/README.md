# LLVM: A Compiler Infrastructure Overview
LLVM is a compiler infrastructure. To understand what it is exactly we need to dive into compilation <br>
process (this is most accurate for unmanaged code like C/C++).

We can distinguish three steps of assembly generation from the source code:

1. Front end, which includes:
    * lexer, which performs lexical analysis of the raw code and produces tokens (strings with certain meaning)
    * parser, which produces an abstract syntax tree (tokens grouped in a tree which represents the actual algorithm implemented in the source code)
    * semantic analysis (mainly type checking), during which the AST is checked for errors like wrong use of types or use of variables before initialization
    * generation of intermediate representation (IR), usually based on AST
2. Middle-end, which aims at reducing code complexity for example by precalculating stuff. It must not change the algorithm/program itself.
3. Back end, which translates the IR to expected output (assembly or bytecode).

The core of LLVM is the optimizer but the project also includes a compiler front end - clang - which is intended to be used with the LLVM toolchain.

![LLVM-ASM](../../assets/llvm-asm.png)

# OLLVM: Turning Intermediate Representation Into Atrocities
Now let's talk about obfuscation ! Now that we know how LLVM works, we can quickly get some ideas about the various possible layers of obfuscation.
Technically, obfuscation can be performed at any abstraction level of a program. In the case of LLVM, the most common is on bytecode (the IR level).

> [!NOTE]
> 'But why obfuscate the LLVM bytecode? Why not the source code? Or the binary?', you may ask.

Regarding the engineering aspects, it is because there are lots of front-ends converting different languages into the same LLVM bytecode (Clang/Clang++ for C/C++, Mono LLVM for C#, Python and so on).
Hence, by working at the bytecode level, it is possible to obfuscate programs written in many languages without even knowing them. Another good thing is that the obfuscation can be easily integrated with the existing compilation chains: just add a few obfuscation flags.