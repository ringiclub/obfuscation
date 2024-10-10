- [initOpaque.c](code/initOpaque.c)
  - d
```shell
tigress \
   --Environment=x86_64:Linux:Gcc:4.6 \
   --Transform=InitOpaque \
   --Functions=* \
   obfuscation-demo.c \
   --out=tigress/code/demo.c
```

