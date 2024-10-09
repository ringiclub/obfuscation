- [encodeBranches.c](code/encodeBranches.c)
  - https://tigress.wtf/encodeBranches.html
  - Le code veut pas compiler après avoir été obfusqué
```shell
tigress \
    --Environment=x86_64:Linux:Gcc:4.6 \
    --Transform=InitOpaque \
        --Functions=* \
    --Transform=AntiBranchAnalysis \
        --Functions=* \
        --AntiBranchAnalysisKinds=goto2nopSled \
        --AntiBranchAnalysisOpaqueStructs=input \
    obfuscation-demo.c \
    --out=tigress/code/encodeBranches.c
```

- [addOpaque.c](code/addOpaque.c)
    - https://tigress.wtf/addOpaque.html
    - Le code veut pas compiler après avoir été obfusqué
```shell
tigress \
    --Environment=x86_64:Linux:Gcc:4.6 \
    --Transform=InitOpaque \
        --Functions=* \
    --Transform=AntiBranchAnalysis \
        --Functions=* \
        --AntiBranchAnalysisKinds=goto2nopSled \
        --AntiBranchAnalysisOpaqueStructs=input \
    obfuscation-demo.c \
    --out=tigress/code/encodeBranches.c
```

- [encodeBranches.c](code/encodeBranches.c)
    - https://tigress.wtf/encodeBranches.html
    - Le code veut pas compiler après avoir été obfusqué
```shell
tigress \
    --Environment=x86_64:Linux:Gcc:4.6 \
    --Transform=InitOpaque \
        --Functions=* \
    --Transform=AntiBranchAnalysis \
        --Functions=* \
        --AntiBranchAnalysisKinds=goto2nopSled \
        --AntiBranchAnalysisOpaqueStructs=input \
    obfuscation-demo.c \
    --out=tigress/code/encodeBranches.c
```

- [encodeBranches.c](code/encodeBranches.c)
    - https://tigress.wtf/encodeBranches.html
    - Le code veut pas compiler après avoir été obfusqué
```shell
tigress \
    --Environment=x86_64:Linux:Gcc:4.6 \
    --Transform=InitOpaque \
        --Functions=* \
    --Transform=AntiBranchAnalysis \
        --Functions=* \
        --AntiBranchAnalysisKinds=goto2nopSled \
        --AntiBranchAnalysisOpaqueStructs=input \
    obfuscation-demo.c \
    --out=tigress/code/encodeBranches.c
```

