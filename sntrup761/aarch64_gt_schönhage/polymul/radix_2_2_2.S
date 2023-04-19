.align 6
.global _radix_2_2_2
.global __radix_2_2_2
_radix_2_2_2:
__radix_2_2_2:
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
    mov v15.H[0], w4
    mov v15.H[1], w5
    movi  v25.8h, #0

    ldr q0, [x1, #0]
    ldr q1, [x1, #16]
    ldr q2, [x1, #64]
    ldr q3, [x1, #80]
    ldr q4, [x1, #128]
    ldr q5, [x1, #144]
    ldr q6, [x1, #192]
    ldr q7, [x1, #208]
    ldr q8, [x1, #256]
    ldr q9, [x1, #272]
    ldr q10, [x1, #320]
    ldr q11, [x1, #336]
    ldr q12, [x1, #384]
    ldr q13, [x1, #400]
    ldr q14, [x1, #448]
    ldr q16, [x1, #464]

    add v17.8h, v0.8h, v8.8h
    add v18.8h, v1.8h, v9.8h
    add v19.8h, v2.8h, v10.8h
    add v20.8h, v3.8h, v11.8h
    add v21.8h, v4.8h, v12.8h
    add v22.8h, v5.8h, v13.8h
    add v23.8h, v6.8h, v14.8h
    add v24.8h, v7.8h, v16.8h
    sub   v8.8h,   v0.8h, v8.8h
    sub   v9.8h,   v1.8h, v9.8h
    sub   v10.8h,  v2.8h, v10.8h
    sub   v11.8h,  v3.8h, v11.8h
    sub   v12.8h,  v4.8h, v12.8h
    sub   v13.8h,  v5.8h, v13.8h
    sub   v14.8h,  v6.8h, v14.8h
    sub   v16.8h,  v7.8h, v16.8h
    add  v0.8h, v17.8h, v21.8h
    add  v1.8h, v18.8h, v22.8h
    add  v2.8h, v19.8h, v23.8h
    add  v3.8h, v20.8h, v24.8h
    sub  v21.8h, v17.8h, v21.8h
    sub  v22.8h, v18.8h, v22.8h
    sub  v23.8h, v19.8h, v23.8h
    sub  v24.8h, v20.8h, v24.8h
    add  v17.8h, v0.8h, v2.8h
    add  v18.8h, v1.8h, v3.8h
    sub  v19.8h, v0.8h, v2.8h
    sub  v20.8h, v1.8h, v3.8h
    neg  v6.8h, v23.8h
    neg  v7.8h, v24.8h
    sqdmulh  v26.8h, v17.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v17.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v19.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v19.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v21.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v21.8h, v26.8h, v15.H[0]
    mov    v27.16b,  v17.16b
    mov    v28.16b,  v19.16b
    mov    v29.16b,  v21.16b
    mov    v30.16b,  v21.16b
    add    x8,  x0, 0
    st4  {v27.4s - v30.4s}, [x8]
    sqdmulh  v26.8h, v18.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v18.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v20.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v20.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v22.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v22.8h, v26.8h, v15.H[0]
    mov    v27.16b,  v18.16b
    mov    v28.16b,  v20.16b
    mov    v29.16b,  v22.16b
    mov    v30.16b,  v22.16b
    add    x8,  x0, 64
    st4  {v27.4s - v30.4s}, [x8]
    sqdmulh  v26.8h, v23.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v23.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v6.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v6.8h, v26.8h, v15.H[0]
    mov    v27.16b,  v25.16b
    mov    v28.16b,  v25.16b
    mov    v29.16b,  v23.16b
    mov    v30.16b,  v6.16b
    add    x8,  x0, 128
    st4  {v27.4s - v30.4s}, [x8]
    sqdmulh  v26.8h, v24.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v24.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v7.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v7.8h, v26.8h, v15.H[0]
    mov    v29.16b,  v24.16b
    mov    v30.16b,  v7.16b
    add    x8,  x0, 192
    st4  {v27.4s - v30.4s}, [x8]
    sub  v27.8h, v8.8h, v16.8h
    add  v28.8h, v8.8h, v16.8h
    sub  v29.8h, v8.8h, v11.8h
    add  v30.8h, v8.8h, v11.8h
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 256
    st4  {v27.4s - v30.4s}, [x8]
    add  v27.8h, v9.8h, v10.8h
    sub  v28.8h, v9.8h, v10.8h
    add  v29.8h, v9.8h, v14.8h
    sub  v30.8h, v9.8h, v14.8h
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 320
    st4  {v27.4s - v30.4s}, [x8]
    add  v27.8h, v12.8h, v11.8h
    sub  v28.8h, v12.8h, v11.8h
    sub  v29.8h, v16.8h, v12.8h
    add  v30.8h, v16.8h, v12.8h
    neg  v30.8h, v30.8h
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 384
    st4  {v27.4s - v30.4s}, [x8]
    add  v27.8h, v13.8h, v14.8h
    sub  v28.8h, v13.8h, v14.8h
    sub  v29.8h, v10.8h, v13.8h
    add  v30.8h, v10.8h, v13.8h
    neg  v30.8h, v30.8h
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 448
    st4  {v27.4s - v30.4s}, [x8]
    ldr q0, [x1, #512]
    ldr q1, [x1, #528]
    ldr q2, [x1, #576]
    ldr q3, [x1, #592]
    ldr q4, [x1, #640]
    ldr q5, [x1, #656]
    ldr q6, [x1, #704]
    ldr q7, [x1, #720]
    ldr q8, [x1, #768]
    ldr q9, [x1, #784]
    ldr q10, [x1, #832]
    ldr q11, [x1, #848]
    ldr q12, [x1, #896]
    ldr q13, [x1, #912]
    ldr q14, [x1, #960]
    ldr q16, [x1, #976]
    sub  v17.8h, v0.8h, v13.8h
    add  v18.8h, v1.8h, v4.8h
    add  v19.8h, v8.8h, v5.8h
    add  v20.8h, v9.8h, v12.8h
    add  v0.8h, v0.8h, v13.8h
    sub  v1.8h, v1.8h, v4.8h
    sub  v8.8h, v8.8h, v5.8h
    sub  v9.8h, v9.8h, v12.8h
    sub  v21.8h, v2.8h, v16.8h
    add  v22.8h, v3.8h, v6.8h
    add  v23.8h, v10.8h, v7.8h
    add  v24.8h, v11.8h, v14.8h
    add  v2.8h, v2.8h, v16.8h
    sub  v3.8h, v3.8h, v6.8h
    sub  v10.8h, v10.8h, v7.8h
    sub  v11.8h, v11.8h, v14.8h
    ext  v5.16b, v21.16b, v22.16b, #8
    ext  v6.16b, v22.16b, v23.16b, #8
    ext  v7.16b, v23.16b, v24.16b, #8
    neg  v24.8h, v24.8h
    ext  v4.16b, v24.16b, v21.16b, #8
    add  v21.8h, v17.8h, v4.8h
    add  v22.8h, v18.8h, v5.8h
    add  v23.8h, v19.8h, v6.8h
    add  v24.8h, v20.8h, v7.8h
    sub  v17.8h, v17.8h, v4.8h
    sub  v18.8h, v18.8h, v5.8h
    sub  v19.8h, v19.8h, v6.8h
    sub  v20.8h, v20.8h, v7.8h
    ext  v7.16b, v2.16b, v3.16b, #8
    ext  v4.16b, v3.16b, v10.16b, #8
    ext  v5.16b, v10.16b, v11.16b, #8
    neg  v11.8h, v11.8h
    ext  v6.16b, v11.16b, v2.16b, #8
    sub  v2.8h, v0.8h, v4.8h
    sub  v3.8h, v1.8h, v5.8h
    add  v10.8h, v8.8h, v6.8h
    add  v11.8h, v9.8h, v7.8h
    add  v0.8h, v0.8h, v4.8h
    add  v1.8h, v1.8h, v5.8h
    sub  v8.8h, v8.8h, v6.8h
    sub  v9.8h, v9.8h, v7.8h
    mov    v27.16b,  v21.16b
    mov    v28.16b,  v17.16b
    mov    v29.16b,  v2.16b
    mov    v30.16b,  v0.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 512
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v22.16b
    mov    v28.16b,  v18.16b
    mov    v29.16b,  v3.16b
    mov    v30.16b,  v1.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 576
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v23.16b
    mov    v28.16b,  v19.16b
    mov    v29.16b,  v10.16b
    mov    v30.16b,  v8.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 640
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v24.16b
    mov    v28.16b,  v20.16b
    mov    v29.16b,  v11.16b
    mov    v30.16b,  v9.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 704
    st4  {v27.4s - v30.4s}, [x8]
    ldr q0, [x1, #512]
    ldr q1, [x1, #528]
    ldr q2, [x1, #576]
    ldr q3, [x1, #592]
    ldr q4, [x1, #640]
    ldr q5, [x1, #656]
    ldr q6, [x1, #704]
    ldr q7, [x1, #720]
    ldr q8, [x1, #768]
    ldr q9, [x1, #784]
    ldr q10, [x1, #832]
    ldr q11, [x1, #848]
    ldr q12, [x1, #896]
    ldr q13, [x1, #912]
    ldr q14, [x1, #960]
    ldr q16, [x1, #976]
    sub  v17.8h, v0.8h, v5.8h
    add  v18.8h, v1.8h, v12.8h
    sub  v19.8h, v13.8h, v8.8h
    sub  v20.8h, v4.8h, v9.8h
    add  v0.8h, v0.8h, v5.8h
    sub  v1.8h, v1.8h, v12.8h
    add  v8.8h, v13.8h, v8.8h
    neg  v8.8h, v8.8h
    add  v9.8h, v4.8h, v9.8h
    neg  v9.8h, v9.8h
    sub  v21.8h, v2.8h, v7.8h
    add  v22.8h, v3.8h, v14.8h
    sub  v23.8h, v16.8h, v10.8h
    sub  v24.8h, v6.8h, v11.8h
    add  v2.8h, v2.8h, v7.8h
    sub  v3.8h, v3.8h, v14.8h
    add  v10.8h, v16.8h, v10.8h
    neg  v10.8h, v10.8h
    add  v11.8h, v6.8h, v11.8h
    neg  v11.8h, v11.8h
    ext  v6.16b, v21.16b, v22.16b, #8
    ext  v7.16b, v22.16b, v23.16b, #8
    ext  v4.16b, v23.16b, v24.16b, #8
    neg  v24.8h, v24.8h
    ext  v5.16b, v24.16b, v21.16b, #8
    sub  v21.8h, v17.8h, v4.8h
    add  v22.8h, v18.8h, v5.8h
    add  v23.8h, v19.8h, v6.8h
    add  v24.8h, v20.8h, v7.8h
    add  v17.8h, v17.8h, v4.8h
    sub  v18.8h, v18.8h, v5.8h
    sub  v19.8h, v19.8h, v6.8h
    sub  v20.8h, v20.8h, v7.8h
    ext  v4.16b, v2.16b, v3.16b, #8
    ext  v5.16b, v3.16b, v10.16b, #8
    ext  v6.16b, v10.16b, v11.16b, #8
    neg  v11.8h, v11.8h
    ext  v7.16b, v11.16b, v2.16b, #8
    sub  v2.8h, v0.8h, v4.8h
    sub  v3.8h, v1.8h, v5.8h
    sub  v10.8h, v8.8h, v6.8h
    add  v11.8h, v9.8h, v7.8h
    add  v0.8h, v0.8h, v4.8h
    add  v1.8h, v1.8h, v5.8h
    add  v8.8h, v8.8h, v6.8h
    sub  v9.8h, v9.8h, v7.8h
    mov    v27.16b,  v21.16b
    mov    v28.16b,  v17.16b
    mov    v29.16b,  v2.16b
    mov    v30.16b,  v0.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 768
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v22.16b
    mov    v28.16b,  v18.16b
    mov    v29.16b,  v3.16b
    mov    v30.16b,  v1.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 832
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v23.16b
    mov    v28.16b,  v19.16b
    mov    v29.16b,  v10.16b
    mov    v30.16b,  v8.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 896
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v24.16b
    mov    v28.16b,  v20.16b
    mov    v29.16b,  v11.16b
    mov    v30.16b,  v9.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 960
    st4  {v27.4s - v30.4s}, [x8]
    ldr q0, [x1, #1024]
    ldr q1, [x1, #1040]
    ldr q2, [x1, #1536]
    ldr q3, [x1, #1552]
    ldr q4, [x1, #1088]
    ldr q5, [x1, #1104]
    ldr q6, [x1, #1600]
    ldr q7, [x1, #1616]
    ldr q8, [x1, #1280]
    ldr q9, [x1, #1296]
    ldr q10, [x1, #1792]
    ldr q11, [x1, #1808]
    ldr q12, [x1, #1344]
    ldr q13, [x1, #1360]
    ldr q14, [x1, #1856]
    ldr q16, [x1, #1872]
    sub  v17.8h, v0.8h, v11.8h
    add  v18.8h, v1.8h, v8.8h
    add  v19.8h, v2.8h, v9.8h
    add  v20.8h, v3.8h, v10.8h
    sub  v21.8h, v4.8h, v16.8h
    add  v22.8h, v5.8h, v12.8h
    add  v23.8h, v6.8h, v13.8h
    add  v24.8h, v7.8h, v14.8h
    ldr q0, [x1, #1152]
    ldr q1, [x1, #1168]
    ldr q2, [x1, #1664]
    ldr q3, [x1, #1680]
    ldr q4, [x1, #1216]
    ldr q5, [x1, #1232]
    ldr q6, [x1, #1728]
    ldr q7, [x1, #1744]
    ldr q8, [x1, #1408]
    ldr q9, [x1, #1424]
    ldr q10, [x1, #1920]
    ldr q11, [x1, #1936]
    ldr q12, [x1, #1472]
    ldr q13, [x1, #1488]
    ldr q14, [x1, #1984]
    ldr q16, [x1, #2000]
    sub  v0.8h, v0.8h, v11.8h
    add  v1.8h, v1.8h, v8.8h
    add  v2.8h, v2.8h, v9.8h
    add  v3.8h, v3.8h, v10.8h
    sub  v4.8h, v4.8h, v16.8h
    add  v5.8h, v5.8h, v12.8h
    add  v6.8h, v6.8h, v13.8h
    add  v7.8h, v7.8h, v14.8h
    ext  v9.16b, v0.16b, v1.16b, #8
    ext  v10.16b, v1.16b, v2.16b, #8
    ext  v11.16b, v2.16b, v3.16b, #8
    neg  v3.8h, v3.8h
    ext  v8.16b, v3.16b, v0.16b, #8
    add  v0.8h, v17.8h, v8.8h
    add  v1.8h, v18.8h, v9.8h
    add  v2.8h, v19.8h, v10.8h
    add  v3.8h, v20.8h, v11.8h
    sub  v17.8h, v17.8h, v8.8h
    sub  v18.8h, v18.8h, v9.8h
    sub  v19.8h, v19.8h, v10.8h
    sub  v20.8h, v20.8h, v11.8h
    ext  v9.16b, v4.16b, v5.16b, #8
    ext  v10.16b, v5.16b, v6.16b, #8
    ext  v11.16b, v6.16b, v7.16b, #8
    neg  v7.8h, v7.8h
    ext  v8.16b, v7.16b, v4.16b, #8
    add  v4.8h, v21.8h, v8.8h
    add  v5.8h, v22.8h, v9.8h
    add  v6.8h, v23.8h, v10.8h
    add  v7.8h, v24.8h, v11.8h
    sub  v21.8h, v21.8h, v8.8h
    sub  v22.8h, v22.8h, v9.8h
    sub  v23.8h, v23.8h, v10.8h
    sub  v24.8h, v24.8h, v11.8h
    ext  v9.16b, v4.16b, v5.16b, #12
    ext  v10.16b, v5.16b, v6.16b, #12
    ext  v11.16b, v6.16b, v7.16b, #12
    neg  v7.8h, v7.8h
    ext  v8.16b, v7.16b, v4.16b, #12
    add  v4.8h, v0.8h, v8.8h
    add  v5.8h, v1.8h, v9.8h
    add  v6.8h, v2.8h, v10.8h
    add  v7.8h, v3.8h, v11.8h
    sub  v0.8h, v0.8h, v8.8h
    sub  v1.8h, v1.8h, v9.8h
    sub  v2.8h, v2.8h, v10.8h
    sub  v3.8h, v3.8h, v11.8h
    ext  v8.16b, v22.16b, v23.16b, #12
    ext  v9.16b, v23.16b, v24.16b, #12
    ext  v11.16b, v21.16b, v22.16b, #12
    neg  v24.8h, v24.8h
    ext  v10.16b, v24.16b, v21.16b, #12
    sub  v21.8h, v17.8h, v8.8h
    sub  v22.8h, v18.8h, v9.8h
    add  v23.8h, v19.8h, v10.8h
    add  v24.8h, v20.8h, v11.8h
    add  v17.8h, v17.8h, v8.8h
    add  v18.8h, v18.8h, v9.8h
    sub  v19.8h, v19.8h, v10.8h
    sub  v20.8h, v20.8h, v11.8h
    mov    v27.16b,  v4.16b
    mov    v28.16b,  v0.16b
    mov    v29.16b,  v21.16b
    mov    v30.16b,  v17.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1024
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v5.16b
    mov    v28.16b,  v1.16b
    mov    v29.16b,  v22.16b
    mov    v30.16b,  v18.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1088
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v6.16b
    mov    v28.16b,  v2.16b
    mov    v29.16b,  v23.16b
    mov    v30.16b,  v19.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1152
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v7.16b
    mov    v28.16b,  v3.16b
    mov    v29.16b,  v24.16b
    mov    v30.16b,  v20.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1216
    st4  {v27.4s - v30.4s}, [x8]
    ldr q0, [x1, #1024]
    ldr q1, [x1, #1040]
    ldr q2, [x1, #1536]
    ldr q3, [x1, #1552]
    ldr q4, [x1, #1088]
    ldr q5, [x1, #1104]
    ldr q6, [x1, #1600]
    ldr q7, [x1, #1616]
    ldr q8, [x1, #1280]
    ldr q9, [x1, #1296]
    ldr q10, [x1, #1792]
    ldr q11, [x1, #1808]
    ldr q12, [x1, #1344]
    ldr q13, [x1, #1360]
    ldr q14, [x1, #1856]
    ldr q16, [x1, #1872]
    add  v17.8h, v0.8h, v11.8h
    sub  v18.8h, v1.8h, v8.8h
    sub  v19.8h, v2.8h, v9.8h
    sub  v20.8h, v3.8h, v10.8h
    add  v21.8h, v4.8h, v16.8h
    sub  v22.8h, v5.8h, v12.8h
    sub  v23.8h, v6.8h, v13.8h
    sub  v24.8h, v7.8h, v14.8h
    ldr q0, [x1, #1152]
    ldr q1, [x1, #1168]
    ldr q2, [x1, #1664]
    ldr q3, [x1, #1680]
    ldr q4, [x1, #1216]
    ldr q5, [x1, #1232]
    ldr q6, [x1, #1728]
    ldr q7, [x1, #1744]
    ldr q8, [x1, #1408]
    ldr q9, [x1, #1424]
    ldr q10, [x1, #1920]
    ldr q11, [x1, #1936]
    ldr q12, [x1, #1472]
    ldr q13, [x1, #1488]
    ldr q14, [x1, #1984]
    ldr q16, [x1, #2000]
    add  v0.8h, v0.8h, v11.8h
    sub  v1.8h, v1.8h, v8.8h
    sub  v2.8h, v2.8h, v9.8h
    sub  v3.8h, v3.8h, v10.8h
    add  v4.8h, v4.8h, v16.8h
    sub  v5.8h, v5.8h, v12.8h
    sub  v6.8h, v6.8h, v13.8h
    sub  v7.8h, v7.8h, v14.8h
    ext  v8.16b, v1.16b, v2.16b, #8
    ext  v9.16b, v2.16b, v3.16b, #8
    ext  v11.16b, v0.16b, v1.16b, #8
    neg  v3.8h, v3.8h
    ext  v10.16b, v3.16b, v0.16b, #8
    sub  v0.8h, v17.8h, v8.8h
    sub  v1.8h, v18.8h, v9.8h
    add  v2.8h, v19.8h, v10.8h
    add  v3.8h, v20.8h, v11.8h
    add  v17.8h, v17.8h, v8.8h
    add  v18.8h, v18.8h, v9.8h
    sub  v19.8h, v19.8h, v10.8h
    sub  v20.8h, v20.8h, v11.8h
    ext  v8.16b, v5.16b, v6.16b, #8
    ext  v9.16b, v6.16b, v7.16b, #8
    ext  v11.16b, v4.16b, v5.16b, #8
    neg  v7.8h, v7.8h
    ext  v10.16b, v7.16b, v4.16b, #8
    sub  v4.8h, v21.8h, v8.8h
    sub  v5.8h, v22.8h, v9.8h
    add  v6.8h, v23.8h, v10.8h
    add  v7.8h, v24.8h, v11.8h
    add  v21.8h, v21.8h, v8.8h
    add  v22.8h, v22.8h, v9.8h
    sub  v23.8h, v23.8h, v10.8h
    sub  v24.8h, v24.8h, v11.8h
    ext  v10.16b, v4.16b, v5.16b, #12
    ext  v11.16b, v5.16b, v6.16b, #12
    ext  v8.16b, v6.16b, v7.16b, #12
    neg  v7.8h, v7.8h
    ext  v9.16b, v7.16b, v4.16b, #12
    sub  v4.8h, v0.8h, v8.8h
    add  v5.8h, v1.8h, v9.8h
    add  v6.8h, v2.8h, v10.8h
    add  v7.8h, v3.8h, v11.8h
    add  v0.8h, v0.8h, v8.8h
    sub  v1.8h, v1.8h, v9.8h
    sub  v2.8h, v2.8h, v10.8h
    sub  v3.8h, v3.8h, v11.8h
    ext  v8.16b, v21.16b, v22.16b, #12
    ext  v9.16b, v22.16b, v23.16b, #12
    ext  v10.16b, v23.16b, v24.16b, #12
    neg  v24.8h, v24.8h
    ext  v11.16b, v24.16b, v21.16b, #12
    sub  v21.8h, v17.8h, v8.8h
    sub  v22.8h, v18.8h, v9.8h
    sub  v23.8h, v19.8h, v10.8h
    add  v24.8h, v20.8h, v11.8h
    add  v17.8h, v17.8h, v8.8h
    add  v18.8h, v18.8h, v9.8h
    add  v19.8h, v19.8h, v10.8h
    sub  v20.8h, v20.8h, v11.8h
    mov    v27.16b,  v4.16b
    mov    v28.16b,  v0.16b
    mov    v29.16b,  v21.16b
    mov    v30.16b,  v17.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1280
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v5.16b
    mov    v28.16b,  v1.16b
    mov    v29.16b,  v22.16b
    mov    v30.16b,  v18.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1344
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v6.16b
    mov    v28.16b,  v2.16b
    mov    v29.16b,  v23.16b
    mov    v30.16b,  v19.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1408
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v7.16b
    mov    v28.16b,  v3.16b
    mov    v29.16b,  v24.16b
    mov    v30.16b,  v20.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1472
    st4  {v27.4s - v30.4s}, [x8]
    ldr q0, [x1, #1024]
    ldr q1, [x1, #1040]
    ldr q2, [x1, #1536]
    ldr q3, [x1, #1552]
    ldr q4, [x1, #1088]
    ldr q5, [x1, #1104]
    ldr q6, [x1, #1600]
    ldr q7, [x1, #1616]
    ldr q8, [x1, #1280]
    ldr q9, [x1, #1296]
    ldr q10, [x1, #1792]
    ldr q11, [x1, #1808]
    ldr q12, [x1, #1344]
    ldr q13, [x1, #1360]
    ldr q14, [x1, #1856]
    ldr q16, [x1, #1872]
    sub  v17.8h, v0.8h, v9.8h
    add  v18.8h, v1.8h, v10.8h
    sub  v19.8h, v11.8h, v2.8h
    sub  v20.8h, v8.8h, v3.8h
    sub  v21.8h, v4.8h, v13.8h
    add  v22.8h, v5.8h, v14.8h
    sub  v23.8h, v16.8h, v6.8h
    sub  v24.8h, v12.8h, v7.8h
    ldr q0, [x1, #1152]
    ldr q1, [x1, #1168]
    ldr q2, [x1, #1664]
    ldr q3, [x1, #1680]
    ldr q4, [x1, #1216]
    ldr q5, [x1, #1232]
    ldr q6, [x1, #1728]
    ldr q7, [x1, #1744]
    ldr q8, [x1, #1408]
    ldr q9, [x1, #1424]
    ldr q10, [x1, #1920]
    ldr q11, [x1, #1936]
    ldr q12, [x1, #1472]
    ldr q13, [x1, #1488]
    ldr q14, [x1, #1984]
    ldr q16, [x1, #2000]
    sub  v0.8h, v0.8h, v9.8h
    add  v1.8h, v1.8h, v10.8h
    sub  v2.8h, v11.8h, v2.8h
    sub  v3.8h, v8.8h, v3.8h
    sub  v4.8h, v4.8h, v13.8h
    add  v5.8h, v5.8h, v14.8h
    sub  v6.8h, v16.8h, v6.8h
    sub  v7.8h, v12.8h, v7.8h
    ext  v10.16b, v0.16b, v1.16b, #8
    ext  v11.16b, v1.16b, v2.16b, #8
    ext  v8.16b, v2.16b, v3.16b, #8
    neg  v3.8h, v3.8h
    ext  v9.16b, v3.16b, v0.16b, #8
    sub  v0.8h, v17.8h, v8.8h
    add  v1.8h, v18.8h, v9.8h
    add  v2.8h, v19.8h, v10.8h
    add  v3.8h, v20.8h, v11.8h
    add  v17.8h, v17.8h, v8.8h
    sub  v18.8h, v18.8h, v9.8h
    sub  v19.8h, v19.8h, v10.8h
    sub  v20.8h, v20.8h, v11.8h
    ext  v10.16b, v4.16b, v5.16b, #8
    ext  v11.16b, v5.16b, v6.16b, #8
    ext  v8.16b, v6.16b, v7.16b, #8
    neg  v7.8h, v7.8h
    ext  v9.16b, v7.16b, v4.16b, #8
    sub  v4.8h, v21.8h, v8.8h
    add  v5.8h, v22.8h, v9.8h
    add  v6.8h, v23.8h, v10.8h
    add  v7.8h, v24.8h, v11.8h
    add  v21.8h, v21.8h, v8.8h
    sub  v22.8h, v22.8h, v9.8h
    sub  v23.8h, v23.8h, v10.8h
    sub  v24.8h, v24.8h, v11.8h
    ext  v9.16b, v4.16b, v5.16b, #4
    ext  v10.16b, v5.16b, v6.16b, #4
    ext  v11.16b, v6.16b, v7.16b, #4
    neg  v7.8h, v7.8h
    ext  v8.16b, v7.16b, v4.16b, #4
    add  v4.8h, v0.8h, v8.8h
    add  v5.8h, v1.8h, v9.8h
    add  v6.8h, v2.8h, v10.8h
    add  v7.8h, v3.8h, v11.8h
    sub  v0.8h, v0.8h, v8.8h
    sub  v1.8h, v1.8h, v9.8h
    sub  v2.8h, v2.8h, v10.8h
    sub  v3.8h, v3.8h, v11.8h
    ext  v8.16b, v22.16b, v23.16b, #4
    ext  v9.16b, v23.16b, v24.16b, #4
    ext  v11.16b, v21.16b, v22.16b, #4
    neg  v24.8h, v24.8h
    ext  v10.16b, v24.16b, v21.16b, #4
    sub  v21.8h, v17.8h, v8.8h
    sub  v22.8h, v18.8h, v9.8h
    add  v23.8h, v19.8h, v10.8h
    add  v24.8h, v20.8h, v11.8h
    add  v17.8h, v17.8h, v8.8h
    add  v18.8h, v18.8h, v9.8h
    sub  v19.8h, v19.8h, v10.8h
    sub  v20.8h, v20.8h, v11.8h
    mov    v27.16b,  v4.16b
    mov    v28.16b,  v0.16b
    mov    v29.16b,  v21.16b
    mov    v30.16b,  v17.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1536
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v5.16b
    mov    v28.16b,  v1.16b
    mov    v29.16b,  v22.16b
    mov    v30.16b,  v18.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1600
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v6.16b
    mov    v28.16b,  v2.16b
    mov    v29.16b,  v23.16b
    mov    v30.16b,  v19.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1664
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v7.16b
    mov    v28.16b,  v3.16b
    mov    v29.16b,  v24.16b
    mov    v30.16b,  v20.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1728
    st4  {v27.4s - v30.4s}, [x8]
    ldr q0, [x1, #1024]
    ldr q1, [x1, #1040]
    ldr q2, [x1, #1536]
    ldr q3, [x1, #1552]
    ldr q4, [x1, #1088]
    ldr q5, [x1, #1104]
    ldr q6, [x1, #1600]
    ldr q7, [x1, #1616]
    ldr q8, [x1, #1280]
    ldr q9, [x1, #1296]
    ldr q10, [x1, #1792]
    ldr q11, [x1, #1808]
    ldr q12, [x1, #1344]
    ldr q13, [x1, #1360]
    ldr q14, [x1, #1856]
    ldr q16, [x1, #1872]
    add  v17.8h, v0.8h, v9.8h
    sub  v18.8h, v1.8h, v10.8h
    add  v19.8h, v11.8h, v2.8h
    add  v20.8h, v8.8h, v3.8h
    add  v21.8h, v4.8h, v13.8h
    sub  v22.8h, v5.8h, v14.8h
    add  v23.8h, v16.8h, v6.8h
    add  v24.8h, v12.8h, v7.8h
    ldr q0, [x1, #1152]
    ldr q1, [x1, #1168]
    ldr q2, [x1, #1664]
    ldr q3, [x1, #1680]
    ldr q4, [x1, #1216]
    ldr q5, [x1, #1232]
    ldr q6, [x1, #1728]
    ldr q7, [x1, #1744]
    ldr q8, [x1, #1408]
    ldr q9, [x1, #1424]
    ldr q10, [x1, #1920]
    ldr q11, [x1, #1936]
    ldr q12, [x1, #1472]
    ldr q13, [x1, #1488]
    ldr q14, [x1, #1984]
    ldr q16, [x1, #2000]
    add  v0.8h, v0.8h, v9.8h
    sub  v1.8h, v1.8h, v10.8h
    add  v2.8h, v11.8h, v2.8h
    add  v3.8h, v8.8h, v3.8h
    add  v4.8h, v4.8h, v13.8h
    sub  v5.8h, v5.8h, v14.8h
    add  v6.8h, v16.8h, v6.8h
    add  v7.8h, v12.8h, v7.8h
    ext  v8.16b, v0.16b, v1.16b, #8
    ext  v10.16b, v2.16b, v3.16b, #8
    ext  v11.16b, v3.16b, v0.16b, #8
    neg  v1.8h, v1.8h
    ext  v9.16b, v1.16b, v2.16b, #8
    sub  v0.8h, v17.8h, v8.8h
    add  v1.8h, v18.8h, v9.8h
    sub  v2.8h, v10.8h, v19.8h
    sub  v3.8h, v11.8h, v20.8h
    add  v17.8h, v17.8h, v8.8h
    sub  v18.8h, v18.8h, v9.8h
    add  v19.8h, v19.8h, v10.8h
    add  v20.8h, v20.8h, v11.8h
    ext  v8.16b, v4.16b, v5.16b, #8
    ext  v10.16b, v6.16b, v7.16b, #8
    ext  v11.16b, v7.16b, v4.16b, #8
    neg  v5.8h, v5.8h
    ext  v9.16b, v5.16b, v6.16b, #8
    sub  v4.8h, v21.8h, v8.8h
    add  v5.8h, v22.8h, v9.8h
    sub  v6.8h, v10.8h, v23.8h
    sub  v7.8h, v11.8h, v24.8h
    add  v21.8h, v21.8h, v8.8h
    sub  v22.8h, v22.8h, v9.8h
    add  v23.8h, v23.8h, v10.8h
    add  v24.8h, v24.8h, v11.8h
    ext  v8.16b, v6.16b, v7.16b, #4
    ext  v10.16b, v4.16b, v5.16b, #4
    ext  v11.16b, v5.16b, v6.16b, #4
    neg  v7.8h, v7.8h
    ext  v9.16b, v7.16b, v4.16b, #4
    sub  v4.8h, v0.8h, v8.8h
    add  v5.8h, v1.8h, v9.8h
    add  v6.8h, v2.8h, v10.8h
    add  v7.8h, v3.8h, v11.8h
    add  v0.8h, v0.8h, v8.8h
    sub  v1.8h, v1.8h, v9.8h
    sub  v2.8h, v2.8h, v10.8h
    sub  v3.8h, v3.8h, v11.8h
    ext  v8.16b, v21.16b, v22.16b, #4
    ext  v10.16b, v23.16b, v24.16b, #4
    ext  v11.16b, v24.16b, v21.16b, #4
    neg  v22.8h, v22.8h
    ext  v9.16b, v22.16b, v23.16b, #4
    sub  v21.8h, v17.8h, v8.8h
    add  v22.8h, v18.8h, v9.8h
    sub  v23.8h, v10.8h, v19.8h
    sub  v24.8h, v11.8h, v20.8h
    add  v17.8h, v17.8h, v8.8h
    sub  v18.8h, v18.8h, v9.8h
    add  v19.8h, v19.8h, v10.8h
    neg  v19.8h, v19.8h
    add  v20.8h, v20.8h, v11.8h
    neg  v20.8h, v20.8h
    mov    v27.16b,  v4.16b
    mov    v28.16b,  v0.16b
    mov    v29.16b,  v21.16b
    mov    v30.16b,  v17.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1792
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v5.16b
    mov    v28.16b,  v1.16b
    mov    v29.16b,  v22.16b
    mov    v30.16b,  v18.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1856
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v6.16b
    mov    v28.16b,  v2.16b
    mov    v29.16b,  v23.16b
    mov    v30.16b,  v19.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1920
    st4  {v27.4s - v30.4s}, [x8]
    mov    v27.16b,  v7.16b
    mov    v28.16b,  v3.16b
    mov    v29.16b,  v24.16b
    mov    v30.16b,  v20.16b
    sqdmulh  v26.8h, v27.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v27.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v28.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v28.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v29.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v29.8h, v26.8h, v15.H[0]
    sqdmulh  v26.8h, v30.8h, v15.H[1]
    srshr    v26.8h, v26.8h, #12
    mls      v30.8h, v26.8h, v15.H[0]
    add    x8,  x0, 1984
    st4  {v27.4s - v30.4s}, [x8]
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
