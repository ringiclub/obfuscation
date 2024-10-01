# Obfuscation analysis

# Table of contents
- [Introduction](#introduction)
  - [LLVM: A Compiler Infrastructure Overview](#llvm-a-compiler-infrastructure-overview)
    - [OLLVM: Turning Intermediate Representation Into Atrocities](#ollvm-turning-intermediate-representation-into-atrocities)

- [Obfuscation: The Art of Mathematical Deception](#obfuscation-the-art-of-mathematical-deception)
  - [What really is obfuscation ?](#what-really-is-obfuscation-)
  - [Examples of obfuscations](#examples-of-obfuscations)
    - [Obfuscate all null literals](#obfuscate-all-null-literals)
    - [Data splitting and merging](#data-splitting-and-merging)
    - [Variable transformations](#variable-transformations)
    - [Array transformations](#array-transformations)

## Introduction
As part of my work-study program as a reverse engineer, I'm in charge of analyzing the various layers of obfuscation in compiled code through the interfaces of the Tigress and OLLVM compilers.
The final rendering is a GUI overlay for three types of decompiler (IDA Pro, Ghidra and Binary Ninja) to enable real-time code clean-up with a native C plugin or an external Python script (which I'll have to justify with a benchmark).

Starting from the beginning, software obfuscation is a method to make programs more difficult to reverse engineer. There are multiple reasons why this is done such as protecting intellectual property, defense in depth or hiding bugs. 
No matter the reason, there are multiple ways to go about in making the software more difficult to understand, from fully manual modifications to advanced commercial obfuscation frameworks.

Before trying to de-obfuscate anything and everything, you need to understand how obfuscation works, its different application and abstraction layers, and above all how it works on LLVM and Tigress.

## LLVM: A Compiler Infrastructure Overview
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

![LLVM-ASM](assets/llvm-asm.png)  

### OLLVM: Turning Intermediate Representation Into Atrocities
Now let's talk about obfuscation ! Now that we know how LLVM works, we can quickly get some ideas about the various possible layers of obfuscation.
Technically, obfuscation can be performed at any abstraction level of a program. In the case of LLVM, the most common is on bytecode (the IR level).

> [!NOTE]
> 'But why obfuscate the LLVM bytecode? Why not the source code? Or the binary?', you may ask.

Regarding the engineering aspects, it is because there are lots of front-ends converting different languages into the same LLVM bytecode (Clang/Clang++ for C/C++, Mono LLVM for C#, Python and so on). 
Hence, by working at the bytecode level, it is possible to obfuscate programs written in many languages without even knowing them. Another good thing is that the obfuscation can be easily integrated with the existing compilation chains: just add a few obfuscation flags.

# Obfuscation: The Art of Mathematical Deception
A common practice in obfuscation is to use mathematics... after all, that's what computing is all about. 
So we're going to look at different mathematical expressions for obfuscation.

## What really is obfuscation ?
According to a thesis submitted for the degree of Doctor of Philosophy at the University of Oxford written by Stephen Drape; an obfuscation is a behaviour-preserving transformation whose aim is to make a program “harder to understand.” Collberg  do not define obfuscation but instead qualify “hard to understand” by using various metrics which measure the complexity of code. For example:

- **Cyclomatic Complexity** — the complexity of a function increases with the number of predicates in the function.
- **Nesting Complexity** — the complexity of a function increases with the nesting level of conditionals in the function.
- **Data-Structure Complexity** — the complexity increases with the complexity of the static data structures declared in a program. For example, the complexity of an array increases with the number of dimensions and with the complexity of the element type.

Using such metrics, Collberg  measure the potency of an obfuscation as follows. 
Let: **_T_** be a transformation which maps a program **_P_** to a program **_P'_**.  The potency of a transformation **_T_** with respect to the program **_P_** is defined to be:

$$
T_{\text{pot}}(P) = \frac{E(P')}{E(P)} - 1
$$

where **_E(P)_** is the complexity of **_P_** (using an appropriate metric). **_T_** is said to be a potent obfuscating transformation if :

$$
( T_{\text{pot}}(P) > 0 )
$$

$$
(i.e., if \space ( E(P') > E(P) ))
$$

In, **_P_** and **_P'_** are not required to be equally efficient, it is stated that many of the transformations given will result in **_P'_** being slower or using more memory than **_P_**.  Other properties that Collberg measure are:

- **Resilience** - this measures how well a transformation survives an attack from a deobfuscator. Resilience takes into account the amount of time required to construct a deobfuscator and the execution time and space actually required by the deobfuscator.
- **Execution Cost** - this measures the extra execution time and space of an obfuscated program **_P'_** compared with the original program **_P_**.
- **Quality** - this combines potency, resilience, and execution cost to give an overall measure.

These three properties are measured informally on a non-numerical scale (e.g., for resilience, the scale is trivial, weak, strong, full, one-way).

Another useful measure is the **stealth** of an obfuscation. An obfuscation is stealthy if it does not “stand out” from the rest of the program, i.e., it resembles the original code as much as possible. Stealth is context-sensitive — what is stealthy in one program may not be in another, and so it is difficult to quantify (as it depends on the whole program and also the experience of the reader).

The metrics mentioned above are not always suitable to measure the degree of obfuscation. Consider these two code fragments:

1. 
```c
if (p) {A; } else { if (q) {B; } else {C; }}
```

2. 
```c
if (p) { A; };
if (¬p ∧ q) { B; };
if (¬p ∧ ¬q) { C; }
```

These two fragments are equivalent if **_A_** leaves the value of **_p_** unchanged and **_b_** leaves **_p_** and **_q_** unchanged. If we transform steps (1) to steps (2), then the cyclomatic complexity is increased, but the nesting complexity is decreased. 
Then, which fragment is more obfuscated?

Barak et al. take a more formal approach to obfuscation; their notion of obfuscation is as follows. 
An obfuscator **_O_** is a “compiler” which takes as input a program **_P_** and produces a new program ***_O(P)_*** such that for every **_P_**:

- **Functionality** - **_O(P)_** computes the same function as **_P_**.
- **Polynomial Slowdown** - the description length and running time of **_O(P)_** are at most polynomially larger than that of **_P_**.
- **“Virtual black box” property** - “Anything that can be efficiently computed from **_O(P)_** can be efficiently computed given oracle access to **_P_**”.

With this definition, Barak et al. construct a family of functions that is unobfuscatable in the sense that there is no way of obfuscating programs that compute these functions. The main result of is that their notion of obfuscation is impossible to achieve.
This definition of obfuscation, in particular the “Virtual Black Box” property, is evidently too strong for our purposes, and so we consider a weaker notion. We do not consider our programs as being “black boxes,” as we assume that any attacker can inspect and modify our code. Also, we would like an indication of how “good” an obfuscation is.

## Examples of obfuscations
This section summarises some of the major obfuscations published to date.
First, we consider some of the commercial obfuscators available and  then discuss some data structure and control flow obfuscations that are not  commonly implemented by commercial obfuscators.

### Obfuscate all null literals
The process of obfuscating **all null literals** in a code is really simple. It means that we are going to replace almost all the zeroes in the code by a non-trivial boolean expression, proved to be always false.

$$
\
    \left(p_1 \ast\left(\left(x \lor a_1 \right)^{2} \right) \neq p_2 \ast\left(\left(y \lor a_2 \right)^{2} \right)\right)
\
$$

Where:
- **_p1_** and **_p2_** be _distinct_ prime numbers.
- **_a1_** and **_a2_** be _distinct_ strictly positive random numbers.
- **_x_** and **_y_** be two variables picked from the program (they have to be reachable from the obfuscation instructions).

The expression will always return a boolean zero **(false)**. The idea is to insert this test into our code, just before the 0 we want to obfuscate and to replace this 0 by the result of our comparison.
As you probably noticed  we will have to play attention to the type of the original 0 and make sure we cast the result of our expression to its type.

This type of obfuscation may not be the most sophisticated ever written, but it's enough to learn the basics of LLVM bytecode obfuscation and maybe to annoy people in reverse engineering for a few minutes... until they use a nicely crafted [miasm](https://code.google.com/archive/p/miasm/) script!

### Data splitting and merging
The process of **data splitting / merging** involves dividing a value into several parts and then combining them when needed. To put it another way, it distributes the information of one variable into several new variables. 
For example, a boolean variable can be split into two boolean variables, and performing logical operations on them can get the original value.

$$
\text{part1} = \text{original} \land 0xFF
$$

$$
\text{part2} = \left(\text{original} \gg 8\right) \land 0xFF
$$


Data merging, on the other hand, aggregates several variables into one variable.
When needed, the parts are merged as follows:

$$
\text{reconstructed} = (\text{part1} << 8) \space | \space \text{part2}
$$

This makes code analysis more difficult for attackers, as the original value is never directly exposed.

### Variable transformations
To continue with variables and code complexity, we'll show how to transform an integer variable **_i_** within a method.
To do this, we define two functions **_f_** and **_g_**:

$$
f :: X → Y
$$

$$
g :: Y → X
$$

Where:
* `X ⊆ Z` , this represents the set of values that I take. 

We require that g is a left inverse of f (and so f needs to be injective).<br>
If **_f_** is bijective (injective and surjective), then **_g_** is often called the inverse function of **_f_**. This means that:

$$
g(f(x)) = x \quad \text{for all } x \in X
$$

and

$$
f(g(y)) = y \quad \text{for all } y \in Y.
$$

To replace the variable i with a new variable, j say, of type Y we need to perform two kinds of replacement depending on whether we have an assignment to i or use of i. 
An  assignment to i is a statement of the form i = V and a use of i is an occurrence of i which is not an assignment. The two replacements are : <br>
* Any assignments of **_i_** of the form `i = V` ar replace by `j = f(V)`
* Any uses of **_i_** are replaced by a *while* loop.

In other therms, this replacements can be used to obfuscate a *while* loop. [Look at this file for an example](src/variable-transformations.c)

### Array transformations
There are many ways in which arrays can be obfuscated. One of the simplest ways is to change the array indices. 
Such a change could be achieved either by a variable transformation or by defining a permutation.
Here is an example permutation for an array of size n:

$$
p = λi.(a × i + b ( mod(n))) \space where \space gcd (a, n) = 1
$$

Other array transformations involve changing the structure of an array. One way of changing the structure is by choosing different array dimensions. 
We could fold a 1-dimensional array of size m × n into a 2-dimensional array of size [m, n]. Similarly, we could flatten an n-dimensional array into a 1-dimensional array.

> [!IMPORTANT]
> Before performing array transformations, we must ensure that the arrays are safe to transform. 
 
For example, we may require that a whole array is not passed to another method or that elements of the array do not throw exceptions.

