.align 6
.global inv_3_2_store_asm
.global _inv_3_2_store_asm
inv_3_2_store_asm:
_inv_3_2_store_asm:
    SUB sp, sp, #(16*9)
    STP x19, x20, [sp, #(16*0)]
    STP x21, x22, [sp, #(16*1)]
    STP x23, x24, [sp, #(16*2)]
    STP x25, x26, [sp, #(16*3)]
    STP x27, x28, [sp, #(16*4)]
    STP  d8,  d9, [sp, #(16*5)]
    STP d10, d11, [sp, #(16*6)]
    STP d12, d13, [sp, #(16*7)]
    STP d14, d15, [sp, #(16*8)]

    ldrh w4, [x2, #0*2]
    ldrh w5, [x2, #1*2]
    ldrh w6, [x2, #2*2]
    ldrh w7, [x2, #3*2]
    ldrh w8, [x2, #4*2]
    ldrh w9, [x2, #5*2]
    ldrh w10, [x2, #6*2]
    ldrh w11, [x2, #7*2]
    ldrh w12, [x2, #8*2]
    ldrh w13, [x2, #9*2]
    mov v15.H[0], w4
    mov v15.H[1], w5
    mov v15.H[2], w6
    mov v15.H[3], w7
    mov v15.H[4], w8
    mov v15.H[5], w9
    mov v15.H[6], w10
    mov v15.H[7], w11
    mov v8.H[0], w12
    mov v8.H[1], w13
    movi  v31.8h, #0

    ldr q0, [x1, #0]
    ldr q1, [x1, #1024]
    ldr q2, [x1, #2048]
    ldr q3, [x1, #3072]
    ldr q4, [x1, #4096]
    ldr q5, [x1, #5120]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #0]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    str q19, [x0, #0]
    ldr q21, [x0, #16]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #30]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 14
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #14]
    ldr q23, [x0, #528]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #542]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 526
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 526
    str q24, [x8]
    ldr q25, [x0, #512]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 512
    str q25, [x8]
    ldr q27, [x0, #1024]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1024
    str q27, [x8]
    ldr q29, [x0, #1040]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1054]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1038
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1038
    str q30, [x8]
    ldr q0, [x1, #16]
    ldr q1, [x1, #1040]
    ldr q2, [x1, #2064]
    ldr q3, [x1, #3088]
    ldr q4, [x1, #4112]
    ldr q5, [x1, #5136]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #16]
    add v19.8h, v19.8h, v9.8h
    str q19, [x0, #16]
    ldr q21, [x0, #32]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #46]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 30
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #30]
    ldr q23, [x0, #544]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #558]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 542
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 542
    str q24, [x8]
    ldr q25, [x0, #528]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 528
    str q25, [x8]
    ldr q27, [x0, #1040]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1040
    str q27, [x8]
    ldr q29, [x0, #1056]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1070]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1054
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1054
    str q30, [x8]
    ldr q0, [x1, #32]
    ldr q1, [x1, #1056]
    ldr q2, [x1, #2080]
    ldr q3, [x1, #3104]
    ldr q4, [x1, #4128]
    ldr q5, [x1, #5152]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #32]
    add v19.8h, v19.8h, v9.8h
    str q19, [x0, #32]
    ldr q21, [x0, #48]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #62]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 46
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #46]
    ldr q23, [x0, #560]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #574]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 558
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 558
    str q24, [x8]
    ldr q25, [x0, #544]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 544
    str q25, [x8]
    ldr q27, [x0, #1056]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1056
    str q27, [x8]
    ldr q29, [x0, #1072]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1086]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1070
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1070
    str q30, [x8]
    ldr q0, [x1, #48]
    ldr q1, [x1, #1072]
    ldr q2, [x1, #2096]
    ldr q3, [x1, #3120]
    ldr q4, [x1, #4144]
    ldr q5, [x1, #5168]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #48]
    add v19.8h, v19.8h, v9.8h
    str q19, [x0, #48]
    ldr q21, [x0, #64]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #78]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 62
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #62]
    ldr q23, [x0, #576]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #590]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 574
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 574
    str q24, [x8]
    ldr q25, [x0, #560]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 560
    str q25, [x8]
    ldr q27, [x0, #1072]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1072
    str q27, [x8]
    ldr q29, [x0, #1088]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1102]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1086
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1086
    str q30, [x8]
    ldr q0, [x1, #64]
    ldr q1, [x1, #1088]
    ldr q2, [x1, #2112]
    ldr q3, [x1, #3136]
    ldr q4, [x1, #4160]
    ldr q5, [x1, #5184]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1056]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1056
    str q19, [x8]
    ldr q21, [x0, #1072]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1086]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1070
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1070
    str q22, [x8]
    ldr q23, [x0, #32]
    add v23.8h, v23.8h, v10.8h
    str q23, [x0, #32]
    ldr q25, [x0, #48]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #62]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 46
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    str q26, [x0, #46]
    ldr q27, [x0, #560]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #574]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 558
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 558
    str q28, [x8]
    ldr q29, [x0, #544]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 544
    str q29, [x8]
    ldr q0, [x1, #80]
    ldr q1, [x1, #1104]
    ldr q2, [x1, #2128]
    ldr q3, [x1, #3152]
    ldr q4, [x1, #4176]
    ldr q5, [x1, #5200]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1072]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1072
    str q19, [x8]
    ldr q21, [x0, #1088]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1102]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1086
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1086
    str q22, [x8]
    ldr q23, [x0, #48]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    str q23, [x0, #48]
    ldr q25, [x0, #64]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #78]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 62
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    str q26, [x0, #62]
    ldr q27, [x0, #576]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #590]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 574
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 574
    str q28, [x8]
    ldr q29, [x0, #560]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 560
    str q29, [x8]
    ldr q0, [x1, #96]
    ldr q1, [x1, #1120]
    ldr q2, [x1, #2144]
    ldr q3, [x1, #3168]
    ldr q4, [x1, #4192]
    ldr q5, [x1, #5216]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1088]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1088
    str q19, [x8]
    ldr q21, [x0, #1104]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1118]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1102
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1102
    str q22, [x8]
    ldr q23, [x0, #64]
    add v23.8h, v23.8h, v10.8h
    str q23, [x0, #64]
    ldr q25, [x0, #80]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #94]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 78
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    str q26, [x0, #78]
    ldr q27, [x0, #592]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #606]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 590
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 590
    str q28, [x8]
    ldr q29, [x0, #576]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 576
    str q29, [x8]
    ldr q0, [x1, #112]
    ldr q1, [x1, #1136]
    ldr q2, [x1, #2160]
    ldr q3, [x1, #3184]
    ldr q4, [x1, #4208]
    ldr q5, [x1, #5232]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1104]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1104
    str q19, [x8]
    ldr q21, [x0, #1120]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1134]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1118
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1118
    str q22, [x8]
    ldr q23, [x0, #80]
    add v23.8h, v23.8h, v10.8h
    str q23, [x0, #80]
    ldr q25, [x0, #96]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #110]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 94
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    str q26, [x0, #94]
    ldr q27, [x0, #608]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #622]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 606
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 606
    str q28, [x8]
    ldr q29, [x0, #592]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 592
    str q29, [x8]
    ldr q0, [x1, #128]
    ldr q1, [x1, #1152]
    ldr q2, [x1, #2176]
    ldr q3, [x1, #3200]
    ldr q4, [x1, #4224]
    ldr q5, [x1, #5248]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #592]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #606]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 590
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 590
    str q20, [x8]
    ldr q21, [x0, #576]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 576
    str q21, [x8]
    ldr q23, [x0, #1088]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1088
    str q23, [x8]
    ldr q25, [x0, #1104]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1118]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1102
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1102
    str q26, [x8]
    ldr q27, [x0, #64]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    str q27, [x0, #64]
    ldr q29, [x0, #80]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #94]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 78
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    str q30, [x0, #78]
    ldr q0, [x1, #144]
    ldr q1, [x1, #1168]
    ldr q2, [x1, #2192]
    ldr q3, [x1, #3216]
    ldr q4, [x1, #4240]
    ldr q5, [x1, #5264]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #608]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #622]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 606
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 606
    str q20, [x8]
    ldr q21, [x0, #592]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 592
    str q21, [x8]
    ldr q23, [x0, #1104]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1104
    str q23, [x8]
    ldr q25, [x0, #1120]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1134]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1118
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1118
    str q26, [x8]
    ldr q27, [x0, #80]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    str q27, [x0, #80]
    ldr q29, [x0, #96]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #110]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 94
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    str q30, [x0, #94]
    ldr q0, [x1, #160]
    ldr q1, [x1, #1184]
    ldr q2, [x1, #2208]
    ldr q3, [x1, #3232]
    ldr q4, [x1, #4256]
    ldr q5, [x1, #5280]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #624]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #638]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 622
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 622
    str q20, [x8]
    ldr q21, [x0, #608]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 608
    str q21, [x8]
    ldr q23, [x0, #1120]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1120
    str q23, [x8]
    ldr q25, [x0, #1136]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1150]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1134
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1134
    str q26, [x8]
    ldr q27, [x0, #96]
    add v27.8h, v27.8h, v11.8h
    str q27, [x0, #96]
    ldr q29, [x0, #112]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #126]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 110
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    str q30, [x0, #110]
    ldr q0, [x1, #176]
    ldr q1, [x1, #1200]
    ldr q2, [x1, #2224]
    ldr q3, [x1, #3248]
    ldr q4, [x1, #4272]
    ldr q5, [x1, #5296]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #640]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #654]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 638
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 638
    str q20, [x8]
    ldr q21, [x0, #624]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 624
    str q21, [x8]
    ldr q23, [x0, #1136]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1136
    str q23, [x8]
    ldr q25, [x0, #1152]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1166]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1150
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1150
    str q26, [x8]
    ldr q27, [x0, #112]
    add v27.8h, v27.8h, v11.8h
    str q27, [x0, #112]
    ldr q29, [x0, #128]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #142]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 126
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    str q30, [x0, #126]
    ldr q0, [x1, #192]
    ldr q1, [x1, #1216]
    ldr q2, [x1, #2240]
    ldr q3, [x1, #3264]
    ldr q4, [x1, #4288]
    ldr q5, [x1, #5312]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #96]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    str q19, [x0, #96]
    ldr q21, [x0, #112]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #126]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 110
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    str q22, [x0, #110]
    ldr q23, [x0, #624]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #638]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 622
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 622
    str q24, [x8]
    ldr q25, [x0, #608]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 608
    str q25, [x8]
    ldr q27, [x0, #1120]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1120
    str q27, [x8]
    ldr q29, [x0, #1136]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1150]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1134
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1134
    str q30, [x8]
    ldr q0, [x1, #208]
    ldr q1, [x1, #1232]
    ldr q2, [x1, #2256]
    ldr q3, [x1, #3280]
    ldr q4, [x1, #4304]
    ldr q5, [x1, #5328]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #112]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    str q19, [x0, #112]
    ldr q21, [x0, #128]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #142]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 126
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    str q22, [x0, #126]
    ldr q23, [x0, #640]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #654]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 638
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 638
    str q24, [x8]
    ldr q25, [x0, #624]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 624
    str q25, [x8]
    ldr q27, [x0, #1136]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1136
    str q27, [x8]
    ldr q29, [x0, #1152]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1166]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1150
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1150
    str q30, [x8]
    ldr q0, [x1, #224]
    ldr q1, [x1, #1248]
    ldr q2, [x1, #2272]
    ldr q3, [x1, #3296]
    ldr q4, [x1, #4320]
    ldr q5, [x1, #5344]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #128]
    add v19.8h, v19.8h, v9.8h
    str q19, [x0, #128]
    ldr q21, [x0, #144]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #158]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 142
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #142]
    ldr q23, [x0, #656]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #670]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 654
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 654
    str q24, [x8]
    ldr q25, [x0, #640]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 640
    str q25, [x8]
    ldr q27, [x0, #1152]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1152
    str q27, [x8]
    ldr q29, [x0, #1168]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1182]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1166
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1166
    str q30, [x8]
    ldr q0, [x1, #240]
    ldr q1, [x1, #1264]
    ldr q2, [x1, #2288]
    ldr q3, [x1, #3312]
    ldr q4, [x1, #4336]
    ldr q5, [x1, #5360]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #144]
    add v19.8h, v19.8h, v9.8h
    str q19, [x0, #144]
    ldr q21, [x0, #160]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #174]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 158
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #158]
    ldr q23, [x0, #672]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #686]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 670
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 670
    str q24, [x8]
    ldr q25, [x0, #656]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 656
    str q25, [x8]
    ldr q27, [x0, #1168]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1168
    str q27, [x8]
    ldr q29, [x0, #1184]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1198]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1182
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1182
    str q30, [x8]
    ldr q0, [x1, #256]
    ldr q1, [x1, #1280]
    ldr q2, [x1, #2304]
    ldr q3, [x1, #3328]
    ldr q4, [x1, #4352]
    ldr q5, [x1, #5376]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1152]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1152
    str q19, [x8]
    ldr q21, [x0, #1168]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1182]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1166
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1166
    str q22, [x8]
    ldr q23, [x0, #128]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    str q23, [x0, #128]
    ldr q25, [x0, #144]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #158]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 142
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    str q26, [x0, #142]
    ldr q27, [x0, #656]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #670]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 654
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 654
    str q28, [x8]
    ldr q29, [x0, #640]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 640
    str q29, [x8]
    ldr q0, [x1, #272]
    ldr q1, [x1, #1296]
    ldr q2, [x1, #2320]
    ldr q3, [x1, #3344]
    ldr q4, [x1, #4368]
    ldr q5, [x1, #5392]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1168]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1168
    str q19, [x8]
    ldr q21, [x0, #1184]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1198]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1182
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1182
    str q22, [x8]
    ldr q23, [x0, #144]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    str q23, [x0, #144]
    ldr q25, [x0, #160]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #174]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 158
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    str q26, [x0, #158]
    ldr q27, [x0, #672]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #686]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 670
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 670
    str q28, [x8]
    ldr q29, [x0, #656]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 656
    str q29, [x8]
    ldr q0, [x1, #288]
    ldr q1, [x1, #1312]
    ldr q2, [x1, #2336]
    ldr q3, [x1, #3360]
    ldr q4, [x1, #4384]
    ldr q5, [x1, #5408]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1184]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1184
    str q19, [x8]
    ldr q21, [x0, #1200]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1214]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1198
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1198
    str q22, [x8]
    ldr q23, [x0, #160]
    add v23.8h, v23.8h, v10.8h
    str q23, [x0, #160]
    ldr q25, [x0, #176]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #190]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 174
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    str q26, [x0, #174]
    ldr q27, [x0, #688]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #702]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 686
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 686
    str q28, [x8]
    ldr q29, [x0, #672]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 672
    str q29, [x8]
    ldr q0, [x1, #304]
    ldr q1, [x1, #1328]
    ldr q2, [x1, #2352]
    ldr q3, [x1, #3376]
    ldr q4, [x1, #4400]
    ldr q5, [x1, #5424]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1200]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1200
    str q19, [x8]
    ldr q21, [x0, #1216]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1230]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1214
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1214
    str q22, [x8]
    ldr q23, [x0, #176]
    add v23.8h, v23.8h, v10.8h
    str q23, [x0, #176]
    ldr q25, [x0, #192]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #206]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 190
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    str q26, [x0, #190]
    ldr q27, [x0, #704]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #718]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 702
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 702
    str q28, [x8]
    ldr q29, [x0, #688]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 688
    str q29, [x8]
    ldr q0, [x1, #320]
    ldr q1, [x1, #1344]
    ldr q2, [x1, #2368]
    ldr q3, [x1, #3392]
    ldr q4, [x1, #4416]
    ldr q5, [x1, #5440]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #688]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #702]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 686
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 686
    str q20, [x8]
    ldr q21, [x0, #672]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 672
    str q21, [x8]
    ldr q23, [x0, #1184]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1184
    str q23, [x8]
    ldr q25, [x0, #1200]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1214]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1198
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1198
    str q26, [x8]
    ldr q27, [x0, #160]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    str q27, [x0, #160]
    ldr q29, [x0, #176]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #190]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 174
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    str q30, [x0, #174]
    ldr q0, [x1, #336]
    ldr q1, [x1, #1360]
    ldr q2, [x1, #2384]
    ldr q3, [x1, #3408]
    ldr q4, [x1, #4432]
    ldr q5, [x1, #5456]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #704]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #718]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 702
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 702
    str q20, [x8]
    ldr q21, [x0, #688]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 688
    str q21, [x8]
    ldr q23, [x0, #1200]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1200
    str q23, [x8]
    ldr q25, [x0, #1216]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1230]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1214
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1214
    str q26, [x8]
    ldr q27, [x0, #176]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    str q27, [x0, #176]
    ldr q29, [x0, #192]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #206]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 190
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    str q30, [x0, #190]
    ldr q0, [x1, #352]
    ldr q1, [x1, #1376]
    ldr q2, [x1, #2400]
    ldr q3, [x1, #3424]
    ldr q4, [x1, #4448]
    ldr q5, [x1, #5472]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #720]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #734]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 718
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 718
    str q20, [x8]
    ldr q21, [x0, #704]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 704
    str q21, [x8]
    ldr q23, [x0, #1216]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1216
    str q23, [x8]
    ldr q25, [x0, #1232]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1246]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1230
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1230
    str q26, [x8]
    ldr q27, [x0, #192]
    add v27.8h, v27.8h, v11.8h
    str q27, [x0, #192]
    ldr q29, [x0, #208]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #222]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 206
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    str q30, [x0, #206]
    ldr q0, [x1, #368]
    ldr q1, [x1, #1392]
    ldr q2, [x1, #2416]
    ldr q3, [x1, #3440]
    ldr q4, [x1, #4464]
    ldr q5, [x1, #5488]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #736]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #750]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 734
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 734
    str q20, [x8]
    ldr q21, [x0, #720]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 720
    str q21, [x8]
    ldr q23, [x0, #1232]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1232
    str q23, [x8]
    ldr q25, [x0, #1248]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1262]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1246
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1246
    str q26, [x8]
    ldr q27, [x0, #208]
    add v27.8h, v27.8h, v11.8h
    str q27, [x0, #208]
    ldr q29, [x0, #224]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #238]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 222
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    str q30, [x0, #222]
    ldr q0, [x1, #384]
    ldr q1, [x1, #1408]
    ldr q2, [x1, #2432]
    ldr q3, [x1, #3456]
    ldr q4, [x1, #4480]
    ldr q5, [x1, #5504]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #192]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    str q19, [x0, #192]
    ldr q21, [x0, #208]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #222]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 206
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    str q22, [x0, #206]
    ldr q23, [x0, #720]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #734]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 718
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 718
    str q24, [x8]
    ldr q25, [x0, #704]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 704
    str q25, [x8]
    ldr q27, [x0, #1216]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1216
    str q27, [x8]
    ldr q29, [x0, #1232]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1246]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1230
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1230
    str q30, [x8]
    ldr q0, [x1, #400]
    ldr q1, [x1, #1424]
    ldr q2, [x1, #2448]
    ldr q3, [x1, #3472]
    ldr q4, [x1, #4496]
    ldr q5, [x1, #5520]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #208]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    str q19, [x0, #208]
    ldr q21, [x0, #224]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #238]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 222
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    str q22, [x0, #222]
    ldr q23, [x0, #736]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #750]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 734
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 734
    str q24, [x8]
    ldr q25, [x0, #720]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 720
    str q25, [x8]
    ldr q27, [x0, #1232]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1232
    str q27, [x8]
    ldr q29, [x0, #1248]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1262]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1246
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1246
    str q30, [x8]
    ldr q0, [x1, #416]
    ldr q1, [x1, #1440]
    ldr q2, [x1, #2464]
    ldr q3, [x1, #3488]
    ldr q4, [x1, #4512]
    ldr q5, [x1, #5536]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #224]
    add v19.8h, v19.8h, v9.8h
    str q19, [x0, #224]
    ldr q21, [x0, #240]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #254]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 238
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #238]
    ldr q23, [x0, #752]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #766]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 750
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 750
    str q24, [x8]
    ldr q25, [x0, #736]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 736
    str q25, [x8]
    ldr q27, [x0, #1248]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1248
    str q27, [x8]
    ldr q29, [x0, #1264]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1278]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1262
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1262
    str q30, [x8]
    ldr q0, [x1, #432]
    ldr q1, [x1, #1456]
    ldr q2, [x1, #2480]
    ldr q3, [x1, #3504]
    ldr q4, [x1, #4528]
    ldr q5, [x1, #5552]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #240]
    add v19.8h, v19.8h, v9.8h
    str q19, [x0, #240]
    ldr q21, [x0, #256]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #270]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 254
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    str q22, [x0, #254]
    ldr q23, [x0, #768]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #782]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 766
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 766
    str q24, [x8]
    ldr q25, [x0, #752]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 752
    str q25, [x8]
    ldr q27, [x0, #1264]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1264
    str q27, [x8]
    ldr q29, [x0, #1280]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1294]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1278
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1278
    str q30, [x8]
    ldr q0, [x1, #448]
    ldr q1, [x1, #1472]
    ldr q2, [x1, #2496]
    ldr q3, [x1, #3520]
    ldr q4, [x1, #4544]
    ldr q5, [x1, #5568]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1248]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1248
    str q19, [x8]
    ldr q21, [x0, #1264]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1278]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1262
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1262
    str q22, [x8]
    ldr q23, [x0, #224]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    str q23, [x0, #224]
    ldr q25, [x0, #240]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #254]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 238
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    str q26, [x0, #238]
    ldr q27, [x0, #752]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #766]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 750
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 750
    str q28, [x8]
    ldr q29, [x0, #736]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 736
    str q29, [x8]
    ldr q0, [x1, #464]
    ldr q1, [x1, #1488]
    ldr q2, [x1, #2512]
    ldr q3, [x1, #3536]
    ldr q4, [x1, #4560]
    ldr q5, [x1, #5584]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1264]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1264
    str q19, [x8]
    ldr q21, [x0, #1280]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1294]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1278
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1278
    str q22, [x8]
    ldr q23, [x0, #240]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    str q23, [x0, #240]
    ldr q25, [x0, #256]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #270]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 254
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    str q26, [x0, #254]
    ldr q27, [x0, #768]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #782]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 766
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 766
    str q28, [x8]
    ldr q29, [x0, #752]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 752
    str q29, [x8]
    ldr q0, [x1, #480]
    ldr q1, [x1, #1504]
    ldr q2, [x1, #2528]
    ldr q3, [x1, #3552]
    ldr q4, [x1, #4576]
    ldr q5, [x1, #5600]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1280]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1280
    str q19, [x8]
    ldr q21, [x0, #1296]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1310]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1294
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1294
    str q22, [x8]
    ldr q23, [x0, #256]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 256
    str q23, [x8]
    ldr q25, [x0, #272]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #286]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 270
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 270
    str q26, [x8]
    ldr q27, [x0, #784]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #798]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 782
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 782
    str q28, [x8]
    ldr q29, [x0, #768]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 768
    str q29, [x8]
    ldr q0, [x1, #496]
    ldr q1, [x1, #1520]
    ldr q2, [x1, #2544]
    ldr q3, [x1, #3568]
    ldr q4, [x1, #4592]
    ldr q5, [x1, #5616]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1296]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1296
    str q19, [x8]
    ldr q21, [x0, #1312]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1326]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1310
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1310
    str q22, [x8]
    ldr q23, [x0, #272]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 272
    str q23, [x8]
    ldr q25, [x0, #288]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #302]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 286
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 286
    str q26, [x8]
    ldr q27, [x0, #800]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #814]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 798
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 798
    str q28, [x8]
    ldr q29, [x0, #784]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 784
    str q29, [x8]
    ldr q0, [x1, #512]
    ldr q1, [x1, #1536]
    ldr q2, [x1, #2560]
    ldr q3, [x1, #3584]
    ldr q4, [x1, #4608]
    ldr q5, [x1, #5632]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #784]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #798]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 782
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 782
    str q20, [x8]
    ldr q21, [x0, #768]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 768
    str q21, [x8]
    ldr q23, [x0, #1280]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1280
    str q23, [x8]
    ldr q25, [x0, #1296]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1310]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1294
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1294
    str q26, [x8]
    ldr q27, [x0, #256]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 256
    str q27, [x8]
    ldr q29, [x0, #272]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #286]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 270
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 270
    str q30, [x8]
    ldr q0, [x1, #528]
    ldr q1, [x1, #1552]
    ldr q2, [x1, #2576]
    ldr q3, [x1, #3600]
    ldr q4, [x1, #4624]
    ldr q5, [x1, #5648]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #800]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #814]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 798
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 798
    str q20, [x8]
    ldr q21, [x0, #784]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 784
    str q21, [x8]
    ldr q23, [x0, #1296]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1296
    str q23, [x8]
    ldr q25, [x0, #1312]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1326]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1310
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1310
    str q26, [x8]
    ldr q27, [x0, #272]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 272
    str q27, [x8]
    ldr q29, [x0, #288]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #302]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 286
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 286
    str q30, [x8]
    ldr q0, [x1, #544]
    ldr q1, [x1, #1568]
    ldr q2, [x1, #2592]
    ldr q3, [x1, #3616]
    ldr q4, [x1, #4640]
    ldr q5, [x1, #5664]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #816]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #830]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 814
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 814
    str q20, [x8]
    ldr q21, [x0, #800]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 800
    str q21, [x8]
    ldr q23, [x0, #1312]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1312
    str q23, [x8]
    ldr q25, [x0, #1328]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1342]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1326
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1326
    str q26, [x8]
    ldr q27, [x0, #288]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 288
    str q27, [x8]
    ldr q29, [x0, #304]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #318]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 302
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 302
    str q30, [x8]
    ldr q0, [x1, #560]
    ldr q1, [x1, #1584]
    ldr q2, [x1, #2608]
    ldr q3, [x1, #3632]
    ldr q4, [x1, #4656]
    ldr q5, [x1, #5680]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #832]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #846]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 830
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 830
    str q20, [x8]
    ldr q21, [x0, #816]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 816
    str q21, [x8]
    ldr q23, [x0, #1328]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1328
    str q23, [x8]
    ldr q25, [x0, #1344]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1358]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1342
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1342
    str q26, [x8]
    ldr q27, [x0, #304]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 304
    str q27, [x8]
    ldr q29, [x0, #320]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #334]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 318
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 318
    str q30, [x8]
    ldr q0, [x1, #576]
    ldr q1, [x1, #1600]
    ldr q2, [x1, #2624]
    ldr q3, [x1, #3648]
    ldr q4, [x1, #4672]
    ldr q5, [x1, #5696]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #288]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 288
    str q19, [x8]
    ldr q21, [x0, #304]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #318]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 302
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 302
    str q22, [x8]
    ldr q23, [x0, #816]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #830]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 814
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 814
    str q24, [x8]
    ldr q25, [x0, #800]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 800
    str q25, [x8]
    ldr q27, [x0, #1312]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1312
    str q27, [x8]
    ldr q29, [x0, #1328]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1342]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1326
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1326
    str q30, [x8]
    ldr q0, [x1, #592]
    ldr q1, [x1, #1616]
    ldr q2, [x1, #2640]
    ldr q3, [x1, #3664]
    ldr q4, [x1, #4688]
    ldr q5, [x1, #5712]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #304]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 304
    str q19, [x8]
    ldr q21, [x0, #320]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #334]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 318
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 318
    str q22, [x8]
    ldr q23, [x0, #832]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #846]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 830
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 830
    str q24, [x8]
    ldr q25, [x0, #816]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 816
    str q25, [x8]
    ldr q27, [x0, #1328]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1328
    str q27, [x8]
    ldr q29, [x0, #1344]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1358]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1342
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1342
    str q30, [x8]
    ldr q0, [x1, #608]
    ldr q1, [x1, #1632]
    ldr q2, [x1, #2656]
    ldr q3, [x1, #3680]
    ldr q4, [x1, #4704]
    ldr q5, [x1, #5728]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #320]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 320
    str q19, [x8]
    ldr q21, [x0, #336]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #350]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 334
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 334
    str q22, [x8]
    ldr q23, [x0, #848]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #862]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 846
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 846
    str q24, [x8]
    ldr q25, [x0, #832]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 832
    str q25, [x8]
    ldr q27, [x0, #1344]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1344
    str q27, [x8]
    ldr q29, [x0, #1360]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1374]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1358
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1358
    str q30, [x8]
    ldr q0, [x1, #624]
    ldr q1, [x1, #1648]
    ldr q2, [x1, #2672]
    ldr q3, [x1, #3696]
    ldr q4, [x1, #4720]
    ldr q5, [x1, #5744]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #336]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 336
    str q19, [x8]
    ldr q21, [x0, #352]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #366]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 350
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 350
    str q22, [x8]
    ldr q23, [x0, #864]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #878]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 862
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 862
    str q24, [x8]
    ldr q25, [x0, #848]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 848
    str q25, [x8]
    ldr q27, [x0, #1360]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1360
    str q27, [x8]
    ldr q29, [x0, #1376]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1390]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1374
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1374
    str q30, [x8]
    ldr q0, [x1, #640]
    ldr q1, [x1, #1664]
    ldr q2, [x1, #2688]
    ldr q3, [x1, #3712]
    ldr q4, [x1, #4736]
    ldr q5, [x1, #5760]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1344]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1344
    str q19, [x8]
    ldr q21, [x0, #1360]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1374]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1358
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1358
    str q22, [x8]
    ldr q23, [x0, #320]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 320
    str q23, [x8]
    ldr q25, [x0, #336]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #350]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 334
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 334
    str q26, [x8]
    ldr q27, [x0, #848]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #862]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 846
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 846
    str q28, [x8]
    ldr q29, [x0, #832]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 832
    str q29, [x8]
    ldr q0, [x1, #656]
    ldr q1, [x1, #1680]
    ldr q2, [x1, #2704]
    ldr q3, [x1, #3728]
    ldr q4, [x1, #4752]
    ldr q5, [x1, #5776]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1360]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1360
    str q19, [x8]
    ldr q21, [x0, #1376]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1390]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1374
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1374
    str q22, [x8]
    ldr q23, [x0, #336]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 336
    str q23, [x8]
    ldr q25, [x0, #352]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #366]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 350
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 350
    str q26, [x8]
    ldr q27, [x0, #864]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #878]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 862
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 862
    str q28, [x8]
    ldr q29, [x0, #848]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 848
    str q29, [x8]
    ldr q0, [x1, #672]
    ldr q1, [x1, #1696]
    ldr q2, [x1, #2720]
    ldr q3, [x1, #3744]
    ldr q4, [x1, #4768]
    ldr q5, [x1, #5792]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1376]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1376
    str q19, [x8]
    ldr q21, [x0, #1392]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1406]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1390
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1390
    str q22, [x8]
    ldr q23, [x0, #352]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 352
    str q23, [x8]
    ldr q25, [x0, #368]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #382]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 366
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 366
    str q26, [x8]
    ldr q27, [x0, #880]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #894]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 878
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 878
    str q28, [x8]
    ldr q29, [x0, #864]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 864
    str q29, [x8]
    ldr q0, [x1, #688]
    ldr q1, [x1, #1712]
    ldr q2, [x1, #2736]
    ldr q3, [x1, #3760]
    ldr q4, [x1, #4784]
    ldr q5, [x1, #5808]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1392]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1392
    str q19, [x8]
    ldr q21, [x0, #1408]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1422]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1406
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1406
    str q22, [x8]
    ldr q23, [x0, #368]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 368
    str q23, [x8]
    ldr q25, [x0, #384]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #398]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 382
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 382
    str q26, [x8]
    ldr q27, [x0, #896]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #910]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 894
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 894
    str q28, [x8]
    ldr q29, [x0, #880]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 880
    str q29, [x8]
    ldr q0, [x1, #704]
    ldr q1, [x1, #1728]
    ldr q2, [x1, #2752]
    ldr q3, [x1, #3776]
    ldr q4, [x1, #4800]
    ldr q5, [x1, #5824]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #880]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #894]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 878
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 878
    str q20, [x8]
    ldr q21, [x0, #864]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 864
    str q21, [x8]
    ldr q23, [x0, #1376]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1376
    str q23, [x8]
    ldr q25, [x0, #1392]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1406]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1390
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1390
    str q26, [x8]
    ldr q27, [x0, #352]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 352
    str q27, [x8]
    ldr q29, [x0, #368]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #382]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 366
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 366
    str q30, [x8]
    ldr q0, [x1, #720]
    ldr q1, [x1, #1744]
    ldr q2, [x1, #2768]
    ldr q3, [x1, #3792]
    ldr q4, [x1, #4816]
    ldr q5, [x1, #5840]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #896]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #910]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 894
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 894
    str q20, [x8]
    ldr q21, [x0, #880]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 880
    str q21, [x8]
    ldr q23, [x0, #1392]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1392
    str q23, [x8]
    ldr q25, [x0, #1408]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1422]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1406
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1406
    str q26, [x8]
    ldr q27, [x0, #368]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 368
    str q27, [x8]
    ldr q29, [x0, #384]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #398]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 382
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 382
    str q30, [x8]
    ldr q0, [x1, #736]
    ldr q1, [x1, #1760]
    ldr q2, [x1, #2784]
    ldr q3, [x1, #3808]
    ldr q4, [x1, #4832]
    ldr q5, [x1, #5856]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #912]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #926]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 910
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 910
    str q20, [x8]
    ldr q21, [x0, #896]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 896
    str q21, [x8]
    ldr q23, [x0, #1408]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1408
    str q23, [x8]
    ldr q25, [x0, #1424]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1438]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1422
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1422
    str q26, [x8]
    ldr q27, [x0, #384]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 384
    str q27, [x8]
    ldr q29, [x0, #400]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #414]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 398
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 398
    str q30, [x8]
    ldr q0, [x1, #752]
    ldr q1, [x1, #1776]
    ldr q2, [x1, #2800]
    ldr q3, [x1, #3824]
    ldr q4, [x1, #4848]
    ldr q5, [x1, #5872]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #928]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #942]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 926
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 926
    str q20, [x8]
    ldr q21, [x0, #912]
    add v21.8h, v21.8h, v12.8h
    add x8, x0, 912
    str q21, [x8]
    ldr q23, [x0, #1424]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 1424
    str q23, [x8]
    ldr q25, [x0, #1440]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1454]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1438
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 1438
    str q26, [x8]
    ldr q27, [x0, #400]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 400
    str q27, [x8]
    ldr q29, [x0, #416]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #430]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 414
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 414
    str q30, [x8]
    ldr q0, [x1, #768]
    ldr q1, [x1, #1792]
    ldr q2, [x1, #2816]
    ldr q3, [x1, #3840]
    ldr q4, [x1, #4864]
    ldr q5, [x1, #5888]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #384]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 384
    str q19, [x8]
    ldr q21, [x0, #400]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #414]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 398
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 398
    str q22, [x8]
    ldr q23, [x0, #912]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #926]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 910
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 910
    str q24, [x8]
    ldr q25, [x0, #896]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 896
    str q25, [x8]
    ldr q27, [x0, #1408]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1408
    str q27, [x8]
    ldr q29, [x0, #1424]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1438]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1422
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1422
    str q30, [x8]
    ldr q0, [x1, #784]
    ldr q1, [x1, #1808]
    ldr q2, [x1, #2832]
    ldr q3, [x1, #3856]
    ldr q4, [x1, #4880]
    ldr q5, [x1, #5904]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #400]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 400
    str q19, [x8]
    ldr q21, [x0, #416]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #430]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 414
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 414
    str q22, [x8]
    ldr q23, [x0, #928]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #942]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 926
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 926
    str q24, [x8]
    ldr q25, [x0, #912]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 912
    str q25, [x8]
    ldr q27, [x0, #1424]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 1424
    str q27, [x8]
    ldr q29, [x0, #1440]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1454]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1438
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 1438
    str q30, [x8]
    ldr q0, [x1, #800]
    ldr q1, [x1, #1824]
    ldr q2, [x1, #2848]
    ldr q3, [x1, #3872]
    ldr q4, [x1, #4896]
    ldr q5, [x1, #5920]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #416]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 416
    str q19, [x8]
    ldr q21, [x0, #432]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #446]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 430
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 430
    str q22, [x8]
    ldr q23, [x0, #944]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #958]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 942
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 942
    str q24, [x8]
    ldr q25, [x0, #928]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 928
    str q25, [x8]
    ldr q27, [x0, #1440]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1440
    str q27, [x8]
    ldr q29, [x0, #1456]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1470]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1454
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1454
    str q30, [x8]
    ldr q0, [x1, #816]
    ldr q1, [x1, #1840]
    ldr q2, [x1, #2864]
    ldr q3, [x1, #3888]
    ldr q4, [x1, #4912]
    ldr q5, [x1, #5936]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #432]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 432
    str q19, [x8]
    ldr q21, [x0, #448]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #462]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 446
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 446
    str q22, [x8]
    ldr q23, [x0, #960]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #974]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 958
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 958
    str q24, [x8]
    ldr q25, [x0, #944]
    add v25.8h, v25.8h, v13.8h
    add x8, x0, 944
    str q25, [x8]
    ldr q27, [x0, #1456]
    add v27.8h, v27.8h, v11.8h
    add x8, x0, 1456
    str q27, [x8]
    ldr q29, [x0, #1472]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #1486]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 1470
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    add x8, x0, 1470
    str q30, [x8]
    ldr q0, [x1, #832]
    ldr q1, [x1, #1856]
    ldr q2, [x1, #2880]
    ldr q3, [x1, #3904]
    ldr q4, [x1, #4928]
    ldr q5, [x1, #5952]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1440]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1440
    str q19, [x8]
    ldr q21, [x0, #1456]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1470]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1454
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1454
    str q22, [x8]
    ldr q23, [x0, #416]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 416
    str q23, [x8]
    ldr q25, [x0, #432]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #446]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 430
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 430
    str q26, [x8]
    ldr q27, [x0, #944]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #958]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 942
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 942
    str q28, [x8]
    ldr q29, [x0, #928]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 928
    str q29, [x8]
    ldr q0, [x1, #848]
    ldr q1, [x1, #1872]
    ldr q2, [x1, #2896]
    ldr q3, [x1, #3920]
    ldr q4, [x1, #4944]
    ldr q5, [x1, #5968]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1456]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 1456
    str q19, [x8]
    ldr q21, [x0, #1472]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1486]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1470
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 1470
    str q22, [x8]
    ldr q23, [x0, #432]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 432
    str q23, [x8]
    ldr q25, [x0, #448]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #462]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 446
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 446
    str q26, [x8]
    ldr q27, [x0, #960]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #974]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 958
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 958
    str q28, [x8]
    ldr q29, [x0, #944]
    add v29.8h, v29.8h, v14.8h
    sqdmulh  v6.8h, v29.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v29.8h, v6.8h, v15.H[0]
    add x8, x0, 944
    str q29, [x8]
    ldr q0, [x1, #864]
    ldr q1, [x1, #1888]
    ldr q2, [x1, #2912]
    ldr q3, [x1, #3936]
    ldr q4, [x1, #4960]
    ldr q5, [x1, #5984]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1472]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1472
    str q19, [x8]
    ldr q21, [x0, #1488]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1502]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1486
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1486
    str q22, [x8]
    ldr q23, [x0, #448]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 448
    str q23, [x8]
    ldr q25, [x0, #464]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #478]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 462
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 462
    str q26, [x8]
    ldr q27, [x0, #976]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #990]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 974
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 974
    str q28, [x8]
    ldr q29, [x0, #960]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 960
    str q29, [x8]
    ldr q0, [x1, #880]
    ldr q1, [x1, #1904]
    ldr q2, [x1, #2928]
    ldr q3, [x1, #3952]
    ldr q4, [x1, #4976]
    ldr q5, [x1, #6000]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #1488]
    add v19.8h, v19.8h, v9.8h
    add x8, x0, 1488
    str q19, [x8]
    ldr q21, [x0, #1504]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #1518]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 1502
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    add x8, x0, 1502
    str q22, [x8]
    ldr q23, [x0, #464]
    add v23.8h, v23.8h, v10.8h
    add x8, x0, 464
    str q23, [x8]
    ldr q25, [x0, #480]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #494]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 478
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    add x8, x0, 478
    str q26, [x8]
    ldr q27, [x0, #992]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #1006]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 990
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    add x8, x0, 990
    str q28, [x8]
    ldr q29, [x0, #976]
    add v29.8h, v29.8h, v14.8h
    add x8, x0, 976
    str q29, [x8]
    ldr q0, [x1, #896]
    ldr q1, [x1, #1920]
    ldr q2, [x1, #2944]
    ldr q3, [x1, #3968]
    ldr q4, [x1, #4992]
    ldr q5, [x1, #6016]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #976]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #990]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 974
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 974
    str q20, [x8]
    ldr q21, [x0, #960]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 960
    str q21, [x8]
    ldr q23, [x0, #1472]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1472
    str q23, [x8]
    ldr q25, [x0, #1488]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1502]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1486
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1486
    str q26, [x8]
    ldr q27, [x0, #448]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 448
    str q27, [x8]
    ldr q29, [x0, #464]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #478]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 462
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 462
    str q30, [x8]
    ldr q0, [x1, #912]
    ldr q1, [x1, #1936]
    ldr q2, [x1, #2960]
    ldr q3, [x1, #3984]
    ldr q4, [x1, #5008]
    ldr q5, [x1, #6032]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #992]
    add v19.8h, v19.8h, v9.8h
    smov w27, v19.H[7]
    strh w27, [x0, #1006]
    ext v20.16b, v31.16b,  v19.16b,  #14
    add x8, x0, 990
    ld1 {v20.H}[0], [x8]
    add v20.8h, v20.8h, v9.8h
    add x8, x0, 990
    str q20, [x8]
    ldr q21, [x0, #976]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    add x8, x0, 976
    str q21, [x8]
    ldr q23, [x0, #1488]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    add x8, x0, 1488
    str q23, [x8]
    ldr q25, [x0, #1504]
    add v25.8h, v25.8h, v13.8h
    smov w27, v25.H[7]
    strh w27, [x0, #1518]
    ext v26.16b, v31.16b,  v25.16b,  #14
    add x8, x0, 1502
    ld1 {v26.H}[0], [x8]
    add v26.8h, v26.8h, v13.8h
    sqdmulh  v6.8h, v26.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v26.8h, v6.8h, v15.H[0]
    add x8, x0, 1502
    str q26, [x8]
    ldr q27, [x0, #464]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    add x8, x0, 464
    str q27, [x8]
    ldr q29, [x0, #480]
    add v29.8h, v29.8h, v14.8h
    smov w27, v29.H[7]
    strh w27, [x0, #494]
    ext v30.16b, v31.16b,  v29.16b,  #14
    add x8, x0, 478
    ld1 {v30.H}[0], [x8]
    add v30.8h, v30.8h, v14.8h
    sqdmulh  v6.8h, v30.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v30.8h, v6.8h, v15.H[0]
    add x8, x0, 478
    str q30, [x8]
    ldr q0, [x1, #928]
    ldr q1, [x1, #1952]
    ldr q2, [x1, #2976]
    ldr q3, [x1, #4000]
    ldr q4, [x1, #5024]
    ldr q5, [x1, #6048]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q6, [x0, #1008]
    add v7.8h,  v9.8h,  v6.8h
    add    x8,  x0, 1006
    str q7, [x0, #1008]
    ldr q6, [x8]
    add v7.8h,  v9.8h,  v6.8h
    str q7, [x8]
    ldr q6, [x0, #992]
    add v7.8h,  v12.8h,  v6.8h
    str q7, [x0, #992]
    ldr q6, [x0, #1504]
    add v7.8h,  v10.8h,  v6.8h
    str q7, [x0, #1504]
    ldr q6, [x0, #480]
    add v7.8h,  v11.8h,  v6.8h
    str q7, [x0, #480]
    ldr q6, [x0, #496]
    add v7.8h,  v14.8h,  v6.8h
    str q7, [x0, #496]
    add    x8,  x0, 494
    ldr q6, [x8]
    add v7.8h,  v14.8h,  v6.8h
    str q7, [x8]
    smov w27, v13.H[0]
    ldrh w28, [x0, #1520]
    ldrh w29, [x0, #1518]
    add  w28, w27, w28
    add  w29, w27, w29
    strh w28, [x0, #1520]
    strh w29, [x0, #1518]
    ext v13.16b,  v13.16b,  v31.16b,  #4
    ldr q6, [x0, #4]
    add v7.8h,  v13.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #4]
    ldr q6, [x0, #0]
    add v7.8h,  v13.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #0]
    ldr q6, [x0, #2]
    add v13.8h,  v13.8h,  v13.8h
    add v7.8h,  v13.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #2]
    ldr q0, [x1, #944]
    ldr q1, [x1, #1968]
    ldr q2, [x1, #2992]
    ldr q3, [x1, #4016]
    ldr q4, [x1, #5040]
    ldr q5, [x1, #6064]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q6, [x0, #1024]
    add v7.8h,  v9.8h,  v6.8h
    str q7, [x0, #1024]
    add    x8,  x0, 1022
    ldr q6, [x8]
    add v7.8h,  v9.8h,  v6.8h
    str q7, [x8]
    ldr q6, [x0, #1008]
    add v7.8h,  v12.8h,  v6.8h
    str q7, [x0, #1008]
    ldr q6, [x0, #496]
    add v7.8h,  v11.8h,  v6.8h
    str q7, [x0, #496]
    ldr q6, [x0, #512]
    add v7.8h,  v14.8h,  v6.8h
    str q7, [x0, #512]
    add    x8,  x0, 510
    ldr q6, [x8]
    add v7.8h,  v14.8h,  v6.8h
    str q7, [x8]
    smov w27, v10.H[0]
    ldrh w28, [x0, #1520]
    add  w28, w27, w28
    strh w28, [x0, #1520]
    ext v10.16b,  v10.16b,  v31.16b,  #2
    ldr q6, [x0, #2]
    add v7.8h,  v10.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #2]
    ldr q6, [x0, #0]
    add v7.8h,  v10.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #0]
    ldr q0, [x1, #960]
    ldr q1, [x1, #1984]
    ldr q2, [x1, #3008]
    ldr q3, [x1, #4032]
    ldr q4, [x1, #5056]
    ldr q5, [x1, #6080]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q6, [x0, #480]
    add v7.8h,  v9.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #480]
    ldr q6, [x0, #496]
    add v7.8h,  v12.8h,  v6.8h
    str q7, [x0, #496]
    add    x8,  x0, 494
    ldr q6, [x8]
    add v7.8h,  v12.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x8]
    ldr q6, [x0, #1008]
    add v7.8h,  v10.8h,  v6.8h
    str q7, [x0, #1008]
    add    x8,  x0, 1006
    ldr q6, [x8]
    add v7.8h,  v10.8h,  v6.8h
    str q7, [x8]
    ldr q6, [x0, #992]
    add v7.8h,  v13.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #992]
    ldr q6, [x0, #1504]
    add v7.8h,  v11.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #1504]
    ldr q6, [x0, #4]
    add v7.8h,  v14.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #4]
    ldr q6, [x0, #0]
    add v7.8h,  v14.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #0]
    ldr q6, [x0, #2]
    add v14.8h,  v14.8h,  v14.8h
    add v7.8h,  v14.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #2]
    ldr q0, [x1, #976]
    ldr q1, [x1, #2000]
    ldr q2, [x1, #3024]
    ldr q3, [x1, #4048]
    ldr q4, [x1, #5072]
    ldr q5, [x1, #6096]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q6, [x0, #496]
    add v7.8h,  v9.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #496]
    ldr q6, [x0, #512]
    add v7.8h,  v12.8h,  v6.8h
    str q7, [x0, #512]
    add    x8,  x0, 510
    ldr q6, [x8]
    add v7.8h,  v12.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x8]
    ldr q6, [x0, #1024]
    add v7.8h,  v10.8h,  v6.8h
    str q7, [x0, #1024]
    add    x8,  x0, 1022
    ldr q6, [x8]
    add v7.8h,  v10.8h,  v6.8h
    str q7, [x8]
    ldr q6, [x0, #1008]
    add v7.8h,  v13.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #1008]
    smov w27, v11.H[0]
    ldrh w28, [x0, #1520]
    add  w28, w27, w28
    mov  v21.H[0], w28
    sqdmulh  v20.8h, v21.8h, v15.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v21.8h, v20.8h, v15.H[0]
    add  x8, x0, 1520
    st1  {v21.h}[0], [x8]
    ext v11.16b,  v11.16b,  v31.16b,  #2
    ldr q6, [x0, #2]
    add v7.8h,  v11.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #2]
    ldr q6, [x0, #0]
    add v7.8h,  v11.8h,  v6.8h
    sqdmulh  v6.8h, v7.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v7.8h, v6.8h, v15.H[0]
    str q7, [x0, #0]
    ldr q0, [x1, #992]
    ldr q1, [x1, #2016]
    ldr q2, [x1, #3040]
    ldr q3, [x1, #4064]
    ldr q4, [x1, #5088]
    ldr q5, [x1, #6112]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #512]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 512
    str q19, [x8]
    ldr q21, [x0, #528]
    add v21.8h, v21.8h, v12.8h
    smov w27, v21.H[7]
    strh w27, [x0, #542]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 526
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 526
    str q22, [x8]
    ldr q23, [x0, #1040]
    add v23.8h, v23.8h, v10.8h
    smov w27, v23.H[7]
    strh w27, [x0, #1054]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 1038
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    add x8, x0, 1038
    str q24, [x8]
    ldr q25, [x0, #1024]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 1024
    str q25, [x8]
    ldr q27, [x0, #16]
    add v27.8h, v27.8h, v11.8h
    smov w27, v27.H[7]
    strh w27, [x0, #30]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 14
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    sqdmulh  v6.8h, v28.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v28.8h, v6.8h, v15.H[0]
    str q28, [x0, #14]
    ldr q29, [x0, #0]
    add v29.8h, v29.8h, v14.8h
    str q29, [x0, #0]
    ldr q0, [x1, #1008]
    ldr q1, [x1, #2032]
    ldr q2, [x1, #3056]
    ldr q3, [x1, #4080]
    ldr q4, [x1, #5104]
    ldr q5, [x1, #6128]
    add v6.8h,  v0.8h,  v1.8h
    sqdmulh  v16.8h, v6.8h, v15.H[1]
    sub v1.8h,  v0.8h,  v1.8h
    srshr    v16.8h, v16.8h, #12
    mls      v6.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v1.8h, v15.H[1]
    add v7.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v1.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v7.8h, v15.H[1]
    sub v3.8h,  v2.8h,  v3.8h
    srshr    v16.8h, v16.8h, #12
    mls      v7.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v3.8h, v15.H[1]
    add v19.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v3.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v19.8h, v15.H[1]
    sub v5.8h,  v4.8h,  v5.8h
    srshr    v16.8h, v16.8h, #12
    mls      v19.8h, v16.8h, v15.H[0]
    sqdmulh  v16.8h, v5.8h, v15.H[1]
    srshr    v16.8h, v16.8h, #12
    mls      v5.8h, v16.8h, v15.H[0]
    add v0.8h,  v6.8h,  v7.8h
    add v0.8h,  v0.8h,  v19.8h
    mul       v9.8h, v0.8h, v15.H[2]
    sqrdmulh  v16.8h, v0.8h, v15.H[3]
    mls       v9.8h, v16.8h, v15.H[0]
    sub v2.8h,  v7.8h,  v19.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v7.8h
    mul       v10.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v10.8h, v16.8h, v15.H[0]
    add v2.8h,  v6.8h,  v4.8h
    sub v2.8h,  v2.8h,  v19.8h
    mul       v11.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v11.8h, v16.8h, v15.H[0]
    add v6.8h,  v1.8h,  v3.8h
    add v6.8h,  v5.8h,  v6.8h
    mul       v12.8h, v6.8h, v15.H[2]
    sqrdmulh  v16.8h, v6.8h, v15.H[3]
    mls       v12.8h, v16.8h, v15.H[0]
    sub v2.8h,  v3.8h,  v5.8h
    mul       v4.8h, v2.8h, v15.H[4]
    sqrdmulh  v16.8h, v2.8h, v15.H[5]
    mls       v4.8h, v16.8h, v15.H[0]
    sub v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v3.8h
    mul       v13.8h, v2.8h, v15.H[6]
    sqrdmulh  v16.8h, v2.8h, v15.H[7]
    mls       v13.8h, v16.8h, v15.H[0]
    add v2.8h,  v1.8h,  v4.8h
    sub v2.8h,  v2.8h,  v5.8h
    mul       v14.8h, v2.8h, v8.H[0]
    sqrdmulh  v16.8h, v2.8h, v8.H[1]
    mls       v14.8h, v16.8h, v15.H[0]
    ldr q19, [x0, #528]
    add v19.8h, v19.8h, v9.8h
    sqdmulh  v6.8h, v19.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v19.8h, v6.8h, v15.H[0]
    add x8, x0, 528
    str q19, [x8]
    ldr q21, [x0, #544]
    add v21.8h, v21.8h, v12.8h
    sqdmulh  v6.8h, v21.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v21.8h, v6.8h, v15.H[0]
    smov w27, v21.H[7]
    strh w27, [x0, #558]
    ext v22.16b, v31.16b,  v21.16b,  #14
    add x8, x0, 542
    ld1 {v22.H}[0], [x8]
    add v22.8h, v22.8h, v12.8h
    sqdmulh  v6.8h, v22.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v22.8h, v6.8h, v15.H[0]
    add x8, x0, 542
    str q22, [x8]
    ldr q23, [x0, #1056]
    add v23.8h, v23.8h, v10.8h
    sqdmulh  v6.8h, v23.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v23.8h, v6.8h, v15.H[0]
    smov w27, v23.H[7]
    strh w27, [x0, #1070]
    ext v24.16b, v31.16b,  v23.16b,  #14
    add x8, x0, 1054
    ld1 {v24.H}[0], [x8]
    add v24.8h, v24.8h, v10.8h
    sqdmulh  v6.8h, v24.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v24.8h, v6.8h, v15.H[0]
    add x8, x0, 1054
    str q24, [x8]
    ldr q25, [x0, #1040]
    add v25.8h, v25.8h, v13.8h
    sqdmulh  v6.8h, v25.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v25.8h, v6.8h, v15.H[0]
    add x8, x0, 1040
    str q25, [x8]
    ldr q27, [x0, #32]
    add v27.8h, v27.8h, v11.8h
    sqdmulh  v6.8h, v27.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v27.8h, v6.8h, v15.H[0]
    smov w27, v27.H[7]
    strh w27, [x0, #46]
    ext v28.16b, v31.16b,  v27.16b,  #14
    add x8, x0, 30
    ld1 {v28.H}[0], [x8]
    add v28.8h, v28.8h, v11.8h
    sqdmulh  v6.8h, v28.8h, v15.H[1]
    srshr    v6.8h, v6.8h, #12
    mls      v28.8h, v6.8h, v15.H[0]
    str q28, [x0, #30]
    ldr q29, [x0, #16]
    add v29.8h, v29.8h, v14.8h
    str q29, [x0, #16]
__end:
    LDP x19, x20, [sp, #(16*0)]
    LDP x21, x22, [sp, #(16*1)]
    LDP x23, x24, [sp, #(16*2)]
    LDP x25, x26, [sp, #(16*3)]
    LDP x27, x28, [sp, #(16*4)]
    LDP  d8,  d9, [sp, #(16*5)]
    LDP d10, d11, [sp, #(16*6)]
    LDP d12, d13, [sp, #(16*7)]
    LDP d14, d15, [sp, #(16*8)]
    ADD	sp, sp, #(16*9)
    br lr
