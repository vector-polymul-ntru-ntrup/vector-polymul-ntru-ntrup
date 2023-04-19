/* common */
#include "opt-include-macro.i"
    .align 2
    .globl ntt3x128x4_basemul_S
    .globl _ntt3x128x4_basemul_S



.macro basemul_wrap ptr_r,ptr_a,ptr_b, ptr_ld_a, ptr_ld_b // i = 0, wrap version of "basemul_load_proc_block_1x8x4_core_1"


    /*wrap_CT_4x_top    .4s, v10,v11,v12,v13, v14,v15,v16,v17, v0,v1,v2,v3, v4,v5,v6,v7, \
                v9.s[0],v9.s[1],v9.s[0],v9.s[1], v8.s[0] // ld: v14,v15,v16,v17*/
    wrap_CT_4x_top_l    .4s, v10,v11,v12,v13, v14,v15,v16,v17, v0,v1,v2,v3, v4,v5,v6,v7, \
                v9.s[0],v9.s[1],v9.s[0],v9.s[1], v8.s[0], \
                \ptr_ld_a, q14,q15,q16,q17, 16*4,16*5,16*6,16*7, \
                q10,q11,q12,q13, 16*0,16*1,16*2,16*3// ld: v14,v15,v16,v17, v10,v11,v12,v13
    wrap_CT_4x_mix_l    .4s, v10,v11,v12,v13, v14,v15,v16,v17, v0,v1,v2,v3, v4,v5,v6,v7, \
                v9.s[0],v9.s[1],v9.s[0],v9.s[1], \
                v9.s[0],v9.s[1],v9.s[0],v9.s[1], v8.s[0], \
                v24,v25, v26,v27, \
                \ptr_ld_b, q24,q25,q26,q27, 16*4,16*5,16*6,16*7 // ld: v24,v25,v26,v27
    wrap_CT_4x_mix_l    .4s, v20,v21,v22,v23, v24,v25,v26,v27, v2,v3,v0,v1, v6,v7,v4,v5, \
                v18.s[0],v18.s[1],v18.s[0],v18.s[1], \
                v18.s[2],v18.s[3],v18.s[2],v18.s[3], v8.s[0], \
                v12,v13, v16,v17, \
                \ptr_ld_b, q20,q21,q22,q23, 16*0,16*1,16*2,16*3 // ld: v20,v21,v22,v23,

    wrap_CT_4x_mix      .4s, v10,v11,v14,v15, v12,v13,v16,v17, v0,v1,v2,v3, v4,v5,v6,v7, \
                v18.s[0],v18.s[1],v18.s[0],v18.s[1], \
                v18.s[2],v18.s[3],v18.s[2],v18.s[3], v8.s[0], \
                v22,v23, v26,v27
    wrap_CT_4x_mix      .4s, v20,v21,v24,v25, v22,v23,v26,v27, v2,v3,v0,v1, v6,v7,v4,v5, \
                v28.s[0],v28.s[1],v28.s[2],v28.s[3], \
                v29.s[0],v29.s[1],v29.s[2],v29.s[3], v8.s[0], \
                v11,v13, v15,v17
    wrap_CT_4x_mix      .4s, v10,v12,v14,v16, v11,v13,v15,v17, v0,v1,v2,v3, v4,v5,v6,v7, \
                v28.s[0],v28.s[1],v28.s[2],v28.s[3], \
                v29.s[0],v29.s[1],v29.s[2],v29.s[3], v8.s[0], \
                v21,v23, v25,v27
    wrap_CT_4x_bot      .4s, v20,v22,v24,v26, v21,v23,v25,v27, v0,v1,v2,v3, v4,v5,v6,v7

    ld1 {v6.4s, v7.4s}, [ptr_asymmul], 32
    r_ASYMMUL_4x .2d,.4s,.2s, v0,v1,v2,v3, v10,v11,v12,v13, v20,v21,v22,v23, v4,v5,v6,v7, \
                              v6.s[0], v6.s[1], v6.s[2], v6.s[3], v7.s[0], v7.s[1], v7.s[2], v7.s[3], v8.s[0], v8.s[1] // v6,v7 as temp can be used after TR

    ld1 {v6.4s, v7.4s}, [ptr_asymmul], 32
    r_ASYMMUL_4x .2d,.4s,.2s, v10,v11,v12,v13, v14,v15,v16,v17, v24,v25,v26,v27, v4,v5,v6,v7, \
                              v6.s[0], v6.s[1], v6.s[2], v6.s[3], v7.s[0], v7.s[1], v7.s[2], v7.s[3], v8.s[0], v8.s[1] // v6,v7 as temp can be used after TR
.endm

ntt3x128x4_basemul_S:
_ntt3x128x4_basemul_S:
    /*  *** INTERFACE ***

        C declaration: void ntt3x128x4_basemul_S( \
                                        int32_t*, int32_t*, int32_t*, int64_t*);
        register:
            x0 = output, BIG * SMALL in the basemul-ring.
            x1 = input, pointer to the BIG operand
            x2 = input, pointer to the SMALL operand
            x3 = input, pointer to ring factor

        *** ALGORITHM ***

        Do a complete-NTT for y varible in the basemul-ring F[x,y,z] mod (x - x_i, y^8 - (y_j)^8, z^4 - xy) When the inputs are decomposed as degree-4 polynomials in z, we do asymmetry multiplication, then reverses the NTT back to the answer.

        *** TO-DO ***

        The ring factor of the (2k+1)-th ring = the opposite number to the (2k)-th one. I can use `smlsl` instruction to reduce the number of modular multiplication.
        */
    ABI_push

    ins v8.s[0], w4
    ins v8.s[1], w5

    ptr_asymmul .req x3
    ptr_ntt_2   .req x4
    ptr_ntt_4   .req x5
    ptr_ntt_8   .req x6

    add ptr_ntt_2, ptr_asymmul, 3072        // int64_t* table_ntt_2 = table + 384; ptr_ntt_2 = ptr_asymmul + 3072
    add ptr_ntt_4, ptr_asymmul, 1, lsl 12   // int64_t* table_ntt_4 = table + 512; ptr_ntt_4 = ptr_asymmul + 4096
    add ptr_ntt_8, ptr_ntt_4, 512           // int64_t* table_ntt_8 = table + 576; ptr_ntt_8 = ptr_asymmul + 4608

    ptr_r0  .req x0
    ptr_a0  .req x1
    ptr_b0  .req x2
    ptr_r1  .req x7
    ptr_r2  .req x8
    ptr_a1  .req x9
    ptr_a2  .req x10
    ptr_b1  .req x11
    ptr_b2  .req x12

    add ptr_a1, ptr_a0, 2048        // ptr_a1 = a[1][0] = a[0][0] + 512
    add ptr_b1, ptr_b0, 2048        // ptr_b1 = b[1][0] = b[0][0] + 512
    add ptr_r1, ptr_r0, 2048        // ptr_r1 = r[1][0] = r[0][0] + 512
    add ptr_a2, ptr_a0, 1, lsl 12   // ptr_a2 = a[2][0] = a[0][0] + 1024
    add ptr_b2, ptr_b0, 1, lsl 12   // ptr_b2 = b[2][0] = b[0][0] + 1024
    add ptr_r2, ptr_r0, 1, lsl 12   // ptr_r2 = r[2][0] = r[0][0] + 1024

    .rept 16 // for(int j=0; j<16; j++)
        ld1 {v28.4s, v29.4s, v30.4s, v31.4s}, [ptr_ntt_2], 64 // ptr_ntt_2 = ptr_asymmul + 3072 + 64 (3136)
        ld1 {v18.4s, v19.4s}, [ptr_ntt_4], 32 // ptr_ntt_4 = ptr_asymmul + 4096 + 32 (4128)
        ld1 {v9.4s}, [ptr_ntt_8], 16 // ptr_ntt_8 = ptr_asymmul + 4608 + 16 (4624)

    //---
        basemul_wrap ptr_r0, ptr_a0, ptr_b0, ptr_a0, ptr_b0 // for(int i=0; i<3; i++), i = 0
        add ptr_a0, ptr_a0, #128
        add ptr_b0, ptr_b0, #128
        r_GS_4x_com_store .4s, ptr_r0, q0, q1, q2, q3, q10, q11, q12, q13,\
                            16*0, 16*1, 16*2, 16*3, 16*4, 16*5, 16*6, 16*7

    //---
        basemul_wrap ptr_r0, ptr_a0, ptr_b0, ptr_a1, ptr_b1 // for(int i=0; i<3; i++), i = 1
        add ptr_a1, ptr_a1, #128
        add ptr_b1, ptr_b1, #128
        add ptr_r0, ptr_r0, #128
        r_GS_4x_com_store .4s, ptr_r1, q0, q1, q2, q3, q10, q11, q12, q13,\
                            16*0, 16*1, 16*2, 16*3, 16*4, 16*5, 16*6, 16*7


    //---
        basemul_wrap ptr_r0, ptr_a0, ptr_b0, ptr_a2, ptr_b2 // for(int i=0; i<3; i++), i = 2
        add ptr_a2, ptr_a2, #128
        add ptr_b2, ptr_b2, #128
        add ptr_r1, ptr_r1, #128
        r_GS_4x_com_store .4s, ptr_r2, q0, q1, q2, q3, q10, q11, q12, q13,\
                            16*0, 16*1, 16*2, 16*3, 16*4, 16*5, 16*6, 16*7

        add ptr_r2, ptr_r2, #128
    .endr


    ABI_pop
    ret



