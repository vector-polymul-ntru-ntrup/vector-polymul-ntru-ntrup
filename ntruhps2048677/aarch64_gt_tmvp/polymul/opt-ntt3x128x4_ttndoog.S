// full changed ld1 -> ldr, st1 -> str
#include "opt-include-macro.i"
.align 2
.globl ntt3x128x4_ttndoog_S
.globl _ntt3x128x4_ttndoog_S

.macro NTT_8_constant
    zlzh0 .req x2
    zlzh1 .req x3
    zlzh2 .req x4
    zlzh3 .req x5
    zlzh4 .req x6
    zlzh5 .req x7
    zlzh6 .req x8
    zlzh7 .req x9

    mov  zlzh0, 0x0001
    movk zlzh0, 0x0000, lsl 16
    movk zlzh0, 0x0080, lsl 32
    movk zlzh0, 0x0000, lsl 48

    mov  zlzh1, 0xe7fa
    movk zlzh1, 0x006c, lsl 16
    movk zlzh1, 0x9d31, lsl 32
    movk zlzh1, 0x3681, lsl 48

    mov  zlzh2, 0xa802
    movk zlzh2, 0xff95, lsl 16
    movk zlzh2, 0xb2e2, lsl 32
    movk zlzh2, 0xcac6, lsl 48

    mov  zlzh3, 0xa8c2
    movk zlzh3, 0xff91, lsl 16
    movk zlzh3, 0x92dc, lsl 32
    movk zlzh3, 0xc8c6, lsl 48
    mov  zlzh4, 0x6c55
    movk zlzh4, 0x0051, lsl 16
    movk zlzh4, 0x5a6e, lsl 32
    movk zlzh4, 0x28c0, lsl 48

    mov  zlzh5, 0x91db
    movk zlzh5, 0x0007, lsl 16
    movk zlzh5, 0xdff4, lsl 32
    movk zlzh5, 0x03c9, lsl 48

    mov  zlzh6, 0xfbf8
    movk zlzh6, 0xff81, lsl 16
    movk zlzh6, 0x37cd, lsl 32
    movk zlzh6, 0xc0ee, lsl 48

    mov  zlzh7, 0x017e
    movk zlzh7, 0xffcf, lsl 16
    movk zlzh7, 0x9dc0, lsl 32
    movk zlzh7, 0xe77a, lsl 48

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
.macro NTT_8_require_h
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

.macro NTT_8_address_com_NTT_8_core_h idx
    r_GS_2x_top_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, q12,q13,q14,q15, ptr_src,ptr_src,ptr_src,ptr_src, 0x000,0x080,0x100,0x180 // ld: lo0,lo2, lo1,lo3,
    r_GS_2x_mix_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0], q18,q19,q16,q17, ptr_src,ptr_src,ptr_src,ptr_src, 0x300,0x380,0x200,0x280 // ld: lo4,lo6, lo5,lo7,
    r_GS_2x_mix_l .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3, tt0,tt1,tt2,tt3, \
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], q22,q23,q20,q21, ptr_src,ptr_src,ptr_src,ptr_src, 0x500,0x580,0x400,0x480 // ld: hi0,hi2, hi1,hi3,
    r_GS_2x_mix_l .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7, tt2,tt3,tt0,tt1, \
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], q26,q27,q24,q25, ptr_src,ptr_src,ptr_src,ptr_src, 0x700,0x780,0x600,0x680 // ld: hi4,hi6, hi5,hi7,
    GS_2x_mix hi4,hi6,lo0,lo1,hi5,hi7,lo2,lo3, tt0,tt1,tt2,tt3, \
                v31.s[0],v31.s[1],v31.s[2],v31.s[3]
    GS_2x_mix lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1]

    GS_2x_mix lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3, tt0,tt1,tt2,tt3, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3]
    GS_2x_mix hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7, tt2,tt3,tt0,tt1, \
                v29.s[0],v29.s[1],v29.s[0],v29.s[1]
    r_GS_2x_mix_2s  .4s, hi4,hi5,lo0,lo1,hi6,hi7,lo4,lo5, tt0,tt1,tt2,tt3, \
                   v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0], q12,q13, ptr_src,ptr_src, 0x000+16*(\idx),0x080+16*(\idx) // str: lo0, lo1
    r_GS_2x_mix_4s .4s, lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q14,q16,q15,q17, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x100+16*(\idx),0x200+16*(\idx),0x180+16*(\idx),0x280+16*(\idx) // str: lo2, lo3, lo4, lo5

    r_GS_2x_mix_4s .4s, lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5, tt0,tt1,tt2,tt3, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q20,q18,q21,q19, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x400+16*(\idx),0x300+16*(\idx),0x480+16*(\idx),0x380+16*(\idx) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], q22,q24,q23,q25, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x500+16*(\idx),0x600+16*(\idx),0x580+16*(\idx),0x680+16*(\idx) // str: lo2, lo3, lo4, lo5
    r_GS_2x_bot_ls  .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7,\
                q12,q14,q13,q15, ptr_src, 0x000+16*(\idx+1),0x100+16*(\idx+1),0x080+16*(\idx+1),0x180+16*(\idx+1),\
                q26,q27, 0x700+16*(\idx),0x780+16*(\idx)// str: hi4, hi5, hi6, hi7

    r_GS_2x_mix_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0], q18,q19,q16,q17, ptr_src,ptr_src,ptr_src,ptr_src, 0x300+16*(1),0x380+16*(1),0x200+16*(1),0x280+16*(1) // ld: lo4,lo6, lo5,lo7,
    r_GS_2x_mix_l .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3, tt0,tt1,tt2,tt3, \
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], q22,q23,q20,q21, ptr_src,ptr_src,ptr_src,ptr_src, 0x500+16*(1),0x580+16*(1),0x400+16*(1),0x480+16*(1) // ld: hi0,hi2, hi1,hi3,
    r_GS_2x_mix_l .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7, tt2,tt3,tt0,tt1, \
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], q26,q27,q24,q25, ptr_src,ptr_src,ptr_src,ptr_src, 0x700+16*(1),0x780+16*(1),0x600+16*(1),0x680+16*(1) // ld: hi4,hi6, hi5,hi7,

    GS_2x_mix hi4,hi6,lo0,lo1,hi5,hi7,lo2,lo3, tt0,tt1,tt2,tt3, \
                v31.s[0],v31.s[1],v31.s[2],v31.s[3]
    GS_2x_mix lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1]
    GS_2x_mix lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3, tt0,tt1,tt2,tt3, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3]
    GS_2x_mix hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7, tt2,tt3,tt0,tt1, \
                v29.s[0],v29.s[1],v29.s[0],v29.s[1]

    r_GS_2x_mix_2s  .4s, hi4,hi5,lo0,lo1,hi6,hi7,lo4,lo5, tt0,tt1,tt2,tt3, \
                   v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0], q12,q13, ptr_src,ptr_src, 0x000+16*(\idx+1),0x080+16*(\idx+1) // str: lo0, lo1
    r_GS_2x_mix_4s .4s, lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q14,q16,q15,q17, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x100+16*(\idx+1),0x200+16*(\idx+1),0x180+16*(\idx+1),0x280+16*(\idx+1) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5, tt0,tt1,tt2,tt3, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q20,q18,q21,q19, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x400+16*(\idx+1),0x300+16*(\idx+1),0x480+16*(\idx+1),0x380+16*(\idx+1) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], q22,q24,q23,q25, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x500+16*(\idx+1),0x600+16*(\idx+1),0x580+16*(\idx+1),0x680+16*(\idx+1) // str: lo2, lo3, lo4, lo5
.endm

.macro NTT_8_core_h idx
    r_GS_2x_bot_s .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], q26,q27,\
                ptr_src,ptr_src, 0x700 + 16*(\idx),0x780 + 16*(\idx) // str: hi4, hi5, hi6, hi7

    r_GS_2x_top_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, q12,q13,q14,q15, ptr_src,ptr_src,ptr_src,ptr_src,\
                  0x000 + 16*(\idx+1), 0x080 + 16*(\idx+1), 0x100 + 16*(\idx+1), 0x180 + 16*(\idx+1) // ld: lo0,lo2, lo1,lo3,
    r_GS_2x_mix_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0], q18,q19,q16,q17, ptr_src,ptr_src,ptr_src,ptr_src, 0x300+16*(\idx+1),0x380+16*(\idx+1),0x200+16*(\idx+1),0x280+16*(\idx+1) // ld: lo4,lo6, lo5,lo7,
    r_GS_2x_mix_l .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3, tt0,tt1,tt2,tt3, \
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], q22,q23,q20,q21, ptr_src,ptr_src,ptr_src,ptr_src, 0x500+16*(\idx+1),0x580+16*(\idx+1),0x400+16*(\idx+1),0x480+16*(\idx+1) // ld: hi0,hi2, hi1,hi3,
    r_GS_2x_mix_l .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7, tt2,tt3,tt0,tt1, \
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], q26,q27,q24,q25, ptr_src,ptr_src,ptr_src,ptr_src, 0x700+16*(\idx+1),0x780+16*(\idx+1),0x600+16*(\idx+1),0x680+16*(\idx+1) // ld: hi4,hi6, hi5,hi7,


    GS_2x_mix hi4,hi6,lo0,lo1,hi5,hi7,lo2,lo3, tt0,tt1,tt2,tt3, \
                v31.s[0],v31.s[1],v31.s[2],v31.s[3]
    GS_2x_mix lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1]
    GS_2x_mix lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3, tt0,tt1,tt2,tt3, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3]
    GS_2x_mix hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7, tt2,tt3,tt0,tt1, \
                v29.s[0],v29.s[1],v29.s[0],v29.s[1]

    r_GS_2x_mix_2s  .4s, hi4,hi5,lo0,lo1,hi6,hi7,lo4,lo5, tt0,tt1,tt2,tt3, \
                   v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0], q12,q13, ptr_src,ptr_src, 0x000+16*(\idx+1),0x080+16*(\idx+1) // str: lo0, lo1
    r_GS_2x_mix_4s .4s, lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q14,q16,q15,q17, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x100+16*(\idx+1),0x200+16*(\idx+1),0x180+16*(\idx+1),0x280+16*(\idx+1) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5, tt0,tt1,tt2,tt3, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q20,q18,q21,q19, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x400+16*(\idx+1),0x300+16*(\idx+1),0x480+16*(\idx+1),0x380+16*(\idx+1) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], q22,q24,q23,q25, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x500+16*(\idx+1),0x600+16*(\idx+1),0x580+16*(\idx+1),0x680+16*(\idx+1) // str: lo2, lo3, lo4, lo5
.endm

.macro NTT_8_core_com_NTT_8_shift_h idx
    r_GS_2x_bot_ls  .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7,\
                q12,q14,q13,q15, ptr_src, 0x000+16*(\idx+1),0x100+16*(\idx+1),0x080+16*(\idx+1),0x180+16*(\idx+1),\
                q26,q27, 0x700+16*(\idx),0x780+16*(\idx)// str: hi4, hi5, hi6, hi7
    r_GS_2x_mix_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0], q18,q19,q16,q17, ptr_src,ptr_src,ptr_src,ptr_src, 0x300+16*(\idx+1),0x380+16*(\idx+1),0x200+16*(\idx+1),0x280+16*(\idx+1) // ld: lo4,lo6, lo5,lo7,
    r_GS_2x_mix_l .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3, tt0,tt1,tt2,tt3, \
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], q22,q23,q20,q21, ptr_src,ptr_src,ptr_src,ptr_src, 0x500+16*(\idx+1),0x580+16*(\idx+1),0x400+16*(\idx+1),0x480+16*(\idx+1) // ld: hi0,hi2, hi1,hi3,
    r_GS_2x_mix_l .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7, tt2,tt3,tt0,tt1, \
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], q26,q27,q24,q25, ptr_src,ptr_src,ptr_src,ptr_src, 0x700+16*(\idx+1),0x780+16*(\idx+1),0x600+16*(\idx+1),0x680+16*(\idx+1) // ld: hi4,hi6, hi5,hi7,


    GS_2x_mix hi4,hi6,lo0,lo1,hi5,hi7,lo2,lo3, tt0,tt1,tt2,tt3, \
                v31.s[0],v31.s[1],v31.s[2],v31.s[3]
    GS_2x_mix lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1]
    GS_2x_mix lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3, tt0,tt1,tt2,tt3, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3]
    GS_2x_mix hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7, tt2,tt3,tt0,tt1, \
                v29.s[0],v29.s[1],v29.s[0],v29.s[1]

    r_GS_2x_mix_2s  .4s, hi4,hi5,lo0,lo1,hi6,hi7,lo4,lo5, tt0,tt1,tt2,tt3, \
                   v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0], q12,q13, ptr_src,ptr_src, 0x000+16*(\idx+1),0x080+16*(\idx+1) // str: lo0, lo1
    r_GS_2x_mix_4s .4s, lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q14,q16,q15,q17, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x100+16*(\idx+1),0x200+16*(\idx+1),0x180+16*(\idx+1),0x280+16*(\idx+1) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5, tt0,tt1,tt2,tt3, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q20,q18,q21,q19, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x400+16*(\idx+1),0x300+16*(\idx+1),0x480+16*(\idx+1),0x380+16*(\idx+1) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], q22,q24,q23,q25, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x500+16*(\idx+1),0x600+16*(\idx+1),0x580+16*(\idx+1),0x680+16*(\idx+1) // str: lo2, lo3, lo4, lo5
    r_GS_2x_bot_s .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1,\
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], q26,q27,\
                ptr_src,ptr_src, 0x700 + 16*(\idx+1),0x780 + 16*(\idx+1) // str: hi4, hi5, hi6, hi7


    r_GS_2x_top_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, q12,q13,q14,q15, ptr_src,ptr_src,ptr_src,ptr_src,\
                  0x000 + 16*(\idx+122), 0x080 + 16*(\idx+122), 0x100 + 16*(\idx+122), 0x180 + 16*(\idx+122) // ld: lo0,lo2, lo1,lo3,
    r_GS_2x_mix_l .4s,lo0,lo2,lo4,lo6,lo1,lo3,lo5,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[2],v28.s[3],v0.s[0], q18,q19,q16,q17, ptr_src,ptr_src,ptr_src,ptr_src, 0x300+16*(\idx+122),0x380+16*(\idx+122),0x200+16*(\idx+122),0x280+16*(\idx+122) // ld: lo4,lo6, lo5,lo7,
    r_GS_2x_mix_l .4s,lo4,lo6,hi0,hi2,lo5,lo7,hi1,hi3, tt0,tt1,tt2,tt3, \
                v29.s[0],v29.s[1],v29.s[2],v29.s[3],v0.s[0], q22,q23,q20,q21, ptr_src,ptr_src,ptr_src,ptr_src, 0x500+16*(\idx+122),0x580+16*(\idx+122),0x400+16*(\idx+122),0x480+16*(\idx+122) // ld: hi0,hi2, hi1,hi3,
    r_GS_2x_mix_l .4s,hi0,hi2,hi4,hi6,hi1,hi3,hi5,hi7, tt2,tt3,tt0,tt1, \
                v30.s[0],v30.s[1],v30.s[2],v30.s[3],v0.s[0], q26,q27,q24,q25, ptr_src,ptr_src,ptr_src,ptr_src, 0x700+16*(\idx+122),0x780+16*(\idx+122),0x600+16*(\idx+122),0x680+16*(\idx+122) // ld: hi4,hi6, hi5,hi7,


    GS_2x_mix hi4,hi6,lo0,lo1,hi5,hi7,lo2,lo3, tt0,tt1,tt2,tt3, \
                v31.s[0],v31.s[1],v31.s[2],v31.s[3]
    GS_2x_mix lo0,lo1,lo4,lo5,lo2,lo3,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1]
    GS_2x_mix lo4,lo5,hi0,hi1,lo6,lo7,hi2,hi3, tt0,tt1,tt2,tt3, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3]
    GS_2x_mix hi0,hi1,hi4,hi5,hi2,hi3,hi6,hi7, tt2,tt3,tt0,tt1, \
                v29.s[0],v29.s[1],v29.s[0],v29.s[1]

    r_GS_2x_mix_2s  .4s, hi4,hi5,lo0,lo1,hi6,hi7,lo4,lo5, tt0,tt1,tt2,tt3, \
                   v29.s[2],v29.s[3],v29.s[2],v29.s[3],v0.s[0], q12,q13, ptr_src,ptr_src, 0x000+16*(\idx+122),0x080+16*(\idx+122) // str: lo0, lo1
    r_GS_2x_mix_4s .4s, lo0,lo1,lo2,lo3,lo4,lo5,lo6,lo7, tt2,tt3,tt0,tt1, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q14,q16,q15,q17, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x100+16*(\idx+122),0x200+16*(\idx+122),0x180+16*(\idx+122),0x280+16*(\idx+122) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, lo2,lo3,hi0,hi1,lo6,lo7,hi4,hi5, tt0,tt1,tt2,tt3, \
                v28.s[0],v28.s[1],v28.s[0],v28.s[1],v0.s[0], q20,q18,q21,q19, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x400+16*(\idx+122),0x300+16*(\idx+122),0x480+16*(\idx+122),0x380+16*(\idx+122) // str: lo2, lo3, lo4, lo5
    r_GS_2x_mix_4s .4s, hi0,hi1,hi2,hi3,hi4,hi5,hi6,hi7, tt2,tt3,tt0,tt1, \
                v28.s[2],v28.s[3],v28.s[2],v28.s[3],v0.s[0], q22,q24,q23,q25, ptr_src,ptr_src,ptr_src,ptr_src,\
                0x500+16*(\idx+122),0x600+16*(\idx+122),0x580+16*(\idx+122),0x680+16*(\idx+122) // str: lo2, lo3, lo4, lo5
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


.macro  mod_16760833 a
    SRSHR v28.4S, \a, #24
    MLS \a, v28.4S, v31.4S
.endm
.macro NTT_6_constant
    root3 .req x2
    demon .req x3   // 2^32/384 MOD P

    mov  root3, 0x3b61
    movk root3, 0xffd3, lsl 16
    movk root3, 0x169c, lsl 32
    movk root3, 0xe998, lsl 48

    mov  demon, 0x2aaa
    movk demon, 0x0000, lsl 16
    movk demon, 0x5a57, lsl 32
    movk demon, 0x0015, lsl 48

    ins v31.d[0], root3
    ins v31.d[1], demon

    .unreq root3
    .unreq demon
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

    ptr_s00 .req x14
    ptr_s01 .req x15
    ptr_s02 .req x16
    ptr_s03 .req x17
    ptr_s04 .req x19
    ptr_s05 .req x20

    ptr_s10 .req x21
    ptr_s11 .req x22
    ptr_s12 .req x23
    ptr_s13 .req x24
    ptr_s14 .req x25
    ptr_s15 .req x26
.endm

.macro NTT_6_address
    add ptr_s00, ptr_ret, 0x000
    add ptr_s10, ptr_ret, 0x200
    add ptr_s01, ptr_ret, 0x400
    add ptr_s11, ptr_ret, 0x600

    add ptr_s02, ptr_ret, 0x800
    add ptr_s12, ptr_ret, 0xa00
    add ptr_s03, ptr_ret, 0xc00
    add ptr_s13, ptr_ret, 0xe00

    add ptr_s04, ptr_s02, 0x800
    add ptr_s14, ptr_s12, 0x800
    add ptr_s05, ptr_s03, 0x800
    add ptr_s15, ptr_s13, 0x800
.endm

.macro NTT_6_address_NTT_6_load_com_NTT_6_algostore_0_1_h ptr_00,ptr_01,ptr_02,ptr_03,ptr_04,ptr_05, ptr_06,ptr_07,ptr_08,ptr_09,ptr_10,ptr_11
    ldr q12, [ptr_src, 0]
    ldr q14, [ptr_src, 0x800]
    add tt0.4s, t00.4s, t02.4s
    ldr q13, [ptr_src, 0x400]
    ldr q15, [ptr_src, 0xc00]
    add tt1.4s, t01.4s, t03.4s
    ldr q16, [ptr_src, 0x1000]
    add tt0.4s, tt0.4s, t04.4s
    ldr q17, [ptr_src, 0x1400]
    add tt1.4s, tt1.4s, t05.4s

    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[2]
    mul tt1.4s, tt3.4s, v31.s[2] // M
    sqrdmulh tt2.4s, tt2.4s, v31.s[3]
    sub t04.4s, t00.4s, t04.4s
    sqrdmulh tt3.4s, tt3.4s, v31.s[3] // F0
    sub t05.4s, t01.4s, t05.4s
    mls tt0.4s, tt2.4s, v0.s[0] // M
    sub t02.4s, t00.4s, t02.4s
    mls tt1.4s, tt3.4s, v0.s[0]
    sub t03.4s, t01.4s, t03.4s
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_00], 16 // F0/F1 S
    sub tt0.4s, t04.4s, t02.4s  // tt0 = (U0-U4)-(U0-U2)=U2-U4
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_01], 16
    sub tt1.4s, t05.4s, t03.4s  // tt1 = (U1-U5)-(U1-U3)=U3-U5

    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[0]
    mul tt1.4s, tt3.4s, v31.s[0]
    add t00.4s, t04.4s, t05.4s  // ((U0 - U4) + (U1 - U5))
    sqrdmulh tt2.4s, tt2.4s, v31.s[1]
    sub t01.4s, t04.4s, t05.4s  // ((U0 - U4) - (U1 - U5))
    sqrdmulh tt3.4s, tt3.4s, v31.s[1]
    add t04.4s, t02.4s, t03.4s  // ((U0 - U2) + (U1 - U3))
    mls tt0.4s, tt2.4s, v0.s[0]
    sub t05.4s, t02.4s, t03.4s  // ((U0 - U2) - (U1 - U3))
    mls tt1.4s, tt3.4s, v0.s[0]

    add t00.4s, t00.4s, tt0.4s
    add t01.4s, t01.4s, tt1.4s

    sub t04.4s, t04.4s, tt0.4s
    mul tt0.4s, t00.4s, v31.s[2]
    sub t05.4s, t05.4s, tt1.4s
    mul tt1.4s, t01.4s, v31.s[2]
    sqrdmulh t00.4s, t00.4s, v31.s[3]
    sqrdmulh t01.4s, t01.4s, v31.s[3]
    mls tt0.4s, t00.4s, v0.s[0]
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_02], 16
    mls tt1.4s, t01.4s, v0.s[0]
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_03], 16

    ldr q18, [ptr_src, 0x200]
    mul tt0.4s, t04.4s, v31.s[2]

    ldr q19, [ptr_src, 0x600]
    mul tt1.4s, t05.4s, v31.s[2] // M
    sqrdmulh t04.4s, t04.4s, v31.s[3] // F0
    sqrdmulh t05.4s, t05.4s, v31.s[3]
    mls tt0.4s, t04.4s, v0.s[0] // M
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_04], 16 // F0/F1 S

    ldr q20, [ptr_src, 0xa00]
    add tt0.4s, t10.4s, t12.4s
    mls tt1.4s, t05.4s, v0.s[0]
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_05], 16

    ldr q21, [ptr_src, 0xe00]
    add tt1.4s, t11.4s, t13.4s

    // ori: NTT_6_load_com_NTT_6_algostore_1, some parts are combined in above block
    ldr q22, [ptr_src, 0x1200]
    add tt0.4s, tt0.4s, t14.4s  // tt0 = U0+U2+U4

    ldr q23, [ptr_src, 0x1600]
    add tt1.4s, tt1.4s, t15.4s  // tt1 = U1+U3+U5

    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[2]
    mul tt1.4s, tt3.4s, v31.s[2]
    sqrdmulh tt2.4s, tt2.4s, v31.s[3]
    sub t14.4s, t10.4s, t14.4s
    sqrdmulh tt3.4s, tt3.4s, v31.s[3]
    sub t15.4s, t11.4s, t15.4s
    mls tt0.4s, tt2.4s, v0.s[0]
    sub t12.4s, t10.4s, t12.4s
    mls tt1.4s, tt3.4s, v0.s[0]
    sub t13.4s, t11.4s, t13.4s
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_06], 16
    sub tt0.4s, t14.4s, t12.4s  // tt0 = (U0-U4)-(U0-U2)=U2-U4
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_07], 16
    sub tt1.4s, t15.4s, t13.4s  // tt1 = (U1-U5)-(U1-U3)=U3-U5

    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[0]
    mul tt1.4s, tt3.4s, v31.s[0]
    add t10.4s, t14.4s, t15.4s  // ((U0 - U4) + (U1 - U5))
    sqrdmulh tt2.4s, tt2.4s, v31.s[1]
    sub t11.4s, t14.4s, t15.4s  // ((U0 - U4) - (U1 - U5))
    sqrdmulh tt3.4s, tt3.4s, v31.s[1]
    add t14.4s, t12.4s, t13.4s  // ((U0 - U2) + (U1 - U3))
    mls tt0.4s, tt2.4s, v0.s[0]
    sub t15.4s, t12.4s, t13.4s  // ((U0 - U2) - (U1 - U3))
    mls tt1.4s, tt3.4s, v0.s[0]


    add t10.4s, t10.4s, tt0.4s
    mul t12.4s, t10.4s, v31.s[2]
    add t11.4s, t11.4s, tt1.4s
    mul t13.4s, t11.4s, v31.s[2]
    sub t14.4s, t14.4s, tt0.4s
    sqrdmulh t10.4s, t10.4s, v31.s[3]
    sub t15.4s, t15.4s, tt1.4s
    sqrdmulh t11.4s, t11.4s, v31.s[3]
    mls t12.4s, t10.4s, v0.s[0]
    mod_16760833 t12.4s
    st1 {t12.4s}, [\ptr_08], 16
    mls t13.4s, t11.4s, v0.s[0]
    mod_16760833 t13.4s
    st1 {t13.4s}, [\ptr_09], 16
    // store outside
.endm
.macro NTT_6_load_com_NTT_6_algostore_0_1_h ptr_00,ptr_01,ptr_02,ptr_03,ptr_04,ptr_05, ptr_06,ptr_07,ptr_08,ptr_09,ptr_10,ptr_11
    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[2]
    mul tt1.4s, tt3.4s, v31.s[2] // M
    sqrdmulh tt2.4s, tt2.4s, v31.s[3]
    sub t04.4s, t00.4s, t04.4s
    sqrdmulh tt3.4s, tt3.4s, v31.s[3] // F0
    sub t05.4s, t01.4s, t05.4s
    mls tt0.4s, tt2.4s, v0.s[0] // M
    sub t02.4s, t00.4s, t02.4s
    mls tt1.4s, tt3.4s, v0.s[0]
    sub t03.4s, t01.4s, t03.4s
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_00], 16 // F0/F1 S
    sub tt0.4s, t04.4s, t02.4s  // tt0 = (U0-U4)-(U0-U2)=U2-U4
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_01], 16
    sub tt1.4s, t05.4s, t03.4s  // tt1 = (U1-U5)-(U1-U3)=U3-U5

    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[0]
    mul tt1.4s, tt3.4s, v31.s[0]
    add t00.4s, t04.4s, t05.4s  // ((U0 - U4) + (U1 - U5))
    sqrdmulh tt2.4s, tt2.4s, v31.s[1]
    sub t01.4s, t04.4s, t05.4s  // ((U0 - U4) - (U1 - U5))
    sqrdmulh tt3.4s, tt3.4s, v31.s[1]
    add t04.4s, t02.4s, t03.4s  // ((U0 - U2) + (U1 - U3))
    mls tt0.4s, tt2.4s, v0.s[0]
    sub t05.4s, t02.4s, t03.4s  // ((U0 - U2) - (U1 - U3))
    mls tt1.4s, tt3.4s, v0.s[0]

    add t00.4s, t00.4s, tt0.4s
    add t01.4s, t01.4s, tt1.4s

    sub t04.4s, t04.4s, tt0.4s
    mul tt0.4s, t00.4s, v31.s[2]
    sub t05.4s, t05.4s, tt1.4s
    mul tt1.4s, t01.4s, v31.s[2]
    sqrdmulh t00.4s, t00.4s, v31.s[3]
    sqrdmulh t01.4s, t01.4s, v31.s[3]
    mls tt0.4s, t00.4s, v0.s[0]
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_02], 16
    mls tt1.4s, t01.4s, v0.s[0]
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_03], 16

    ldr q18, [ptr_src, 0x200]
    mul tt0.4s, t04.4s, v31.s[2]
    ldr q19, [ptr_src, 0x600]
    mul tt1.4s, t05.4s, v31.s[2] // M
    sqrdmulh t04.4s, t04.4s, v31.s[3] // F0
    sqrdmulh t05.4s, t05.4s, v31.s[3]
    mls tt0.4s, t04.4s, v0.s[0] // M
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_04], 16 // F0/F1 S
    ldr q20, [ptr_src, 0xa00]
    add tt0.4s, t10.4s, t12.4s
    mls tt1.4s, t05.4s, v0.s[0]
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_05], 16
    ldr q21, [ptr_src, 0xe00]
    add tt1.4s, t11.4s, t13.4s

    // ori: NTT_6_load_com_NTT_6_algostore_1, some parts are combined in above block
    ldr q22, [ptr_src, 0x1200]
    add tt0.4s, tt0.4s, t14.4s  // tt0 = U0+U2+U4
    ldr q23, [ptr_src, 0x1600]
    add tt1.4s, tt1.4s, t15.4s  // tt1 = U1+U3+U5

    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[2]
    mul tt1.4s, tt3.4s, v31.s[2]
    sqrdmulh tt2.4s, tt2.4s, v31.s[3]
    sub t14.4s, t10.4s, t14.4s
    sqrdmulh tt3.4s, tt3.4s, v31.s[3]
    sub t15.4s, t11.4s, t15.4s
    mls tt0.4s, tt2.4s, v0.s[0]
    sub t12.4s, t10.4s, t12.4s
    mls tt1.4s, tt3.4s, v0.s[0]
    sub t13.4s, t11.4s, t13.4s
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_06], 16
    sub tt0.4s, t14.4s, t12.4s  // tt0 = (U0-U4)-(U0-U2)=U2-U4
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_07], 16
    sub tt1.4s, t15.4s, t13.4s  // tt1 = (U1-U5)-(U1-U3)=U3-U5

    add tt2.4s, tt0.4s, tt1.4s
    sub tt3.4s, tt0.4s, tt1.4s
    mul tt0.4s, tt2.4s, v31.s[0]
    mul tt1.4s, tt3.4s, v31.s[0]
    add t10.4s, t14.4s, t15.4s  // ((U0 - U4) + (U1 - U5))
    sqrdmulh tt2.4s, tt2.4s, v31.s[1]
    sub t11.4s, t14.4s, t15.4s  // ((U0 - U4) - (U1 - U5))
    sqrdmulh tt3.4s, tt3.4s, v31.s[1]
    add t14.4s, t12.4s, t13.4s  // ((U0 - U2) + (U1 - U3))
    mls tt0.4s, tt2.4s, v0.s[0]
    sub t15.4s, t12.4s, t13.4s  // ((U0 - U2) - (U1 - U3))
    mls tt1.4s, tt3.4s, v0.s[0]

    add t10.4s, t10.4s, tt0.4s
    add t11.4s, t11.4s, tt1.4s

    sub t14.4s, t14.4s, tt0.4s
    mul tt0.4s, t10.4s, v31.s[2]
    sqrdmulh t10.4s, t10.4s, v31.s[3]
    sub t15.4s, t15.4s, tt1.4s
    mul tt1.4s, t11.4s, v31.s[2]
    sqrdmulh t11.4s, t11.4s, v31.s[3]
    mls tt0.4s, t10.4s, v0.s[0]
    mod_16760833 tt0.4s
    st1 {tt0.4s}, [\ptr_08], 16
    mls tt1.4s, t11.4s, v0.s[0]
    mod_16760833 tt1.4s
    st1 {tt1.4s}, [\ptr_09], 16
.endm
.macro NTT_6_address_com_NTT_6_core_type_0_1_2_h
    NTT_6_address_NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s00,ptr_s03,ptr_s04,ptr_s01,ptr_s02,ptr_s05, ptr_s14,ptr_s11,ptr_s12,ptr_s15,ptr_s10,ptr_s13

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    mul t11.4s, t15.4s, v31.s[2]
    ldr q13, [ptr_src, 0x410]
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s10], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s13], 16

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s02,ptr_s05,ptr_s00,ptr_s03,ptr_s04,ptr_s01, ptr_s10,ptr_s13,ptr_s14,ptr_s11,ptr_s12,ptr_s15

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s12], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s15], 16

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s04,ptr_s01,ptr_s02,ptr_s05,ptr_s00,ptr_s03, ptr_s12,ptr_s15,ptr_s10,ptr_s13,ptr_s14,ptr_s11

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s14], 16
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s11], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5

    //--- one round NTT_6_core_type_0_1_2
    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s00,ptr_s03,ptr_s04,ptr_s01,ptr_s02,ptr_s05, ptr_s14,ptr_s11,ptr_s12,ptr_s15,ptr_s10,ptr_s13

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s10], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s13], 16

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s02,ptr_s05,ptr_s00,ptr_s03,ptr_s04,ptr_s01, ptr_s10,ptr_s13,ptr_s14,ptr_s11,ptr_s12,ptr_s15

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s12], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s15], 16
    //---

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s04,ptr_s01,ptr_s02,ptr_s05,ptr_s00,ptr_s03, ptr_s12,ptr_s15,ptr_s10,ptr_s13,ptr_s14,ptr_s11
.endm

.macro NTT_6_core_type_0_1_2
    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s14], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s11], 16

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s00,ptr_s03,ptr_s04,ptr_s01,ptr_s02,ptr_s05, ptr_s14,ptr_s11,ptr_s12,ptr_s15,ptr_s10,ptr_s13

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s10], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s13], 16
    //---

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s02,ptr_s05,ptr_s00,ptr_s03,ptr_s04,ptr_s01, ptr_s10,ptr_s13,ptr_s14,ptr_s11,ptr_s12,ptr_s15

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s12], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s15], 16
    //---

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s04,ptr_s01,ptr_s02,ptr_s05,ptr_s00,ptr_s03, ptr_s12,ptr_s15,ptr_s10,ptr_s13,ptr_s14,ptr_s11
.endm

.macro NTT_6_core_type_0_1
    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s14], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s11], 16

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s00,ptr_s03,ptr_s04,ptr_s01,ptr_s02,ptr_s05, ptr_s14,ptr_s11,ptr_s12,ptr_s15,ptr_s10,ptr_s13

    ldr q12, [ptr_src, 16]
    mul t10.4s, t14.4s, v31.s[2]
    ldr q14, [ptr_src, 0x810]
    add tt0.4s, t00.4s, t02.4s
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    ldr q13, [ptr_src, 0x410]
    mul t11.4s, t15.4s, v31.s[2]
    ldr q15, [ptr_src, 0xc10]
    add tt1.4s, t01.4s, t03.4s
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    ldr q16, [ptr_src, 0x1010]
    add tt0.4s, tt0.4s, t04.4s  // tt0 = U0+U2+U4
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s10], 16
    ldr q17, [ptr_src, 0x1410]
    add tt1.4s, tt1.4s, t05.4s  // tt1 = U1+U3+U5
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s13], 16

    add ptr_src, ptr_src, 16
    NTT_6_load_com_NTT_6_algostore_0_1_h ptr_s02,ptr_s05,ptr_s00,ptr_s03,ptr_s04,ptr_s01, ptr_s10,ptr_s13,ptr_s14,ptr_s11,ptr_s12,ptr_s15

    mul t10.4s, t14.4s, v31.s[2]
    sqrdmulh t14.4s, t14.4s, v31.s[3]
    mul t11.4s, t15.4s, v31.s[2]
    sqrdmulh t15.4s, t15.4s, v31.s[3]
    mls t10.4s, t14.4s, v0.s[0]
    mod_16760833 t10.4s
    st1 {t10.4s}, [ptr_s12], 16
    mls t11.4s, t15.4s, v0.s[0]
    mod_16760833 t11.4s
    st1 {t11.4s}, [ptr_s15], 16
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

    .unreq ptr_s00
    .unreq ptr_s01
    .unreq ptr_s02
    .unreq ptr_s03
    .unreq ptr_s04
    .unreq ptr_s05
    .unreq ptr_s10
    .unreq ptr_s11
    .unreq ptr_s12
    .unreq ptr_s13
    .unreq ptr_s14
    .unreq ptr_s15
.endm

ntt3x128x4_ttndoog_S:
_ntt3x128x4_ttndoog_S:
    ABI_push
    ptr_ret .req x0

    ptr_src .req x1
    ins v0.s[0], w2

__NTT_8:
    NTT_8_constant
    NTT_8_require_h
    // all function below: str/ld will be merged to the previous/next round
    NTT_8_address_com_NTT_8_core_h 0

    NTT_8_core_h 1
    NTT_8_core_h 2
    NTT_8_core_h 3
    NTT_8_core_h 4
    NTT_8_core_h 5

    NTT_8_core_com_NTT_8_shift_h 6

    NTT_8_core_h 128
    NTT_8_core_h 129
    NTT_8_core_h 130
    NTT_8_core_h 131
    NTT_8_core_h 132
    NTT_8_core_h 133

    NTT_8_core_com_NTT_8_shift_h 134

    NTT_8_core_h 256
    NTT_8_core_h 257
    NTT_8_core_h 258
    NTT_8_core_h 259
    NTT_8_core_h 260
    NTT_8_core_h 261
    NTT_8_core_h 262

    mul hi6.4s, tt0.4s, v28.s[2]
    mul hi7.4s, tt1.4s, v28.s[2]
    sqrdmulh tt0.4s, tt0.4s, v28.s[3]
    sqrdmulh tt1.4s, tt1.4s, v28.s[3]
    mls hi6.4s, tt0.4s, v0.s[0]
    str q26, [ptr_src, 0x700 + 4208]
    mls hi7.4s, tt1.4s, v0.s[0]
    str q27, [ptr_src, 0x780 + 4208]

    NTT_8_unrequire


__NTT_6:
    NTT_6_constant
    NTT_6_require

    // const: 16760833
    MOV  x5, #0xC001
    MOVK x5, #0x00FF, LSL #16
    DUP v3.4S, w5
    //---

    NTT_6_address
    // NTT_6 functions below, str/ld interleave to previous/next round
    NTT_6_address_com_NTT_6_core_type_0_1_2_h

    .rept 8
        NTT_6_core_type_0_1_2
    .endr

    NTT_6_core_type_0_1
    NTT_6_unrequire

__end:
    ABI_pop
    ret




