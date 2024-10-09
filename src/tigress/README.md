## Control: Virtualize
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td><tt>--Transform</tt></td>
<td><tt>Virtualize</tt></td>
<td> Turn a function into an interpreter. </td>
</tr>
<tr>
<td><tt>--VirtualizeShortIdents</tt></td>
<td><tt>bool</tt></td>
<td> Generate shorter identifiers to produce interpreters suitable for publication. Default=false.</td>
</tr>
<tr>
<td><tt>--VirtualizePerformance</tt></td>
<td><tt>IndexedStack, PointerStack, AddressSizeShort, AddressSizeInt, AddressSizeLong, CacheTop</tt></td>
<td> Tweak performance. A comma-separated list of the options below. MODIFIES Virtualize DEFAULT PointerStack 
<ul>
   <li> <tt>IndexedStack</tt> = Use array indexing to access stack elements.
   <li> <tt>PointerStack</tt> = Use pointer operations to access stack elements.
   <li> <tt>AddressSizeShort</tt> = Assume addresses for accessing instruction handlers fit in a short (only available with direct dispatch).
   <li> <tt>AddressSizeInt</tt> = Assume addresses for accessing instruction handlers fit in an int (only available with direct dispatch).
   <li> <tt>AddressSizeLong</tt> = Assume addresses for accessing instruction handlers fit in a long (only available with direct dispatch).
   <li> <tt>CacheTop</tt> = Store the top of stack in a register.
</ul>
</td>
</tr>
<tr>
<td><tt>--VirtualizeOptimizeBody</tt></td>
<td><tt><em><a>BOOLSPEC</a></em></tt></td>
<td> Clean up after superoperator generation by optimizing the body of the generated function. Default=false.</td>
</tr>
<tr>
<td><tt>--VirtualizeOptimizeTreeCode</tt></td>
<td><tt><em><a>BOOLSPEC</a></em></tt></td>
<td> Do constant folding etc. prior to interpreter generation. Default=false.</td>
</tr>
<tr>
<td><tt>--VirtualizeTrace</tt></td>
<td><tt>instr, args, stack, checkTags, actions, regs, locals, checkLocals, threads, *</tt></td>
<td> Insert tracing code to show the stack and the virtual instructions executing. Default=print nothing.
<ul>
   <li> <tt>instr</tt> = print instruction names
   <li> <tt>args</tt> = print arguments to instructions
   <li> <tt>stack</tt> = print stack contents. Currently only works if you set <tt>--VirtualizePerformance=IndexedStack</tt>. You get more readable output if you <tt>--VirtualizeTaggedStore=true</tt>
   <li> <tt>checkTags</tt> = check that the tags indicate the correct type. Requires <tt>--VirtualizeTaggedStore=true</tt> to be set.
   <li> <tt>actions</tt> = print high level actions as they occur
   <li> <tt>regs</tt> = print register contents (not implemented)
   <li> <tt>locals</tt> = print current values of local variables
   <li> <tt>checkLocals</tt> = print local variables that have changed after a store. Useful to find stores that affect more than one variable, ie. write overruns.
   <li> <tt>threads</tt> = trace the thread execution for <tt>--VirtualDispatch=concurrent</tt>.
   <li> <tt>*</tt> = select all options
</ul>
</td>
</tr>
<tr>
<td><tt>--VirtualizeTaggedStore</tt></td>
<td><tt><em><a>BOOLSPEC</a></em></tt></td>
<td> Make stack and registers tagged with their type. Useful for debugging. Default=false.</td>
</tr>
<tr>
<td><tt>--VirtualizeStackSize</tt></td>
<td><tt><em><a>INTSPEC</a></em></tt></td>
<td> Number of elements in the evaluation stack. Default=32.</td>
</tr>
<tr>
<td><tt>--VirtualizeComment</tt></td>
<td><tt>bool</tt></td>
<td> Insert comments in the generated interpreter. Default=false.</td>
</tr>
<tr>
<td><tt>--VirtualizeDump</tt></td>
<td><tt>input, tree, ISA, instrs, types, vars, strings, SuperOps, calls, bytes, array, stack, *</tt></td>
<td> Dump internal data structures used by the virtualizer. Comma-separated list. Default=dump nothing.
<ul>
   <li> <tt>input</tt> = dump the function that is to be virtualized
   <li> <tt>tree</tt> = dump the expression trees generated from the CIL representation
   <li> <tt>ISA</tt> = dump the Instruction Set Architecture
   <li> <tt>instrs</tt> = dump the generated virtual instructions
   <li> <tt>types</tt> = dump the types found
   <li> <tt>vars</tt> = dump the local variables found
   <li> <tt>strings</tt> = dump the strings found
   <li> <tt>SuperOps</tt> = dump the super operator instructions
   <li> <tt>calls</tt> = dump the function calls found
   <li> <tt>bytes</tt> = dump the bytecode array
   <li> <tt>array</tt> = dump the instruction array
   <li> <tt>stack</tt> = dump the evaluation stack
   <li> <tt>*</tt> = select all options
</ul>
</td>
</tr>
<tr>
<td><tt>--VirtualizeConditionalKinds</tt></td>
<td><tt>branch, compute, flag</tt></td>
<td> Ways to transform the one conditional branch that occurs in instruction handlers. Default=branch.
<ul>
   <li> <tt>branch</tt> = Use normal branches, such as <tt>if (a>b) VPC=L1 else VPC=L2</tt>
   <li> <tt>compute</tt> = Compute the branch, such as <tt>x=(a>b); VPC=*(<em>expression over <tt>x</tt></em>)</tt>. Not yet implemented.
   <li> <tt>flag</tt> = Compute the branch from the values of the flag register, such as <tt>asm("cmp a b;pushf;pop"); VPC=*(<em>expression over <tt>flag register</tt></em>)</tt>
</ul>
</td>
</tr>
</table>

## Control: Jit
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td><tt>--Transform</tt></td>
<td><tt>Jit</tt></td>
<td> Turn a function into a sequence of instructions that dynamically builds up the function at runtime. </td>
</tr>
<tr>
<td><tt>--JitEncoding</tt></td>
<td><tt>hard, soft</tt></td>
<td> How the jitted instructions are encoded. Default=hard.
<ul>
   <li> <tt>hard</tt> = The jitted instructions are encoded as code.
   <li> <tt>soft</tt> = The jitted instructions are encoded as data (not implemented).
</ul>
</td>
</tr>
<tr>
<td><tt>--JitFrequency</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> How often to jit the code at runtime. 0=only the first time; n>0=Every n:th time the function is called. Default=0.</td>
</tr>
<tr>
<td><tt>--JitOptimizeBinary</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> Optimize the jitted binary code. 1=omit frame pointer, 2=omit unused assignments, 4=merge ADDs and MULs. Default=1|4=5.</td>
</tr>
<tr>
<td><tt>--JitImplicitFlow</tt></td>
<td><tt>S-Expression</tt></td>
<td> The type of implicit flow to insert. See <tt>--AntiTaintAnalysisImplicitFlow</tt> for a description. Default=none.</td>
</tr>
<tr>
<td><tt>--JitCopyKinds</tt></td>
<td><tt>counter, counter_signal, bitcopy_unrolled, bitcopy_loop, bitcopy_signal, *</tt></td>
<td> Comma-separated list of the kinds of implicit flow to insert. <tt>counter_signal</tt> and <tt>bitcopy_signal</tt> require that <tt>--Transform=InitImplicitFlow --InitImplicitFlowCount=...</tt> has been called to create the signal handlers. Default=all options.
<ul>
   <li> <tt>counter</tt> = Copy a variable by counting up to its value.
   <li> <tt>counter_signal</tt> = Copy a variable by counting up to its value in a signal handler.
   <li> <tt>bitcopy_unrolled</tt> = Copy a variable bit-by-bit, each bit tested by an if-statement.
   <li> <tt>bitcopy_loop</tt> = Loop over the bits in a variable and copy each bit by testing in an if-statement.
   <li> <tt>bitcopy_signal</tt> = Loop over the bits in a variable and copy each bit in a signal handler.
   <li> <tt>*</tt> = Same as all options turned on.
</ul>
</td>
</tr>
<tr>
<td><tt>--JitObfuscateHandle</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Add an opaque predicate to the generated function handle. Default=false.</td>
</tr>
<tr>
<td><tt>--JitObfuscateArguments</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Add bogus arguments and opaque predicates to the jit_add_op function calls. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDumpOpcodes</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> Print the jitter's bytecode. OR the numeric arguments together, or 0 for no dumping. Default=0.
<ul>
   <li> <tt>0x01</tt> = JIT_DEBUG_OPS
   <li> <tt>0x02</tt> = JIT_DEBUG_CODE
   <li> <tt>0x04</tt> = JIT_DEBUG_COMBINED
   <li> <tt>0x08</tt> = JIT_DEBUG_COMPILABLE
   <li> <tt>0x100</tt> = JIT_DEBUG_LOADS
   <li> <tt>0x200</tt> = JIT_DEBUG_ASSOC
   <li> <tt>0x400</tt> = JIT_DEBUG_LIVENESS
</ul>
</td>
</tr>
<tr>
<td><tt>--JitTrace</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> Insert runtime tracing of instructions. Set to 1 to turn it on. Default=0.</td>
</tr>
<tr>
<td><tt>--JitTraceExec</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Annotate each instruction, showing from where it was generated, and the results of execution. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDumpTree</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Print the tree representation of the function, prior to generating the jitting code." Default=false.</td>
</tr>
<tr>
<td><tt>--JitDumpCFG</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Print the jitter's Control Flow Graph. Default=false.</td>
</tr>
<tr>
<td><tt>--JitAnnotateTree</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Annotate the generated code with the corresponding intermediate tree code instructions." Default=false.</td>
</tr>
<tr>
<td><tt>--JitDumpIntermediate</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Print the generated intermediate code at translation time." Default=false.</td>
</tr>
<tr>
<td><tt>--JitRandomizeBlocks</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Randomize the order of basic blocks Default=true.</td>
</tr>
</table>

## Control: JitDynamic
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td><tt>--Transform</tt></td>
<td><tt>JitDynamic</tt></td>
<td> Turn a function into a sequence of instructions that dynamically builds up the function at runtime, and continuously modifies them. </td>
</tr>
<tr>
<td><tt>--JitDynamicEncoding</tt></td>
<td><tt>hard, soft</tt></td>
<td> How the jitted instructions are encoded. Default=hard.
<ul>
   <li> <tt>hard</tt> = The jitted instructions are encoded as code.
   <li> <tt>soft</tt> = The jitted instructions are encoded as data (not implemented).
</ul>
</td>
</tr>
<tr>
<td><tt>--JitDynamicFrequency</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> How often to jit the code at runtime. 0=only the first time; n>0=Every n:th time the function is called. Default=0.</td>
</tr>
<tr>
<td><tt>--JitDynamicOptimizeBinary</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> Optimize the jitted binary code. 1=omit frame pointer, 2=omit unused assignments, 4=merge ADDs and MULs. Default=1|4=5.</td>
</tr>
<tr>
<td><tt>--JitDynamicImplicitFlowHandle</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Insert implicit flow to the generated function handle. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicImplicitFlow</tt></td>
<td><tt>S-Expression</tt></td>
<td> The type of implicit flow to insert. See <tt>--AntiTaintAnalysisImplicitFlow</tt> for a description. Default=none.</td>
</tr>
<tr>
<td><tt>--JitDynamicObfuscateHandle</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Add an opaque predicate to the generated function handle. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicObfuscateArguments</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Add bogus arguments and opaque predicates to the jit_add_op function calls. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicDumpOpcodes</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> Print the jitter's bytecode. OR the numeric arguments together, or 0 for no dumping. Default=0.
<ul>
   <li> <tt>0x01</tt> = JIT_DEBUG_OPS
   <li> <tt>0x02</tt> = JIT_DEBUG_CODE
   <li> <tt>0x04</tt> = JIT_DEBUG_COMBINED
   <li> <tt>0x08</tt> = JIT_DEBUG_COMPILABLE
   <li> <tt>0x100</tt> = JIT_DEBUG_LOADS
   <li> <tt>0x200</tt> = JIT_DEBUG_ASSOC
   <li> <tt>0x400</tt> = JIT_DEBUG_LIVENESS
</ul>
</td>
</tr>
<tr>
<td><tt>--JitDynamicTrace</tt></td>
<td><tt><a>INTSPEC</a></tt></td>
<td> Insert runtime tracing of instructions. Set to 1 to turn it on. Default=0.</td>
</tr>
<tr>
<td><tt>--JitDynamicTraceExec</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Annotate each instruction, showing from where it was generated, and the results of execution. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicDumpTree</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Print the tree representation of the function, prior to generating the jitting code. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicAnnotateTree</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Annotate the generated code with the corresponding intermediate tree code instructions. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicDumpIntermediate</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Print the generated intermediate code at translation time. Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicCodecs</tt></td>
<td><tt>none, ident, ident_loop, xor_transfer, xor_byte_loop, xor_word_loop, xor_qword_loop, xor_call, xor_call_trace, xtea, xtea_trace, stolen_byte, stolen_short, stolen_word</tt></td>
<td> How blocks should be encoded/decoded. Default=*.
<ul>
   <li> <tt>none</tt> = No encoding
   <li> <tt>ident</tt> = The identity encoding using a single copy JIT instruction
   <li> <tt>ident_loop</tt> = The identity encoding using a copy loop of primitive JIT instructions
   <li> <tt>xor_transfer</tt> = An xor encoding using a single xor JIT instruction
   <li> <tt>xor_byte_loop</tt> = An xor encoding using a copy loop of byte-size primitive JIT instructions
   <li> <tt>xor_word_loop</tt> = An xor encoding using a copy loop of word-size primitive JIT instructions
   <li> <tt>xor_qword_loop</tt> = An xor encoding using a copy loop of qword-size primitive JIT instructions
   <li> <tt>xor_call</tt> = An xor encoding calling a xor function
   <li> <tt>xor_call_trace</tt> = An xor encoding calling a xor function with tracing turned on (for debugging)
   <li> <tt>xtea</tt> = An xtea encryption
   <li> <tt>xtea_trace</tt> = An xtea encryption with tracing turned on (for debugging)
   <li> <tt>stolen_byte</tt> = A byte-sized stolen bytes encoding
   <li> <tt>stolen_short</tt> = A short-sized stolen bytes encoding
   <li> <tt>stolen_word</tt> = A word-sized stolen bytes encoding
</ul>
</td>
</tr>
<tr>
<td><tt>--JitDynamicKeyTypes</tt></td>
<td><tt>data, code</tt></td>
<td> Where the encoding/decoding key is stored (for xor and xtea encodings) Default=data.
<ul>
   <li> <tt>data</tt> = In the data segment
   <li> <tt>code</tt> = In the code segment (not implemented)
</ul>
</td>
</tr>
<tr>
<td><tt>--JitDynamicBlockFraction</tt></td>
<td><tt><em><a>FRACSPEC</a></em></tt></td>
<td> Fraction of the basic blocks in a function to encode Default=all.</td>
</tr>
<tr>
<td><tt>--JitDynamicRandomizeBlocks</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Randomize the order of basic blocks Default=true.</td>
</tr>
<tr>
<td><tt>--JitDynamicReEncode</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> If true, blocks will be re-encoded after being executed. If false, blocks will be decoded once, and stay in cleartext. ('False' is not implemented; this option is always set to 'true'.) Default=true.</td>
</tr>
<tr>
<td><tt>--JitDynamicOptimize</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Clean up the generated code by removing jumps-to-jumps. Default=true.</td>
</tr>
<tr>
<td><tt>--JitDynamicDumpCFG</tt></td>
<td><tt><a>BOOLSPEC</a></tt></td>
<td> Print the jitter's Control Flow Graph. This requires graphviz to be installed (the <tt>dot</tt> command is used). A number of pdf files get generated that shows the CFG at various stages of processing: <tt>CFGAfterInsertingAnnotations.pdf</tt>, <tt>CFGAfterSimplifyingJumps.pdf</tt>, <tt>CFGAfterTranslatingAnnotations.pdf</tt>, <tt>CFGBeforeInsertingAnnotations.pdf</tt>, <tt>CFGDumpingFunctionFinal.pdf</tt>, <tt>CFGDumpingFunctionInitial.pdf</tt>, <tt>CFGFixupIndirecJumps.pdf</tt>, <tt>CFGReplaceWithCompiledBlock.pdf</tt>, <tt>CFGSplitOutBranches.pdf</tt>, <tt>CFGSplitOutDataReferences.pdf</tt>, <tt>OriginalCFG.pdf</tt> Default=false.</td>
</tr>
<tr>
<td><tt>--JitDynamicTraceBlock</tt></td>
<td><tt>STRING</tt></td>
<td> Print out a message before each block is executed. (Not currently implemented.) Default="".</td>
</tr>
<tr>
<td><tt>--JitDynamicCompileCommand</tt></td>
<td><tt>STRING</tt></td>
<td> A string of the form "gcc -std=c99 -o %o %i", where "%i" will be replaced with the name of the input file and "%o" with the name of the output file. For example, if your program uses the math library, you should set <tt>--JitDynamicCompileCommand="gcc -std=c99 -o %o %i -lm". Default="gcc -std=c99 -o %o %i".</td>
</tr>
</table>

## Control: Flatten
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td><tt>--Transform</tt></td>
<td><tt>Flatten</tt></td>
<td> Flatten a function using Chenxi Wang's algorithm </td>
</tr>
<tr>
<td><tt>--FlattenDumpBlocks</tt></td>
<td><tt><em><a>BOOLSPEC</a></em></tt></td>
<td> Print the linearized blocks. Default=false.</td>
</tr>
<tr>
<td><tt>--FlattenSplitBasicBlocks</tt></td>
<td><tt><em><a>BOOLSPEC</a></em></tt></td>
<td> If true, then basic blocks (sequences of assignment and call statements without intervening branches) will be split up into indiviual blocks. If false, they will be kept intact. Default=false.</td>
</tr>
<tr>
<td><tt>--FlattenRandomizeBlocks</tt></td>
<td><tt><em><a>BOOLSPEC</a></em></tt></td>
<td> If true, then basic block sequences will be randomized. Default=false.</td>
</tr>
<tr>
<td><tt>--FlattenTrace</tt></td>
<td><tt>blocks, check, *</tt></td>
<td> Print a message before each block gets executed. Useful for debugging. Prior to version <b>3.3.3</b> this used to be a boolean. Default=print nothing.
<ul>
   <li> <tt>blocks</tt> = print a message before each block gets executed
   <li> <tt>check</tt> = insert extra checks, such as hitting <tt>default</tt> in a switch dispatch
   <li> <tt>*</tt> = select all options
</ul>
</td>
</tr>
</table>

## Control: Add Opaque
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td><tt>--Transform</tt></td>
<td><tt>AddOpaque</tt></td>
<td> Add opaque predicates to split up control-flow. </td>
</tr>
<tr>
<td><tt>--AddOpaqueCount</tt></td>
<td><tt><em><a>INTSPEC</a></em></tt></td>
<td> How many opaques to add to each function. Default=1.</td>
</tr>
<tr>
<td><tt>--AddOpaqueKinds</tt></td>
<td><tt>call, bug, true, junk, fake, question, *</tt></td>
<td> Comma-separated list of the types of insertions of bogus computation allowed. Default=<tt>call,bug,true,junk,question</tt>.
<ul>
   <li> <tt>call</tt> = <tt>if (false) RandomFunction()</tt>
   <li> <tt>bug</tt> = <tt>if (false) BuggyStatement else RealStatement</tt>
   <li> <tt>true</tt> = <tt>if (true) RealStatement</tt>
   <li> <tt>junk</tt> = <tt>if (false) asm(".byte random bytes")</tt>
   <li> <tt>fake</tt> = <tt>if (False) NonExistingFunction()</tt>
   <li> <tt>question</tt> = <tt>if (True || False) RealStatement else CopyOfRealStatement</tt>
   <li> <tt>*</tt> = Turns all options on.
</ul>
</td>
</tr>
<tr>
<td><tt>--AddOpaqueObfuscate</tt></td>
<td><tt><em>BOOL</em></tt></td>
<td> Perform some light obfuscation of copied code when using the 'question' opaque predicate. Default=true.</td>
</tr>
<tr>
<td><tt>--AddOpaqueSplitBasicBlocks</tt></td>
<td><tt><em>BOOL</em></tt></td>
<td> Split up basic blocks (sequences of statements without control flow) so that opaque predicates can be inserted between them. Default=false.</td>
</tr>
<tr>
<td><tt>--AddOpaqueInline</tt></td>
<td><tt><em>BOOL</em></tt></td>
<td> Inline the split out functions when using 'question' opaque predicates. Default=false.</td>
</tr>
<tr>
<td><tt>--AddOpaqueSplitKinds</tt></td>
<td><tt>top, block, deep, recursive, level, inside</tt></td>
<td> Comma-separated list specifying the order in which different split methods are attempted when <tt>--AddOpaqueKinds=question</tt> is specified. Default=top,block,deep,recursive.
<ul>
   <li> <tt>top</tt> = split the top-level list of statements into two functions <tt>funcname_split_1</tt> and <tt>funcname_split_2</tt>.
   <li> <tt>block</tt> = split a basic block (list of assignment and call statements) into two functions.
   <li> <tt>deep</tt> = split out a nested control structure of at least height>2 into its own function <tt>funcname_split_1</tt>.
   <li> <tt>recursive</tt> = same as block, but calls to split functions are also allowed to be split out.
   <li> <tt>level</tt> = split out a statement at a level specified by <tt>--AddOpaqueSplitLevel</tt>.
   <li> <tt>inside</tt> = split out a statement at the innermost nesting level.
</ul>
</td>
</tr>
<tr>
<td><tt>--AddOpaqueSplitLevel</tt></td>
<td><tt><em><a>INTSPEC</a></em></tt></td>
<td> Levels which could be split out when specifying <tt>--AddOpaqueSplitKinds=level</tt> Default=1.</td>
</tr>
<tr>
<td><tt>--AddOpaqueStructs</tt></td>
<td><tt>list, array, input, env, *</tt></td>
<td> Default=list,array.
<ul>
   <li> <tt>list</tt> = Generate opaque expressions using linked lists
   <li> <tt>array</tt> = Generate opaque expressions using arrays
   <li> <tt>input</tt> = Generate opaque expressions that depend on input. Requires <tt>--Inputs</tt> to set invariants over input.
   <li> <tt>env</tt> = Generate opaque expressions from entropy. Requires <tt>--InitEntropy</tt>.
   <li> <tt>*</tt> = Same as list,array,input,env
</ul>
</td>
</tr>
</table>

## Control: Encode Branches
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td><tt>--Transform</tt></td>
<td><tt>InitBranchFunctions</tt></td>
<td> Initialize so that branch functions can be insered at a later time. </td>
</tr>
<tr>
<td><tt>--InitBranchFunsOpaqueStructs</tt></td>
<td><tt>list, array, input, env, *</tt></td>
<td> Comma-separated list of the kinds of opaque constructs to use when obfuscating the branch function. Default=list,array.
<ul>
   <li> <tt>list</tt> = Generate opaque expressions using linked lists
   <li> <tt>array</tt> = Generate opaque expressions using arrays
   <li> <tt>input</tt> = Generate opaque expressions that depend on input. Requires <tt>--Inputs</tt> to set invariants over input.
   <li> <tt>env</tt> = Generate opaque expressions from entropy. Requires <tt>--InitEntropy</tt>.
   <li> <tt>*</tt> = Same as list,array,input,env
</ul>
</td>
</tr>
<tr>
<td><tt>--InitBranchFunsCount</tt></td>
<td><tt><em><a>INTSPEC</a></em></tt></td>
<td> How many branch functions to add. </td>
</tr>
<tr>
<td><tt>--InitBranchFunsObfuscate</tt></td>
<td><tt><em><a>BOOLSPEC</a></em></tt></td>
<td> Whether to obfuscate the branch function. Default=false.</td>
</tr>
</table>