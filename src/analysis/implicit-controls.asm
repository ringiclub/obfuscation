; original code
jne target_label
    ; some code
target_label:
    ; code to be executed if jne is taken

; obfuscated code
mov rax, 0            ; Set condition variable to 0
cmp rax, 1            ; Compare it against a constant
je  continue          ; If equal, jump to continue
; code to execute if jne would have been taken
continue:
    ; some code