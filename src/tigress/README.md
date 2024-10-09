# Introduction

# Table of contents

## Tigress

### Control: Virtualize
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Virtualize</td>
<td> Turn a function into an interpreter. </td>
</tr>
<tr>
<td>--VirtualizeShortIdents</td>
<td>bool</td>
<td> Generate shorter identifiers to produce interpreters suitable for publication. Default=false.</td>
</tr>
<tr>
<td>--VirtualizePerformance</td>
<td>IndexedStack, PointerStack, AddressSizeShort, AddressSizeInt, AddressSizeLong, CacheTop</td>
<td> Tweak performance. A comma-separated list of the options below. MODIFIES Virtualize DEFAULT PointerStack 
<ul>
   <li> IndexedStack = Use array indexing to access stack elements.
   <li> PointerStack = Use pointer operations to access stack elements.
   <li> AddressSizeShort = Assume addresses for accessing instruction handlers fit in a short (only available with direct dispatch).
   <li> AddressSizeInt = Assume addresses for accessing instruction handlers fit in an int (only available with direct dispatch).
   <li> AddressSizeLong = Assume addresses for accessing instruction handlers fit in a long (only available with direct dispatch).
   <li> CacheTop = Store the top of stack in a register.
</ul>
</td>
</tr>
<tr>
<td>--VirtualizeOptimizeBody</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Clean up after superoperator generation by optimizing the body of the generated function. Default=false.</td>
</tr>
<tr>
<td>--VirtualizeOptimizeTreeCode</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Do constant folding etc. prior to interpreter generation. Default=false.</td>
</tr>
<tr>
<td>--VirtualizeTrace</td>
<td>instr, args, stack, checkTags, actions, regs, locals, checkLocals, threads, *</td>
<td> Insert tracing code to show the stack and the virtual instructions executing. Default=print nothing.
<ul>
   <li> instr = print instruction names
   <li> args = print arguments to instructions
   <li> stack = print stack contents. Currently only works if you set --VirtualizePerformance=IndexedStack. You get more readable output if you --VirtualizeTaggedStore=true
   <li> checkTags = check that the tags indicate the correct type. Requires --VirtualizeTaggedStore=true to be set.
   <li> actions = print high level actions as they occur
   <li> regs = print register contents (not implemented)
   <li> locals = print current values of local variables
   <li> checkLocals = print local variables that have changed after a store. Useful to find stores that affect more than one variable, ie. write overruns.
   <li> threads = trace the thread execution for --VirtualDispatch=concurrent.
   <li> * = select all options
</ul>
</td>
</tr>
<tr>
<td>--VirtualizeTaggedStore</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Make stack and registers tagged with their type. Useful for debugging. Default=false.</td>
</tr>
<tr>
<td>--VirtualizeStackSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Number of elements in the evaluation stack. Default=32.</td>
</tr>
<tr>
<td>--VirtualizeComment</td>
<td>bool</td>
<td> Insert comments in the generated interpreter. Default=false.</td>
</tr>
<tr>
<td>--VirtualizeDump</td>
<td>input, tree, ISA, instrs, types, vars, strings, SuperOps, calls, bytes, array, stack, *</td>
<td> Dump internal data structures used by the virtualizer. Comma-separated list. Default=dump nothing.
<ul>
   <li> input = dump the function that is to be virtualized
   <li> tree = dump the expression trees generated from the CIL representation
   <li> ISA = dump the Instruction Set Architecture
   <li> instrs = dump the generated virtual instructions
   <li> types = dump the types found
   <li> vars = dump the local variables found
   <li> strings = dump the strings found
   <li> SuperOps = dump the super operator instructions
   <li> calls = dump the function calls found
   <li> bytes = dump the bytecode array
   <li> array = dump the instruction array
   <li> stack = dump the evaluation stack
   <li> * = select all options
</ul>
</td>
</tr>
<tr>
<td>--VirtualizeConditionalKinds</td>
<td>branch, compute, flag</td>
<td> Ways to transform the one conditional branch that occurs in instruction handlers. Default=branch.
<ul>
   <li> branch = Use normal branches, such as if (a>b) VPC=L1 else VPC=L2
   <li> compute = Compute the branch, such as x=(a>b); VPC=*(<em>expression over x</em>). Not yet implemented.
   <li> flag = Compute the branch from the values of the flag register, such as asm("cmp a b;pushf;pop"); VPC=*(<em>expression over flag register</em>)
</ul>
</td>
</tr>
</table>

### Control: Jit
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Jit</td>
<td> Turn a function into a sequence of instructions that dynamically builds up the function at runtime. </td>
</tr>
<tr>
<td>--JitEncoding</td>
<td>hard, soft</td>
<td> How the jitted instructions are encoded. Default=hard.
<ul>
   <li> hard = The jitted instructions are encoded as code.
   <li> soft = The jitted instructions are encoded as data (not implemented).
</ul>
</td>
</tr>
<tr>
<td>--JitFrequency</td>
<td><a>INTSPEC</a></td>
<td> How often to jit the code at runtime. 0=only the first time; n>0=Every n:th time the function is called. Default=0.</td>
</tr>
<tr>
<td>--JitOptimizeBinary</td>
<td><a>INTSPEC</a></td>
<td> Optimize the jitted binary code. 1=omit frame pointer, 2=omit unused assignments, 4=merge ADDs and MULs. Default=1|4=5.</td>
</tr>
<tr>
<td>--JitImplicitFlow</td>
<td>S-Expression</td>
<td> The type of implicit flow to insert. See --AntiTaintAnalysisImplicitFlow for a description. Default=none.</td>
</tr>
<tr>
<td>--JitCopyKinds</td>
<td>counter, counter_signal, bitcopy_unrolled, bitcopy_loop, bitcopy_signal, *</td>
<td> Comma-separated list of the kinds of implicit flow to insert. counter_signal and bitcopy_signal require that --Transform=InitImplicitFlow --InitImplicitFlowCount=... has been called to create the signal handlers. Default=all options.
<ul>
   <li> counter = Copy a variable by counting up to its value.
   <li> counter_signal = Copy a variable by counting up to its value in a signal handler.
   <li> bitcopy_unrolled = Copy a variable bit-by-bit, each bit tested by an if-statement.
   <li> bitcopy_loop = Loop over the bits in a variable and copy each bit by testing in an if-statement.
   <li> bitcopy_signal = Loop over the bits in a variable and copy each bit in a signal handler.
   <li> * = Same as all options turned on.
</ul>
</td>
</tr>
<tr>
<td>--JitObfuscateHandle</td>
<td><a>BOOLSPEC</a></td>
<td> Add an opaque predicate to the generated function handle. Default=false.</td>
</tr>
<tr>
<td>--JitObfuscateArguments</td>
<td><a>BOOLSPEC</a></td>
<td> Add bogus arguments and opaque predicates to the jit_add_op function calls. Default=false.</td>
</tr>
<tr>
<td>--JitDumpOpcodes</td>
<td><a>INTSPEC</a></td>
<td> Print the jitter's bytecode. OR the numeric arguments together, or 0 for no dumping. Default=0.
<ul>
   <li> 0x01 = JIT_DEBUG_OPS
   <li> 0x02 = JIT_DEBUG_CODE
   <li> 0x04 = JIT_DEBUG_COMBINED
   <li> 0x08 = JIT_DEBUG_COMPILABLE
   <li> 0x100 = JIT_DEBUG_LOADS
   <li> 0x200 = JIT_DEBUG_ASSOC
   <li> 0x400 = JIT_DEBUG_LIVENESS
</ul>
</td>
</tr>
<tr>
<td>--JitTrace</td>
<td><a>INTSPEC</a></td>
<td> Insert runtime tracing of instructions. Set to 1 to turn it on. Default=0.</td>
</tr>
<tr>
<td>--JitTraceExec</td>
<td><a>BOOLSPEC</a></td>
<td> Annotate each instruction, showing from where it was generated, and the results of execution. Default=false.</td>
</tr>
<tr>
<td>--JitDumpTree</td>
<td><a>BOOLSPEC</a></td>
<td> Print the tree representation of the function, prior to generating the jitting code." Default=false.</td>
</tr>
<tr>
<td>--JitDumpCFG</td>
<td><a>BOOLSPEC</a></td>
<td> Print the jitter's Control Flow Graph. Default=false.</td>
</tr>
<tr>
<td>--JitAnnotateTree</td>
<td><a>BOOLSPEC</a></td>
<td> Annotate the generated code with the corresponding intermediate tree code instructions." Default=false.</td>
</tr>
<tr>
<td>--JitDumpIntermediate</td>
<td><a>BOOLSPEC</a></td>
<td> Print the generated intermediate code at translation time." Default=false.</td>
</tr>
<tr>
<td>--JitRandomizeBlocks</td>
<td><a>BOOLSPEC</a></td>
<td> Randomize the order of basic blocks Default=true.</td>
</tr>
</table>

### Control: JitDynamic
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>JitDynamic</td>
<td> Turn a function into a sequence of instructions that dynamically builds up the function at runtime, and continuously modifies them. </td>
</tr>
<tr>
<td>--JitDynamicEncoding</td>
<td>hard, soft</td>
<td> How the jitted instructions are encoded. Default=hard.
<ul>
   <li> hard = The jitted instructions are encoded as code.
   <li> soft = The jitted instructions are encoded as data (not implemented).
</ul>
</td>
</tr>
<tr>
<td>--JitDynamicFrequency</td>
<td><a>INTSPEC</a></td>
<td> How often to jit the code at runtime. 0=only the first time; n>0=Every n:th time the function is called. Default=0.</td>
</tr>
<tr>
<td>--JitDynamicOptimizeBinary</td>
<td><a>INTSPEC</a></td>
<td> Optimize the jitted binary code. 1=omit frame pointer, 2=omit unused assignments, 4=merge ADDs and MULs. Default=1|4=5.</td>
</tr>
<tr>
<td>--JitDynamicImplicitFlowHandle</td>
<td><a>BOOLSPEC</a></td>
<td> Insert implicit flow to the generated function handle. Default=false.</td>
</tr>
<tr>
<td>--JitDynamicImplicitFlow</td>
<td>S-Expression</td>
<td> The type of implicit flow to insert. See --AntiTaintAnalysisImplicitFlow for a description. Default=none.</td>
</tr>
<tr>
<td>--JitDynamicObfuscateHandle</td>
<td><a>BOOLSPEC</a></td>
<td> Add an opaque predicate to the generated function handle. Default=false.</td>
</tr>
<tr>
<td>--JitDynamicObfuscateArguments</td>
<td><a>BOOLSPEC</a></td>
<td> Add bogus arguments and opaque predicates to the jit_add_op function calls. Default=false.</td>
</tr>
<tr>
<td>--JitDynamicDumpOpcodes</td>
<td><a>INTSPEC</a></td>
<td> Print the jitter's bytecode. OR the numeric arguments together, or 0 for no dumping. Default=0.
<ul>
   <li> 0x01 = JIT_DEBUG_OPS
   <li> 0x02 = JIT_DEBUG_CODE
   <li> 0x04 = JIT_DEBUG_COMBINED
   <li> 0x08 = JIT_DEBUG_COMPILABLE
   <li> 0x100 = JIT_DEBUG_LOADS
   <li> 0x200 = JIT_DEBUG_ASSOC
   <li> 0x400 = JIT_DEBUG_LIVENESS
</ul>
</td>
</tr>
<tr>
<td>--JitDynamicTrace</td>
<td><a>INTSPEC</a></td>
<td> Insert runtime tracing of instructions. Set to 1 to turn it on. Default=0.</td>
</tr>
<tr>
<td>--JitDynamicTraceExec</td>
<td><a>BOOLSPEC</a></td>
<td> Annotate each instruction, showing from where it was generated, and the results of execution. Default=false.</td>
</tr>
<tr>
<td>--JitDynamicDumpTree</td>
<td><a>BOOLSPEC</a></td>
<td> Print the tree representation of the function, prior to generating the jitting code. Default=false.</td>
</tr>
<tr>
<td>--JitDynamicAnnotateTree</td>
<td><a>BOOLSPEC</a></td>
<td> Annotate the generated code with the corresponding intermediate tree code instructions. Default=false.</td>
</tr>
<tr>
<td>--JitDynamicDumpIntermediate</td>
<td><a>BOOLSPEC</a></td>
<td> Print the generated intermediate code at translation time. Default=false.</td>
</tr>
<tr>
<td>--JitDynamicCodecs</td>
<td>none, ident, ident_loop, xor_transfer, xor_byte_loop, xor_word_loop, xor_qword_loop, xor_call, xor_call_trace, xtea, xtea_trace, stolen_byte, stolen_short, stolen_word</td>
<td> How blocks should be encoded/decoded. Default=*.
<ul>
   <li> none = No encoding
   <li> ident = The identity encoding using a single copy JIT instruction
   <li> ident_loop = The identity encoding using a copy loop of primitive JIT instructions
   <li> xor_transfer = An xor encoding using a single xor JIT instruction
   <li> xor_byte_loop = An xor encoding using a copy loop of byte-size primitive JIT instructions
   <li> xor_word_loop = An xor encoding using a copy loop of word-size primitive JIT instructions
   <li> xor_qword_loop = An xor encoding using a copy loop of qword-size primitive JIT instructions
   <li> xor_call = An xor encoding calling a xor function
   <li> xor_call_trace = An xor encoding calling a xor function with tracing turned on (for debugging)
   <li> xtea = An xtea encryption
   <li> xtea_trace = An xtea encryption with tracing turned on (for debugging)
   <li> stolen_byte = A byte-sized stolen bytes encoding
   <li> stolen_short = A short-sized stolen bytes encoding
   <li> stolen_word = A word-sized stolen bytes encoding
</ul>
</td>
</tr>
<tr>
<td>--JitDynamicKeyTypes</td>
<td>data, code</td>
<td> Where the encoding/decoding key is stored (for xor and xtea encodings) Default=data.
<ul>
   <li> data = In the data segment
   <li> code = In the code segment (not implemented)
</ul>
</td>
</tr>
<tr>
<td>--JitDynamicBlockFraction</td>
<td><em><a>FRACSPEC</a></em></td>
<td> Fraction of the basic blocks in a function to encode Default=all.</td>
</tr>
<tr>
<td>--JitDynamicRandomizeBlocks</td>
<td><a>BOOLSPEC</a></td>
<td> Randomize the order of basic blocks Default=true.</td>
</tr>
<tr>
<td>--JitDynamicReEncode</td>
<td><a>BOOLSPEC</a></td>
<td> If true, blocks will be re-encoded after being executed. If false, blocks will be decoded once, and stay in cleartext. ('False' is not implemented; this option is always set to 'true'.) Default=true.</td>
</tr>
<tr>
<td>--JitDynamicOptimize</td>
<td><a>BOOLSPEC</a></td>
<td> Clean up the generated code by removing jumps-to-jumps. Default=true.</td>
</tr>
<tr>
<td>--JitDynamicDumpCFG</td>
<td><a>BOOLSPEC</a></td>
<td> Print the jitter's Control Flow Graph. This requires graphviz to be installed (the dot command is used). A number of pdf files get generated that shows the CFG at various stages of processing: CFGAfterInsertingAnnotations.pdf, CFGAfterSimplifyingJumps.pdf, CFGAfterTranslatingAnnotations.pdf, CFGBeforeInsertingAnnotations.pdf, CFGDumpingFunctionFinal.pdf, CFGDumpingFunctionInitial.pdf, CFGFixupIndirecJumps.pdf, CFGReplaceWithCompiledBlock.pdf, CFGSplitOutBranches.pdf, CFGSplitOutDataReferences.pdf, OriginalCFG.pdf Default=false.</td>
</tr>
<tr>
<td>--JitDynamicTraceBlock</td>
<td>STRING</td>
<td> Print out a message before each block is executed. (Not currently implemented.) Default="".</td>
</tr>
<tr>
<td>--JitDynamicCompileCommand</td>
<td>STRING</td>
<td> A string of the form "gcc -std=c99 -o %o %i", where "%i" will be replaced with the name of the input file and "%o" with the name of the output file. For example, if your program uses the math library, you should set --JitDynamicCompileCommand="gcc -std=c99 -o %o %i -lm". Default="gcc -std=c99 -o %o %i".</td>
</tr>
</table>

### Control: Flatten
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Flatten</td>
<td> Flatten a function using Chenxi Wang's algorithm </td>
</tr>
<tr>
<td>--FlattenDumpBlocks</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Print the linearized blocks. Default=false.</td>
</tr>
<tr>
<td>--FlattenSplitBasicBlocks</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> If true, then basic blocks (sequences of assignment and call statements without intervening branches) will be split up into indiviual blocks. If false, they will be kept intact. Default=false.</td>
</tr>
<tr>
<td>--FlattenRandomizeBlocks</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> If true, then basic block sequences will be randomized. Default=false.</td>
</tr>
<tr>
<td>--FlattenTrace</td>
<td>blocks, check, *</td>
<td> Print a message before each block gets executed. Useful for debugging. Prior to version <b>3.3.3</b> this used to be a boolean. Default=print nothing.
<ul>
   <li> blocks = print a message before each block gets executed
   <li> check = insert extra checks, such as hitting default in a switch dispatch
   <li> * = select all options
</ul>
</td>
</tr>
</table>

### Control: Add Opaque
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>AddOpaque</td>
<td> Add opaque predicates to split up control-flow. </td>
</tr>
<tr>
<td>--AddOpaqueCount</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many opaques to add to each function. Default=1.</td>
</tr>
<tr>
<td>--AddOpaqueKinds</td>
<td>call, bug, true, junk, fake, question, *</td>
<td> Comma-separated list of the types of insertions of bogus computation allowed. Default=call,bug,true,junk,question.
<ul>
   <li> call = if (false) RandomFunction()
   <li> bug = if (false) BuggyStatement else RealStatement
   <li> true = if (true) RealStatement
   <li> junk = if (false) asm(".byte random bytes")
   <li> fake = if (False) NonExistingFunction()
   <li> question = if (True || False) RealStatement else CopyOfRealStatement
   <li> * = Turns all options on.
</ul>
</td>
</tr>
<tr>
<td>--AddOpaqueObfuscate</td>
<td><em>BOOL</em></td>
<td> Perform some light obfuscation of copied code when using the 'question' opaque predicate. Default=true.</td>
</tr>
<tr>
<td>--AddOpaqueSplitBasicBlocks</td>
<td><em>BOOL</em></td>
<td> Split up basic blocks (sequences of statements without control flow) so that opaque predicates can be inserted between them. Default=false.</td>
</tr>
<tr>
<td>--AddOpaqueInline</td>
<td><em>BOOL</em></td>
<td> Inline the split out functions when using 'question' opaque predicates. Default=false.</td>
</tr>
<tr>
<td>--AddOpaqueSplitKinds</td>
<td>top, block, deep, recursive, level, inside</td>
<td> Comma-separated list specifying the order in which different split methods are attempted when --AddOpaqueKinds=question is specified. Default=top,block,deep,recursive.
<ul>
   <li> top = split the top-level list of statements into two functions funcname_split_1 and funcname_split_2.
   <li> block = split a basic block (list of assignment and call statements) into two functions.
   <li> deep = split out a nested control structure of at least height>2 into its own function funcname_split_1.
   <li> recursive = same as block, but calls to split functions are also allowed to be split out.
   <li> level = split out a statement at a level specified by --AddOpaqueSplitLevel.
   <li> inside = split out a statement at the innermost nesting level.
</ul>
</td>
</tr>
<tr>
<td>--AddOpaqueSplitLevel</td>
<td><em><a>INTSPEC</a></em></td>
<td> Levels which could be split out when specifying --AddOpaqueSplitKinds=level Default=1.</td>
</tr>
<tr>
<td>--AddOpaqueStructs</td>
<td>list, array, input, env, *</td>
<td> Default=list,array.
<ul>
   <li> list = Generate opaque expressions using linked lists
   <li> array = Generate opaque expressions using arrays
   <li> input = Generate opaque expressions that depend on input. Requires --Inputs to set invariants over input.
   <li> env = Generate opaque expressions from entropy. Requires --InitEntropy.
   <li> * = Same as list,array,input,env
</ul>
</td>
</tr>
</table>

### Control: Encode Branches
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>InitBranchFunctions</td>
<td> Initialize so that branch functions can be insered at a later time. </td>
</tr>
<tr>
<td>--InitBranchFunsOpaqueStructs</td>
<td>list, array, input, env, *</td>
<td> Comma-separated list of the kinds of opaque constructs to use when obfuscating the branch function. Default=list,array.
<ul>
   <li> list = Generate opaque expressions using linked lists
   <li> array = Generate opaque expressions using arrays
   <li> input = Generate opaque expressions that depend on input. Requires --Inputs to set invariants over input.
   <li> env = Generate opaque expressions from entropy. Requires --InitEntropy.
   <li> * = Same as list,array,input,env
</ul>
</td>
</tr>
<tr>
<td>--InitBranchFunsCount</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many branch functions to add. </td>
</tr>
<tr>
<td>--InitBranchFunsObfuscate</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Whether to obfuscate the branch function. Default=false.</td>
</tr>
</table>

### Data: Encode Data

<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>EncodeData</td>
<td> Replace integer variables with a different encoding. Use --GlobalVariables and --LocalVariables to specify the variables that should be transformed. In addition to the variables specifed, any other variables that are related through aliasing will be transformed. Only integer variables, arrays of integers, and pointers to integers are currently supported. Avoid structs, since our alias analysis algorithm conflates all fields. </td>
</tr>
<tr>
<td>--EncodeDataCodecs</td>
<td>poly1, xor, xorfloat, add, rnc, poly_xor, xor_poly, poly_rnc, xor_rnc, *</td>
<td> Comma-separated list of the kinds of codecs that may be used. Only poly1 currently makes sense; avoid the others. Default=poly1.
<ul>
   <li> poly1 = Linear transformation of the form a*x+b.
   <li> xor = Exclusive-or with a constant.
   <li> xorfloat = Exclusive-or with a constant on floating point values.
   <li> add = Add a constant and promote to next largest integer type. Will fail for the largest integer type.
   <li> rnc = Residue Number Coding
   <li> poly_xor = First encode with poly1, then with xor
   <li> xor_poly = First encode with xor, then with poly1
   <li> poly_rnc = First encode with poly1, then with rnc
   <li> xor_rnc = First encode with xor, then with rnc
   <li> * = All options
</ul>
</td>
</tr>
<tr>
<td>--EncodeDataDebug</td>
<td>pointsToGraph, aliasConstraints, aliasProgress, aliasDebug, aliasTypes, mayAliasRelationships, traceUpdates</td>
<td> Debugging options. Default=NONE.
<ul>
   <li> pointsToGraph = Print the alias graph.
   <li> aliasConstraints = Print alias constraints.
   <li> aliasProgress = Print progress of the alias computation.
   <li> aliasDebug = Print alias debugging information
   <li> aliasTypes = Print alias type information
   <li> mayAliasRelationships = Print may alias relationships
   <li> traceUpdates = Trace how functions are transformed
</ul>
</td>
</tr>
<tr>
<td>--EncodeDataOptimize</td>
<td></td>
<td> Simplify expressions. Default=true.</td>
</tr>
<tr>
<td>--EncodeDataTrace</td>
<td></td>
<td> Trace execution of encoded data. Default=false.</td>
</tr>
<tr>
<td>--EncodeDataNumberOfPieces</td>
<td><em><a>INTSPEC</a></em></td>
<td> Number of pieces in which to break up a value. Only applies to codecs that split values, such as rnc. Default=2.</td>
</tr>
<tr>
<td>--EncodeDataStorage</td>
<td>struct, split</td>
<td> How variabls split into multiple pieces should be stored. Default=struct.
<ul>
   <li> struct = Store pieces in a struct.
   <li> split = Store pieces in individual variables. Only partially implemented.
</ul>
</td>
</tr>
</table>

### Data: Encode Arithmetic
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>EncodeArithmetic</td>
<td> Replace integer arithmetic with more complex expressions. </td>
</tr>
<tr>
<td>--EncodeArithmeticKinds</td>
<td>builtin, plugins</td>
<td> Specify the types to encode. Currently, only integer is available. <b>From version 3.3.3.</b> Default=builtin.
<ul>
   <li> builtin = Use Tigress' built-in MBA patterns
   <li> plugins = Use plugin MBA expressions
</ul>
</td>
</tr>
<tr>
<td>--EncodeArithmeticMaxLevel</td>
<td><em><a>INTSPEC</a></em></td>
<td> How deep to recurse into expressions. Default=1.</td>
</tr>
<tr>
<td>--EncodeArithmeticMaxTransforms</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many transformations to perform on each expression. Default=1.</td>
</tr>
<tr>
<td>--EncodeArithmeticRepeatTimes</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many times to repeat the rewriting process. Equivalent to calling EncodeArithmetic multiple times. <b>From Version 3.3</b> Default=1.</td>
</tr>
<tr>
<td>--EncodeArithmeticDumpFileName</td>
<td><em>string</em></td>
<td> Name of Json file onto which we dump transformed expression. The actual file will be <em>function-name</em>_<em>number</em>_<em>fileName.json</em>. <b>From version 3.3.2.</b> Default=100.</td>
</tr>
</table>

### Data: Encode Literals
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>EncodeLiterals</td>
<td> Replace literal integers and strings with less obvious expressions. </td>
</tr>
<tr>
<td>--EncodeLiteralsKinds</td>
<td>integer, string, *</td>
<td> Specify the types of literals to encode Default=integer,string.
<ul>
   <li> integer = Replace literal integers with opaque expressions
   <li> string = Replace literal strings with calls to a function that generates them
   <li> * = Same as integer,string
</ul>
</td>
</tr>
<tr>
<td>--EncodeLiteralsEncoderName</td>
<td>string</td>
<td> The name of the generated encoder function (only for encoded strings). Default=None.</td>
</tr>
<tr>
<td>--EncodeLiteralsMaxLevel</td>
<td><em><a>INTSPEC</a></em></td>
<td> How deep to recurse into split integer expressions. Default=100.</td>
</tr>
<tr>
<td>--EncodeLiteralsMaxTransforms</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many transformations to perform on each split integer expression. Default=100.</td>
</tr>
<tr>
<td>--EncodeLiteralsIntegerKinds</td>
<td>opaque, split</td>
<td> Specify how to encode integer literals. Default=opaque.
<ul>
   <li> opaque = Replace literal integers with opaque expressions
   <li> split = Replace literal integers by splitting into subparts, and then doing EncodeArithmetic on them.
</ul>
</td>
</tr>
</table>

### Functions: Split
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Split</td>
<td> Outline pieces of a function </td>
</tr>
<tr>
<td>--SplitKinds</td>
<td>top, block, deep, recursive, level, inside</td>
<td> Comma-separated list specifying the order in which different split methods are attempted. Default=top,block,deep,recursive.
<ul>
   <li> top = split the top-level list of statements into two functions funcname_split_1 and funcname_split_2.
   <li> block = split a basic block (list of assignment and call statements) into two functions.
   <li> deep = split out a nested control structure of at least height>2 into its own function funcname_split_1.
   <li> recursive = same as block, but calls to split functions are also allowed to be split out.
   <li> level = split out a statement at a level specified by --SplitLevel.
   <li> inside = split out a statement at the innermost nesting level.
</ul>
</td>
</tr>
<tr>
<td>--SplitCount</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many times to attempt the split. Default=1.</td>
</tr>
<tr>
<td>--SplitName</td>
<td>string</td>
<td> If --SplitName=name is given, the split out functions will be named <em>prefix_name_number</em>, otherwise they will be named <em>prefix_originalName_split_number</em>. Default=none.</td>
</tr>
<tr>
<td>--SplitLevel</td>
<td><em><a>INTSPEC</a></em></td>
<td> Levels which could be split out when specifying --SplitKinds=level. Default=1.</td>
</tr>
<tr>
<td>--SplitLocalsAsFormals</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Pass local variables as formals to split out functions. Can cause functions to have many arguments which can be a problem for languages like WebAssembly that puts a limit on the number of function arguments. Default=true.</td>
</tr>
</table>

### Functions: Merge
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Merge</td>
<td> Merge of two or more functions. Two different types of merge are supported: simple merge (if () function1 else if () function2 else ...) and flatten merge, where the functions are first flattened, and then the resulting blocks are woven together. This transformation modifies the signature of the function (an extra formal <em> selector</em> argument is added that selects between the constituent functions at runtime), and this cannot be done for functions whose address is taken. --Functions=\* merges together all functions in the program whose signatures can be changed, --Functions=%50 merges together about half of them, etc. It is a good idea to follow this transform by a RndArgs transform to hide the extra selector argument. </td>
</tr>
<tr>
<td>--MergeName</td>
<td>string</td>
<td> If set, the merged function will be named <em>prefix_name</em>, otherwise it will be named <em>prefix_originalName1_originalName2</em>. Note that it's unpredictable which function will be the first and the second, so it's better to set the merged named explicitly. </td>
</tr>
<tr>
<td>--MergeObfuscateSelect</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Whether the extra parameter passed to the merged function should be obfuscated with opaque expressions or not. Default=false.</td>
</tr>
<tr>
<td>--MergeOpaqueStructs</td>
<td>list, array, *</td>
<td> Type of opaque predicate to use. Traditionally, for this transformation, array is used. Default=array.
<ul>
   <li> list = Generate opaque expressions using linked lists
   <li> array = Generate opaque expressions using arrays
   <li> * = Same as list,array
</ul>
</td>
</tr>
<tr>
<td>--MergeFlatten</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Whether to flatten before merging or not. Default=true.</td>
</tr>
<tr>
<td>--MergeFlattenDispatch</td>
<td>switch, goto, indirect, ?</td>
<td> Dispatch method used for flattened merge. Default=switch.
<ul>
   <li> switch = dispatch by while(1) {switch (next) {blocks}}
   <li> goto = dispatch by {labl1: block1; goto block2;}
   <li> indirect = dispatch by goto* (jtab[next])
   <li> ? = select an dispatch method at random.
</ul>
</td>
</tr>
<tr>
<td>--MergeSplitBasicBlocks</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> If true, then basic blocks (sequences of assignment and call statements without intervening branches) will be split up into indiviual blocks prior to merging. Default=false.</td>
</tr>
<tr>
<td>--MergeRandomizeBlocks</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> If true, then basic block sequences will be randomized. Default=false.</td>
</tr>
<tr>
<td>--MergeConditionalKinds</td>
<td>branch, compute, flag</td>
<td> If merging before flattening, this option describes ways to transform conditional branches. Default=branch.
<ul>
   <li> branch = Use normal branches, such as if (a>b) goto L1 else goto L2
   <li> compute = Compute the branch, such as x=(a>b); goto *(<em>expression over x</em>)
   <li> flag = Compute the branch from the values of the flag register, such as asm("cmp a b;pushf;pop"); goto *(<em>expression over flag register</em>)
</ul>
</td>
</tr>
</table>

### Functions: Randomize Arguments
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>RndArgs</td>
<td> Randomize the order of arguments to a function and add extra bogus arguments. </td>
</tr>
<tr>
<td>--RndArgsBogusNo</td>
<td><em><a>INTSPEC</a></em></td>
<td> Number of bogus arguments to add. Default=0.</td>
</tr>
</table>

### Functions: Inline
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Inline</td>
<td> Replace the functions calls with the body of the function. Delete the functions after done inlining. </td>
</tr>
<tr>
<td>--InlineKeepFunctions</td>
<td><em>String,String,...</em></td>
<td> Do not delete these functions after inlining. Default=NONE.</td>
</tr>
<tr>
<td>--InlineDumpCallGraph</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Save the callgraph as a .dot file. Default=False.</td>
</tr>
<tr>
<td>--InlineOptimizeKinds</td>
<td>constProp, copyProp, mergeLocals, gotos</td>
<td> List of optimizing transformations to apply Default=NONE.
<ul>
   <li> constProp = <em>Constant Propagation</em>, i.e. replace a variable with its value, if it is constant.
   <li> copyProp = <em>Copy Propagation</em>, i.e. after the assignment x=y replaces uses of variable x with y.
   <li> mergeLocals = Reduce the number of local variables by merging locals that are not live at the same time. Particularly useful after inlining.
   <li> gotos = Remove extra labels and gotos that were inserted during the inlining process.
</ul>
</td>
</tr>
</table>

### Functions: Copy
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Copy</td>
<td> Make a copy of a function. </td>
</tr>
<tr>
<td>--CopyName</td>
<td>string</td>
<td> Name of the new function. Default=Current name followed by '_' and a random number.</td>
</tr>
</table>

### Functions: Random Function
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>RandomFuns</td>
<td> Generate a random function useful as an attack target. </td>
</tr>
<tr>
<td>--RandomFunsFunctionCount</td>
<td><em><a>INTSPEC</a></em></td>
<td> Number of functions to generate. Default=1.</td>
</tr>
<tr>
<td>--RandomFunsTrace</td>
<td><em><a>INTSPEC</a></em></td>
<td> Insert tracing in the generated program. 0=no tracing. 1=trace function entry and exit. 2=as 1, but also trace control points. 3=as 2, but also trace individual statements. 4=as 3, but also trace the values of the STATE variable at each statement. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsTraceAssets</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Trace the state at each asset instance Default=0.</td>
</tr>
<tr>
<td>--RandomFunsInputSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of input. Default=1.</td>
</tr>
<tr>
<td>--RandomFunsLocalStaticStateSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of function-local static state. Default=1.</td>
</tr>
<tr>
<td>--RandomFunsLocalDynamicStateSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of function-local dynamic state, i.e. the number of linked structures (lists, trees, etc) that can be built. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsGlobalStaticStateSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of global static state. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsGlobalDynamicStateSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of global dynamic state, i.e. the number of linked structures (lists, trees, etc) that can be built. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsOutputSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of output. Default=1.</td>
</tr>
<tr>
<td>--RandomFunsCodeSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of the generated code. This is the number of nodes in generated Abstract Syntax Tree. Default=10.</td>
</tr>
<tr>
<td>--RandomFunsLoopSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Maximum count of loop iterations. Used to control the length of execution. Default=None.</td>
</tr>
<tr>
<td>--RandomFunsBoolSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of boolean expressions, specifically the number of conjunctions and disjunctions (&& and ||) that are used to build up expressions. Default=1.</td>
</tr>
<tr>
<td>--RandomFunsType</td>
<td>char, short, int, long, float, double</td>
<td> Type of input/output/state. Default=long.
<ul>
   <li> char = C int type
   <li> short = C int type
   <li> int = C int type
   <li> long = C long type
   <li> float = C float type
   <li> double = C double type
</ul>
</td>
</tr>
<tr>
<td>--RandomFunsName</td>
<td>string</td>
<td> The name of the generated function. Default=SECRET.</td>
</tr>
<tr>
<td>--RandomFunsFailureKind</td>
<td>message, abort, segv, random, assign</td>
<td> The manner in which a triggered asset may fail. Comma-separated list. Default=segv.
<ul>
   <li> message = Print a message.
   <li> abort = Call the abort function.
   <li> segv = Die with a segmentation fault.
   <li> random = Insert some random bytes which, when executed, will probably cause the program to misbehave.
   <li> assign = Insert some random assignments that, when executed, are likely to cause the program to produce the wrong output.
</ul>
</td>
</tr>
<tr>
<td>--RandomFunsInputKind</td>
<td>argv, stdin</td>
<td> How inputs are read by the program, through the command line or stdin. Default=argv.
<ul>
   <li> argv = Enter input to the program on the command line.
   <li> stdin = Enter input to the program through stdin.
</ul>
</td>
</tr>
<tr>
<td>--RandomFunsInputType</td>
<td>int, float, string</td>
<td> What is the type of the input being read from the user. Default=int.
<ul>
   <li> int = Enter input as a decimal integer.
   <li> float = Enter input as decimal float.
   <li> string = Enter input as an ASCII string.
</ul>
</td>
</tr>
<tr>
<td>--RandomFunsDummyFailure</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Generates excatly the same code whether true or false, except the failure code is rendered impotent. In other words, --RandomFunsDummyFailure=true will have the failure code inserted, but inactive. Default=false.</td>
</tr>
<tr>
<td>--RandomFunsTimeCheckCount</td>
<td>int</td>
<td> The number of checks for expired time (gettimeofday() > someTimeInThePast) to be inserted in the program. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsActivationCodeCheckCount</td>
<td>int</td>
<td> The number of checks for correct activation code to be inserted in the program. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsActivationCode</td>
<td>int</td>
<td> The code the user has to enter (as the first command line arguments) to be allowed to run the program. Default=42.</td>
</tr>
<tr>
<td>--RandomFunsSecurityCheckCount</td>
<td>int</td>
<td> The number of security checks to be inserted in the program. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsSecurityCheckValues</td>
<td><em>S-Expression</em></td>
<td> List of ((asset# state index value) (asset# state index value) ...) where  where 'state' is one of [input,output,local,global]. (5 local 3 42) specifies that the point where asset number 5 is in the code, local[3] may have the value 42. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsPasswordCheckCount</td>
<td>int</td>
<td> The number of checks for correct password to be inserted in the program. Probably only 0 and 1 make sense here, since the user will be prompted for a password once for every check. Default=0.</td>
</tr>
<tr>
<td>--RandomFunsPassword</td>
<td>string</td>
<td> The password the user has to enter (read from standard input) to be allowed to run the program. Default="42".</td>
</tr>
<tr>
<td>--RandomFunsControlStructures</td>
<td>S-Expression</td>
<td> If set, will define the nested control structures of the generated function. Otherwise, a random structure will be generated. The argument is an S-Expression, where each subexpression has one of the forms (bb INTSPEC) (for a basic block consisting of a certain number of assignment statements), (for <em>S-expression</em>) (for a for-loop with a given body), or (if <em>S-expression</em> <em>S-expression</em>) (for an if-statement with a given then and else part), or (switch <em>S-expression</em> <em>S-expression</em>) (for a switch-statement with a given list of cases and a default case). For example, --RandomFunsControlStructures='(for ((bb 4)))' will generate a body consisting of a for-loop with 4 assignment statements in the body. (for ((bb 4) (if ((bb 1)) ((bb 2))))) also puts an if-statement inside the loop. (for ((bb 4) (if ((bb 1)) ((for (bb 2)))))) puts a for-loop inside the else-part of the if-statement. (switch ((bb 4) (if ((bb 1)) (bb 4))) (bb 4)) creates a switch-statment with two cases (a basic block and an if-statement), and a basic block as the default case. Default=none.</td>
</tr>
<tr>
<td>--RandomFunsBasicBlockSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> The size of basic blocks, when control structures are not explicitly specified using RandomFunsControlStructures. Default=3.</td>
</tr>
<tr>
<td>--RandomFunsForBound</td>
<td>constant, input, boundedInput, boundedAny</td>
<td> The allowable upper bound in a for-statement. Comma-separated list. Default=constant.
<ul>
   <li> constant = Literal integer.
   <li> input = Value from the input array, could cause index out of bounds.
   <li> boundedInput = Value from the input array, will not cause index out of bounds.
   <li> boundedAny = Value from the any source, will not cause index out of bounds.
</ul>
</td>
</tr>
<tr>
<td>--RandomFunsOperators</td>
<td>PlusA, MinusA, Mult, Div, Mod, Shiftlt, Shiftrt, Lt, Gt, Le, Ge, Eq, Ne, BAnd, BXor, BOr, *</td>
<td> The allowable operators in expressions. Comma-separated list. Default=all.
<ul>
   <li> PlusA = +
   <li> MinusA = -
   <li> Mult = *
   <li> Div = /
   <li> Mod = %
   <li> Shiftlt = <<
   <li> Shiftrt = >>
   <li> Lt = <
   <li> Gt = >
   <li> Le = =<
   <li> Ge = >=
   <li> Eq = ==
   <li> Ne = !=
   <li> BAnd = &
   <li> BXor = ^
   <li> BOr = |
   <li> * = all operators
</ul>
</td>
</tr>
<tr>
<td>--RandomFunsPointTest</td>
<td>BOOL</td>
<td> Add if (output[0] == 4242424242U) printf("You win!\n"); after the call to the generated function. The idea is to replace (by hand) 4242424242U with one actual output of the function. This can be used as another reverse engineering challenge: "<em>Find an input for which the program prints "You win!.</em> Default=false.</td>
</tr>
</table>

### Integrity: Checksum
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>Checksum</td>
<td> Insert checkers that compute hashes over the code bytes and take action if the hashes return the wrong value </td>
</tr>
<tr>
<td>--ChecksumTemplateKinds</td>
<td>local, function, string, data</td>
<td> Where to insert checker templates. Default=local.
<ul>
   <li> local = The text segment, i.e. the code bytes.
   <li> function = The string segment.
   <li> string = The constant data segment.
   <li> data = The data segment. Currently not supported.
</ul>
</td>
</tr>
<tr>
<td>--ChecksumHashFunctionKinds</td>
<td>add, mul, xor, linear, quadratic, random</td>
<td> Kinds of expressions to use in the hash function. Default=xor.
<ul>
   <li> add = The body of the hash function performs hash += codeByte.
   <li> mul = The body of the hash function performs hash *= codeByte.
   <li> xor = The body of the hash function performs hash ^= codeByte.
   <li> linear = The body of the hash function performs hash = hash * small_odd_int + codeByte.
   <li> quadratic = The body of the hash function performs hash = hash * hash * small_odd_int + hash * small_odd_int + codeByte.
   <li> random = The body of the hash function performs hash += random_function(hash, codeByte).
</ul>
</td>
</tr>
<tr>
<td>--ChecksumHashValueTypes</td>
<td>int32, int64</td>
<td> Comma-separated list of the kinds of expressions to use in the hash functions. Default=int32,int64.
<ul>
   <li> int32 = A 32-bit value.
   <li> int64 = A 64-bit value.
</ul>
</td>
</tr>
<tr>
<td>--ChecksumRandomHashFunctionSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of the randomly generated hash function. Default=1.</td>
</tr>
<tr>
<td>--ChecksumObfuscateBody</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Obfuscate the body of the hash function. Default=false.</td>
</tr>
</table>

### Integrity: Self Modify
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>SelfModify</td>
<td> Transform the function by adding code that modifies itself. </td>
</tr>
<tr>
<td>--SelfModifyKinds</td>
<td>indirectBranch, arithmetic, comparisons</td>
<td> Types of instructions to self-modify. Default=indirectBranch.
<ul>
   <li> indirectBranch = Transform indirect branches
   <li> arithmetic = Transform binary arithmetic expressions
   <li> comparisons = Transform binary comparisons
</ul>
</td>
</tr>
<tr>
<td>--SelfModifyStyle</td>
<td>clobber, stack, text</td>
<td> What style of inline assembly code to generate. Default=NONE.
<ul>
   <li> clobber = Tell the compiler which registers the code is modifying.
   <li> stack = Store modified registers on the stack.
   <li> text = Store modified registers in the text segment.
</ul>
</td>
</tr>
<tr>
<td>--SelfModifyFraction</td>
<td><em><a>FRACSPEC</a></em></td>
<td> How many statements should be self-modified. Default=%100.</td>
</tr>
<tr>
<td>--SelfModifySubExpressions</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Recurse into sub-expressions with transforming an expression. Can cause bugs. Default=false.</td>
</tr>
<tr>
<td>--SelfModifyBogusInstructions</td>
<td>PlusA, MinusA, Mult, Div, Mod, Shiftlt, Shiftrt, Lt, Gt, Le, Ge, Eq, Ne, *</td>
<td> Which binary operators to modify. Default=*.
<ul>
   <li> PlusA = +
   <li> MinusA = -
   <li> Mult = *
   <li> Div = /
   <li> Mod = %
   <li> Shiftlt = <<
   <li> Shiftrt = >>
   <li> Lt = <
   <li> Gt = >
   <li> Le = =<
   <li> Ge = >=
   <li> Eq = ==
   <li> Ne = !=
   <li> * = all operators
</ul>
</td>
</tr>
<tr>
<td>--SelfModifyBogusInstructions</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many bogus instructions to insert inside the self-modify template to avoid pattern-matching attacks. Right now, the inserted instructions are simple 1-byte x86 instructions that are equivalent to NOPs. Default=0.</td>
</tr>
</table>

## Environment Transformations: Encode External
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>InitEncodeExternal</td>
<td> Replace direct system calls with indirect ones through dlsym. </td>
</tr>
</table>

## Environment Transformations: Check Environment
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>CheckEnvironment</td>
<td> Check if we are being run in an environment where we are being monitored. </td>
</tr>
<tr>
<td>--CheckEnvironmentCount</td>
<td><a>INTSPEC</a></td>
<td> How many checkers to insert. Default=1.</td>
</tr>
<tr>
<td>--CheckEnvironmentSandboxes</td>
<td>gdb, lldb, bochs, vmware, virtualBox, qemu, pin, cuckoo</td>
<td> The list of sandbxes that should be detected. Default=None.
<ul>
   <li> gdb = The gdb debugger
   <li> lldb = The lldb debugger
   <li> bochs = The Bochs emulator
   <li> vmware = The VMware virtual machine
   <li> virtualBox = The VirtualBox virtual machine
   <li> qemu = The QEMU emulator
   <li> pin = The Intel Pin tracing tool
   <li> cuckoo = The Cuckoo sandbox
</ul>
</td>
</tr>
<tr>
<td>--CheckEnvironmentResponseKinds</td>
<td>abort, modifyGlobal, random, plugin</td>
<td> Comma-separated list of ways to respond when a check fails. Default=None.
<ul>
   <li> abort = Call the abort function
   <li> modifyGlobal = Make random modification to a global variable
   <li> random = Execute random bytes
   <li> plugin = Call one of the plugin responders
</ul>
</td>
</tr>
</table>

### Anti Analysis Transformations: AntiAliasAnalysis
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>AntiAliasAnalysis</td>
<td> Transform the code by replacing direct function calls with indirect ones, making alias analysis become less precise. </td>
</tr>
<tr>
<td>--AntiAliasAnalysisObfuscateIndex</td>
<td><a>BOOLSPEC</a></td>
<td> Use opaque expressions to compute function addresses. Default=true.</td>
</tr>
<tr>
<td>--AntiAliasAnalysisBogusEntries</td>
<td><a>BOOLSPEC</a></td>
<td> Add bogus function addresses, and bogus updates to them. Default=true.</td>
</tr>
</table>

### Anti Analysis Transformations: AntiTaintAnalysis
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>AntiTaintAnalysis</td>
<td> Transform the code by inserting <em>implicit flow</em> such that dynamic taint analysis becomes less precise. </td>
</tr>
<tr>
<td>--AntiTaintAnalysisKinds</td>
<td>argv, sysCalls, vars, *</td>
<td> Comma-separated list of the kinds of anti-taint analysis transformations to employ. Default=none.
<ul>
   <li> argv = Insert implicit flow from argv and argc in main.
   <li> sysCalls = Insert implicit flow from output variables of common system calls.
   <li> vars = Insert implicit flow to a variable whenever it is written to. Use --LocalVariables=.. and --GlobalVariables=... to specify which variables should be copied.
   <li> * = Same as all options turned on.
</ul>
</td>
</tr>
<tr>
<td>--AntiTaintAnalysisSysCalls</td>
<td>getpid, scanf, *</td>
<td> Comma-separated list of the system calls whose output should be passed through implicit flow. Only two calls are currently implemented. Default=all system calls.
<ul>
   <li> getpid = Insert implicit flow to the output of getpid.
   <li> scanf = Insert implicit flow to the output of scanf.
   <li> * = Same as all options turned on.
</ul>
</td>
</tr>
<tr>
<td>--AntiTaintAnalysisImplicitFlow</td>
<td>single, compose, select, majority, repeat, until</td>
<td> S-expression of the implicit flow combiners to use. Default=none.
<ul>
   <li> single = The expression (single a) inserts a simple implicit flow, where a is one of
   <li> compose = The S-expression (compose a b c) inserts an implicit flow where the output of a
   <li> select = The S-expression (select a b c) inserts an implicit flow that picks among a,b,c
   <li> majority = The S-expression (majority a b c) inserts an implicit flow that uses majority logic
   <li> repeat = The S-expression (repeat a n) (where n is an integer) is equivalent to
   <li> until = The S-expression (until a m n) (where m,n are integers, m<n)
</ul>
</td>
</tr>
</table>

### Anti Analysis Transformations: Opaque Predicate
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>InitOpaque</td>
<td> Add opaque initialization code. This initialization code <em>has to</em> be added to a function that gets called <em>before</em> any uses of opaque predicates, usually, but not necessarily, to main. </td>
</tr>
<tr>
<td>--InitOpaqueStructs</td>
<td>list, array, input, env, *</td>
<td> Comma-separated list of the kinds of opaque constructs to add. Default=list,array.
<ul>
   <li> list = Generate opaque expressions using linked lists
   <li> array = Generate opaque expressions using arrays
   <li> input = Generate opaque expressions that depend on input. Requires --Inputs to set invariants over input.
   <li> env = Generate opaque expressions from entropy. Requires --InitEntropy.
   <li> * = Same as list,array,input,env
</ul>
</td>
</tr>
<tr>
<td>--InitOpaqueCount</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many opaque data structures (lists or arrays) to add to the program. They will be split roughly evenly between the different declared opaque structures. Default=1.</td>
</tr>
<tr>
<td>--InitOpaqueTrace</td>
<td>update, use, check</td>
<td> Trace opaque structures and values as they are generated during execution. This used to be a boolean, but from version 3.3, it can take on multiple values. Default=NONE.
<ul>
   <li> update = Print the generated structure
   <li> use = Print every use of an opaque value
   <li> check = Print only if an opaque value is wrong
</ul>
</td>
</tr>
<tr>
<td>--InitOpaqueDebug</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> If true, then we store all opaque values in a temporary variable. This can help with debugging when looking at the generated code. For example, if you see a variable named _OPAQUE_Array_42_expected_128, it means: 1)this is opaque expression number 42; 2) it is computed based on an Array opaque kind; and 3) it should always have the value 128. Default=FALSE.</td>
</tr>
<tr>
<td>--InitOpaqueSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of opaque arrays. Default=30.</td>
</tr>
</table>

### Anti Analysis Transformations: Implicit flow
<table>
    <colgroup>
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 20%;">
       <col span="1" style="width: 60%;">
    </colgroup>
<tr><th>Option</th><th>Arguments</th><th>Description</th></tr>
<tr>
<td>--Transform</td>
<td>InitImplicitFlow</td>
<td> Call this before --Transform=AntiTaintAnalysis, in case you want to use the implicit flow copy kinds counter_signal and bitcopy_signal. This transformation inserts the requisite signal handlers and jitted functions. </td>
</tr>
<tr>
<td>--InitImplicitFlowKinds</td>
<td>counter_int, counter_float, counter_signal, bitcopy_unrolled, bitcopy_loop, bitcopy_signal, file_write, lookup_byteArray, trivial_clock, trivial_thread_1, trivial_thread_2, trivial_counter, file_cache_time, file_cache_thread_1, file_cache_thread_2, mem_cache_time, mem_cache_thread_1, mem_cache_thread_2, jit_time, branchPrediction_time, *</td>
<td> Comma-separated list of the kinds of implicit flow that can be inserted. Default=all options.
<ul>
   <li> counter_int = Copy a variable by counting up to its value.
   <li> counter_float = Copy a variable by counting up to its value.
   <li> counter_signal = Copy a variable by counting up to its value in a signal handler.
   <li> bitcopy_unrolled = Copy a variable bit-by-bit, each bit tested by an if-statement.
   <li> bitcopy_loop = Loop over the bits in a variable and copy each bit by testing in an if-statement.
   <li> bitcopy_signal = Loop over the bits in a variable and copy each bit in a signal handler.
   <li> file_write = Copy a variable byte-by-byte by writing to a file.
   <li> lookup_byteArray = Copy a variable byte-by-byte by looking up each byte in a table.
   <li> trivial_clock = Copy a variable by timing a trivial loop
   <li> trivial_thread_1 = Copy a variable by timing a trivial loop, using 1 thread for timing
   <li> trivial_thread_2 = Copy a variable by timing a trivial loop, using 2 threads for timing
   <li> trivial_counter = Copy a variable by timing (using performance counters) a trivial loop
   <li> file_cache_time = Copy a variable by timing a file being read with caching turned on or off.
   <li> file_cache_thread_1 = Copy a variable by timing a file being read with caching turned on or off, but using 1 thread for timing.
   <li> file_cache_thread_2 = Copy a variable by timing a file being read with caching turned on or off, but using 2 threads for timing.
   <li> mem_cache_time = Copy a variable by timing a CPU data cache being read with or without caching
   <li> mem_cache_thread_1 = Copy a variable by timing a CPU data cache being read with or without caching, but using 1 thread for timing.
   <li> mem_cache_thread_2 = Copy a variable by timing a CPU data cache being read with or without caching, but using 2 threads for timing.
   <li> jit_time = Copy a variable by timing a jitted function.
   <li> branchPrediction_time = Copy a variable by timing the CPU's branch prediction.
   <li> * = Same as all options turned on.
</ul>
</td>
</tr>
<tr>
<td>--InitImplicitFlowHandlerCount</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many signal handlers to insert. Default=1.</td>
</tr>
<tr>
<td>--InitImplicitFlowJitCount</td>
<td><em><a>INTSPEC</a></em></td>
<td> How many jitted functions to insert. Default=0.</td>
</tr>
<tr>
<td>--InitImplicitFileCacheSize</td>
<td><em><a>INTSPEC</a></em></td>
<td> Size of the file (in 8k blocks) for a file cache implicit flow. Default=100.</td>
</tr>
<tr>
<td>--InitImplicitFlowJitFunctionBody</td>
<td>S-Expression</td>
<td> S-Expression describing the control structures of the function to be jitted. See the RandomFuns transformation for description of the syntax. Default="(for (for (for (for (if (bb 2) (bb 2))))))".</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingKind</td>
<td>gap, resend</td>
<td> How to do the training. Either by simply looking for a gap between slow and fast times, or to do a more sophisticated statistical test. Default=gap.
<ul>
   <li> gap = Look for a gap between slow and fast times.
   <li> resend = Use a more sophisticated statistical test, resending each bit until a guaranteed confindence level and target error rate has been achieved. Set these with --InitImplicitFlowTrainingResendConfidenceLevel=... and --InitImplicitFlowTrainingResendTargetErrorRate=....
</ul>
</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingParameterRange</td>
<td>S-Expression</td>
<td> An S-Expression consisting of lists of elements of the form (<em>implicit-flow-kind from to</em>), indicating that we will start by training with the parameter set to <em>from</em>, then <em>2*from</em>, <em>4*from</em>, until <em>to</em> is reached. Default=(trivial_clock 1 10000) trivial_thread_1 1 10000) trivial_thread_2 1 10000) trivial_counter 1 10000) file_cache_time 1 1024) file_cache_thread_1 1 1024) file_cache_thread_2 1 1024) mem_cache_time 2 64) mem_cache_thread_1 2 64) mem_cache_thread_2 2 64) jit_time 0 0) jit_thread_1 0 0) jit_thread_2 0 0).</td>
</tr>
<tr>
<td>--InitImplicitFlowTrace</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Trace the execution of the initialization of implicit flow. Default=false.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrain</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Generate a program that runs the training pass. The output will look something like this: T  RAINING_DATA '(trivial_counter 779.000000 2) (trivial_thread 0.000000 8192) (file_cache_time 24618781.250000 512) (file_cache_thread 0.000000 2) (mem_cache_time 26890.750000 128) (mem_cache_thread 0.000000 2048) (jit_time 10020289.000000 0)'. This can then be input to a subsequent run of tigress, setting --InitImplicitFlowTrainingData= to this output. Default=false.</td>
</tr>
<tr>
<td>--InitImplicitFlowTime</td>
<td><em><a>BOOLSPEC</a></em></td>
<td> Generate a program that runs lots of timing tests. The output looks something like this TRAINING_MEASURED_TIME,trivial_counter,fast,example.com,1,208.000000, where the two last entries is the parameter of the implicit flow kind and the time (usually in clock cycles). Default=false.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingTimesClock</td>
<td><em><a>INTSPEC</a></em></td>
<td> Number of training measurements to take for timing-based primitives. Default=0.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingTimesThread</td>
<td><em><a>INTSPEC</a></em></td>
<td> Number of training measurements to take for threading-based primitives. Default=0.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingGapMaxFailureRateClock</td>
<td><em><a>INTSPEC</a></em></td>
<td> Maximum acceptable failure rate for timing-based primitives, out of 100, for the gap training kind. Default=5.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingGapMaxFailureRateThread</td>
<td><em><a>INTSPEC</a></em></td>
<td> Maximum acceptable failure rate for thread-based primitives, out of 100, for the gap training kind. Default=5.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingGapMinGap</td>
<td><em><a>INTSPEC</a></em></td>
<td> Minimum gap between fast and midpoint and slow and midpoint, as a percentage, for the gap training kind. Default=80.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingResendConfidenceLevel</td>
<td><em>real</em></td>
<td> Confidence level, a floating point number close to 1.0, for the resend training kind. Default=0.95.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingResendTargetErrorRate</td>
<td><em>real</em></td>
<td> Acceptable error rate for the resend training kind. Should be a floating point number close to 0. Default=0.0001.</td>
</tr>
<tr>
<td>--InitImplicitFlowTrainingData</td>
<td><em>SExpression</em></td>
<td> Set training data from previous run of --InitImplicitFlowTrain. Default=none.</td>
</tr>
</table>

### Other: Optimize