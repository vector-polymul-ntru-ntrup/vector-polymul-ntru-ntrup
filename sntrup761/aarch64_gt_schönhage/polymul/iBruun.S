
.align 6
.global __asm_iBruun_permuted
.global ___asm_iBruun_permuted
__asm_iBruun_permuted:
___asm_iBruun_permuted:

    sub sp, sp, #4*16
    ldr  d0, [x2]
    stp  d8,  d9, [sp, #0*16]
    ldr  q1, [x2, #8]
    stp d10, d11, [sp, #1*16]
    stp d12, d13, [sp, #2*16]
    stp d14, d15, [sp, #3*16]


.rept 2

    // 28, 29, 30, 31
    ldr q28, [x1, #17*16]
    ldr q30, [x1, #25*16]
    
    sub       v3.8H, v28.8H, v30.8H
    mul      v15.8H,  v3.8H, v1.H[4]
    ldr q29, [x1, #21*16]
    sqrdmulh  v5.8H,  v3.8H, v1.H[5]
    ldr q31, [x1, #29*16]
    mls      v15.8H,  v5.8H, v0.H[0]
    
    // 24, 25, 26, 27
    ldr q24, [x1, #1*16]
    sub       v2.8H, v31.8H, v29.8H
    mul      v14.8H,  v2.8H, v1.H[4]
    ldr q26, [x1, #9*16]
    sqrdmulh  v4.8H,  v2.8H, v1.H[5]
    sub       v3.8H, v24.8H, v26.8H
    mls      v14.8H,  v4.8H, v0.H[0]

    mul      v11.8H,  v3.8H, v1.H[0]
    add      v12.8H, v28.8H, v30.8H
    sqrdmulh  v5.8H,  v3.8H, v1.H[1]
    add      v12.8H, v12.8H, v14.8H
    mls      v11.8H,  v5.8H, v0.H[0]

    ldr q25, [x1, #5*16]
    add      v13.8H, v29.8H, v31.8H
    mls      v13.8H, v15.8H, v1.H[6]
    ldr q27, [x1, #13*16]
    sqrdmulh  v6.8H, v15.8H, v1.H[7]
    sub       v2.8H, v27.8H, v25.8H
    mla      v13.8H,  v6.8H, v0.H[0]

    mul      v10.8H,  v2.8H, v1.H[0]
    add       v9.8H, v25.8H, v27.8H
    sqrdmulh  v4.8H,  v2.8H, v1.H[1]
    mls      v10.8H,  v4.8H, v0.H[0]
    
    add       v8.8H, v24.8H, v26.8H
    mls       v9.8H, v11.8H, v1.H[2]
    add       v8.8H,  v8.8H, v10.8H
    sqrdmulh  v6.8H, v11.8H, v1.H[3]
    mla       v9.8H,  v6.8H, v0.H[0]

    // 24, 26, 28, 30
    sub       v2.8H, v14.8H, v10.8H
    mul      v28.8H,  v2.8H, v0.H[2]
    sub       v3.8H,  v8.8H, v12.8H
    sqrdmulh  v4.8H,  v2.8H, v0.H[3]
    mls      v28.8H,  v4.8H, v0.H[0]

    add      v24.8H,  v8.8H, v12.8H
    mul      v30.8H,  v3.8H, v0.H[2]
    add      v24.8H, v24.8H, v28.8H
    sqrdmulh  v5.8H,  v3.8H, v0.H[3]
    add      v26.8H, v10.8H, v14.8H
    mls      v30.8H,  v5.8H, v0.H[0]
    sub      v26.8H, v26.8H, v30.8H

    sqdmulh   v6.8H, v24.8H, v0.H[1]
    sshr      v6.8H,  v6.8H, #12
    mls      v24.8H,  v6.8H, v0.H[0]

    sqdmulh   v7.8H, v26.8H, v0.H[1]
    sshr      v7.8H,  v7.8H, #12
    mls      v26.8H,  v7.8H, v0.H[0]

    // 25, 27, 29, 31
    sub       v2.8H, v15.8H, v11.8H
    mul      v29.8H,  v2.8H, v0.H[2]
    sub       v3.8H,  v9.8H, v13.8H
    sqrdmulh  v4.8H,  v2.8H, v0.H[3]
    mls      v29.8H,  v4.8H, v0.H[0]

    add      v25.8H,  v9.8H, v13.8H
    mul      v31.8H,  v3.8H, v0.H[2]
    add      v25.8H, v25.8H, v29.8H
    sqrdmulh  v5.8H,  v3.8H, v0.H[3]
    add      v27.8H, v11.8H, v15.8H
    mls      v31.8H,  v5.8H, v0.H[0]
    sub      v27.8H, v27.8H, v31.8H

    // 20, 21, 22, 23
    sqdmulh   v6.8H, v25.8H, v0.H[1]
    sshr      v6.8H,  v6.8H, #12
    ldr q20, [x1, #16*16]
    mls      v25.8H,  v6.8H, v0.H[0]

    sqdmulh   v7.8H, v27.8H, v0.H[1]
    sshr      v7.8H,  v7.8H, #12
    ldr q22, [x1, #24*16]
    mls      v27.8H,  v7.8H, v0.H[0]

    sub       v3.8H, v20.8H, v22.8H
    mul      v15.8H,  v3.8H, v1.H[4]
    ldr q21, [x1, #20*16]
    sqrdmulh  v5.8H,  v3.8H, v1.H[5]
    ldr q23, [x1, #28*16]
    mls      v15.8H,  v5.8H, v0.H[0]

    // 16, 17, 18, 19
    sub       v2.8H, v23.8H, v21.8H
    mul      v14.8H,  v2.8H, v1.H[4]
    ldr q16, [x1, #0*16]
    sqrdmulh  v4.8H,  v2.8H, v1.H[5]
    ldr q18, [x1, #8*16]
    mls      v14.8H,  v4.8H, v0.H[0]
    sub       v3.8H, v16.8H, v18.8H
    
    mul      v11.8H,  v3.8H, v1.H[0]
    add      v12.8H, v20.8H, v22.8H
    sqrdmulh  v5.8H,  v3.8H, v1.H[1]
    add      v12.8H, v12.8H, v14.8H
    mls      v11.8H,  v5.8H, v0.H[0]
    
    add      v13.8H, v21.8H, v23.8H
    mls      v13.8H, v15.8H, v1.H[6]
    ldr q17, [x1, #4*16]
    sqrdmulh  v6.8H, v15.8H, v1.H[7]
    ldr q19, [x1, #12*16]
    mla      v13.8H,  v6.8H, v0.H[0]

    sub       v2.8H, v19.8H, v17.8H
    mul      v10.8H,  v2.8H, v1.H[0]
    sqrdmulh  v4.8H,  v2.8H, v1.H[1]
    mls      v10.8H,  v4.8H, v0.H[0]

    add       v9.8H, v17.8H, v19.8H
    mls       v9.8H, v11.8H, v1.H[2]
    add       v8.8H, v16.8H, v18.8H
    sqrdmulh  v6.8H, v11.8H, v1.H[3]
    add       v8.8H,  v8.8H, v10.8H
    mla       v9.8H,  v6.8H, v0.H[0]

    // 16, 18, 20, 22
    sub       v2.8H, v14.8H, v10.8H
    mul      v20.8H,  v2.8H, v0.H[2]
    sub       v5.8H,  v8.8H, v12.8H
    sqrdmulh  v3.8H,  v2.8H, v0.H[3]
    mls      v20.8H,  v3.8H, v0.H[0]

    mul      v22.8H,  v5.8H, v0.H[2]
    trn1     v4.8H, v20.8H, v28.8H
    sqrdmulh  v6.8H,  v5.8H, v0.H[3]
    str q4, [x0, #8*16]
    add      v16.8H,  v8.8H, v12.8H
    mls      v22.8H,  v6.8H, v0.H[0]
    add      v16.8H, v16.8H, v20.8H

    sqdmulh   v2.8H, v16.8H, v0.H[1]
    trn1     v7.8H, v22.8H, v30.8H
    str q7, [x0, #12*16]
    
    sshr      v3.8H,  v2.8H, #12
    mls      v16.8H,  v3.8H, v0.H[0]
    add      v18.8H, v10.8H, v14.8H

    trn1      v4.8H, v16.8H, v24.8H
    str  q4, [x0, #0*16]
    
    sub      v18.8H, v18.8H, v22.8H
    sqdmulh   v5.8H, v18.8H, v0.H[1]
    sshr      v6.8H,  v5.8H, #12
    mls      v18.8H,  v6.8H, v0.H[0]

    trn1      v7.8H, v18.8H, v26.8H
    str  q7, [x0, #4*16]
    
    // 17, 19, 21, 23
    sub       v2.8H, v15.8H, v11.8H
    trn2      v8.8H, v16.8H, v24.8H
    str  q8, [x0, #16*16]
    mul      v21.8H,  v2.8H, v0.H[2]
    trn2     v10.8H, v18.8H, v26.8H
    str q10, [x0, #20*16]
    sqrdmulh  v4.8H,  v2.8H, v0.H[3]
    trn2     v12.8H, v20.8H, v28.8H
    str q12, [x0, #24*16]
    mls      v21.8H,  v4.8H, v0.H[0]
    trn2     v14.8H, v22.8H, v30.8H
    str q14, [x0, #28*16]

    sub       v3.8H,  v9.8H, v13.8H
    mul      v23.8H,  v3.8H, v0.H[2]
    trn1     v16.8H, v21.8H, v29.8H
    str q16, [x0, #10*16]
    sqrdmulh  v5.8H,  v3.8H, v0.H[3]
    trn2     v18.8H, v21.8H, v29.8H
    str q18, [x0, #26*16]
    mls      v23.8H,  v5.8H, v0.H[0]

    add      v17.8H,  v9.8H, v13.8H
    add      v17.8H, v17.8H, v21.8H
    trn1     v20.8H, v23.8H, v31.8H
    sqdmulh   v6.8H, v17.8H, v0.H[1]
    str q20, [x0, #14*16]
    sshr      v6.8H,  v6.8H, #12
    trn2     v22.8H, v23.8H, v31.8H
    mls      v17.8H,  v6.8H, v0.H[0]
    str q22, [x0, #30*16]
    

    add      v19.8H, v11.8H, v15.8H
    sub      v19.8H, v19.8H, v23.8H
    trn1     v24.8H, v17.8H, v25.8H
    sqdmulh   v7.8H, v19.8H, v0.H[1]
    str q24, [x0, #2*16]
    sshr      v7.8H,  v7.8H, #12
    trn2     v26.8H, v17.8H, v25.8H
    mls      v19.8H,  v7.8H, v0.H[0]
    str q26, [x0, #18*16]
    
    trn1     v28.8H, v19.8H, v27.8H
    str q28, [x0, #6*16]
    trn2     v30.8H, v19.8H, v27.8H
    str q30, [x0, #22*16]

    add x1, x1, #2*16
    
    add x0, x0, #16

.endr

    ldp  d8,  d9, [sp, #0*16]
    ldp d10, d11, [sp, #1*16]
    ldp d12, d13, [sp, #2*16]
    ldp d14, d15, [sp, #3*16]
    add sp, sp, #4*16

    br lr



