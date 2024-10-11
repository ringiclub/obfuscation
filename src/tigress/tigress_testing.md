# Introduction

Here all the test on Tigress obfuscator are made based on this initial code [click here](../obfuscation-demo.c)...
This file aim to show some testing on tigress, to demonstrate the changes after the obfuscation, on the 4 mosts commmon one for our cases.

# Opaque Predicate

- [executable](code/opaquePredicate.d/initOpaque)
- [obfuscated_source](code/opaquePredicate.d/initOpaque.c)

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
![](../../assets/images/pseucode/initopaque-pseudocode.png)

### Command
```shell
tigress \
   --Environment=x86_64:Linux:Gcc:11.4.0 \
   --Transform=InitOpaque \
   --Functions=* \
   obfuscation-demo.c \
   --out=tigress/code/initOpaque.c
```

# Mixed boolean arithmetic

## Pseudo-code
```c++

undefined8 main(undefined4 param_1,undefined8 param_2,undefined8 param_3)

{
  long in_FS_OFFSET;
  uint local_c0;
  uint local_bc;
  uint local_b8;
  uint local_b4;
  uint local_b0;
  uint local_ac;
  uint local_a8;
  uint auStack_8c [5];
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
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
  local_78 = 1;
  local_74 = 2;
  local_70 = 3;
  local_6c = 4;
  local_68 = 5;
  for (local_c0 = 0; (int)((local_c0 - 2 ^ local_c0) & (local_c0 ^ 2) ^ local_c0 - 2) < 0;
      local_c0 = (local_c0 | 1) * 2 - (local_c0 ^ 1)) {
    auStack_8c[(int)local_c0] = auStack_8c[(long)(int)local_c0 + 5];
  }
  for (local_bc = 0; (int)((local_bc - 3 ^ local_bc) & (local_bc ^ 3) ^ local_bc - 3) < 0;
      local_bc = (local_bc * 2 | 2) + (local_bc ^ 0xfffffffe) + 1) {
    auStack_8c[(long)(int)local_bc + 2] = auStack_8c[(long)(int)(local_bc + 2) + 5];
  }
  local_b8 = 0;
  while ((int)(((int)(-(uint)((int)local_b8 < 3) & 2 - local_b8) >> 0x1f) -
              (2 - local_b8 & -(uint)((int)local_b8 < 3) ^
              (int)(-(uint)((int)local_b8 < 3) & 2 - local_b8) >> 0x1f)) < 0) {
    auStack_58[(int)local_b8] = auStack_8c[(int)local_b8];
    local_b8 = (local_b8 & 1) * 2 + (local_b8 ^ 1);
  }
  local_b4 = 0;
  while ((int)((int)(-(uint)((int)local_b4 < 4) & 3 - local_b4) >> 0x1f ^
              ((int)(-(uint)((int)local_b4 < 4) & 3 - local_b4) >> 0x1f) -
              (-(uint)((int)local_b4 < 4) & 3 - local_b4)) < 0) {
    auStack_58[(int)(local_b4 + 2)] = auStack_8c[(long)(int)local_b4 + 2];
    local_b4 = (local_b4 | 1) * 2 + (local_b4 ^ 0xfffffffe) + 1;
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
  _global_argv = param_2;
  _global_argc = param_1;
  _global_envp = param_3;
  puts(&local_38);
  local_b0 = 0;
  local_ac = 0;
  while ((int)(((int)(-(uint)((int)local_ac < 6) & 5 - local_ac) >> 0x1f) -
              (5 - local_ac & -(uint)((int)local_ac < 6) ^
              (int)(-(uint)((int)local_ac < 6) & 5 - local_ac) >> 0x1f)) < 0) {
    local_b0 = (auStack_58[(int)local_ac] | local_b0) * 2 + ~(auStack_58[(int)local_ac] ^ local_b0)
               + 1;
    local_ac = (local_ac * 2 & 2) + (local_ac ^ 1);
  }
  if ((int)((local_b0 >> 1) - local_b0) < 0) {
    printf("Sum of array elements is %d\n",(ulong)local_b0);
  }
  else {
    puts("Sum is zero");
  }
  local_a8 = 0;
  while ((int)(((int)(-(uint)((int)local_a8 < 6) & 5 - local_a8) >> 0x1f) -
              (5 - local_a8 & -(uint)((int)local_a8 < 6) ^
              (int)(-(uint)((int)local_a8 < 6) & 5 - local_a8) >> 0x1f)) < 0) {
    if (auStack_8c + 5 != (uint *)0x0) {
      printf("Element %d: %d\n",(ulong)local_a8,(ulong)(auStack_8c + 5)[(int)local_a8]);
    }
    local_a8 = (local_a8 * 2 | 2) + (local_a8 ^ 0xfffffffe) + 1;
  }
  if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
                    /* WARNING: Subroutine does not return */
    __stack_chk_fail();
  }
  return 0;
}
```

## Graph view
![](../../assets/images/pseucode/mba-pseudocode.png)

### Command
```shell
tigress \
  --Environment=x86_64:Linux:Gcc:11.4.0 \
  --Transform=EncodeArithmetic \
  --Functions=* \
  --EncodeArithmeticKinds=* \
  obfuscation-demo.c \
  --out=tigress/code/mba.c
```

# Flattening

## Pseudo-code
```c++

undefined8 main(undefined4 param_1,undefined8 param_2,undefined8 param_3)

{
  long in_FS_OFFSET;
  int local_c8;
  int local_c4;
  int local_c0;
  int local_bc;
  int local_b8;
  int local_b4;
  int local_b0;
  uint local_ac;
  int local_a8;
  uint local_a4;
  int *local_a0;
  undefined8 local_98;
  int aiStack_8c [5];
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  int aiStack_58 [8];
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
  local_98 = 0x51;
  _global_argv = param_2;
  _global_argc = param_1;
  _global_envp = param_3;
  do {
    switch(local_98) {
    case 0:
      local_31 = 0x74;
      local_98 = 0x1f;
      break;
    case 1:
      local_26 = 0x20;
      local_98 = 0x26;
      break;
    case 2:
      local_1a = 0x6e;
      local_98 = 0x14;
      break;
    case 3:
      local_23 = 0x72;
      local_98 = 0x29;
      break;
    case 4:
      aiStack_58[local_b4] = aiStack_8c[local_b4];
      local_98 = 0x31;
      break;
    case 5:
      local_2f = 0x6e;
      local_98 = 0x44;
      break;
    case 6:
      local_b0 = 0;
      local_98 = 0x35;
      break;
    case 7:
      local_1c = 0x6d;
      local_98 = 0x32;
      break;
    case 8:
      local_2d = 0x20;
      local_98 = 0x2d;
      break;
    case 9:
      local_16 = 0;
      local_98 = 0x3f;
      break;
    case 10:
      if ((int)local_a4 < local_c0) {
        local_98 = 0x47;
      }
      else {
        local_98 = 0x37;
      }
      break;
    case 0xb:
      local_28 = 0x6f;
      local_98 = 0x12;
      break;
    case 0xd:
      local_1d = 0x65;
      local_98 = 7;
      break;
    case 0xe:
      local_24 = 0x72;
      local_98 = 3;
      break;
    case 0xf:
      local_74 = 2;
      local_98 = 0x38;
      break;
    case 0x11:
      printf("Sum of array elements is %d\n",(ulong)local_ac);
      local_98 = 0x30;
      break;
    case 0x12:
      local_27 = 0x66;
      local_98 = 1;
      break;
    case 0x13:
      local_33 = 0x6c;
      local_98 = 0x39;
      break;
    case 0x14:
      local_19 = 0x74;
      local_98 = 0x41;
      break;
    case 0x15:
      aiStack_8c[(long)local_b8 + 2] = aiStack_8c[(long)(local_c8 + local_b8) + 5];
      local_98 = 0x2c;
      break;
    case 0x17:
      if (local_ac == 0) {
        local_98 = 0x3b;
      }
      else {
        local_98 = 0x11;
      }
      break;
    case 0x19:
      local_c0 = 5;
      local_98 = 0x48;
      break;
    case 0x1a:
      aiStack_58[local_b0 + local_c8] = aiStack_8c[(long)local_b0 + 2];
      local_98 = 0x4f;
      break;
    case 0x1b:
      local_2b = 0x75;
      local_98 = 0x54;
      break;
    case 0x1d:
      local_1f = 0x65;
      local_98 = 0x3a;
      break;
    case 0x1e:
      if (local_b8 < local_c4) {
        local_98 = 0x15;
      }
      else {
        local_98 = 0x2b;
      }
      break;
    case 0x1f:
      local_30 = 0x69;
      local_98 = 5;
      break;
    case 0x20:
      local_68 = 5;
      local_98 = 0x27;
      break;
    case 0x21:
      local_38 = 'C';
      local_98 = 0x24;
      break;
    case 0x22:
      local_21 = 0x79;
      local_98 = 0x4e;
      break;
    case 0x23:
      local_bc = local_bc + 1;
      local_98 = 0x34;
      break;
    case 0x24:
      local_37 = 0x61;
      local_98 = 0x33;
      break;
    case 0x25:
      local_34 = 0x75;
      local_98 = 0x13;
      break;
    case 0x26:
      local_25 = 0x61;
      local_98 = 0xe;
      break;
    case 0x27:
      local_bc = 0;
      local_98 = 0x34;
      break;
    case 0x28:
      local_29 = 0x20;
      local_98 = 0xb;
      break;
    case 0x29:
      local_22 = 0x61;
      local_98 = 0x22;
      break;
    case 0x2b:
      local_b4 = 0;
      local_98 = 0x45;
      break;
    case 0x2c:
      local_b8 = local_b8 + 1;
      local_98 = 0x1e;
      break;
    case 0x2d:
      local_2c = 0x73;
      local_98 = 0x1b;
      break;
    case 0x2e:
      local_17 = 0x21;
      local_98 = 9;
      break;
    case 0x2f:
      local_a8 = local_a8 + 1;
      local_98 = 0x3e;
      break;
    case 0x30:
      local_a4 = 0;
      local_98 = 0x36;
      break;
    case 0x31:
      local_b4 = local_b4 + 1;
      local_98 = 0x45;
      break;
    case 0x32:
      local_1b = 0x65;
      local_98 = 2;
      break;
    case 0x33:
      local_36 = 0x6c;
      local_98 = 0x42;
      break;
    case 0x34:
      if (local_bc < local_c8) {
        local_98 = 0x4d;
      }
      else {
        local_98 = 0x4b;
      }
      break;
    case 0x35:
      if (local_b0 < local_c4) {
        local_98 = 0x1a;
      }
      else {
        local_98 = 0x21;
      }
      break;
    case 0x36:
      local_a0 = aiStack_8c + 5;
      local_98 = 10;
      break;
    case 0x37:
      if (local_10 != *(long *)(in_FS_OFFSET + 0x28)) {
                    /* WARNING: Subroutine does not return */
        __stack_chk_fail();
      }
      return 0;
    case 0x38:
      local_70 = 3;
      local_98 = 0x52;
      break;
    case 0x39:
      local_32 = 0x61;
      local_98 = 0;
      break;
    case 0x3a:
      local_1e = 0x6c;
      local_98 = 0xd;
      break;
    case 0x3b:
      puts("Sum is zero");
      local_98 = 0x30;
      break;
    case 0x3e:
      if (local_a8 < local_c0) {
        local_98 = 0x46;
      }
      else {
        local_98 = 0x17;
      }
      break;
    case 0x3f:
      puts(&local_38);
      local_98 = 0x55;
      break;
    case 0x41:
      local_18 = 0x73;
      local_98 = 0x2e;
      break;
    case 0x42:
      local_35 = 99;
      local_98 = 0x25;
      break;
    case 0x44:
      local_2e = 0x67;
      local_98 = 8;
      break;
    case 0x45:
      if (local_b4 < local_c8) {
        local_98 = 4;
      }
      else {
        local_98 = 6;
      }
      break;
    case 0x46:
      local_ac = local_ac + aiStack_58[local_a8];
      local_98 = 0x2f;
      break;
    case 0x47:
      if (local_a0 == (int *)0x0) {
        local_98 = 0x50;
      }
      else {
        local_98 = 0x4a;
      }
      break;
    case 0x48:
      local_78 = 1;
      local_98 = 0xf;
      break;
    case 0x49:
      local_c8 = 2;
      local_98 = 0x57;
      break;
    case 0x4a:
      printf("Element %d: %d\n",(ulong)local_a4,(ulong)(uint)local_a0[(int)local_a4]);
      local_98 = 0x50;
      break;
    case 0x4b:
      local_b8 = 0;
      local_98 = 0x1e;
      break;
    case 0x4c:
      local_a8 = 0;
      local_98 = 0x3e;
      break;
    case 0x4d:
      aiStack_8c[local_bc] = aiStack_8c[(long)local_bc + 5];
      local_98 = 0x23;
      break;
    case 0x4e:
      local_20 = 0x20;
      local_98 = 0x1d;
      break;
    case 0x4f:
      local_b0 = local_b0 + 1;
      local_98 = 0x35;
      break;
    case 0x50:
      local_a4 = local_a4 + 1;
      local_98 = 10;
      break;
    case 0x51:
      local_a0 = (int *)0x0;
      local_98 = 0x49;
      break;
    case 0x52:
      local_6c = 4;
      local_98 = 0x20;
      break;
    case 0x54:
      local_2a = 0x6d;
      local_98 = 0x28;
      break;
    case 0x55:
      local_ac = 0;
      local_98 = 0x4c;
      break;
    case 0x57:
      local_c4 = 3;
      local_98 = 0x19;
    }
  } while( true );
}


```

## Graph view
![](../../assets/images/pseucode/flattening-pseudocode.png)

### Command
```shell
tigress \
  --Environment=x86_64:Linux:Gcc:11.4.0 \
  --Transform=Flatten \
  --Functions=* \
  --FlattenSplitBasicBlocks=true \
  --FlattenRandomizeBlocks=true \
  obfuscation-demo.c \
  --out=tigress/code/flattening.c
```

# Bogus Control Flow

## Pseudo-code
```c++
```

## Graph view
![](../../assets/bogus-pseudocode.png)

### Command
```shell

```