
.align 6
.global __asm_basemul
.global ___asm_basemul
__asm_basemul:
___asm_basemul:

    sub sp, sp, #(16*4)
    stp d12, d13, [sp, #16*2]
    stp d14, d15, [sp, #16*3]
    stp  d8,  d9, [sp, #16*0]
    stp d10, d11, [sp, #16*1]
    
    ldr s0, [x3]
    add x3, x3, #4

    ldrh w4, [x3, #0*2]
    ldrh w5, [x3, #1*2]
    add x3, x3, #4

    mov v0.H[2], w4
    mov v0.H[3], w5
    
    ldr q12, [x1, #4*16]
    ldr q23, [x2, #7*16]
    ldr q13, [x1, #5*16]
    ldr q22, [x2, #6*16]
    ldr q14, [x1, #6*16]
    ldr q21, [x2, #5*16]
    ldr q15, [x1, #7*16]
    ldr q20, [x2, #4*16]

    mov w6, #3
    __basemul_loop:
  
    // c11
    smull    v28.4S, v12.4H, v23.4H
    ldr  q8, [x1, #0*16]
    smull2   v29.4S, v12.8H, v23.8H
    ldr q19, [x2, #3*16]
    smlal    v28.4S, v13.4H, v22.4H
    ldr  q9, [x1, #1*16]
    smlal2   v29.4S, v13.8H, v22.8H
    ldr q18, [x2, #2*16]
    smlal    v28.4S, v14.4H, v21.4H
    ldr q10, [x1, #2*16]
    smlal2   v29.4S, v14.8H, v21.8H
    ldr q17, [x2, #1*16]
    smlal    v28.4S, v15.4H, v20.4H
    ldr q11, [x1, #3*16]
    smlal2   v29.4S, v15.8H, v20.8H
    ldr q16, [x2, #0*16]

    add x1, x1, #8*16
    add x2, x2, #8*16

    // c3 
    smull    v24.4S,  v8.4H, v19.4H
    smull2   v25.4S,  v8.8H, v19.8H
    smlal    v24.4S,  v9.4H, v18.4H
    smlal2   v25.4S,  v9.8H, v18.8H
    smlal    v24.4S, v10.4H, v17.4H
    smlal2   v25.4S, v10.8H, v17.8H
    smlal    v24.4S, v11.4H, v16.4H
    smlal2   v25.4S, v11.8H, v16.8H

    // c7, c11, c3 result 
    smull    v26.4S,  v8.4H, v23.4H
    uzp1      v6.8H, v28.8H, v29.8H
    smull2   v27.4S,  v8.8H, v23.8H
    mul       v6.8H,  v6.8H, v0.H[0]
    smlal    v26.4S,  v9.4H, v22.4H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal2   v27.4S,  v9.8H, v22.8H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal    v26.4S, v10.4H, v21.4H
    uzp2      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S, v10.8H, v21.8H
    smlal    v26.4S, v11.4H, v20.4H
    uzp1      v4.8H, v24.8H, v25.8H
    smlal2   v27.4S, v11.8H, v20.8H
    mul       v4.8H,  v4.8H, v0.H[0]
    smlal    v26.4S, v12.4H, v19.4H
    smlal    v24.4S,  v4.4H, v0.H[1]
    smlal2   v27.4S, v12.8H, v19.8H
    smlal2   v25.4S,  v4.8H, v0.H[1]
    smlal    v26.4S, v13.4H, v18.4H
    uzp2      v4.8H, v24.8H, v25.8H
    smlal2   v27.4S, v13.8H, v18.8H
    smlal    v26.4S, v14.4H, v17.4H
    sub       v4.8H,  v4.8H,  v6.8H
    str q4, [x0, #3*16]
    smlal2   v27.4S, v14.8H, v17.8H
    smlal    v26.4S, v15.4H, v16.4H
    smlal2   v27.4S, v15.8H, v16.8H

    // c7 reduction, c10
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v28.4S, v11.4H, v23.4H
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v29.4S, v11.8H, v23.8H
    smlal    v26.4S,  v5.4H, v0.H[1]
    smlal    v28.4S, v12.4H, v22.4H
    smlal2   v27.4S,  v5.8H, v0.H[1]
    smlal2   v29.4S, v12.8H, v22.8H
    uzp2      v5.8H, v26.8H, v27.8H
    
    // c7 result, c14, c10
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smull    v30.4S, v15.4H, v23.4H
    mul       v2.8H,  v6.8H, v0.H[2]
    smull2   v31.4S, v15.8H, v23.8H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal    v28.4S, v13.4H, v21.4H
    sub       v5.8H,  v5.8H,  v2.8H
    smlal2   v29.4S, v13.8H, v21.8H
    str q5, [x0, #7*16]
    
    // c14 reduction, c10
    uzp1      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v14.4H, v20.4H
    mul       v7.8H,  v7.8H, v0.H[0]
    smlal2   v29.4S, v14.8H, v20.8H
    smlal    v30.4S,  v7.4H, v0.H[1]
    smlal    v28.4S, v15.4H, v19.4H
    smlal2   v31.4S,  v7.8H, v0.H[1]
    smlal2   v29.4S, v15.8H, v19.8H
    uzp2      v7.8H, v30.8H, v31.8H

    // c14 multiplication, c6
    sqrdmulh  v1.8H,  v7.8H, v0.H[3]
    smull    v26.4S,  v8.4H, v22.4H
    mul       v3.8H,  v7.8H, v0.H[2]
    smull2   v27.4S,  v8.8H, v22.8H
    mls       v3.8H,  v1.8H, v0.H[1]
    smlal    v26.4S,  v9.4H, v21.4H
    
    // c10 reduction, c6
    uzp1      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S,  v9.8H, v21.8H
    mul       v6.8H,  v6.8H, v0.H[0]
    smlal    v26.4S, v10.4H, v20.4H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal2   v27.4S, v10.8H, v20.8H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal    v26.4S, v11.4H, v19.4H
    uzp2      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S, v11.8H, v19.8H

    // c10 multiplication, c6
    sub       v6.8H,  v6.8H, v3.8H
    smlal    v26.4S, v12.4H, v18.4H
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smlal2   v27.4S, v12.8H, v18.8H
    mul       v2.8H,  v6.8H, v0.H[2]
    smlal    v26.4S, v13.4H, v17.4H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal2   v27.4S, v13.8H, v17.8H
    
    // c6 
    smlal    v26.4S, v14.4H, v16.4H
    smlal2   v27.4S, v14.8H, v16.8H

    // c6 reduction, c13, c9
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v30.4S, v14.4H, v23.4H
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v31.4S, v14.8H, v23.8H
    smlal    v26.4S,  v5.4H, v0.H[1]
    smlal    v30.4S, v15.4H, v22.4H
    smlal2   v27.4S,  v5.8H, v0.H[1]
    smlal2   v31.4S, v15.8H, v22.8H
    uzp2      v5.8H, v26.8H, v27.8H

    // c6 result, c9
    sub       v5.8H, v5.8H, v7.8H
    smull    v28.4S, v10.4H, v23.4H
    sub       v5.8H, v5.8H, v2.8H
    smull2   v29.4S, v10.8H, v23.8H
    str q5, [x0, #6*16]

    // c2 
    smull    v24.4S,  v8.4H, v18.4H
    smull2   v25.4S,  v8.8H, v18.8H
    smlal    v24.4S,  v9.4H, v17.4H
    smlal2   v25.4S,  v9.8H, v17.8H
    smlal    v24.4S, v10.4H, v16.4H
    smlal2   v25.4S, v10.8H, v16.8H

    // c2 reduction, c9
    uzp1      v4.8H, v24.8H, v25.8H
    smlal    v28.4S, v11.4H, v22.4H
    mul       v4.8H,  v4.8H, v0.H[0]
    smlal2   v29.4S, v11.8H, v22.8H
    smlal    v24.4S,  v4.4H, v0.H[1]
    smlal    v28.4S, v12.4H, v21.4H
    smlal2   v25.4S,  v4.8H, v0.H[1]
    smlal2   v29.4S, v12.8H, v21.8H
    uzp2      v4.8H, v24.8H, v25.8H

    // c2 result, c9
    sub       v4.8H, v4.8H, v6.8H
    smlal    v28.4S, v13.4H, v20.4H
    str q4, [x0, #2*16]
    smlal2   v29.4S, v13.8H, v20.8H
    
    // c13 reduction, c9
    uzp1      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v14.4H, v19.4H
    mul       v7.8H,  v7.8H, v0.H[0]
    smlal2   v29.4S, v14.8H, v19.8H
    smlal    v30.4S,  v7.4H, v0.H[1]
    smlal    v28.4S, v15.4H, v18.4H
    smlal2   v31.4S,  v7.8H, v0.H[1]
    smlal2   v29.4S, v15.8H, v18.8H
    uzp2      v7.8H, v30.8H, v31.8H

    // c13 multiplication, c5
    sqrdmulh  v1.8H,  v7.8H, v0.H[3]
    smull    v26.4S,  v8.4H, v21.4H
    mul       v3.8H,  v7.8H, v0.H[2]
    smull2   v27.4S,  v8.8H, v21.8H
    mls       v3.8H,  v1.8H, v0.H[1]
    smlal    v26.4S,  v9.4H, v20.4H
    
    // c9 reduction, c5
    uzp1      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S,  v9.8H, v20.8H
    mul       v6.8H,  v6.8H, v0.H[0]
    smlal    v26.4S, v10.4H, v19.4H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal2   v27.4S, v10.8H, v19.8H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal    v26.4S, v11.4H, v18.4H
    uzp2      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S, v11.8H, v18.8H

    // c9 multiplication, c5
    sub       v6.8H,  v6.8H, v3.8H
    smlal    v26.4S, v12.4H, v17.4H
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smlal2   v27.4S, v12.8H, v17.8H
    mul       v2.8H,  v6.8H, v0.H[2]
    smlal    v26.4S, v13.4H, v16.4H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal2   v27.4S, v13.8H, v16.8H
    
    // c5 reduction, c1
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v24.4S,  v8.4H, v17.4H
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v25.4S,  v8.8H, v17.8H
    smlal    v26.4S,  v5.4H, v0.H[1]
    smlal    v24.4S,  v9.4H, v16.4H
    smlal2   v27.4S,  v5.8H, v0.H[1]
    smlal2   v25.4S,  v9.8H, v16.8H
    uzp2      v5.8H, v26.8H, v27.8H

    // c5 result, c12
    sub       v5.8H,  v5.8H, v7.8H
    smull    v30.4S, v13.4H, v23.4H
    sub       v5.8H,  v5.8H, v2.8H
    smull2   v31.4S, v13.8H, v23.8H
    str q5, [x0, #5*16]

    // c1 reduction, c12
    uzp1      v4.8H, v24.8H, v25.8H
    smlal    v30.4S, v14.4H, v22.4H
    mul       v4.8H,  v4.8H, v0.H[0]
    smlal2   v31.4S, v14.8H, v22.8H
    smlal    v24.4S,  v4.4H, v0.H[1]
    smlal    v30.4S, v15.4H, v21.4H
    smlal2   v25.4S,  v4.8H, v0.H[1]
    smlal2   v31.4S, v15.8H, v21.8H
    uzp2      v4.8H, v24.8H, v25.8H

    // c1 result, c8
    sub       v4.8H,  v4.8H, v6.8H
    smull    v28.4S,  v9.4H, v23.4H
    str q4, [x0, #1*16]
    smull2   v29.4S,  v9.8H, v23.8H

    // c12 reduction, c8
    uzp1      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v10.4H, v22.4H
    mul       v7.8H,  v7.8H, v0.H[0]
    smlal2   v29.4S, v10.8H, v22.8H
    smlal    v30.4S,  v7.4H, v0.H[1]
    smlal    v28.4S, v11.4H, v21.4H
    smlal2   v31.4S,  v7.8H, v0.H[1]
    smlal2   v29.4S, v11.8H, v21.8H
    uzp2      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v12.4H, v20.4H

    // c12 multiplication, c8
    sqrdmulh  v1.8H,  v7.8H, v0.H[3]
    smlal2   v29.4S, v12.8H, v20.8H
    mul       v3.8H,  v7.8H, v0.H[2]
    smlal    v28.4S, v13.4H, v19.4H
    mls       v3.8H,  v1.8H, v0.H[1]
    smlal2   v29.4S, v13.8H, v19.8H
    
    // c8
    smlal    v28.4S, v14.4H, v18.4H
    smlal2   v29.4S, v14.8H, v18.8H
    smlal    v28.4S, v15.4H, v17.4H
    smlal2   v29.4S, v15.8H, v17.8H

    // c8 reduction, c4
    uzp1      v6.8H, v28.8H, v29.8H
    smull    v26.4S,  v8.4H, v20.4H
    mul       v6.8H,  v6.8H, v0.H[0]
    smull2   v27.4S,  v8.8H, v20.8H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal    v26.4S,  v9.4H, v19.4H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal2   v27.4S,  v9.8H, v19.8H
    uzp2      v6.8H, v28.8H, v29.8H

    // c8 multiplication, c4
    sub       v6.8H,  v6.8H, v3.8H
    smlal    v26.4S, v10.4H, v18.4H
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smlal2   v27.4S, v10.8H, v18.8H
    mul       v2.8H,  v6.8H, v0.H[2]
    smlal    v26.4S, v11.4H, v17.4H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal2   v27.4S, v11.8H, v17.8H

    // c4
    smlal    v26.4S, v12.4H, v16.4H
    smlal2   v27.4S, v12.8H, v16.8H

    // c4 reduction, c0
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v24.4S,  v8.4H, v16.4H
    ldr q12, [x1, #4*16]
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v25.4S,  v8.8H, v16.8H
    ldr q23, [x2, #7*16]
    smlal    v26.4S,  v5.4H, v0.H[1]
    ldr q13, [x1, #5*16]
    smlal2   v27.4S,  v5.8H, v0.H[1]
    ldr q22, [x2, #6*16]
    uzp2      v5.8H, v26.8H, v27.8H

    // c0 reduction, c4 result
    sub       v5.8H,  v5.8H, v7.8H
    uzp1      v4.8H, v24.8H, v25.8H
    ldr q14, [x1, #6*16]
    sub       v5.8H,  v5.8H, v2.8H
    mul       v4.8H,  v4.8H, v0.H[0]
    ldr q21, [x2, #5*16]
    str q5, [x0, #4*16]
    smlal    v24.4S,  v4.4H, v0.H[1]
    ldr q15, [x1, #7*16]
    smlal2   v25.4S,  v4.8H, v0.H[1]
    ldr q20, [x2, #4*16]
    uzp2      v4.8H, v24.8H, v25.8H

    // c0 result
    sub       v4.8H,  v4.8H, v6.8H
    str q4, [x0, #0*16]

    add x0, x0, #8*16

    ldrh w4, [x3, #0*2]
    ldrh w5, [x3, #1*2]
    add x3, x3, #4

    mov v0.H[2], w4
    mov v0.H[3], w5

    sub w6, w6, #1
    cbnz w6, __basemul_loop

    // c11
    smull    v28.4S, v12.4H, v23.4H
    ldr  q8, [x1, #0*16]
    smull2   v29.4S, v12.8H, v23.8H
    ldr q19, [x2, #3*16]
    smlal    v28.4S, v13.4H, v22.4H
    ldr  q9, [x1, #1*16]
    smlal2   v29.4S, v13.8H, v22.8H
    ldr q18, [x2, #2*16]
    smlal    v28.4S, v14.4H, v21.4H
    ldr q10, [x1, #2*16]
    smlal2   v29.4S, v14.8H, v21.8H
    ldr q17, [x2, #1*16]
    smlal    v28.4S, v15.4H, v20.4H
    ldr q11, [x1, #3*16]
    smlal2   v29.4S, v15.8H, v20.8H
    ldr q16, [x2, #0*16]

    add x1, x1, #8*16
    add x2, x2, #8*16

    // c3 
    smull    v24.4S,  v8.4H, v19.4H
    smull2   v25.4S,  v8.8H, v19.8H
    smlal    v24.4S,  v9.4H, v18.4H
    smlal2   v25.4S,  v9.8H, v18.8H
    smlal    v24.4S, v10.4H, v17.4H
    smlal2   v25.4S, v10.8H, v17.8H
    smlal    v24.4S, v11.4H, v16.4H
    smlal2   v25.4S, v11.8H, v16.8H

    // c7, c11, c3 result 
    smull    v26.4S,  v8.4H, v23.4H
    uzp1      v6.8H, v28.8H, v29.8H
    smull2   v27.4S,  v8.8H, v23.8H
    mul       v6.8H,  v6.8H, v0.H[0]
    smlal    v26.4S,  v9.4H, v22.4H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal2   v27.4S,  v9.8H, v22.8H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal    v26.4S, v10.4H, v21.4H
    uzp2      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S, v10.8H, v21.8H
    smlal    v26.4S, v11.4H, v20.4H
    uzp1      v4.8H, v24.8H, v25.8H
    smlal2   v27.4S, v11.8H, v20.8H
    mul       v4.8H,  v4.8H, v0.H[0]
    smlal    v26.4S, v12.4H, v19.4H
    smlal    v24.4S,  v4.4H, v0.H[1]
    smlal2   v27.4S, v12.8H, v19.8H
    smlal2   v25.4S,  v4.8H, v0.H[1]
    smlal    v26.4S, v13.4H, v18.4H
    uzp2      v4.8H, v24.8H, v25.8H
    smlal2   v27.4S, v13.8H, v18.8H
    smlal    v26.4S, v14.4H, v17.4H
    sub       v4.8H,  v4.8H,  v6.8H
    str q4, [x0, #3*16]
    smlal2   v27.4S, v14.8H, v17.8H
    smlal    v26.4S, v15.4H, v16.4H
    smlal2   v27.4S, v15.8H, v16.8H

    // c7 reduction, c10
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v28.4S, v11.4H, v23.4H
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v29.4S, v11.8H, v23.8H
    smlal    v26.4S,  v5.4H, v0.H[1]
    smlal    v28.4S, v12.4H, v22.4H
    smlal2   v27.4S,  v5.8H, v0.H[1]
    smlal2   v29.4S, v12.8H, v22.8H
    uzp2      v5.8H, v26.8H, v27.8H
    
    // c7 result, c14, c10
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smull    v30.4S, v15.4H, v23.4H
    mul       v2.8H,  v6.8H, v0.H[2]
    smull2   v31.4S, v15.8H, v23.8H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal    v28.4S, v13.4H, v21.4H
    sub       v5.8H,  v5.8H,  v2.8H
    smlal2   v29.4S, v13.8H, v21.8H
    str q5, [x0, #7*16]
    
    // c14 reduction, c10
    uzp1      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v14.4H, v20.4H
    mul       v7.8H,  v7.8H, v0.H[0]
    smlal2   v29.4S, v14.8H, v20.8H
    smlal    v30.4S,  v7.4H, v0.H[1]
    smlal    v28.4S, v15.4H, v19.4H
    smlal2   v31.4S,  v7.8H, v0.H[1]
    smlal2   v29.4S, v15.8H, v19.8H
    uzp2      v7.8H, v30.8H, v31.8H

    // c14 multiplication, c6
    sqrdmulh  v1.8H,  v7.8H, v0.H[3]
    smull    v26.4S,  v8.4H, v22.4H
    mul       v3.8H,  v7.8H, v0.H[2]
    smull2   v27.4S,  v8.8H, v22.8H
    mls       v3.8H,  v1.8H, v0.H[1]
    smlal    v26.4S,  v9.4H, v21.4H
    
    // c10 reduction, c6
    uzp1      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S,  v9.8H, v21.8H
    mul       v6.8H,  v6.8H, v0.H[0]
    smlal    v26.4S, v10.4H, v20.4H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal2   v27.4S, v10.8H, v20.8H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal    v26.4S, v11.4H, v19.4H
    uzp2      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S, v11.8H, v19.8H

    // c10 multiplication, c6
    sub       v6.8H,  v6.8H, v3.8H
    smlal    v26.4S, v12.4H, v18.4H
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smlal2   v27.4S, v12.8H, v18.8H
    mul       v2.8H,  v6.8H, v0.H[2]
    smlal    v26.4S, v13.4H, v17.4H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal2   v27.4S, v13.8H, v17.8H
    
    // c6 
    smlal    v26.4S, v14.4H, v16.4H
    smlal2   v27.4S, v14.8H, v16.8H

    // c6 reduction, c13, c9
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v30.4S, v14.4H, v23.4H
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v31.4S, v14.8H, v23.8H
    smlal    v26.4S,  v5.4H, v0.H[1]
    smlal    v30.4S, v15.4H, v22.4H
    smlal2   v27.4S,  v5.8H, v0.H[1]
    smlal2   v31.4S, v15.8H, v22.8H
    uzp2      v5.8H, v26.8H, v27.8H

    // c6 result, c9
    sub       v5.8H, v5.8H, v7.8H
    smull    v28.4S, v10.4H, v23.4H
    sub       v5.8H, v5.8H, v2.8H
    smull2   v29.4S, v10.8H, v23.8H
    str q5, [x0, #6*16]

    // c2 
    smull    v24.4S,  v8.4H, v18.4H
    smull2   v25.4S,  v8.8H, v18.8H
    smlal    v24.4S,  v9.4H, v17.4H
    smlal2   v25.4S,  v9.8H, v17.8H
    smlal    v24.4S, v10.4H, v16.4H
    smlal2   v25.4S, v10.8H, v16.8H

    // c2 reduction, c9
    uzp1      v4.8H, v24.8H, v25.8H
    smlal    v28.4S, v11.4H, v22.4H
    mul       v4.8H,  v4.8H, v0.H[0]
    smlal2   v29.4S, v11.8H, v22.8H
    smlal    v24.4S,  v4.4H, v0.H[1]
    smlal    v28.4S, v12.4H, v21.4H
    smlal2   v25.4S,  v4.8H, v0.H[1]
    smlal2   v29.4S, v12.8H, v21.8H
    uzp2      v4.8H, v24.8H, v25.8H

    // c2 result, c9
    sub       v4.8H, v4.8H, v6.8H
    smlal    v28.4S, v13.4H, v20.4H
    str q4, [x0, #2*16]
    smlal2   v29.4S, v13.8H, v20.8H
    
    // c13 reduction, c9
    uzp1      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v14.4H, v19.4H
    mul       v7.8H,  v7.8H, v0.H[0]
    smlal2   v29.4S, v14.8H, v19.8H
    smlal    v30.4S,  v7.4H, v0.H[1]
    smlal    v28.4S, v15.4H, v18.4H
    smlal2   v31.4S,  v7.8H, v0.H[1]
    smlal2   v29.4S, v15.8H, v18.8H
    uzp2      v7.8H, v30.8H, v31.8H

    // c13 multiplication, c5
    sqrdmulh  v1.8H,  v7.8H, v0.H[3]
    smull    v26.4S,  v8.4H, v21.4H
    mul       v3.8H,  v7.8H, v0.H[2]
    smull2   v27.4S,  v8.8H, v21.8H
    mls       v3.8H,  v1.8H, v0.H[1]
    smlal    v26.4S,  v9.4H, v20.4H
    
    // c9 reduction, c5
    uzp1      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S,  v9.8H, v20.8H
    mul       v6.8H,  v6.8H, v0.H[0]
    smlal    v26.4S, v10.4H, v19.4H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal2   v27.4S, v10.8H, v19.8H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal    v26.4S, v11.4H, v18.4H
    uzp2      v6.8H, v28.8H, v29.8H
    smlal2   v27.4S, v11.8H, v18.8H

    // c9 multiplication, c5
    sub       v6.8H,  v6.8H, v3.8H
    smlal    v26.4S, v12.4H, v17.4H
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smlal2   v27.4S, v12.8H, v17.8H
    mul       v2.8H,  v6.8H, v0.H[2]
    smlal    v26.4S, v13.4H, v16.4H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal2   v27.4S, v13.8H, v16.8H
    
    // c5 reduction, c1
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v24.4S,  v8.4H, v17.4H
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v25.4S,  v8.8H, v17.8H
    smlal    v26.4S,  v5.4H, v0.H[1]
    smlal    v24.4S,  v9.4H, v16.4H
    smlal2   v27.4S,  v5.8H, v0.H[1]
    smlal2   v25.4S,  v9.8H, v16.8H
    uzp2      v5.8H, v26.8H, v27.8H

    // c5 result, c12
    sub       v5.8H,  v5.8H, v7.8H
    smull    v30.4S, v13.4H, v23.4H
    sub       v5.8H,  v5.8H, v2.8H
    smull2   v31.4S, v13.8H, v23.8H
    str q5, [x0, #5*16]

    // c1 reduction, c12
    uzp1      v4.8H, v24.8H, v25.8H
    smlal    v30.4S, v14.4H, v22.4H
    mul       v4.8H,  v4.8H, v0.H[0]
    smlal2   v31.4S, v14.8H, v22.8H
    smlal    v24.4S,  v4.4H, v0.H[1]
    smlal    v30.4S, v15.4H, v21.4H
    smlal2   v25.4S,  v4.8H, v0.H[1]
    smlal2   v31.4S, v15.8H, v21.8H
    uzp2      v4.8H, v24.8H, v25.8H

    // c1 result, c8
    sub       v4.8H,  v4.8H, v6.8H
    smull    v28.4S,  v9.4H, v23.4H
    str q4, [x0, #1*16]
    smull2   v29.4S,  v9.8H, v23.8H

    // c12 reduction, c8
    uzp1      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v10.4H, v22.4H
    mul       v7.8H,  v7.8H, v0.H[0]
    smlal2   v29.4S, v10.8H, v22.8H
    smlal    v30.4S,  v7.4H, v0.H[1]
    smlal    v28.4S, v11.4H, v21.4H
    smlal2   v31.4S,  v7.8H, v0.H[1]
    smlal2   v29.4S, v11.8H, v21.8H
    uzp2      v7.8H, v30.8H, v31.8H
    smlal    v28.4S, v12.4H, v20.4H

    // c12 multiplication, c8
    sqrdmulh  v1.8H,  v7.8H, v0.H[3]
    smlal2   v29.4S, v12.8H, v20.8H
    mul       v3.8H,  v7.8H, v0.H[2]
    smlal    v28.4S, v13.4H, v19.4H
    mls       v3.8H,  v1.8H, v0.H[1]
    smlal2   v29.4S, v13.8H, v19.8H
    
    // c8
    smlal    v28.4S, v14.4H, v18.4H
    smlal2   v29.4S, v14.8H, v18.8H
    smlal    v28.4S, v15.4H, v17.4H
    smlal2   v29.4S, v15.8H, v17.8H

    // c8 reduction, c4
    uzp1      v6.8H, v28.8H, v29.8H
    smull    v26.4S,  v8.4H, v20.4H
    mul       v6.8H,  v6.8H, v0.H[0]
    smull2   v27.4S,  v8.8H, v20.8H
    smlal    v28.4S,  v6.4H, v0.H[1]
    smlal    v26.4S,  v9.4H, v19.4H
    smlal2   v29.4S,  v6.8H, v0.H[1]
    smlal2   v27.4S,  v9.8H, v19.8H
    uzp2      v6.8H, v28.8H, v29.8H

    // c8 multiplication, c4
    sub       v6.8H,  v6.8H, v3.8H
    smlal    v26.4S, v10.4H, v18.4H
    sqrdmulh  v1.8H,  v6.8H, v0.H[3]
    smlal2   v27.4S, v10.8H, v18.8H
    mul       v2.8H,  v6.8H, v0.H[2]
    smlal    v26.4S, v11.4H, v17.4H
    mls       v2.8H,  v1.8H, v0.H[1]
    smlal2   v27.4S, v11.8H, v17.8H

    // c4
    smlal    v26.4S, v12.4H, v16.4H
    smlal2   v27.4S, v12.8H, v16.8H

    // c4 reduction, c0
    uzp1      v5.8H, v26.8H, v27.8H
    smull    v24.4S,  v8.4H, v16.4H
    mul       v5.8H,  v5.8H, v0.H[0]
    smull2   v25.4S,  v8.8H, v16.8H
    smlal    v26.4S,  v5.4H, v0.H[1]
    smlal2   v27.4S,  v5.8H, v0.H[1]
    uzp2      v5.8H, v26.8H, v27.8H

    // c0 reduction, c4 result
    sub       v5.8H,  v5.8H, v7.8H
    uzp1      v4.8H, v24.8H, v25.8H
    sub       v5.8H,  v5.8H, v2.8H
    mul       v4.8H,  v4.8H, v0.H[0]
    str q5, [x0, #4*16]
    smlal    v24.4S,  v4.4H, v0.H[1]
    smlal2   v25.4S,  v4.8H, v0.H[1]
    uzp2      v4.8H, v24.8H, v25.8H

    // c0 result
    sub       v4.8H,  v4.8H, v6.8H
    str q4, [x0, #0*16]

    add x0, x0, #8*16

    ldp  d8,  d9, [sp, #16*0]
    ldp d10, d11, [sp, #16*1]
    ldp d12, d13, [sp, #16*2]
    ldp d14, d15, [sp, #16*3]
    add sp, sp, #(16*4)

    br lr
 

