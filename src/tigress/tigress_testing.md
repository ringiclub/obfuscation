# Introduction

Here all the test on Tigress obfuscator are made based on this initial code [click here](../obfuscation-demo.c)...
This file aim to show some testing on tigress, to demonstrate the changes after the obfuscation, on the 4 mosts commmon one for our cases.

# Opaque Predicate

- [executable](code/initOpaque)
- [obfuscated_source](code/initOpaque.c)

## Pseudo-code
```C++
undefined8 main(undefined4 param_1,undefined8 param_2,undefined8 param_3)

{
  int iVar1;
  undefined4 *puVar2;
  int *piVar3;
  long in_FS_OFFSET;
  int local_f8;
  int local_f4;
  int local_f0;
  int local_ec;
  uint local_e8;
  int local_e4;
  uint local_e0;
  uint auStack_8c [13];
  uint auStack_58 [8];
  char local_38;
  undefined local_37;
  undefined local_36;
  undefined local_35;
  undefined local_34;
  undefined local_33;
  undefined local_32;
  undefined local_31;
  undefined local_30;
  undefined local_2f;
  undefined local_2e;
  undefined local_2d;
  undefined local_2c;
  undefined local_2b;
  undefined local_2a;
  undefined local_29;
  undefined local_28;
  undefined local_27;
  undefined local_26;
  undefined local_25;
  undefined local_24;
  undefined local_23;
  undefined local_22;
  undefined local_21;
  undefined local_20;
  undefined local_1f;
  undefined local_1e;
  undefined local_1d;
  undefined local_1c;
  undefined local_1b;
  undefined local_1a;
  undefined local_19;
  undefined local_18;
  undefined local_17;
  undefined local_16;
  long local_10;
  
  local_10 = *(long *)(in_FS_OFFSET + 0x28);
  _global_argv = param_2;
  _global_argc = param_1;
  _global_envp = param_3;
  __1_main_1_opaque_list_1 = malloc(0x18);
  *(void **)((long)__1_main_1_opaque_list_1 + 8) = __1_main_1_opaque_list_1;
  *(void **)((long)__1_main_1_opaque_list_1 + 0x10) = __1_main_1_opaque_list_1;
  rand();
  puVar2 = (undefined4 *)malloc(0x18);
  *puVar2 = 0;
  *(undefined8 *)(puVar2 + 2) = *(undefined8 *)((long)__1_main_1_opaque_list_1 + 8);
  *(void **)(puVar2 + 4) = __1_main_1_opaque_list_1;
  *(undefined4 **)(*(long *)((long)__1_main_1_opaque_list_1 + 8) + 0x10) = puVar2;
  *(undefined4 **)((long)__1_main_1_opaque_list_1 + 8) = puVar2;
  iVar1 = rand();
  piVar3 = (int *)malloc(0x18);
  *piVar3 = iVar1;
  *(undefined8 *)(piVar3 + 2) = *(undefined8 *)((long)__1_main_1_opaque_list_1 + 8);
  *(void **)(piVar3 + 4) = __1_main_1_opaque_list_1;
  *(int **)(*(long *)((long)__1_main_1_opaque_list_1 + 8) + 0x10) = piVar3;
  *(int **)((long)__1_main_1_opaque_list_1 + 8) = piVar3;
  iVar1 = rand();
  piVar3 = (int *)malloc(0x18);
  *piVar3 = iVar1 * 2;
  *(undefined8 *)(piVar3 + 2) = *(undefined8 *)((long)__1_main_1_opaque_list_1 + 8);
  *(void **)(piVar3 + 4) = __1_main_1_opaque_list_1;
  *(int **)(*(long *)((long)__1_main_1_opaque_list_1 + 8) + 0x10) = piVar3;
  *(int **)((long)__1_main_1_opaque_list_1 + 8) = piVar3;
  iVar1 = rand();
  piVar3 = (int *)malloc(0x18);
  *piVar3 = iVar1 * 3;
  *(undefined8 *)(piVar3 + 2) = *(undefined8 *)((long)__1_main_1_opaque_list_1 + 8);
  *(void **)(piVar3 + 4) = __1_main_1_opaque_list_1;
  *(int **)(*(long *)((long)__1_main_1_opaque_list_1 + 8) + 0x10) = piVar3;
  *(int **)((long)__1_main_1_opaque_list_1 + 8) = piVar3;
  __1_main_1_opaque_ptr_2 = *(undefined8 *)((long)__1_main_1_opaque_list_1 + 8);
  auStack_8c[5] = 1;
  auStack_8c[6] = 2;
  auStack_8c[7] = 3;
  auStack_8c[8] = 4;
  auStack_8c[9] = 5;
  for (local_f8 = 0; local_f8 < 2; local_f8 = local_f8 + 1) {
    auStack_8c[local_f8] = auStack_8c[(long)local_f8 + 5];
  }
  for (local_f4 = 0; local_f4 < 3; local_f4 = local_f4 + 1) {
    auStack_8c[(long)local_f4 + 2] = auStack_8c[(long)(local_f4 + 2) + 5];
  }
  for (local_f0 = 0; local_f0 < 2; local_f0 = local_f0 + 1) {
    auStack_58[local_f0] = auStack_8c[local_f0];
  }
  for (local_ec = 0; local_ec < 3; local_ec = local_ec + 1) {
    auStack_58[local_ec + 2] = auStack_8c[(long)local_ec + 2];
  }
  local_38 = 'C';
  local_37 = 0x61;
  local_36 = 0x6c;
  local_35 = 99;
  local_34 = 0x75;
  local_33 = 0x6c;
  local_32 = 0x61;
  local_31 = 0x74;
  local_30 = 0x69;
  local_2f = 0x6e;
  local_2e = 0x67;
  local_2d = 0x20;
  local_2c = 0x73;
  local_2b = 0x75;
  local_2a = 0x6d;
  local_29 = 0x20;
  local_28 = 0x6f;
  local_27 = 0x66;
  local_26 = 0x20;
  local_25 = 0x61;
  local_24 = 0x72;
  local_23 = 0x72;
  local_22 = 0x61;
  local_21 = 0x79;
  local_20 = 0x20;
  local_1f = 0x65;
  local_1e = 0x6c;
  local_1d = 0x65;
  local_1c = 0x6d;
  local_1b = 0x65;
  local_1a = 0x6e;
  local_19 = 0x74;
  local_18 = 0x73;
  local_17 = 0x21;
  local_16 = 0;
  __1_main_1_opaque_ptr_1 = __1_main_1_opaque_ptr_2;
  puts(&local_38);
  local_e8 = 0;
  for (local_e4 = 0; local_e4 < 5; local_e4 = local_e4 + 1) {
    local_e8 = local_e8 + auStack_58[local_e4];
  }
  if (local_e8 == 0) {
    puts("Sum is zero");
  }
  else {
    printf("Sum of array elements is %d\n",(ulong)local_e8);
  }
  for (local_e0 = 0; (int)local_e0 < 5; local_e0 = local_e0 + 1) {
    if (auStack_8c + 5 != (uint *)0x0) {
      printf("Element %d: %d\n",(ulong)local_e0,(ulong)(auStack_8c + 5)[(int)local_e0]);
    }
  }
  if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail();
  }
  return 0;
}
```

## Graph view
![](../../assets/initopaque-pseudocode.png)

### Command
```shell
tigress \
   --Environment=x86_64:Linux:Gcc:4.6 \
   --Transform=InitOpaque \
   --Functions=* \
   obfuscation-demo.c \
   --out=tigress/code/demo.c
```

- [mixedBooleanArithmetic](code/)
