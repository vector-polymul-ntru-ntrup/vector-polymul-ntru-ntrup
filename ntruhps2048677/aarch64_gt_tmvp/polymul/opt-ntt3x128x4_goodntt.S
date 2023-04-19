// full changed ld1 -> ldr, st1 -> str
#include "opt-include-macro.i"
.align 2
.globl ntt3x128x4_goodntt_S
.globl _ntt3x128x4_goodntt_S
.macro NTT_6_constant
    root3 .req x2
    mov  root3, 0xc49e
    movk root3, 0x002c, lsl 16
    movk root3, 0xe8e4, lsl 32
    movk root3, 0x1667, lsl 48
    ins v0.d[1], root3
    .unreq root3
.endm

.macro NTT_6_require
    tt0 .req v4
    tt1 .req v5
    tt2 .req v6
    tt3 .req v7
    tt4 .req v8
    tt5 .req v9
    tt6 .req v10
    tt7 .req v11

    t00 .req v12
    t01 .req v13
    t02 .req v14
    t03 .req v15
    t04 .req v16
    t05 .req v17
    t10 .req v18
    t11 .req v19
    t12 .req v20
    t13 .req v21
    t14 .req v22
    t15 .req v23
.endm

.macro NTT_6_address_h
    // NTT_6_core_0_j0
    ldr d12, [ptr_src, 0x000]
    ldr d15, [ptr_src, 0x200]
    saddl tt0.4s, t00.4h, t03.4h    // U0 + U3
    ssubl tt1.4s, t00.4h, t03.4h    // U0 - U3
    ldr d16, [ptr_src, 0x400]
    saddw tt2.4s, tt0.4s, t04.4h    // U0 + U3 + U4
    str q6, [ptr_ret2, 0x000]
    saddw tt3.4s, tt1.4s, t04.4h    // U0 - U3 + U4
    str q7, [ptr_ret2, 0x400]

    ssubl t00.4s, t00.4h, t04.4h    // U0 - U4
    sub t03.4s, tt0.4s, t00.4s      // U4 + U3
    sub t04.4s, tt1.4s, t00.4s      // U4 - U3

    mul tt2.4s, t03.4s, v0.s[2]
    mul tt3.4s, t04.4s, v0.s[2]
    sqrdmulh t03.4s, t03.4s, v0.s[3]
    sqrdmulh t04.4s, t04.4s, v0.s[3]
    mls tt2.4s, t03.4s, v0.s[0] // w (U4 + U3)
    mls tt3.4s, t04.4s, v0.s[0] // w (U4 - U3)

    sub t03.4s, t00.4s, tt3.4s  // U0 - U4 - w (U4 - U3)
    str q15, [ptr_ret2, 0x800]
    sub t04.4s, t00.4s, tt2.4s  // U0 - U4 - w (U4 + U3)
    str q16, [ptr_ret2, 0xc00]
    ldr d14, [ptr_src, 0x008]
    add tt1.4s, tt1.4s, tt3.4s  // U0 - U3 + w (U4 - U3)
    str q5, [ptr_ret2, 0x1000]
    ldr d17, [ptr_src, 0x208]
    add tt0.4s, tt0.4s, tt2.4s  // U0 + U3 + w (U4 + U3)
    str q4, [ptr_ret2, 0x1400] // 0x400 + 4096
    ldr d12, [ptr_src, 0x408]

    // NTT_6_core_0_j1
    saddl tt0.4s, t00.4h, t05.4h    // U0 + U5
    ssubl tt1.4s, t00.4h, t05.4h    // U0 - U5
    saddw tt2.4s, tt0.4s, t02.4h    // U0 + U5 + U2
    str q6, [ptr_ret2, 0x010]
    saddw tt3.4s, tt1.4s, t02.4h    // U0 - U5 + U2
    str q7, [ptr_ret2, 0x410]

    ssubl t00.4s, t00.4h, t02.4h    // U0 - U2
    sub t02.4s, tt0.4s, t00.4s      // U2 + U5
    sub t05.4s, tt1.4s, t00.4s      // U2 - U5

    mul tt2.4s, t02.4s, v0.s[2]
    mul tt3.4s, t05.4s, v0.s[2]
    sqrdmulh t02.4s, t02.4s, v0.s[3]
    sqrdmulh t05.4s, t05.4s, v0.s[3]
    mls tt2.4s, t02.4s, v0.s[0] // w (U2 + U5)
    mls tt3.4s, t05.4s, v0.s[0] // w (U2 - U5)

    add tt1.4s, tt1.4s, tt3.4s  // (U0 - U5) + w (U2 - U5)
    str q5, [ptr_ret2, 0x810]
    add tt0.4s, tt0.4s, tt2.4s  // (U0 + U5) + w (U2 + U5)
    str q4, [ptr_ret2, 0xc10]
    ldr d16, [ptr_src, 0x010]
    sub t02.4s, t00.4s, tt3.4s  // (U0 - U2) - w (U2 - U5)
    str q14, [ptr_ret2, 0x1010]
    ldr d13, [ptr_src, 0x210]
    sub t05.4s, t00.4s, tt2.4s  // (U0 - U2) - w (U2 + U5)
    str q17, [ptr_ret2, 0x1410]
    ldr d14, [ptr_src, 0x410]

    // NTT_6_core_0_j2
    saddl tt0.4s, t02.4h, t04.4h    // U2 + U4
    ssubl tt1.4s, t02.4h, t04.4h    // U2 - U4
    saddw tt2.4s, tt0.4s, t01.4h    // U2 + U1 + U4
    str q6, [ptr_ret2, 0x020]
    ssubw tt3.4s, tt0.4s, t01.4h    // U2 - U1 + U4
    str q7, [ptr_ret2, 0x420]

    mul t01.4s, tt1.4s, v0.s[2]
    ssubw tt2.4s, tt2.4s, t02.4h        // U4 + U1
    sqrdmulh tt1.4s, tt1.4s, v0.s[3]
    ssubw tt3.4s, tt3.4s, t02.4h        // U4 - U1
    mls t01.4s, tt1.4s, v0.s[0]         // w (U2 - U4)

    sub t02.4s, tt3.4s, tt0.4s          // - U2 - U1
    sub t04.4s, tt2.4s, tt0.4s          // - U2 + U1
.endm

.macro NTT_6_core_h
    // NTT_6_core_0_j0
    sub tt3.4s, t01.4s, tt3.4s  // w (U2 - U4) + U1 - U4
    str q7, [ptr_ret2, 0x820]
    ldr d12, [ptr_src, 0x018]
    sub tt2.4s, t01.4s, tt2.4s  // w (U2 - U4) - U1 - U4
    str q6, [ptr_ret2, 0xc20]
    ldr d15, [ptr_src, 0x218]
    sub t04.4s, t04.4s, t01.4s  // (- U2 + U1) - w (U2 - U4)
    str q16, [ptr_ret2, 0x1020]
    saddl tt0.4s, t00.4h, t03.4h    // U0 + U3
    sub t02.4s, t02.4s, t01.4s  // (- U2 - U1) - w (U2 - U4)
    str q14, [ptr_ret2, 0x1420]
    ssubl tt1.4s, t00.4h, t03.4h    // U0 - U3
    ldr d16, [ptr_src, 0x418]
    saddw tt2.4s, tt0.4s, t04.4h    // U0 + U3 + U4
    str q6, [ptr_ret2, 0x030]
    saddw tt3.4s, tt1.4s, t04.4h    // U0 - U3 + U4
    str q7, [ptr_ret2, 0x430]

    ssubl t00.4s, t00.4h, t04.4h    // U0 - U4
    sub t03.4s, tt0.4s, t00.4s      // U4 + U3
    sub t04.4s, tt1.4s, t00.4s      // U4 - U3

    mul tt2.4s, t03.4s, v0.s[2]
    mul tt3.4s, t04.4s, v0.s[2]
    sqrdmulh t03.4s, t03.4s, v0.s[3]
    sqrdmulh t04.4s, t04.4s, v0.s[3]
    mls tt2.4s, t03.4s, v0.s[0] // w (U4 + U3)
    mls tt3.4s, t04.4s, v0.s[0] // w (U4 - U3)

    sub t03.4s, t00.4s, tt3.4s  // U0 - U4 - w (U4 - U3)
    str q15, [ptr_ret2, 0x830]
    sub t04.4s, t00.4s, tt2.4s  // U0 - U4 - w (U4 + U3)
    str q16, [ptr_ret2, 0xc30]
    ldr d14, [ptr_src, 0x020]
    add tt1.4s, tt1.4s, tt3.4s  // U0 - U3 + w (U4 - U3)
    str q5, [ptr_ret2, 0x1030]
    ldr d17, [ptr_src, 0x220]
    add tt0.4s, tt0.4s, tt2.4s  // U0 + U3 + w (U4 + U3)
    str q4, [ptr_ret2, 0x1430]
    ldr d12, [ptr_src, 0x420]

    // NTT_6_core_0_j1
    saddl tt0.4s, t00.4h, t05.4h    // U0 + U5
    ssubl tt1.4s, t00.4h, t05.4h    // U0 - U5
    saddw tt2.4s, tt0.4s, t02.4h    // U0 + U5 + U2
    str q6, [ptr_ret2, 0x040]
    saddw tt3.4s, tt1.4s, t02.4h    // U0 - U5 + U2
    str q7, [ptr_ret2, 0x440]

    ssubl t00.4s, t00.4h, t02.4h    // U0 - U2
    sub t02.4s, tt0.4s, t00.4s      // U2 + U5
    sub t05.4s, tt1.4s, t00.4s      // U2 - U5

    mul tt2.4s, t02.4s, v0.s[2]
    mul tt3.4s, t05.4s, v0.s[2]
    sqrdmulh t02.4s, t02.4s, v0.s[3]
    sqrdmulh t05.4s, t05.4s, v0.s[3]
    mls tt2.4s, t02.4s, v0.s[0] // w (U2 + U5)
    mls tt3.4s, t05.4s, v0.s[0] // w (U2 - U5)

    add tt1.4s, tt1.4s, tt3.4s  // (U0 - U5) + w (U2 - U5)
    str q5, [ptr_ret2, 0x840]
    add tt0.4s, tt0.4s, tt2.4s  // (U0 + U5) + w (U2 + U5)
    str q4, [ptr_ret2, 0xc40]
    ldr d16, [ptr_src, 0x028]
    sub t02.4s, t00.4s, tt3.4s  // (U0 - U2) - w (U2 - U5)
    str q14, [ptr_ret2, 0x1040]
    ldr d13, [ptr_src, 0x228]
    sub t05.4s, t00.4s, tt2.4s  // (U0 - U2) - w (U2 + U5)
    str q17, [ptr_ret2, 0x1440]
    ldr d14, [ptr_src, 0x428]


    // NTT_6_core_0_j2
    saddl tt0.4s, t02.4h, t04.4h    // U2 + U4
    ssubl tt1.4s, t02.4h, t04.4h    // U2 - U4
    saddw tt2.4s, tt0.4s, t01.4h    // U2 + U1 + U4
    str q6, [ptr_ret2, 0x050]
    ssubw tt3.4s, tt0.4s, t01.4h    // U2 - U1 + U4
    str q7, [ptr_ret2, 0x450]

    mul t01.4s, tt1.4s, v0.s[2]
    ssubw tt2.4s, tt2.4s, t02.4h        // U4 + U1
    sqrdmulh tt1.4s, tt1.4s, v0.s[3]
    ssubw tt3.4s, tt3.4s, t02.4h        // U4 - U1
    mls t01.4s, tt1.4s, v0.s[0]         // w (U2 - U4)

    sub t02.4s, tt3.4s, tt0.4s          // - U2 - U1
    sub t04.4s, tt2.4s, tt0.4s          // - U2 + U1
.endm

.macro NTT_6_core_0_j0_h
    /*
        condition: U1 = U2 = U5 = 0

        T0 = (U0 + U3) + U4
        T1 = (U0 - U3) + U4
        T2 = (U0 - U4) - w (U4 - U3)
        T3 = (U0 - U4) - w (U4 + U3)
        T4 = (U0 - U3) + w (U4 - U3)
        T5 = (U0 + U3) + w (U4 + U3)
    */
    sub tt3.4s, t01.4s, tt3.4s  // w (U2 - U4) + U1 - U4
    str q7, [ptr_ret2, 0x820]

    ldr d12, [ptr_src, 24]
    sub tt2.4s, t01.4s, tt2.4s  // w (U2 - U4) - U1 - U4
    str q6, [ptr_ret2, 0xc20]
    ldr d15, [ptr_src, 0x218] // 0x200+24
    saddl tt0.4s, t00.4h, t03.4h    // U0 + U3
    sub t04.4s, t04.4s, t01.4s  // (- U2 + U1) - w (U2 - U4)
    str q16, [ptr_ret2, 0x1020]
    ldr d16, [ptr_src, 0x418] // 0x400+24
    ssubl tt1.4s, t00.4h, t03.4h    // U0 - U3
    sub t02.4s, t02.4s, t01.4s  // (- U2 - U1) - w (U2 - U4)
    str q14, [ptr_ret2, 0x1420]

    saddw tt2.4s, tt0.4s, t04.4h    // U0 + U3 + U4
    str q6, [ptr_ret2, 0x030]
    saddw tt3.4s, tt1.4s, t04.4h    // U0 - U3 + U4
    str q7, [ptr_ret2, 0x430]

    ssubl t00.4s, t00.4h, t04.4h    // U0 - U4
    sub t03.4s, tt0.4s, t00.4s      // U4 + U3
    mul tt2.4s, t03.4s, v0.s[2]
    sub t04.4s, tt1.4s, t00.4s      // U4 - U3
    mul tt3.4s, t04.4s, v0.s[2]
    sqrdmulh t03.4s, t03.4s, v0.s[3]
    sqrdmulh t04.4s, t04.4s, v0.s[3]
    mls tt2.4s, t03.4s, v0.s[0] // w (U4 + U3)
    mls tt3.4s, t04.4s, v0.s[0] // w (U4 - U3)

    sub t03.4s, t00.4s, tt3.4s  // U0 - U4 - w (U4 - U3)
    str q15, [ptr_ret2, 0x830]
    sub t04.4s, t00.4s, tt2.4s  // U0 - U4 - w (U4 + U3)
    str q16, [ptr_ret2, 0xc30]
    add tt1.4s, tt1.4s, tt3.4s  // U0 - U3 + w (U4 - U3)
    str q5, [ptr_ret2, 0x1030]
    add tt0.4s, tt0.4s, tt2.4s  // U0 + U3 + w (U4 + U3)
    str q4, [ptr_ret2, 0x1430]
.endm

.macro NTT_6_unrequire
    .unreq tt0
    .unreq tt1
    .unreq tt2
    .unreq tt3
    .unreq tt4
    .unreq tt5
    .unreq tt6
    .unreq tt7
    .unreq t00
    .unreq t01
    .unreq t02
    .unreq t03
    .unreq t04
    .unreq t05
    .unreq t10
    .unreq t11
    .unreq t12
    .unreq t13
    .unreq t14
    .unreq t15
.endm

.macro NTT_8_constant
    zlzh0 .req x2
    zlzh1 .req x3
    zlzh2 .req x4
    zlzh3 .req x5
    zlzh4 .req x6
    zlzh5 .req x7
    zlzh6 .req x8
    zlzh7 .req x9

    mov  zlzh0, 0x0001 // I0/I1
    movk zlzh0, 0x0000, lsl 16 // I0/I1
    movk zlzh0, 0x0080, lsl 32
    movk zlzh0, 0x0000, lsl 48

    mov  zlzh1, 0x1806
    movk zlzh1, 0xff93, lsl 16
    movk zlzh1, 0x62cf, lsl 32
    movk zlzh1, 0xc97e, lsl 48

    mov  zlzh2, 0x573e
    movk zlzh2, 0x006e, lsl 16
    movk zlzh2, 0x6d24, lsl 32
    movk zlzh2, 0x3739, lsl 48

    mov  zlzh3, 0x57fe
    movk zlzh3, 0x006a, lsl 16
    movk zlzh3, 0x4d1e, lsl 32
    movk zlzh3, 0x3539, lsl 48

    mov  zlzh4, 0xfe82
    movk zlzh4, 0x0030, lsl 16
    movk zlzh4, 0x6240, lsl 32
    movk zlzh4, 0x1885, lsl 48

    mov  zlzh5, 0x0408
    movk zlzh5, 0x007e, lsl 16
    movk zlzh5, 0xc833, lsl 32
    movk zlzh5, 0x3f11, lsl 48

    mov  zlzh6, 0x6e25
    movk zlzh6, 0xfff8, lsl 16
    movk zlzh6, 0x200c, lsl 32
    movk zlzh6, 0xfc36, lsl 48

    mov  zlzh7, 0x93ab
    movk zlzh7, 0xffae, lsl 16
    movk zlzh7, 0xa592, lsl 32
    movk zlzh7, 0xd73f, lsl 48

    ins v28.d[0], zlzh0
    ins v28.d[1], zlzh1
    ins v29.d[0], zlzh2
    ins v29.d[1], zlzh3
    ins v30.d[0], zlzh4
    ins v30.d[1], zlzh5
    ins v31.d[0], zlzh6
    ins v31.d[1], zlzh7

    .unreq zlzh0
    .unreq zlzh1
    .unreq zlzh2
    .unreq zlzh3
    .unreq zlzh4
    .unreq zlzh5
    .unreq zlzh6
    .unreq zlzh7
.endm

.macro NTT_8_require
    tt0 .req v8
    tt1 .req v9
    tt2 .req v10
    tt3 .req v11

    lo0 .req v12
    lo1 .req v13
    lo2 .req v14
    lo3 .req v15
    lo4 .req v16
    lo5 .req v17
    lo6 .req v18
    lo7 .req v19

    hi0 .req v20
    hi1 .req v21
    hi2 .req v22
    hi3 .req v23
    hi4 .req v24
    hi5 .req v25
    hi6 .req v26
    hi7 .req v27
.endm

.macro NTT_8_address_com_NTT_8_load_h
    // one round
    r_CT_2x_top_l   .4s, lo0,lo1,lo2,lo3, lo4,lo5,lo6,lo7, tt0,tt1,tt2,tt3,\
                    v28.s[0],v28.s[1],v28.s[0],v28.s[1], v0.s[0],\
                    q16,q17,q18,q19, ptr_ret,ptr_ret,ptr_ret,ptr_ret, 0x200,0x280,0x300,0x380 // ld: lo4,lo5,lo6,lo7
    r_CT_2x_mix_l   .4s, lo0,lo1,lo2,lo3, lo4,lo5,lo6,lo7, tt0,tt1,tt2,tt3,\
                    v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0],\
                    q12,q13,q14,q15, ptr_ret,ptr_ret,ptr_ret,ptr_ret, 0x000,0x080,0x100,0x180 // ld: lo0,lo1,lo2,lo3
    r_CT_2x_mix_l   .4s, lo2,lo3,hi0,hi1, lo6,lo7,hi4,hi5, tt2,tt3,tt0,tt1,\
                    v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0],\
                    q24,q25,q20,q21, ptr_ret,ptr_ret,ptr_ret,ptr_ret, 0x600,0x680,0x400,0x480 // ld: hi4,hi5,hi0,hi1
    r_CT_2x_mix_l   .4s, hi0,hi1,hi2,hi3, hi4,hi5,hi6,hi7, tt0,tt1,tt2,tt3,\
                    v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0],\
                    q26,q27,q22,q23, ptr_ret,ptr_ret,ptr_ret,ptr_ret, 0x700,0x780,0x500,0x580 // ld: hi6,hi7,hi2,hi3

    r_CT_2x_mix .4s,hi2,hi3,lo0,lo1,hi6,hi7,lo2,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3,tt2,tt3,tt0,tt1,\
                v29.s[0],v29.s[1],v29.s[0],v29.s[1],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7,tt0,tt1,tt2,tt3,\
                v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi4,hi5,lo0,lo2,hi6,hi7,lo1,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix_com_store_load_ls   .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7,tt0,tt1,tt2,tt3,\
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0],lo0,tt0,lo2,tt1, q13,q15,q14,q12, 0x080+16,0x180+16,0x100+16,0x000+16,\
                q13,q15,q14,q12, 0x080+0,0x180+0,0x100+0,0x000+0, ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3,tt2,tt3,tt0,tt1,\
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0],lo4,tt2,lo6,tt3, q17,q19,q18,q16, 0x280+16,0x380+16,0x300+16,0x200+16,\
                q17,q19,q18,q16, 0x280+0,0x380+0,0x300+0,0x200+0, ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7,tt0,tt1,tt2,tt3,\
                v31.s[0],v31.s[1],v31.s[2],v31.s[3],v0.s[0],hi0,tt0,hi2,tt1, q21,q23,q22,q20, 0x480+16,0x580+16,0x500+16,0x400+16,\
                q21,q23,q22,q20, 0x480+0,0x580+0,0x500+0,0x400+0, ptr_ret
.endm

.macro NTT_8_core_com_NTT_8_store_h idx
    r_CT_2x_mix_com_store_load_ls   .4s,hi4,hi6,hi0,hi2, hi5,hi7,lo4,lo5, tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], hi6,tt3,hi4,tt2, q25,q27,q24,q26, 0x680+16*\idx+16, 0x780+16*\idx+16, 0x600+16*\idx+16, 0x700+16*\idx+16,\
                q25,q27,q24,q26, 0x680+16*\idx,0x780+16*\idx,0x600+16*\idx,0x700+16*\idx, ptr_ret
    r_CT_2x_mix .4s,lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5,tt2,tt3,tt0,tt1,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi2,hi3,lo0,lo1,hi6,hi7,lo2,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3,tt2,tt3,tt0,tt1,\
                v29.s[0],v29.s[1],v29.s[0],v29.s[1],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7,tt0,tt1,tt2,tt3,\
                v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi4,hi5,lo0,lo2,hi6,hi7,lo1,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix_com_store_load_ls   .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7,tt0,tt1,tt2,tt3,\
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], lo0,tt0,lo2,tt1, q13,q15,q14,q12, 0x080+16*(\idx+2),0x180+16*(\idx+2),0x100+16*(\idx+2),0x000+16*(\idx+2),\
                q13,q15,q14,q12, 0x080+16*(\idx+1),0x180+16*(\idx+1),0x100+16*(\idx+1),0x000+16*(\idx+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3,tt2,tt3,tt0,tt1,\
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], lo4,tt2,lo6,tt3, q17,q19,q18,q16, 0x280+16*(\idx+2),0x380+16*(\idx+2),0x300+16*(\idx+2),0x200+16*(\idx+2),\
                q17,q19,q18,q16, 0x280+16*(\idx+1),0x380+16*(\idx+1),0x300+16*(\idx+1),0x200+16*(\idx+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7,tt0,tt1,tt2,tt3,\
                v31.s[0],v31.s[1],v31.s[2],v31.s[3],v0.s[0], hi0,tt0,hi2,tt1, q21,q23,q22,q20, 0x480+16*(\idx+2),0x580+16*(\idx+2),0x500+16*(\idx+2),0x400+16*(\idx+2),\
                q21,q23,q22,q20, 0x480+16*(\idx+1),0x580+16*(\idx+1),0x500+16*(\idx+1),0x400+16*(\idx+1), ptr_ret
    r_CT_2x_bot_s   .4s, hi0,hi2,hi4,hi6, hi1,hi3,hi5,hi7, tt0,tt1,tt2,tt3, \idx,\
                q25,q27,q24,q26, 0x680 + 16*(\idx+1),0x780 + 16*(\idx+1),0x600 + 16*(\idx+1),0x700 + 16*(\idx+1), ptr_ret
.endm

.macro NTT_8_core_com_NTT_8_store_load_h idx // i: for loop index
    r_CT_2x_mix_com_store_load_ls   .4s,hi4,hi6,hi0,hi2, hi5,hi7,lo4,lo5, tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], hi6,tt3,hi4,tt2, q25,q27,q24,q26, 0x680+16*\idx+16, 0x780+16*\idx+16, 0x600+16*\idx+16, 0x700+16*\idx+16,\
                q25,q27,q24,q26, 0x680+16*\idx,0x780+16*\idx,0x600+16*\idx,0x700+16*\idx, ptr_ret
    r_CT_2x_mix .4s,lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5,tt2,tt3,tt0,tt1,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi2,hi3,lo0,lo1,hi6,hi7,lo2,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3,tt2,tt3,tt0,tt1,\
                v29.s[0],v29.s[1],v29.s[0],v29.s[1],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7,tt0,tt1,tt2,tt3,\
                v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi4,hi5,lo0,lo2,hi6,hi7,lo1,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix_com_store_load_ls   .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7,tt0,tt1,tt2,tt3,\
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], lo0,tt0,lo2,tt1, q13,q15,q14,q12, 0x080+16*(\idx+2),0x180+16*(\idx+2),0x100+16*(\idx+2),0x000+16*(\idx+2),\
                q13,q15,q14,q12, 0x080+16*(\idx+1),0x180+16*(\idx+1),0x100+16*(\idx+1),0x000+16*(\idx+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3,tt2,tt3,tt0,tt1,\
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], lo4,tt2,lo6,tt3, q17,q19,q18,q16, 0x280+16*(\idx+2),0x380+16*(\idx+2),0x300+16*(\idx+2),0x200+16*(\idx+2),\
                q17,q19,q18,q16, 0x280+16*(\idx+1),0x380+16*(\idx+1),0x300+16*(\idx+1),0x200+16*(\idx+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7,tt0,tt1,tt2,tt3,\
                v31.s[0],v31.s[1],v31.s[2],v31.s[3],v0.s[0], hi0,tt0,hi2,tt1, q21,q23,q22,q20, 0x480+16*(\idx+2),0x580+16*(\idx+2),0x500+16*(\idx+2),0x400+16*(\idx+2),\
                q21,q23,q22,q20, 0x480+16*(\idx+1),0x580+16*(\idx+1),0x500+16*(\idx+1),0x400+16*(\idx+1), ptr_ret
.endm

.macro NTT_8_core_com_NTT_8_store_com_NTT_8_shift_com_NTT_8_load_h idx
    r_CT_2x_mix_com_store_load_ls   .4s,hi4,hi6,hi0,hi2, hi5,hi7,lo4,lo5, tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], hi6,tt3,hi4,tt2, q25,q27,q24,q26, 0x680+16*\idx+16, 0x780+16*\idx+16, 0x600+16*\idx+16, 0x700+16*\idx+16,\
                q25,q27,q24,q26, 0x680+16*\idx,0x780+16*\idx,0x600+16*\idx,0x700+16*\idx, ptr_ret
    r_CT_2x_mix .4s,lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5,tt2,tt3,tt0,tt1,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi2,hi3,lo0,lo1,hi6,hi7,lo2,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3,tt2,tt3,tt0,tt1,\
                v29.s[0],v29.s[1],v29.s[0],v29.s[1],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7,tt0,tt1,tt2,tt3,\
                v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi4,hi5,lo0,lo2,hi6,hi7,lo1,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix_com_store_load_ls   .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7,tt0,tt1,tt2,tt3,\
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], lo0,tt0,lo2,tt1, q13,q15,q14,q12, 0x080+16*(\idx+2)+0x780,0x180+16*(\idx+2)+0x780,0x100+16*(\idx+2)+0x780,0x000+16*(\idx+2)+0x780,\
                q13,q15,q14,q12, 0x080+16*(\idx+1),0x180+16*(\idx+1),0x100+16*(\idx+1),0x000+16*(\idx+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3,tt2,tt3,tt0,tt1,\
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], lo4,tt2,lo6,tt3, q17,q19,q18,q16, 0x280+16*(\idx+2)+0x780,0x380+16*(\idx+2)+0x780,0x300+16*(\idx+2)+0x780,0x200+16*(\idx+2)+0x780,\
                q17,q19,q18,q16, 0x280+16*(\idx+1),0x380+16*(\idx+1),0x300+16*(\idx+1),0x200+16*(\idx+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7,tt0,tt1,tt2,tt3,\
                v31.s[0],v31.s[1],v31.s[2],v31.s[3],v0.s[0], hi0,tt0,hi2,tt1, q21,q23,q22,q20, 0x480+16*(\idx+2)+0x780,0x580+16*(\idx+2)+0x780,0x500+16*(\idx+2)+0x780,0x400+16*(\idx+2)+0x780,\
                q21,q23,q22,q20, 0x480+16*(\idx+1),0x580+16*(\idx+1),0x500+16*(\idx+1),0x400+16*(\idx+1), ptr_ret

    r_CT_2x_mix_com_store_load_ls .4s,hi4,hi6,hi0,hi2, hi5,hi7,lo4,lo5, tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], hi6,tt3,hi4,tt2, q25,q27,q24,q26, 0x680 + 16*(\idx+2)+0x780, 0x780 + 16*(\idx+2)+0x780, 0x600 + 16*(\idx+2)+0x780, 0x700 + 16*(\idx+2)+0x780,\
                q25,q27,q24,q26, 0x680 + 16*(\idx+1), 0x780 + 16*(\idx+1), 0x600 + 16*(\idx+1), 0x700 + 16*(\idx+1),  ptr_ret
    r_CT_2x_mix .4s,lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5,tt2,tt3,tt0,tt1,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi2,hi3,lo0,lo1,hi6,hi7,lo2,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0]
    r_CT_2x_mix .4s,lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7,tt0,tt1,tt2,tt3,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix .4s,lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3,tt2,tt3,tt0,tt1,\
                v29.s[0],v29.s[1],v29.s[0],v29.s[1],v0.s[0]
    r_CT_2x_mix .4s,hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7,tt0,tt1,tt2,tt3,\
                v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0]

    r_CT_2x_mix .4s,hi4,hi5,lo0,lo2,hi6,hi7,lo1,lo3,tt2,tt3,tt0,tt1,\
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0]
    r_CT_2x_mix_com_store_load_ls   .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7,tt0,tt1,tt2,tt3,\
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], lo0,tt0,lo2,tt1, q13,q15,q14,q12, 0x080+16*(\idx+121+2),0x180+16*(\idx+121+2),0x100+16*(\idx+121+2),0x000+16*(\idx+121+2),\
                q13,q15,q14,q12, 0x080+16*(\idx+121+1),0x180+16*(\idx+121+1),0x100+16*(\idx+121+1),0x000+16*(\idx+121+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3,tt2,tt3,tt0,tt1,\
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], lo4,tt2,lo6,tt3, q17,q19,q18,q16, 0x280+16*(\idx+121+2),0x380+16*(\idx+121+2),0x300+16*(\idx+121+2),0x200+16*(\idx+121+2),\
                q17,q19,q18,q16, 0x280+16*(\idx+121+1),0x380+16*(\idx+121+1),0x300+16*(\idx+121+1),0x200+16*(\idx+121+1), ptr_ret
    r_CT_2x_mix_com_store_load_ls   .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7,tt0,tt1,tt2,tt3,\
                v31.s[0],v31.s[1],v31.s[2],v31.s[3],v0.s[0], hi0,tt0,hi2,tt1, q21,q23,q22,q20, 0x480+16*(\idx+121+2),0x580+16*(\idx+121+2),0x500+16*(\idx+121+2),0x400+16*(\idx+121+2),\
                q21,q23,q22,q20, 0x480+16*(\idx+121+1),0x580+16*(\idx+121+1),0x500+16*(\idx+121+1),0x400+16*(\idx+121+1), ptr_ret
.endm

.macro NTT_8_unrequire
    .unreq tt0
    .unreq tt1
    .unreq tt2
    .unreq tt3

    .unreq lo0
    .unreq lo1
    .unreq lo2
    .unreq lo3
    .unreq lo4
    .unreq lo5
    .unreq lo6
    .unreq lo7

    .unreq hi0
    .unreq hi1
    .unreq hi2
    .unreq hi3
    .unreq hi4
    .unreq hi5
    .unreq hi6
    .unreq hi7
.endm

ntt3x128x4_goodntt_S:
_ntt3x128x4_goodntt_S:
    ABI_push
    ptr_ret .req x0
    ptr_src .req x1
    ptr_ret2 .req x14
    mov ptr_ret2, ptr_ret
    ins v0.s[0], w2
__NTT_6:
    NTT_6_constant
    NTT_6_require
    // NTT_6_address_h, NTT_6_core, NTT_6_core_0_j0, str/ld interleave to previous/next round
    NTT_6_address_h

        .rept 20
            NTT_6_core_h
            add ptr_src, ptr_src, 24
            add ptr_ret2, ptr_ret2, 48
        .endr

    NTT_6_core_0_j0_h
    NTT_6_unrequire

__NTT_8:
    NTT_8_constant
    NTT_8_require
    // NTT_8 functions below, str/ld interleave to previous/next round
    NTT_8_address_com_NTT_8_load_h // combine w/ one NTT_8_core_com_NTT_8_store_load -> slow

    NTT_8_core_com_NTT_8_store_load_h 0
    NTT_8_core_com_NTT_8_store_load_h 1
    NTT_8_core_com_NTT_8_store_load_h 2
    NTT_8_core_com_NTT_8_store_load_h 3
    NTT_8_core_com_NTT_8_store_load_h 4
    NTT_8_core_com_NTT_8_store_load_h 5

    NTT_8_core_com_NTT_8_store_com_NTT_8_shift_com_NTT_8_load_h 6

    NTT_8_core_com_NTT_8_store_load_h 128
    NTT_8_core_com_NTT_8_store_load_h 129
    NTT_8_core_com_NTT_8_store_load_h 130
    NTT_8_core_com_NTT_8_store_load_h 131
    NTT_8_core_com_NTT_8_store_load_h 132
    NTT_8_core_com_NTT_8_store_load_h 133

    NTT_8_core_com_NTT_8_store_com_NTT_8_shift_com_NTT_8_load_h 134

    NTT_8_core_com_NTT_8_store_load_h 256
    NTT_8_core_com_NTT_8_store_load_h 257
    NTT_8_core_com_NTT_8_store_load_h 258
    NTT_8_core_com_NTT_8_store_load_h 259
    NTT_8_core_com_NTT_8_store_load_h 260
    NTT_8_core_com_NTT_8_store_load_h 261

    NTT_8_core_com_NTT_8_store_h 262
    NTT_8_unrequire

__end:
    ABI_pop
    ret

