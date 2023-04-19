.align 6
.global _load_good_radix_3_2_2
.global __load_good_radix_3_2_2
_load_good_radix_3_2_2:
__load_good_radix_3_2_2:
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
    mov v15.H[0], w4
    mov v15.H[1], w5
    mov v15.H[2], w6
    mov v15.H[3], w7
    movi  v24.8h, #0

    ldr q0, [x1, #0]
    movi  v1.8h, #0
    movi  v2.8h, #0
    ldr q3, [x1, #768]
    movi  v4.8h, #0
    ldr q5, [x1, #1280]
    ldr q6, [x1, #512]
    movi  v7.8h, #0
    ldr q8, [x1, #1024]
    ldr q9, [x1, #256]
    movi  v10.8h, #0
    movi  v11.8h, #0

    mul       v20.8h, v8.8h, v15.H[1]
    add       v14.8h,  v0.8h, v8.8h
    sqrdmulh  v21.8h, v8.8h, v15.H[2]
    sub       v22.8h,  v0.8h, v8.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v13.8h,  v0.8h, v20.8h
    sub       v12.8h,  v22.8h, v20.8h
    sub       v20.8h,  v5.8h, v9.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v8.8h,  v5.8h, v9.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v0.8h,  v21.8h, v9.8h
    add       v4.8h,  v5.8h, v21.8h
    sub       v4.8h,  v24.8h, v4.8h
    mul       v1.8h, v6.8h, v15.H[1]
    mov    v9.16b,  v6.16b
    sqrdmulh  v20.8h, v6.8h, v15.H[2]
    mls       v1.8h, v20.8h, v15.H[0]
    add       v5.8h,  v6.8h, v1.8h
    sub       v5.8h,  v24.8h, v5.8h
    mov    v2.16b,  v3.16b
    mov    v6.16b,  v3.16b
    mov    v10.16b,  v3.16b

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1536]
    ldr q0, [x1, #16]
    str q1, [x0, #512]
    movi  v1.8h, #0
    str q2, [x0, #0]
    movi  v2.8h, #0
    str q4, [x0, #3584]
    ldr q3, [x1, #784]
    str q5, [x0, #2560]
    movi  v4.8h, #0
    str q6, [x0, #2048]
    ldr q5, [x1, #1296]
    str q8, [x0, #5632]
    ldr q6, [x1, #528]
    str q9, [x0, #4608]
    movi  v7.8h, #0
    str q10, [x0, #4096]
    ldr q8, [x1, #1040]
    str q12, [x0, #1024]
    ldr q9, [x1, #272]
    str q13, [x0, #3072]
    movi  v10.8h, #0
    str q14, [x0, #5120]
    movi  v11.8h, #0

    mul       v20.8h, v8.8h, v15.H[1]
    add       v14.8h,  v0.8h, v8.8h
    sqrdmulh  v21.8h, v8.8h, v15.H[2]
    sub       v22.8h,  v0.8h, v8.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v13.8h,  v0.8h, v20.8h
    sub       v12.8h,  v22.8h, v20.8h
    sub       v20.8h,  v5.8h, v9.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v8.8h,  v5.8h, v9.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v0.8h,  v21.8h, v9.8h
    add       v4.8h,  v5.8h, v21.8h
    sub       v4.8h,  v24.8h, v4.8h
    mul       v1.8h, v6.8h, v15.H[1]
    mov    v9.16b,  v6.16b
    sqrdmulh  v20.8h, v6.8h, v15.H[2]
    mls       v1.8h, v20.8h, v15.H[0]
    add       v5.8h,  v6.8h, v1.8h
    sub       v5.8h,  v24.8h, v5.8h
    mov    v2.16b,  v3.16b
    mov    v6.16b,  v3.16b
    mov    v10.16b,  v3.16b

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1552]
    ldr q0, [x1, #1056]
    str q1, [x0, #528]
    ldr q1, [x1, #288]
    str q2, [x0, #16]
    movi  v2.8h, #0
    str q4, [x0, #3600]
    movi  v3.8h, #0
    str q5, [x0, #2576]
    ldr q4, [x1, #32]
    str q6, [x0, #2064]
    movi  v5.8h, #0
    str q8, [x0, #5648]
    movi  v6.8h, #0
    str q9, [x0, #4624]
    ldr q7, [x1, #800]
    str q10, [x0, #4112]
    movi  v8.8h, #0
    str q12, [x0, #1040]
    ldr q9, [x1, #1312]
    str q13, [x0, #3088]
    ldr q10, [x1, #544]
    str q14, [x0, #5136]
    movi  v11.8h, #0

    mul       v20.8h, v4.8h, v15.H[1]
    add       v14.8h,  v0.8h, v4.8h
    sqrdmulh  v21.8h, v4.8h, v15.H[2]
    sub       v13.8h,  v0.8h, v4.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v12.8h,  v0.8h, v20.8h
    sub       v13.8h,  v13.8h, v20.8h
    mul       v20.8h, v9.8h, v15.H[1]
    add       v8.8h,  v1.8h, v9.8h
    sqrdmulh  v21.8h, v9.8h, v15.H[2]
    sub       v22.8h,  v1.8h, v9.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v4.8h,  v1.8h, v20.8h
    sub       v0.8h,  v22.8h, v20.8h
    mul       v5.8h, v10.8h, v15.H[1]
    mov    v9.16b,  v10.16b
    sqrdmulh  v20.8h, v10.8h, v15.H[2]
    mls       v5.8h, v20.8h, v15.H[0]
    add       v1.8h,  v10.8h, v5.8h
    sub       v1.8h,  v24.8h, v1.8h
    mul       v2.8h, v7.8h, v15.H[1]
    mov    v10.16b,  v7.16b
    sqrdmulh  v20.8h, v7.8h, v15.H[2]
    mls       v2.8h, v20.8h, v15.H[0]
    add       v6.8h,  v7.8h, v2.8h
    sub       v6.8h,  v24.8h, v6.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1600]
    ldr q0, [x1, #1072]
    str q1, [x0, #576]
    ldr q1, [x1, #304]
    str q2, [x0, #64]
    movi  v2.8h, #0
    str q4, [x0, #3648]
    movi  v3.8h, #0
    str q5, [x0, #2624]
    ldr q4, [x1, #48]
    str q6, [x0, #2112]
    movi  v5.8h, #0
    str q8, [x0, #5696]
    movi  v6.8h, #0
    str q9, [x0, #4672]
    ldr q7, [x1, #816]
    str q10, [x0, #4160]
    movi  v8.8h, #0
    str q12, [x0, #1088]
    ldr q9, [x1, #1328]
    str q13, [x0, #3136]
    ldr q10, [x1, #560]
    str q14, [x0, #5184]
    movi  v11.8h, #0

    mul       v20.8h, v4.8h, v15.H[1]
    add       v14.8h,  v0.8h, v4.8h
    sqrdmulh  v21.8h, v4.8h, v15.H[2]
    sub       v13.8h,  v0.8h, v4.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v12.8h,  v0.8h, v20.8h
    sub       v13.8h,  v13.8h, v20.8h
    mul       v20.8h, v9.8h, v15.H[1]
    add       v8.8h,  v1.8h, v9.8h
    sqrdmulh  v21.8h, v9.8h, v15.H[2]
    sub       v22.8h,  v1.8h, v9.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v4.8h,  v1.8h, v20.8h
    sub       v0.8h,  v22.8h, v20.8h
    mul       v5.8h, v10.8h, v15.H[1]
    mov    v9.16b,  v10.16b
    sqrdmulh  v20.8h, v10.8h, v15.H[2]
    mls       v5.8h, v20.8h, v15.H[0]
    add       v1.8h,  v10.8h, v5.8h
    sub       v1.8h,  v24.8h, v1.8h
    mul       v2.8h, v7.8h, v15.H[1]
    mov    v10.16b,  v7.16b
    sqrdmulh  v20.8h, v7.8h, v15.H[2]
    mls       v2.8h, v20.8h, v15.H[0]
    add       v6.8h,  v7.8h, v2.8h
    sub       v6.8h,  v24.8h, v6.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1616]
    movi  v0.8h, #0
    str q1, [x0, #592]
    ldr q1, [x1, #1344]
    str q2, [x0, #80]
    ldr q2, [x1, #576]
    str q4, [x0, #3664]
    movi  v3.8h, #0
    str q5, [x0, #2640]
    ldr q4, [x1, #1088]
    str q6, [x0, #2128]
    ldr q5, [x1, #320]
    str q8, [x0, #5712]
    movi  v6.8h, #0
    str q9, [x0, #4688]
    movi  v7.8h, #0
    str q10, [x0, #4176]
    ldr q8, [x1, #64]
    str q12, [x0, #1104]
    movi  v9.8h, #0
    str q13, [x0, #3152]
    movi  v10.8h, #0
    str q14, [x0, #5200]
    ldr q11, [x1, #832]

    sub       v20.8h,  v4.8h, v8.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v14.8h,  v4.8h, v8.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v12.8h,  v21.8h, v8.8h
    add       v13.8h,  v4.8h, v21.8h
    sub       v13.8h,  v24.8h, v13.8h
    mul       v20.8h, v5.8h, v15.H[1]
    add       v8.8h,  v1.8h, v5.8h
    sqrdmulh  v21.8h, v5.8h, v15.H[2]
    sub       v4.8h,  v1.8h, v5.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v0.8h,  v1.8h, v20.8h
    sub       v4.8h,  v4.8h, v20.8h
    mov    v1.16b,  v2.16b
    mov    v5.16b,  v2.16b
    mov    v9.16b,  v2.16b
    mul       v6.8h, v11.8h, v15.H[1]
    mov    v10.16b,  v11.16b
    sqrdmulh  v20.8h, v11.8h, v15.H[2]
    mls       v6.8h, v20.8h, v15.H[0]
    add       v2.8h,  v11.8h, v6.8h
    sub       v2.8h,  v24.8h, v2.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1664]
    movi  v0.8h, #0
    str q1, [x0, #640]
    ldr q1, [x1, #1360]
    str q2, [x0, #128]
    ldr q2, [x1, #592]
    str q4, [x0, #3712]
    movi  v3.8h, #0
    str q5, [x0, #2688]
    ldr q4, [x1, #1104]
    str q6, [x0, #2176]
    ldr q5, [x1, #336]
    str q8, [x0, #5760]
    movi  v6.8h, #0
    str q9, [x0, #4736]
    movi  v7.8h, #0
    str q10, [x0, #4224]
    ldr q8, [x1, #80]
    str q12, [x0, #1152]
    movi  v9.8h, #0
    str q13, [x0, #3200]
    movi  v10.8h, #0
    str q14, [x0, #5248]
    ldr q11, [x1, #848]

    sub       v20.8h,  v4.8h, v8.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v14.8h,  v4.8h, v8.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v12.8h,  v21.8h, v8.8h
    add       v13.8h,  v4.8h, v21.8h
    sub       v13.8h,  v24.8h, v13.8h
    mul       v20.8h, v5.8h, v15.H[1]
    add       v8.8h,  v1.8h, v5.8h
    sqrdmulh  v21.8h, v5.8h, v15.H[2]
    sub       v4.8h,  v1.8h, v5.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v0.8h,  v1.8h, v20.8h
    sub       v4.8h,  v4.8h, v20.8h
    mov    v1.16b,  v2.16b
    mov    v5.16b,  v2.16b
    mov    v9.16b,  v2.16b
    mul       v6.8h, v11.8h, v15.H[1]
    mov    v10.16b,  v11.16b
    sqrdmulh  v20.8h, v11.8h, v15.H[2]
    mls       v6.8h, v20.8h, v15.H[0]
    add       v2.8h,  v11.8h, v6.8h
    sub       v2.8h,  v24.8h, v2.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1680]
    ldr q0, [x1, #96]
    str q1, [x0, #656]
    movi  v1.8h, #0
    str q2, [x0, #144]
    movi  v2.8h, #0
    str q4, [x0, #3728]
    ldr q3, [x1, #864]
    str q5, [x0, #2704]
    movi  v4.8h, #0
    str q6, [x0, #2192]
    ldr q5, [x1, #1376]
    str q8, [x0, #5776]
    ldr q6, [x1, #608]
    str q9, [x0, #4752]
    movi  v7.8h, #0
    str q10, [x0, #4240]
    ldr q8, [x1, #1120]
    str q12, [x0, #1168]
    ldr q9, [x1, #352]
    str q13, [x0, #3216]
    movi  v10.8h, #0
    str q14, [x0, #5264]
    movi  v11.8h, #0

    mul       v20.8h, v8.8h, v15.H[1]
    add       v14.8h,  v0.8h, v8.8h
    sqrdmulh  v21.8h, v8.8h, v15.H[2]
    sub       v22.8h,  v0.8h, v8.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v13.8h,  v0.8h, v20.8h
    sub       v12.8h,  v22.8h, v20.8h
    sub       v20.8h,  v5.8h, v9.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v8.8h,  v5.8h, v9.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v0.8h,  v21.8h, v9.8h
    add       v4.8h,  v5.8h, v21.8h
    sub       v4.8h,  v24.8h, v4.8h
    mul       v1.8h, v6.8h, v15.H[1]
    mov    v9.16b,  v6.16b
    sqrdmulh  v20.8h, v6.8h, v15.H[2]
    mls       v1.8h, v20.8h, v15.H[0]
    add       v5.8h,  v6.8h, v1.8h
    sub       v5.8h,  v24.8h, v5.8h
    mov    v2.16b,  v3.16b
    mov    v6.16b,  v3.16b
    mov    v10.16b,  v3.16b

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1728]
    ldr q0, [x1, #112]
    str q1, [x0, #704]
    movi  v1.8h, #0
    str q2, [x0, #192]
    movi  v2.8h, #0
    str q4, [x0, #3776]
    ldr q3, [x1, #880]
    str q5, [x0, #2752]
    movi  v4.8h, #0
    str q6, [x0, #2240]
    ldr q5, [x1, #1392]
    str q8, [x0, #5824]
    ldr q6, [x1, #624]
    str q9, [x0, #4800]
    movi  v7.8h, #0
    str q10, [x0, #4288]
    ldr q8, [x1, #1136]
    str q12, [x0, #1216]
    ldr q9, [x1, #368]
    str q13, [x0, #3264]
    movi  v10.8h, #0
    str q14, [x0, #5312]
    movi  v11.8h, #0

    mul       v20.8h, v8.8h, v15.H[1]
    add       v14.8h,  v0.8h, v8.8h
    sqrdmulh  v21.8h, v8.8h, v15.H[2]
    sub       v22.8h,  v0.8h, v8.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v13.8h,  v0.8h, v20.8h
    sub       v12.8h,  v22.8h, v20.8h
    sub       v20.8h,  v5.8h, v9.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v8.8h,  v5.8h, v9.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v0.8h,  v21.8h, v9.8h
    add       v4.8h,  v5.8h, v21.8h
    sub       v4.8h,  v24.8h, v4.8h
    mul       v1.8h, v6.8h, v15.H[1]
    mov    v9.16b,  v6.16b
    sqrdmulh  v20.8h, v6.8h, v15.H[2]
    mls       v1.8h, v20.8h, v15.H[0]
    add       v5.8h,  v6.8h, v1.8h
    sub       v5.8h,  v24.8h, v5.8h
    mov    v2.16b,  v3.16b
    mov    v6.16b,  v3.16b
    mov    v10.16b,  v3.16b

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1744]
    ldr q0, [x1, #1152]
    str q1, [x0, #720]
    ldr q1, [x1, #384]
    str q2, [x0, #208]
    movi  v2.8h, #0
    str q4, [x0, #3792]
    movi  v3.8h, #0
    str q5, [x0, #2768]
    ldr q4, [x1, #128]
    str q6, [x0, #2256]
    movi  v5.8h, #0
    str q8, [x0, #5840]
    movi  v6.8h, #0
    str q9, [x0, #4816]
    ldr q7, [x1, #896]
    str q10, [x0, #4304]
    movi  v8.8h, #0
    str q12, [x0, #1232]
    ldr q9, [x1, #1408]
    str q13, [x0, #3280]
    ldr q10, [x1, #640]
    str q14, [x0, #5328]
    movi  v11.8h, #0

    mul       v20.8h, v4.8h, v15.H[1]
    add       v14.8h,  v0.8h, v4.8h
    sqrdmulh  v21.8h, v4.8h, v15.H[2]
    sub       v13.8h,  v0.8h, v4.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v12.8h,  v0.8h, v20.8h
    sub       v13.8h,  v13.8h, v20.8h
    mul       v20.8h, v9.8h, v15.H[1]
    add       v8.8h,  v1.8h, v9.8h
    sqrdmulh  v21.8h, v9.8h, v15.H[2]
    sub       v22.8h,  v1.8h, v9.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v4.8h,  v1.8h, v20.8h
    sub       v0.8h,  v22.8h, v20.8h
    mul       v5.8h, v10.8h, v15.H[1]
    mov    v9.16b,  v10.16b
    sqrdmulh  v20.8h, v10.8h, v15.H[2]
    mls       v5.8h, v20.8h, v15.H[0]
    add       v1.8h,  v10.8h, v5.8h
    sub       v1.8h,  v24.8h, v1.8h
    mul       v2.8h, v7.8h, v15.H[1]
    mov    v10.16b,  v7.16b
    sqrdmulh  v20.8h, v7.8h, v15.H[2]
    mls       v2.8h, v20.8h, v15.H[0]
    add       v6.8h,  v7.8h, v2.8h
    sub       v6.8h,  v24.8h, v6.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1792]
    ldr q0, [x1, #1168]
    str q1, [x0, #768]
    ldr q1, [x1, #400]
    str q2, [x0, #256]
    movi  v2.8h, #0
    str q4, [x0, #3840]
    movi  v3.8h, #0
    str q5, [x0, #2816]
    ldr q4, [x1, #144]
    str q6, [x0, #2304]
    movi  v5.8h, #0
    str q8, [x0, #5888]
    movi  v6.8h, #0
    str q9, [x0, #4864]
    ldr q7, [x1, #912]
    str q10, [x0, #4352]
    movi  v8.8h, #0
    str q12, [x0, #1280]
    ldr q9, [x1, #1424]
    str q13, [x0, #3328]
    ldr q10, [x1, #656]
    str q14, [x0, #5376]
    movi  v11.8h, #0

    mul       v20.8h, v4.8h, v15.H[1]
    add       v14.8h,  v0.8h, v4.8h
    sqrdmulh  v21.8h, v4.8h, v15.H[2]
    sub       v13.8h,  v0.8h, v4.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v12.8h,  v0.8h, v20.8h
    sub       v13.8h,  v13.8h, v20.8h
    mul       v20.8h, v9.8h, v15.H[1]
    add       v8.8h,  v1.8h, v9.8h
    sqrdmulh  v21.8h, v9.8h, v15.H[2]
    sub       v22.8h,  v1.8h, v9.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v4.8h,  v1.8h, v20.8h
    sub       v0.8h,  v22.8h, v20.8h
    mul       v5.8h, v10.8h, v15.H[1]
    mov    v9.16b,  v10.16b
    sqrdmulh  v20.8h, v10.8h, v15.H[2]
    mls       v5.8h, v20.8h, v15.H[0]
    add       v1.8h,  v10.8h, v5.8h
    sub       v1.8h,  v24.8h, v1.8h
    mul       v2.8h, v7.8h, v15.H[1]
    mov    v10.16b,  v7.16b
    sqrdmulh  v20.8h, v7.8h, v15.H[2]
    mls       v2.8h, v20.8h, v15.H[0]
    add       v6.8h,  v7.8h, v2.8h
    sub       v6.8h,  v24.8h, v6.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1808]
    movi  v0.8h, #0
    str q1, [x0, #784]
    ldr q1, [x1, #1440]
    str q2, [x0, #272]
    ldr q2, [x1, #672]
    str q4, [x0, #3856]
    movi  v3.8h, #0
    str q5, [x0, #2832]
    ldr q4, [x1, #1184]
    str q6, [x0, #2320]
    ldr q5, [x1, #416]
    str q8, [x0, #5904]
    movi  v6.8h, #0
    str q9, [x0, #4880]
    movi  v7.8h, #0
    str q10, [x0, #4368]
    ldr q8, [x1, #160]
    str q12, [x0, #1296]
    movi  v9.8h, #0
    str q13, [x0, #3344]
    movi  v10.8h, #0
    str q14, [x0, #5392]
    ldr q11, [x1, #928]

    sub       v20.8h,  v4.8h, v8.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v14.8h,  v4.8h, v8.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v12.8h,  v21.8h, v8.8h
    add       v13.8h,  v4.8h, v21.8h
    sub       v13.8h,  v24.8h, v13.8h
    mul       v20.8h, v5.8h, v15.H[1]
    add       v8.8h,  v1.8h, v5.8h
    sqrdmulh  v21.8h, v5.8h, v15.H[2]
    sub       v4.8h,  v1.8h, v5.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v0.8h,  v1.8h, v20.8h
    sub       v4.8h,  v4.8h, v20.8h
    mov    v1.16b,  v2.16b
    mov    v5.16b,  v2.16b
    mov    v9.16b,  v2.16b
    mul       v6.8h, v11.8h, v15.H[1]
    mov    v10.16b,  v11.16b
    sqrdmulh  v20.8h, v11.8h, v15.H[2]
    mls       v6.8h, v20.8h, v15.H[0]
    add       v2.8h,  v11.8h, v6.8h
    sub       v2.8h,  v24.8h, v2.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1856]
    movi  v0.8h, #0
    str q1, [x0, #832]
    ldr q1, [x1, #1456]
    str q2, [x0, #320]
    ldr q2, [x1, #688]
    str q4, [x0, #3904]
    movi  v3.8h, #0
    str q5, [x0, #2880]
    ldr q4, [x1, #1200]
    str q6, [x0, #2368]
    ldr q5, [x1, #432]
    str q8, [x0, #5952]
    movi  v6.8h, #0
    str q9, [x0, #4928]
    movi  v7.8h, #0
    str q10, [x0, #4416]
    ldr q8, [x1, #176]
    str q12, [x0, #1344]
    movi  v9.8h, #0
    str q13, [x0, #3392]
    movi  v10.8h, #0
    str q14, [x0, #5440]
    ldr q11, [x1, #944]

    sub       v20.8h,  v4.8h, v8.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v14.8h,  v4.8h, v8.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v12.8h,  v21.8h, v8.8h
    add       v13.8h,  v4.8h, v21.8h
    sub       v13.8h,  v24.8h, v13.8h
    mul       v20.8h, v5.8h, v15.H[1]
    add       v8.8h,  v1.8h, v5.8h
    sqrdmulh  v21.8h, v5.8h, v15.H[2]
    sub       v4.8h,  v1.8h, v5.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v0.8h,  v1.8h, v20.8h
    sub       v4.8h,  v4.8h, v20.8h
    mov    v1.16b,  v2.16b
    mov    v5.16b,  v2.16b
    mov    v9.16b,  v2.16b
    mul       v6.8h, v11.8h, v15.H[1]
    mov    v10.16b,  v11.16b
    sqrdmulh  v20.8h, v11.8h, v15.H[2]
    mls       v6.8h, v20.8h, v15.H[0]
    add       v2.8h,  v11.8h, v6.8h
    sub       v2.8h,  v24.8h, v2.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1872]
    ldr q0, [x1, #192]
    str q1, [x0, #848]
    movi  v1.8h, #0
    str q2, [x0, #336]
    movi  v2.8h, #0
    str q4, [x0, #3920]
    ldr q3, [x1, #960]
    str q5, [x0, #2896]
    movi  v4.8h, #0
    str q6, [x0, #2384]
    ldr q5, [x1, #1472]
    str q8, [x0, #5968]
    ldr q6, [x1, #704]
    str q9, [x0, #4944]
    movi  v7.8h, #0
    str q10, [x0, #4432]
    ldr q8, [x1, #1216]
    str q12, [x0, #1360]
    ldr q9, [x1, #448]
    str q13, [x0, #3408]
    movi  v10.8h, #0
    str q14, [x0, #5456]
    movi  v11.8h, #0

    mul       v20.8h, v8.8h, v15.H[1]
    add       v14.8h,  v0.8h, v8.8h
    sqrdmulh  v21.8h, v8.8h, v15.H[2]
    sub       v22.8h,  v0.8h, v8.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v13.8h,  v0.8h, v20.8h
    sub       v12.8h,  v22.8h, v20.8h
    sub       v20.8h,  v5.8h, v9.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v8.8h,  v5.8h, v9.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v0.8h,  v21.8h, v9.8h
    add       v4.8h,  v5.8h, v21.8h
    sub       v4.8h,  v24.8h, v4.8h
    mul       v1.8h, v6.8h, v15.H[1]
    mov    v9.16b,  v6.16b
    sqrdmulh  v20.8h, v6.8h, v15.H[2]
    mls       v1.8h, v20.8h, v15.H[0]
    add       v5.8h,  v6.8h, v1.8h
    sub       v5.8h,  v24.8h, v5.8h
    mov    v2.16b,  v3.16b
    mov    v6.16b,  v3.16b
    mov    v10.16b,  v3.16b

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1920]
    ldr q0, [x1, #208]
    str q1, [x0, #896]
    movi  v1.8h, #0
    str q2, [x0, #384]
    movi  v2.8h, #0
    str q4, [x0, #3968]
    ldr q3, [x1, #976]
    str q5, [x0, #2944]
    movi  v4.8h, #0
    str q6, [x0, #2432]
    ldr q5, [x1, #1488]
    str q8, [x0, #6016]
    ldr q6, [x1, #720]
    str q9, [x0, #4992]
    movi  v7.8h, #0
    str q10, [x0, #4480]
    ldr q8, [x1, #1232]
    str q12, [x0, #1408]
    ldr q9, [x1, #464]
    str q13, [x0, #3456]
    movi  v10.8h, #0
    str q14, [x0, #5504]
    movi  v11.8h, #0

    mul       v20.8h, v8.8h, v15.H[1]
    add       v14.8h,  v0.8h, v8.8h
    sqrdmulh  v21.8h, v8.8h, v15.H[2]
    sub       v22.8h,  v0.8h, v8.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v13.8h,  v0.8h, v20.8h
    sub       v12.8h,  v22.8h, v20.8h
    sub       v20.8h,  v5.8h, v9.8h
    mul       v21.8h, v20.8h, v15.H[1]
    add       v8.8h,  v5.8h, v9.8h
    sqrdmulh  v22.8h, v20.8h, v15.H[2]
    mls       v21.8h, v22.8h, v15.H[0]
    sub       v0.8h,  v21.8h, v9.8h
    add       v4.8h,  v5.8h, v21.8h
    sub       v4.8h,  v24.8h, v4.8h
    mul       v1.8h, v6.8h, v15.H[1]
    mov    v9.16b,  v6.16b
    sqrdmulh  v20.8h, v6.8h, v15.H[2]
    mls       v1.8h, v20.8h, v15.H[0]
    add       v5.8h,  v6.8h, v1.8h
    sub       v5.8h,  v24.8h, v5.8h
    mov    v2.16b,  v3.16b
    mov    v6.16b,  v3.16b
    mov    v10.16b,  v3.16b

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1936]
    ldr q0, [x1, #1248]
    str q1, [x0, #912]
    ldr q1, [x1, #480]
    str q2, [x0, #400]
    movi  v2.8h, #0
    str q4, [x0, #3984]
    movi  v3.8h, #0
    str q5, [x0, #2960]
    ldr q4, [x1, #224]
    str q6, [x0, #2448]
    movi  v5.8h, #0
    str q8, [x0, #6032]
    movi  v6.8h, #0
    str q9, [x0, #5008]
    ldr q7, [x1, #992]
    str q10, [x0, #4496]
    movi  v8.8h, #0
    str q12, [x0, #1424]
    ldr q9, [x1, #1504]
    str q13, [x0, #3472]
    ldr q10, [x1, #736]
    str q14, [x0, #5520]
    movi  v11.8h, #0

    mul       v20.8h, v4.8h, v15.H[1]
    add       v14.8h,  v0.8h, v4.8h
    sqrdmulh  v21.8h, v4.8h, v15.H[2]
    sub       v13.8h,  v0.8h, v4.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v12.8h,  v0.8h, v20.8h
    sub       v13.8h,  v13.8h, v20.8h
    mul       v20.8h, v9.8h, v15.H[1]
    add       v8.8h,  v1.8h, v9.8h
    sqrdmulh  v21.8h, v9.8h, v15.H[2]
    sub       v22.8h,  v1.8h, v9.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v4.8h,  v1.8h, v20.8h
    sub       v0.8h,  v22.8h, v20.8h
    mul       v5.8h, v10.8h, v15.H[1]
    mov    v9.16b,  v10.16b
    sqrdmulh  v20.8h, v10.8h, v15.H[2]
    mls       v5.8h, v20.8h, v15.H[0]
    add       v1.8h,  v10.8h, v5.8h
    sub       v1.8h,  v24.8h, v1.8h
    mul       v2.8h, v7.8h, v15.H[1]
    mov    v10.16b,  v7.16b
    sqrdmulh  v20.8h, v7.8h, v15.H[2]
    mls       v2.8h, v20.8h, v15.H[0]
    add       v6.8h,  v7.8h, v2.8h
    sub       v6.8h,  v24.8h, v6.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q0, [x0, #1984]
    ldr q0, [x1, #1264]
    str q1, [x0, #960]
    ldr q1, [x1, #496]
    str q2, [x0, #448]
    movi  v2.8h, #0
    str q4, [x0, #4032]
    movi  v3.8h, #0
    str q5, [x0, #3008]
    ldr q4, [x1, #240]
    str q6, [x0, #2496]
    movi  v5.8h, #0
    str q8, [x0, #6080]
    movi  v6.8h, #0
    str q9, [x0, #5056]
    ldr q7, [x1, #1008]
    str q10, [x0, #4544]
    movi  v8.8h, #0
    str q12, [x0, #1472]
    movi  v9.8h, #0
    ldrh  w11, [x1, #1520]
    mov   v9.h[0], w11
    str q13, [x0, #3520]
    ldr q10, [x1, #752]
    str q14, [x0, #5568]
    movi  v11.8h, #0

    mul       v20.8h, v4.8h, v15.H[1]
    add       v14.8h,  v0.8h, v4.8h
    sqrdmulh  v21.8h, v4.8h, v15.H[2]
    sub       v13.8h,  v0.8h, v4.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v12.8h,  v0.8h, v20.8h
    sub       v13.8h,  v13.8h, v20.8h
    mul       v20.8h, v9.8h, v15.H[1]
    add       v8.8h,  v1.8h, v9.8h
    sqrdmulh  v21.8h, v9.8h, v15.H[2]
    sub       v22.8h,  v1.8h, v9.8h
    mls       v20.8h, v21.8h, v15.H[0]
    add       v4.8h,  v1.8h, v20.8h
    sub       v0.8h,  v22.8h, v20.8h
    mul       v5.8h, v10.8h, v15.H[1]
    mov    v9.16b,  v10.16b
    sqrdmulh  v20.8h, v10.8h, v15.H[2]
    mls       v5.8h, v20.8h, v15.H[0]
    add       v1.8h,  v10.8h, v5.8h
    sub       v1.8h,  v24.8h, v1.8h
    mul       v2.8h, v7.8h, v15.H[1]
    mov    v10.16b,  v7.16b
    sqrdmulh  v20.8h, v7.8h, v15.H[2]
    mls       v2.8h, v20.8h, v15.H[0]
    add       v6.8h,  v7.8h, v2.8h
    sub       v6.8h,  v24.8h, v6.8h

    add    v3.8h, v12.8h, v1.8h
    add    v7.8h, v13.8h, v5.8h
    add    v11.8h, v14.8h, v9.8h
    sub    v12.8h, v12.8h, v1.8h
    sqdmulh  v25.8h, v12.8h, v15.H[3]
    sub    v13.8h, v13.8h,  v5.8h
    srshr    v25.8h, v25.8h, #12
    mls      v12.8h, v25.8h, v15.H[0]
    sqdmulh  v31.8h, v13.8h, v15.H[3]
    sub    v14.8h, v14.8h, v9.8h
    srshr    v31.8h, v31.8h, #12
    mls      v13.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v14.8h, v15.H[3]
    add    v1.8h, v0.8h, v2.8h;
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v15.H[0]
    add    v5.8h, v4.8h, v6.8h
    add    v9.8h, v8.8h, v10.8h
    sub    v0.8h, v0.8h, v2.8h
    sqdmulh  v29.8h, v0.8h, v15.H[3]
    sub    v4.8h, v4.8h, v6.8h
    srshr    v29.8h, v29.8h, #12
    mls      v0.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v4.8h, v15.H[3]
    sub    v8.8h, v8.8h, v10.8h
    srshr    v28.8h, v28.8h, #12
    mls      v4.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v8.8h, v15.H[3]
    add    v2.8h, v3.8h, v1.8h
    srshr    v27.8h, v27.8h, #12
    mls      v8.8h, v27.8h, v15.H[0]
    sqdmulh  v31.8h, v2.8h, v15.H[3]
    add    v6.8h, v7.8h, v5.8h
    srshr    v31.8h, v31.8h, #12
    mls      v2.8h, v31.8h, v15.H[0]
    sqdmulh  v30.8h, v6.8h, v15.H[3]
    add    v10.8h, v11.8h, v9.8h
    srshr    v30.8h, v30.8h, #12
    mls      v6.8h, v30.8h, v15.H[0]
    sqdmulh  v29.8h, v10.8h, v15.H[3]
    sub    v1.8h, v3.8h, v1.8h
    srshr    v29.8h, v29.8h, #12
    mls      v10.8h, v29.8h, v15.H[0]
    sqdmulh  v28.8h, v1.8h, v15.H[3]
    sub    v5.8h, v7.8h, v5.8h
    srshr    v28.8h, v28.8h, #12
    mls      v1.8h, v28.8h, v15.H[0]
    sqdmulh  v27.8h, v5.8h, v15.H[3]
    sub    v9.8h, v11.8h, v9.8h
    srshr    v27.8h, v27.8h, #12
    mls      v5.8h, v27.8h, v15.H[0]

    sqdmulh  v26.8h, v9.8h, v15.H[3]

    srshr    v26.8h, v26.8h, #12
    mls      v9.8h, v26.8h, v15.H[0]
    str q2, [x0, #464]
    str q6, [x0, #2512]
    str q10, [x0, #4560]
    str q1, [x0, #976]
    str q5, [x0, #3024]
    str q9, [x0, #5072]
    str q12, [x0, #1488]
    str q13, [x0, #3536]
    str q14, [x0, #5584]
    str q0, [x0, #2000]
    str q4, [x0, #4048]
    str q8, [x0, #6096]
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
