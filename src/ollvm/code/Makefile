
DIR:=./prefix/llvm/bin
PLUGIN:=ollvm/build/libLLVMObfuscator.so

CLANG:=$(DIR)/clang
OPT:=$(DIR)/opt

PASSES="flattening,bogus,substitution,substitution,string-encryption"
PASSE_FLAT="flattening"
PASSE_BOGUS="bogus"
PASSE_SUBSTITUTION="substitution"

obfuscated: test_yo_ollvm.c
	$(CLANG) -O1 -S -emit-llvm $^ -o $@
	$(OPT) -load-pass-plugin=$(PLUGIN) -passes=$(PASSE_FLAT) $@ -o obfuscated.bc
	$(OPT) -passes="dot-callgraph" obfuscated -o what.dot

test: test.c
	 LLVM_OBF_PEEPHOLE_PASSES=$(PASSES)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_ollvm_for_coeia: test_yo_ollvm_for_coeia.c
	 LLVM_OBF_PEEPHOLE_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_clean_for_coeia: test_yo_clean_for_coeia.c
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_debian_complex: test_yo_debian_complex.c
	 LLVM_OBF_PEEPHOLE_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_debian_complex_2: test_yo_debian_complex.c
	 LLVM_OBF_SCALAROPTIMIZERLATE_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_debian_complex_3: test_yo_debian_complex.c
	 LLVM_OBF_VECTORIZERSTART_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_debian_complex_4: test_yo_debian_complex.c
	 LLVM_OBF_PIPELINESTART_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_debian_complex_5: test_yo_debian_complex.c
	 LLVM_OBF_PIPELINEEARLYSIMPLIFICATION_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_debian_complex_6: test_yo_debian_complex.c
	 LLVM_OBF_OPTIMIZERLASTEP_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat: test_yo_ollvm.c
	 LLVM_OBF_PEEPHOLE_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_2: test_yo_ollvm.c
	 LLVM_OBF_SCALAROPTIMIZERLATE_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_3: test_yo_ollvm.c
	 LLVM_OBF_VECTORIZERSTART_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_4: test_yo_ollvm.c
	 LLVM_OBF_PIPELINESTART_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_5: test_yo_ollvm.c
	 LLVM_OBF_PIPELINEEARLYSIMPLIFICATION_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_flat_6: test_yo_ollvm.c
	 LLVM_OBF_OPTIMIZERLASTEP_PASSES=$(PASSE_FLAT)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_bogus: test_yo_ollvm.c
	 LLVM_OBF_PEEPHOLE_PASSES=$(PASSE_BOGUS)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@

test_yo_sub: test_yo_ollvm.c
	 LLVM_OBF_PEEPHOLE_PASSES=$(PASSE_SUBSTITUTION)\
	 $(CLANG) -O1 -fpass-plugin=$(PLUGIN) $^ -o $@


.PHONY: test test_yo_flat test_yo_flat_2 test_yo_flat_3 test_yo_flat_4 test_yo_flat_5 test_yo_flat_6 test_yo_bogus test_yo_sub test_yo_flat_debian_complex test_yo_flat_debian_complex_2 obfuscated.bc obfuscated