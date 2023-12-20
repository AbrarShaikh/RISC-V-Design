delay(int):
        push    {r4, lr}
        mov     r4, r0
        bl      clock
        add     r4, r4, r0
.L2:
        bl      clock
        cmp     r0, r4
        blt     .L2
        pop     {r4, pc}
.LC0:
        .ascii  "Count value is: %d\012\000"
display(int):
        push    {r3, lr}
        mov     r1, r0
        movw    r0, #:lower16:.LC0
        movt    r0, #:upper16:.LC0
        bl      printf
        pop     {r3, pc}
main:
        push    {r3, r4, r5, lr}
        movs    r4, #0
        movw    r5, #41248
        movt    r5, 7
.L9:
        mov     r0, r4
        bl      display(int)
        adds    r4, r4, #1
        cmp     r4, #16
        it      ge
        movge   r4, #0
        mov     r0, r5
        bl      delay(int)
        b       .L9
