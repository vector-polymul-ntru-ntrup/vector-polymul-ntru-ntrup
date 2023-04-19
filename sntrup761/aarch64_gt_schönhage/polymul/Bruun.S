
.align 6
.global __asm_Bruun_permuted
.global ___asm_Bruun_permuted
__asm_Bruun_permuted:
___asm_Bruun_permuted:

    ldrh w4, [x2]
    sub sp, sp, #(16*4)
    stp  d8,  d9, [sp, #16*0]
    ldr s0, [x2, #2]
    stp d10, d11, [sp, #16*1]
    ldr q1, [x2, #6]
    stp d12, d13, [sp, #16*2]
    mov v0.H[2], w4
    stp d14, d15, [sp, #16*3]


    // TODO: recognize the interleaving pattern
    // and write macros for them
.rept 2

    // 16, 17, 18, 19, 20, 21, 22, 23
    
    // 16, 18, 20, 22
    // 17, 19, 21, 23
    
    ldr q12, [x1, #8*16]
    ldr q13, [x1, #24*16]
    trn1     v20.8H, v12.8H, v13.8H
    trn2     v28.8H, v12.8H, v13.8H
    
    ldr q14, [x1, #12*16]
    ldr q15, [x1, #28*16]
    trn1     v22.8H, v14.8H, v15.8H
    trn2     v30.8H, v14.8H, v15.8H
    
    ldr  q8, [x1, #0*16]
    mul       v4.8H, v20.8H, v0.H[0]
    ldr  q9, [x1, #16*16]
    sqrdmulh  v5.8H, v20.8H, v0.H[1]
    trn1     v16.8H,  v8.8H,  v9.8H
    mls       v4.8H,  v5.8H, v0.H[2]
    trn2     v24.8H,  v8.8H,  v9.8H

    ldr q10, [x1, #4*16]
    mul       v6.8H, v22.8H, v0.H[0]
    ldr q11, [x1, #20*16]
    sqrdmulh  v7.8H, v22.8H, v0.H[1]
    trn1     v18.8H, v10.8H, v11.8H
    mls       v6.8H,  v7.8H, v0.H[2]
    trn2     v26.8H, v10.8H, v11.8H
    
    ldr q12, [x1, #10*16]
    sub       v8.8H, v16.8H, v20.8H
    add      v10.8H, v18.8H, v22.8H
    ldr q13, [x1, #26*16]
    add      v16.8H,  v8.8H,  v6.8H
    sub      v18.8H, v10.8H,  v4.8H

    ldr q14, [x1, #14*16]
    sub      v20.8H,  v8.8H,  v6.8H
    add      v22.8H, v10.8H,  v4.8H
    ldr q15, [x1, #30*16]
    trn1     v21.8H, v12.8H, v13.8H
    trn2     v29.8H, v12.8H, v13.8H
    ldr  q8, [x1, #2*16]
    trn1     v23.8H, v14.8H, v15.8H
    trn2     v31.8H, v14.8H, v15.8H
    
    ldr  q9, [x1, #18*16]
    mul       v4.8H, v21.8H, v0.H[0]
    trn1     v17.8H,  v8.8H,  v9.8H
    ldr q10, [x1, #6*16]
    sqrdmulh  v5.8H, v21.8H, v0.H[1]
    trn2     v25.8H,  v8.8H,  v9.8H
    ldr q11, [x1, #22*16]
    mls       v4.8H,  v5.8H, v0.H[2]
    trn1     v19.8H, v10.8H, v11.8H

    add x1, x1, #16

    mul       v6.8H, v23.8H, v0.H[0]
    trn2     v27.8H, v10.8H, v11.8H
    sqrdmulh  v7.8H, v23.8H, v0.H[1]
    sub       v9.8H, v17.8H, v21.8H
    mls       v6.8H,  v7.8H, v0.H[2]
    add      v11.8H, v19.8H, v23.8H

    // 24, 25, 26, 27, 28, 29, 30, 31
    
    // 24, 26, 28, 30
    // 25, 27, 29, 31
    
    mul      v12.8H, v28.8H, v0.H[0]
    add      v17.8H,  v9.8H,  v6.8H
    sqrdmulh v13.8H, v28.8H, v0.H[1]
    sub      v19.8H, v11.8H,  v4.8H
    mls      v12.8H, v13.8H, v0.H[2]
    sub      v21.8H,  v9.8H,  v6.8H
    mul      v14.8H, v30.8H, v0.H[0]
    add      v23.8H, v11.8H,  v4.8H
    
    sqrdmulh v15.8H, v30.8H, v0.H[1]
    sub       v8.8H, v24.8H, v28.8H
    mls      v14.8H, v15.8H, v0.H[2]
    add      v10.8H, v26.8H, v30.8H

    mul       v4.8H, v29.8H, v0.H[0]
    add      v24.8H,  v8.8H, v14.8H
    sqrdmulh  v5.8H, v29.8H, v0.H[1]
    sub      v26.8H, v10.8H, v12.8H
    mls       v4.8H,  v5.8H, v0.H[2]
    sub      v28.8H,  v8.8H, v14.8H
    mul       v6.8H, v31.8H, v0.H[0]
    add      v30.8H, v10.8H, v12.8H

    sqrdmulh  v7.8H, v31.8H, v0.H[1]
    sub       v9.8H, v25.8H, v29.8H
    mls       v6.8H,  v7.8H, v0.H[2]
    add      v11.8H, v27.8H, v31.8H

    // 16, 17, 18, 19
    
    mul      v12.8H, v18.8H, v1.H[0]
    add      v25.8H,  v9.8H, v6.8H
    sqrdmulh v13.8H, v18.8H, v1.H[1]
    sub      v27.8H, v11.8H, v4.8H
    mls      v12.8H, v13.8H, v0.H[2]
    sub      v29.8H,  v9.8H, v6.8H
    mul      v14.8H, v19.8H, v1.H[0]
    add      v31.8H, v11.8H, v4.8H

    sqrdmulh v15.8H, v19.8H, v1.H[1]
    sub      v16.8H, v16.8H, v18.8H
    mls      v14.8H, v15.8H, v0.H[2]

    mla      v17.8H, v19.8H, v1.H[2]
    sub      v18.8H, v16.8H, v14.8H
    str q18, [x0, #8*16]
    sqrdmulh  v8.8H, v19.8H, v1.H[3]
    add      v16.8H, v16.8H, v14.8H
    str q16, [x0, #0*16]
    mls      v17.8H,  v8.8H, v0.H[2]

    // 20, 21, 22, 23
    
    mul      v4.8H, v22.8H, v1.H[4]
    add      v19.8H, v17.8H, v12.8H
    str q19, [x0, #12*16]
    sqrdmulh v5.8H, v22.8H, v1.H[5]
    sub      v17.8H, v17.8H, v12.8H
    str q17, [x0, #4*16]
    
    mls      v4.8H,  v5.8H, v0.H[2]

    mul      v6.8H, v23.8H, v1.H[4]
    sub      v20.8H, v20.8H, v22.8H
    sqrdmulh v7.8H, v23.8H, v1.H[5]
    mls      v6.8H,  v7.8H, v0.H[2]

    mla      v21.8H, v23.8H, v1.H[6]
    sub      v22.8H, v20.8H,  v6.8H
    str q22, [x0, #24*16]
    sqrdmulh  v9.8H, v23.8H, v1.H[7]
    add      v20.8H, v20.8H,  v6.8H
    str q20, [x0, #16*16]
    mls      v21.8H,  v9.8H, v0.H[2]

    // 24, 25, 26, 27
    
    mul      v12.8H, v26.8H, v1.H[0]
    add      v23.8H, v21.8H,  v4.8H
    str q23, [x0, #28*16]
    sqrdmulh v13.8H, v26.8H, v1.H[1]
    sub      v21.8H, v21.8H,  v4.8H
    str q21, [x0, #20*16]

    mls      v12.8H, v13.8H, v0.H[2]

    mul      v14.8H, v27.8H, v1.H[0]
    sqrdmulh v15.8H, v27.8H, v1.H[1]
    mls      v14.8H, v15.8H, v0.H[2]

    mla      v25.8H, v27.8H, v1.H[2]
    sub      v24.8H, v24.8H, v26.8H
    sqrdmulh  v8.8H, v27.8H, v1.H[3]
    sub      v26.8H, v24.8H, v14.8H
    str q26, [x0, #9*16]
    mls      v25.8H,  v8.8H, v0.H[2]
    add      v24.8H, v24.8H, v14.8H
    str q24, [x0, #1*16]
    
    // 28, 29, 30, 31
    
    mul       v4.8H, v30.8H, v1.H[4]
    add      v27.8H, v25.8H, v12.8H
    str q27, [x0, #13*16]
    sqrdmulh  v5.8H, v30.8H, v1.H[5]
    sub      v25.8H, v25.8H, v12.8H
    str q25, [x0, #5*16]
    mls       v4.8H,  v5.8H, v0.H[2]

    mul       v6.8H, v31.8H, v1.H[4]
    sqrdmulh  v7.8H, v31.8H, v1.H[5]
    mls       v6.8H,  v7.8H, v0.H[2]

    mla      v29.8H, v31.8H, v1.H[6]
    sub      v28.8H, v28.8H, v30.8H
    sqrdmulh  v9.8H, v31.8H, v1.H[7]
    sub      v30.8H, v28.8H,  v6.8H
    str q30, [x0, #25*16]
    mls      v29.8H,  v9.8H, v0.H[2]
    add      v28.8H, v28.8H,  v6.8H
    str q28, [x0, #17*16]
    
    add      v31.8H, v29.8H,  v4.8H
    str q31, [x0, #29*16]
    sub      v29.8H, v29.8H,  v4.8H
    str q29, [x0, #21*16]
    
    add x0, x0, #2*16

.endr

    // TODO: interleave these
    ldp  d8,  d9, [sp, #16*0]
    ldp d10, d11, [sp, #16*1]
    ldp d12, d13, [sp, #16*2]
    ldp d14, d15, [sp, #16*3]
    add sp, sp, #(16*4)

    br lr



