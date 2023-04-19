.align 6
.global _load_good_NTT_32_small
.global __load_good_NTT_32_small
_load_good_NTT_32_small:
__load_good_NTT_32_small:
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

    movi  v31.16b, #0

    ldr q0, [x1, #0]
    ldr q2, [x1, #528]
    ldr q4, [x1, #288]
    ldr q6, [x1, #48]
    ldr q8, [x1, #576]
    ldr q10, [x1, #336]
    ldr q12, [x1, #96]
    ldr q14, [x1, #624]
    ldr q16, [x1, #384]
    ldr q18, [x1, #144]
    ldr q20, [x1, #672]
    ldr q22, [x1, #432]
    ldr q24, [x1, #192]
    ldr q26, [x1, #720]
    ldr q28, [x1, #480]
    ldr q30, [x1, #240]
    movi  v31.16b, #0

    add       v3.16b,  v0.16b, v16.16b
    add       v5.16b,  v2.16b, v18.16b
    add       v11.16b,  v8.16b, v24.16b
    add       v13.16b,  v10.16b, v26.16b
    add       v7.16b,  v3.16b, v11.16b
    add       v9.16b,  v5.16b, v13.16b
    sub       v15.16b,  v3.16b, v11.16b
    sub       v17.16b,  v5.16b, v13.16b
    str q7, [x0, #0]
    str q9, [x0, #64]
    str q15, [x0, #256]
    str q17, [x0, #320]
    add       v7.16b,  v4.16b, v20.16b
    add       v9.16b,  v6.16b, v22.16b
    add       v15.16b,  v12.16b, v28.16b
    add       v17.16b,  v14.16b, v30.16b
    add       v3.16b,  v7.16b, v15.16b
    add       v5.16b,  v9.16b, v17.16b
    sub       v11.16b,  v7.16b, v15.16b
    sub       v13.16b,  v9.16b, v17.16b
    str q3, [x0, #128]
    str q5, [x0, #192]
    str q11, [x0, #384]
    str q13, [x0, #448]
    sub       v3.16b,  v0.16b, v16.16b
    sub       v5.16b,  v2.16b, v18.16b
    sub       v7.16b,  v4.16b, v20.16b
    sub       v9.16b,  v6.16b, v22.16b
    sub       v11.16b,  v8.16b, v24.16b
    sub       v13.16b,  v10.16b, v26.16b
    sub       v15.16b,  v12.16b, v28.16b
    sub       v17.16b,  v14.16b, v30.16b
    str q3, [x0, #512]
    str q5, [x0, #576]
    str q7, [x0, #640]
    str q9, [x0, #704]
    str q11, [x0, #768]
    str q13, [x0, #832]
    str q15, [x0, #896]
    str q17, [x0, #960]
    ext       v5.16b, v8.16b, v24.16b, #8
    neg       v15.16b, v24.16b
    ext       v3.16b, v15.16b, v8.16b, #8
    add       v7.16b,  v0.16b, v3.16b
    sub       v9.16b,  v5.16b, v16.16b
    sub       v11.16b,  v0.16b, v3.16b
    add       v13.16b,  v5.16b, v16.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #1024]
    str q9, [x0, #1040]
    str q11, [x0, #1280]
    str q13, [x0, #1296]
    neg       v15.16b,  v10.16b
    ext       v5.16b, v15.16b, v26.16b, #8
    ext       v3.16b, v26.16b, v10.16b, #8
    sub       v7.16b,  v2.16b, v3.16b
    add       v9.16b,  v18.16b, v5.16b
    add       v11.16b,  v2.16b, v3.16b
    sub       v13.16b,  v18.16b, v5.16b
    str q7, [x0, #1088]
    str q9, [x0, #1104]
    str q11, [x0, #1344]
    str q13, [x0, #1360]
    ext       v3.16b, v28.16b, v12.16b, #8
    neg       v15.16b,  v28.16b
    ext       v5.16b, v12.16b, v15.16b, #8
    sub       v7.16b,  v3.16b, v4.16b
    add       v9.16b,  v20.16b, v5.16b
    add       v11.16b,  v3.16b, v4.16b
    neg       v11.16b,  v11.16b
    sub       v13.16b,  v20.16b, v5.16b
    str q7, [x0, #1152]
    str q9, [x0, #1168]
    str q11, [x0, #1408]
    str q13, [x0, #1424]
    ext       v5.16b, v14.16b, v30.16b, #8
    neg       v15.16b,  v30.16b
    ext       v3.16b, v15.16b, v14.16b, #8
    add       v7.16b,  v6.16b, v3.16b
    sub       v9.16b,  v5.16b, v22.16b
    sub       v11.16b,  v6.16b, v3.16b
    add       v13.16b,  v5.16b, v22.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #1216]
    str q9, [x0, #1232]
    str q11, [x0, #1472]
    str q13, [x0, #1488]
    ext       v5.16b, v24.16b, v8.16b, #8
    neg       v15.16b,  v8.16b
    ext       v3.16b, v15.16b, v24.16b, #8
    add       v7.16b,  v0.16b, v3.16b
    add       v9.16b,  v16.16b, v5.16b
    sub       v11.16b,  v0.16b, v3.16b
    sub       v13.16b,  v16.16b, v5.16b
    str q7, [x0, #1536]
    str q9, [x0, #1552]
    str q11, [x0, #1792]
    str q13, [x0, #1808]
    ext       v3.16b, v10.16b, v26.16b, #8
    neg       v15.16b,  v10.16b
    ext       v5.16b, v26.16b, v15.16b, #8
    add       v7.16b,  v2.16b, v3.16b
    sub       v9.16b,  v5.16b, v18.16b
    sub       v11.16b,  v2.16b, v3.16b
    add       v13.16b,  v5.16b, v18.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #1600]
    str q9, [x0, #1616]
    str q11, [x0, #1856]
    str q13, [x0, #1872]
    ext       v3.16b, v12.16b, v28.16b, #8
    neg       v15.16b,  v28.16b
    ext       v5.16b, v15.16b, v12.16b, #8
    add       v7.16b,  v4.16b, v3.16b
    neg       v7.16b,  v7.16b
    sub       v9.16b,  v5.16b, v20.16b
    sub       v11.16b,  v3.16b, v4.16b
    add       v13.16b,  v5.16b, v20.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #1664]
    str q9, [x0, #1680]
    str q11, [x0, #1920]
    str q13, [x0, #1936]
    ext       v5.16b, v30.16b, v14.16b, #8
    neg       v15.16b,  v14.16b
    ext       v3.16b, v15.16b, v30.16b, #8
    add       v7.16b,  v6.16b, v3.16b
    add       v9.16b,  v22.16b, v5.16b
    sub       v11.16b,  v6.16b, v3.16b
    sub       v13.16b,  v22.16b, v5.16b
    ldr q0, [x0, #0]
    str q7, [x0, #1728]
    ldr q2, [x0, #64]
    str q9, [x0, #1744]
    ldr q4, [x0, #128]
    str q11, [x0, #1984]
    ldr q6, [x0, #192]
    str q13, [x0, #2000]
    add       v3.16b,  v0.16b, v4.16b
    add       v5.16b,  v2.16b, v6.16b
    saddl     v23.8h,  v3.8b,   v5.8b
    saddl2    v25.8h,  v3.16b,  v5.16b
    ssubl     v27.8h,  v3.8b,   v5.8b
    ssubl2    v29.8h,  v3.16b,  v5.16b
    str q23, [x0, #0]
    str q25, [x0, #16]
    str q27, [x0, #64]
    str q29, [x0, #80]
    ssubl        v23.8h, v0.8b, v4.8b
    ssubl2       v25.8h, v0.16b, v4.16b
    ssubl        v27.8h, v2.8b, v6.8b
    ssubl2       v29.8h, v2.16b, v6.16b
    str q23, [x0, #128]
    str q25, [x0, #144]
    str q27, [x0, #160]
    str q29, [x0, #176]
    ldr q0, [x0, #256]
    str q23, [x0, #192]
    ldr q2, [x0, #320]
    ldr q4, [x0, #384]
    str q25, [x0, #208]
    neg       v27.8h,  v27.8h
    neg       v29.8h,  v29.8h
    ldr q6, [x0, #448]
    str q27, [x0, #224]
    str q29, [x0, #240]
    ext       v5.16b, v2.16b, v6.16b, #8
    neg       v8.16b,  v6.16b
    ext       v3.16b, v8.16b, v2.16b, #8
    saddl        v23.8h, v0.8b, v3.8b
    saddl2       v25.8h, v0.16b, v3.16b
    saddl        v27.8h, v4.8b, v5.8b
    saddl2       v29.8h, v4.16b, v5.16b
    str q23, [x0, #256]
    str q25, [x0, #272]
    str q27, [x0, #288]
    str q29, [x0, #304]
    ssubl        v23.8h, v0.8b, v3.8b
    ssubl2       v25.8h, v0.16b, v3.16b
    ssubl        v27.8h, v4.8b, v5.8b
    ssubl2       v29.8h, v4.16b, v5.16b
    str q23, [x0, #320]
    str q25, [x0, #336]
    str q27, [x0, #352]
    str q29, [x0, #368]
    ext       v9.16b, v6.16b, v2.16b, #8
    neg       v8.16b,  v2.16b
    ext       v7.16b, v8.16b, v6.16b, #8
    saddl        v23.8h, v0.8b, v7.8b
    saddl2       v25.8h, v0.16b, v7.16b
    ssubl        v27.8h, v9.8b, v4.8b
    ssubl2       v29.8h, v9.16b, v4.16b
    ldr q8, [x0, #768]
    str q23, [x0, #384]
    ldr q10, [x0, #832]
    str q25, [x0, #400]
    ldr q12, [x0, #896]
    str q27, [x0, #416]
    ldr q14, [x0, #960]
    str q29, [x0, #432]
    ssubl        v23.8h, v0.8b, v7.8b
    ssubl2       v25.8h, v0.16b, v7.16b
    saddl        v27.8h, v4.8b, v9.8b
    saddl2       v29.8h, v4.16b, v9.16b
    neg       v27.8h,  v27.8h
    neg       v29.8h,  v29.8h
    ldr q0, [x0, #512]
    str q23, [x0, #448]
    ldr q2, [x0, #576]
    str q25, [x0, #464]
    ldr q4, [x0, #640]
    str q27, [x0, #480]
    ldr q6, [x0, #704]
    str q29, [x0, #496]
    neg       v11.16b,  v12.16b
    ext       v3.16b,  v11.16b, v4.16b, #8
    ext       v5.16b, v4.16b, v12.16b, #8
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v11.16b, v6.16b, #8
    ext       v9.16b,  v6.16b, v14.16b, #8
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v8.16b, v5.16b
    add       v20.16b,  v2.16b, v7.16b
    add       v22.16b,  v10.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v8.16b, v5.16b
    sub       v28.16b,  v2.16b, v7.16b
    sub       v30.16b,  v10.16b, v9.16b
    ext       v5.16b,  v20.16b, v22.16b, #12
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #12
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #12
    ext       v9.16b,  v11.16b, v28.16b, #12
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #512]
    str q25, [x0, #528]
    str q27, [x0, #576]
    str q29, [x0, #592]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #544]
    str q25, [x0, #560]
    str q27, [x0, #608]
    str q29, [x0, #624]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    str q23, [x0, #704]
    str q25, [x0, #720]
    str q27, [x0, #640]
    str q29, [x0, #656]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    str q23, [x0, #672]
    str q25, [x0, #688]
    str q27, [x0, #736]
    str q29, [x0, #752]
    neg       v11.16b,  v4.16b
    ext       v3.16b,  v11.16b, v12.16b, #8
    ext       v5.16b,  v12.16b, v4.16b, #8
    neg       v11.16b,  v6.16b
    ext       v7.16b,  v11.16b, v14.16b, #8
    ext       v9.16b,  v14.16b, v6.16b, #8
    add       v16.16b,   v0.16b, v3.16b
    sub       v18.16b,   v5.16b, v8.16b
    add       v20.16b,  v2.16b, v7.16b
    sub       v22.16b,  v9.16b, v10.16b
    sub       v24.16b,  v0.16b, v3.16b
    add       v26.16b,  v5.16b, v8.16b
    neg       v26.16b,  v26.16b
    sub       v28.16b,  v2.16b, v7.16b
    add       v30.16b,  v9.16b, v10.16b
    neg       v30.16b,  v30.16b
    ext       v5.16b,  v20.16b, v22.16b, #4
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #4
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #4
    ext       v9.16b,  v11.16b, v28.16b, #4
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #768]
    str q25, [x0, #784]
    str q27, [x0, #832]
    str q29, [x0, #848]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #800]
    str q25, [x0, #816]
    str q27, [x0, #864]
    str q29, [x0, #880]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #1024]
    str q23, [x0, #960]
    ldr q2, [x0, #1040]
    str q25, [x0, #976]
    ldr q4, [x0, #1088]
    str q27, [x0, #896]
    ldr q6, [x0, #1104]
    str q29, [x0, #912]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #1152]
    str q23, [x0, #928]
    ldr q10, [x0, #1168]
    str q25, [x0, #944]
    ldr q12, [x0, #1216]
    str q27, [x0, #992]
    ldr q14, [x0, #1232]
    str q29, [x0, #1008]
    neg       v11.16b,  v10.16b
    ext       v3.16b,  v11.16b, v8.16b, #12
    ext       v5.16b, v8.16b, v10.16b, #12
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v11.16b, v12.16b, #12
    ext       v9.16b,  v12.16b, v14.16b, #12
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    add       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    sub       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #14
    ext       v5.16b,  v20.16b, v22.16b, #14
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #14
    ext       v9.16b,  v11.16b, v28.16b, #14
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #1024]
    str q25, [x0, #1040]
    str q27, [x0, #1088]
    str q29, [x0, #1104]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #1056]
    str q25, [x0, #1072]
    str q27, [x0, #1120]
    str q29, [x0, #1136]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #1280]
    str q23, [x0, #1216]
    ldr q2, [x0, #1296]
    str q25, [x0, #1232]
    ldr q4, [x0, #1344]
    str q27, [x0, #1152]
    ldr q6, [x0, #1360]
    str q29, [x0, #1168]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #1408]
    str q23, [x0, #1184]
    ldr q10, [x0, #1424]
    str q25, [x0, #1200]
    ldr q12, [x0, #1472]
    str q27, [x0, #1248]
    ldr q14, [x0, #1488]
    str q29, [x0, #1264]
    neg       v11.16b,  v10.16b
    ext       v3.16b,  v8.16b, v10.16b, #12
    ext       v5.16b, v11.16b, v8.16b, #12
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v12.16b, v14.16b, #12
    ext       v9.16b,  v11.16b, v12.16b, #12
    sub       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    sub       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    add       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    add       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #6
    ext       v5.16b,  v20.16b, v22.16b, #6
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #6
    ext       v9.16b,  v11.16b, v28.16b, #6
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #1280]
    str q25, [x0, #1296]
    str q27, [x0, #1344]
    str q29, [x0, #1360]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #1312]
    str q25, [x0, #1328]
    str q27, [x0, #1376]
    str q29, [x0, #1392]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #1536]
    str q23, [x0, #1472]
    ldr q2, [x0, #1552]
    str q25, [x0, #1488]
    ldr q4, [x0, #1600]
    str q27, [x0, #1408]
    ldr q6, [x0, #1616]
    str q29, [x0, #1424]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #1664]
    str q23, [x0, #1440]
    ldr q10, [x0, #1680]
    str q25, [x0, #1456]
    ldr q12, [x0, #1728]
    str q27, [x0, #1504]
    ldr q14, [x0, #1744]
    str q29, [x0, #1520]
    neg       v11.16b,  v10.16b
    ext       v3.16b, v11.16b, v8.16b, #4
    ext       v5.16b, v8.16b,  v10.16b, #4
    neg       v11.16b,  v14.16b
    ext       v7.16b, v11.16b, v12.16b, #4
    ext       v9.16b, v12.16b,  v14.16b, #4
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    add       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    sub       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #10
    ext       v5.16b,  v20.16b, v22.16b, #10
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #10
    ext       v9.16b,  v11.16b, v28.16b, #10
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #1536]
    str q25, [x0, #1552]
    str q27, [x0, #1600]
    str q29, [x0, #1616]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #1568]
    str q25, [x0, #1584]
    str q27, [x0, #1632]
    str q29, [x0, #1648]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #1792]
    str q23, [x0, #1728]
    ldr q2, [x0, #1808]
    str q25, [x0, #1744]
    ldr q4, [x0, #1856]
    str q27, [x0, #1664]
    ldr q6, [x0, #1872]
    str q29, [x0, #1680]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #1920]
    str q23, [x0, #1696]
    ldr q10, [x0, #1936]
    str q25, [x0, #1712]
    ldr q12, [x0, #1984]
    str q27, [x0, #1760]
    ldr q14, [x0, #2000]
    str q29, [x0, #1776]
    neg       v11.16b,  v10.16b
    ext       v3.16b, v8.16b,  v10.16b, #4
    ext       v5.16b, v11.16b, v8.16b, #4
    neg       v11.16b,  v14.16b
    ext       v7.16b, v12.16b,  v14.16b, #4
    ext       v9.16b, v11.16b,  v12.16b, #4
    sub       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    sub       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    add       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    add       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #2
    ext       v5.16b,  v20.16b, v22.16b, #2
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #2
    ext       v9.16b,  v11.16b, v28.16b, #2
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #1792]
    str q25, [x0, #1808]
    str q27, [x0, #1856]
    str q29, [x0, #1872]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #1824]
    str q25, [x0, #1840]
    str q27, [x0, #1888]
    str q29, [x0, #1904]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    str q23, [x0, #1984]
    str q25, [x0, #2000]
    str q27, [x0, #1920]
    str q29, [x0, #1936]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    str q23, [x0, #1952]
    str q25, [x0, #1968]
    str q27, [x0, #2016]
    str q29, [x0, #2032]
    ldr q0, [x1, #256]
    ldr q2, [x1, #16]
    ldr q4, [x1, #544]
    ldr q6, [x1, #304]
    ldr q8, [x1, #64]
    ldr q10, [x1, #592]
    ldr q12, [x1, #352]
    ldr q14, [x1, #112]
    ldr q16, [x1, #640]
    ldr q18, [x1, #400]
    ldr q20, [x1, #160]
    ldr q22, [x1, #688]
    ldr q24, [x1, #448]
    ldr q26, [x1, #208]
    ldr q28, [x1, #736]
    ldr q30, [x1, #496]
    movi  v31.16b, #0

    add       v3.16b,  v0.16b, v16.16b
    add       v5.16b,  v2.16b, v18.16b
    add       v11.16b,  v8.16b, v24.16b
    add       v13.16b,  v10.16b, v26.16b
    add       v7.16b,  v3.16b, v11.16b
    add       v9.16b,  v5.16b, v13.16b
    sub       v15.16b,  v3.16b, v11.16b
    sub       v17.16b,  v5.16b, v13.16b
    str q7, [x0, #2048]
    str q9, [x0, #2112]
    str q15, [x0, #2304]
    str q17, [x0, #2368]
    add       v7.16b,  v4.16b, v20.16b
    add       v9.16b,  v6.16b, v22.16b
    add       v15.16b,  v12.16b, v28.16b
    add       v17.16b,  v14.16b, v30.16b
    add       v3.16b,  v7.16b, v15.16b
    add       v5.16b,  v9.16b, v17.16b
    sub       v11.16b,  v7.16b, v15.16b
    sub       v13.16b,  v9.16b, v17.16b
    str q3, [x0, #2176]
    str q5, [x0, #2240]
    str q11, [x0, #2432]
    str q13, [x0, #2496]
    sub       v3.16b,  v0.16b, v16.16b
    sub       v5.16b,  v2.16b, v18.16b
    sub       v7.16b,  v4.16b, v20.16b
    sub       v9.16b,  v6.16b, v22.16b
    sub       v11.16b,  v8.16b, v24.16b
    sub       v13.16b,  v10.16b, v26.16b
    sub       v15.16b,  v12.16b, v28.16b
    sub       v17.16b,  v14.16b, v30.16b
    str q3, [x0, #2560]
    str q5, [x0, #2624]
    str q7, [x0, #2688]
    str q9, [x0, #2752]
    str q11, [x0, #2816]
    str q13, [x0, #2880]
    str q15, [x0, #2944]
    str q17, [x0, #3008]
    neg       v15.16b,  v24.16b
    ext       v3.16b,  v24.16b, v8.16b, #8
    ext       v5.16b,  v8.16b, v15.16b, #8
    sub       v7.16b,  v3.16b, v0.16b
    add       v9.16b,  v5.16b, v16.16b
    add       v11.16b,  v0.16b, v3.16b
    neg       v11.16b,  v11.16b
    sub       v13.16b,  v16.16b, v5.16b
    str q7, [x0, #3072]
    str q9, [x0, #3088]
    str q11, [x0, #3328]
    str q13, [x0, #3344]
    neg       v15.16b,  v26.16b
    ext       v3.16b,  v15.16b, v10.16b, #8
    ext       v5.16b,  v10.16b,  v26.16b, #8
    add       v7.16b,  v2.16b,  v3.16b
    sub       v9.16b,  v5.16b, v18.16b
    sub       v11.16b,  v2.16b,  v3.16b
    add       v13.16b,  v5.16b, v18.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #3136]
    str q9, [x0, #3152]
    str q11, [x0, #3392]
    str q13, [x0, #3408]
    neg       v15.16b,  v12.16b
    ext       v3.16b,  v28.16b, v12.16b,  #8
    ext       v5.16b,  v15.16b, v28.16b, #8
    sub       v7.16b,  v4.16b,  v3.16b
    add       v9.16b,  v20.16b, v5.16b
    add       v11.16b,  v3.16b, v4.16b
    sub       v13.16b,  v20.16b, v5.16b
    str q7, [x0, #3200]
    str q9, [x0, #3216]
    str q11, [x0, #3456]
    str q13, [x0, #3472]
    ext       v3.16b,  v30.16b, v14.16b,  #8
    neg       v15.16b,  v30.16b
    ext       v5.16b,  v14.16b,  v15.16b, #8
    sub       v7.16b,  v3.16b, v6.16b
    add       v9.16b,  v5.16b, v22.16b
    add       v11.16b,  v6.16b,  v3.16b
    neg       v11.16b,  v11.16b
    sub       v13.16b,  v22.16b, v5.16b
    str q7, [x0, #3264]
    str q9, [x0, #3280]
    str q11, [x0, #3520]
    str q13, [x0, #3536]
    ext       v3.16b,  v8.16b,  v24.16b, #8
    neg       v15.16b,  v24.16b
    ext       v5.16b,  v15.16b, v8.16b, #8
    add       v7.16b,  v3.16b, v0.16b
    neg       v7.16b,  v7.16b
    sub       v9.16b,  v5.16b, v16.16b
    sub       v11.16b,  v3.16b, v0.16b
    add       v13.16b,  v16.16b,  v5.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #3584]
    str q9, [x0, #3600]
    str q11, [x0, #3840]
    str q13, [x0, #3856]
    neg       v15.16b,  v10.16b
    ext       v3.16b,  v15.16b, v26.16b, #8
    ext       v5.16b,  v26.16b, v10.16b, #8
    add       v7.16b,  v2.16b,  v3.16b
    add       v9.16b,  v5.16b, v18.16b
    sub       v11.16b,  v2.16b,  v3.16b
    sub       v13.16b,  v18.16b,  v5.16b
    str q7, [x0, #3648]
    str q9, [x0, #3664]
    str q11, [x0, #3904]
    str q13, [x0, #3920]
    ext       v3.16b,  v12.16b,  v28.16b, #8
    neg       v15.16b,  v12.16b
    ext       v5.16b,  v28.16b, v15.16b, #8
    add       v7.16b,  v4.16b,  v3.16b
    sub       v9.16b,  v5.16b, v20.16b
    sub       v11.16b,  v4.16b,  v3.16b
    add       v13.16b,  v5.16b, v20.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #3712]
    str q9, [x0, #3728]
    str q11, [x0, #3968]
    str q13, [x0, #3984]
    ext       v3.16b,  v14.16b,  v30.16b, #8
    neg       v15.16b,  v30.16b
    ext       v5.16b,  v15.16b, v14.16b,  #8
    add       v7.16b,  v3.16b, v6.16b
    neg       v7.16b,  v7.16b
    sub       v9.16b,  v5.16b, v22.16b
    sub       v11.16b,  v3.16b, v6.16b
    add       v13.16b,  v22.16b, v5.16b
    neg       v13.16b,  v13.16b
    ldr q0, [x0, #2048]
    str q7, [x0, #3776]
    ldr q2, [x0, #2112]
    str q9, [x0, #3792]
    ldr q4, [x0, #2176]
    str q11, [x0, #4032]
    ldr q6, [x0, #2240]
    str q13, [x0, #4048]
    add       v3.16b,  v0.16b, v4.16b
    add       v5.16b,  v2.16b, v6.16b
    saddl     v23.8h,  v3.8b,   v5.8b
    saddl2    v25.8h,  v3.16b,  v5.16b
    ssubl     v27.8h,  v3.8b,   v5.8b
    ssubl2    v29.8h,  v3.16b,  v5.16b
    str q23, [x0, #2048]
    str q25, [x0, #2064]
    str q27, [x0, #2112]
    str q29, [x0, #2128]
    ssubl        v23.8h, v0.8b, v4.8b
    ssubl2       v25.8h, v0.16b, v4.16b
    ssubl        v27.8h, v2.8b, v6.8b
    ssubl2       v29.8h, v2.16b, v6.16b
    str q23, [x0, #2176]
    str q25, [x0, #2192]
    str q27, [x0, #2208]
    str q29, [x0, #2224]
    ldr q0, [x0, #2304]
    str q23, [x0, #2240]
    ldr q2, [x0, #2368]
    ldr q4, [x0, #2432]
    str q25, [x0, #2256]
    neg       v27.8h,  v27.8h
    neg       v29.8h,  v29.8h
    ldr q6, [x0, #2496]
    str q27, [x0, #2272]
    str q29, [x0, #2288]
    ext       v5.16b, v2.16b, v6.16b, #8
    neg       v8.16b,  v6.16b
    ext       v3.16b, v8.16b, v2.16b, #8
    saddl        v23.8h, v0.8b, v3.8b
    saddl2       v25.8h, v0.16b, v3.16b
    saddl        v27.8h, v4.8b, v5.8b
    saddl2       v29.8h, v4.16b, v5.16b
    str q23, [x0, #2304]
    str q25, [x0, #2320]
    str q27, [x0, #2336]
    str q29, [x0, #2352]
    ssubl        v23.8h, v0.8b, v3.8b
    ssubl2       v25.8h, v0.16b, v3.16b
    ssubl        v27.8h, v4.8b, v5.8b
    ssubl2       v29.8h, v4.16b, v5.16b
    str q23, [x0, #2368]
    str q25, [x0, #2384]
    str q27, [x0, #2400]
    str q29, [x0, #2416]
    ext       v9.16b, v6.16b, v2.16b, #8
    neg       v8.16b,  v2.16b
    ext       v7.16b, v8.16b, v6.16b, #8
    saddl        v23.8h, v0.8b, v7.8b
    saddl2       v25.8h, v0.16b, v7.16b
    ssubl        v27.8h, v9.8b, v4.8b
    ssubl2       v29.8h, v9.16b, v4.16b
    ldr q8, [x0, #2816]
    str q23, [x0, #2432]
    ldr q10, [x0, #2880]
    str q25, [x0, #2448]
    ldr q12, [x0, #2944]
    str q27, [x0, #2464]
    ldr q14, [x0, #3008]
    str q29, [x0, #2480]
    ssubl        v23.8h, v0.8b, v7.8b
    ssubl2       v25.8h, v0.16b, v7.16b
    saddl        v27.8h, v4.8b, v9.8b
    saddl2       v29.8h, v4.16b, v9.16b
    neg       v27.8h,  v27.8h
    neg       v29.8h,  v29.8h
    ldr q0, [x0, #2560]
    str q23, [x0, #2496]
    ldr q2, [x0, #2624]
    str q25, [x0, #2512]
    ldr q4, [x0, #2688]
    str q27, [x0, #2528]
    ldr q6, [x0, #2752]
    str q29, [x0, #2544]
    neg       v11.16b,  v12.16b
    ext       v3.16b,  v11.16b, v4.16b, #8
    ext       v5.16b, v4.16b, v12.16b, #8
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v11.16b, v6.16b, #8
    ext       v9.16b,  v6.16b, v14.16b, #8
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v8.16b, v5.16b
    add       v20.16b,  v2.16b, v7.16b
    add       v22.16b,  v10.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v8.16b, v5.16b
    sub       v28.16b,  v2.16b, v7.16b
    sub       v30.16b,  v10.16b, v9.16b
    ext       v5.16b,  v20.16b, v22.16b, #12
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #12
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #12
    ext       v9.16b,  v11.16b, v28.16b, #12
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #2560]
    str q25, [x0, #2576]
    str q27, [x0, #2624]
    str q29, [x0, #2640]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #2592]
    str q25, [x0, #2608]
    str q27, [x0, #2656]
    str q29, [x0, #2672]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    str q23, [x0, #2752]
    str q25, [x0, #2768]
    str q27, [x0, #2688]
    str q29, [x0, #2704]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    str q23, [x0, #2720]
    str q25, [x0, #2736]
    str q27, [x0, #2784]
    str q29, [x0, #2800]
    neg       v11.16b,  v4.16b
    ext       v3.16b,  v11.16b, v12.16b, #8
    ext       v5.16b,  v12.16b, v4.16b, #8
    neg       v11.16b,  v6.16b
    ext       v7.16b,  v11.16b, v14.16b, #8
    ext       v9.16b,  v14.16b, v6.16b, #8
    add       v16.16b,   v0.16b, v3.16b
    sub       v18.16b,   v5.16b, v8.16b
    add       v20.16b,  v2.16b, v7.16b
    sub       v22.16b,  v9.16b, v10.16b
    sub       v24.16b,  v0.16b, v3.16b
    add       v26.16b,  v5.16b, v8.16b
    neg       v26.16b,  v26.16b
    sub       v28.16b,  v2.16b, v7.16b
    add       v30.16b,  v9.16b, v10.16b
    neg       v30.16b,  v30.16b
    ext       v5.16b,  v20.16b, v22.16b, #4
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #4
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #4
    ext       v9.16b,  v11.16b, v28.16b, #4
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #2816]
    str q25, [x0, #2832]
    str q27, [x0, #2880]
    str q29, [x0, #2896]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #2848]
    str q25, [x0, #2864]
    str q27, [x0, #2912]
    str q29, [x0, #2928]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #3072]
    str q23, [x0, #3008]
    ldr q2, [x0, #3088]
    str q25, [x0, #3024]
    ldr q4, [x0, #3136]
    str q27, [x0, #2944]
    ldr q6, [x0, #3152]
    str q29, [x0, #2960]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #3200]
    str q23, [x0, #2976]
    ldr q10, [x0, #3216]
    str q25, [x0, #2992]
    ldr q12, [x0, #3264]
    str q27, [x0, #3040]
    ldr q14, [x0, #3280]
    str q29, [x0, #3056]
    neg       v11.16b,  v10.16b
    ext       v3.16b,  v11.16b, v8.16b, #12
    ext       v5.16b, v8.16b, v10.16b, #12
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v11.16b, v12.16b, #12
    ext       v9.16b,  v12.16b, v14.16b, #12
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    add       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    sub       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #14
    ext       v5.16b,  v20.16b, v22.16b, #14
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #14
    ext       v9.16b,  v11.16b, v28.16b, #14
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #3072]
    str q25, [x0, #3088]
    str q27, [x0, #3136]
    str q29, [x0, #3152]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #3104]
    str q25, [x0, #3120]
    str q27, [x0, #3168]
    str q29, [x0, #3184]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #3328]
    str q23, [x0, #3264]
    ldr q2, [x0, #3344]
    str q25, [x0, #3280]
    ldr q4, [x0, #3392]
    str q27, [x0, #3200]
    ldr q6, [x0, #3408]
    str q29, [x0, #3216]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #3456]
    str q23, [x0, #3232]
    ldr q10, [x0, #3472]
    str q25, [x0, #3248]
    ldr q12, [x0, #3520]
    str q27, [x0, #3296]
    ldr q14, [x0, #3536]
    str q29, [x0, #3312]
    neg       v11.16b,  v10.16b
    ext       v3.16b,  v8.16b, v10.16b, #12
    ext       v5.16b, v11.16b, v8.16b, #12
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v12.16b, v14.16b, #12
    ext       v9.16b,  v11.16b, v12.16b, #12
    sub       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    sub       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    add       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    add       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #6
    ext       v5.16b,  v20.16b, v22.16b, #6
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #6
    ext       v9.16b,  v11.16b, v28.16b, #6
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #3328]
    str q25, [x0, #3344]
    str q27, [x0, #3392]
    str q29, [x0, #3408]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #3360]
    str q25, [x0, #3376]
    str q27, [x0, #3424]
    str q29, [x0, #3440]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #3584]
    str q23, [x0, #3520]
    ldr q2, [x0, #3600]
    str q25, [x0, #3536]
    ldr q4, [x0, #3648]
    str q27, [x0, #3456]
    ldr q6, [x0, #3664]
    str q29, [x0, #3472]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #3712]
    str q23, [x0, #3488]
    ldr q10, [x0, #3728]
    str q25, [x0, #3504]
    ldr q12, [x0, #3776]
    str q27, [x0, #3552]
    ldr q14, [x0, #3792]
    str q29, [x0, #3568]
    neg       v11.16b,  v10.16b
    ext       v3.16b, v11.16b, v8.16b, #4
    ext       v5.16b, v8.16b,  v10.16b, #4
    neg       v11.16b,  v14.16b
    ext       v7.16b, v11.16b, v12.16b, #4
    ext       v9.16b, v12.16b,  v14.16b, #4
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    add       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    sub       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #10
    ext       v5.16b,  v20.16b, v22.16b, #10
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #10
    ext       v9.16b,  v11.16b, v28.16b, #10
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #3584]
    str q25, [x0, #3600]
    str q27, [x0, #3648]
    str q29, [x0, #3664]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #3616]
    str q25, [x0, #3632]
    str q27, [x0, #3680]
    str q29, [x0, #3696]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #3840]
    str q23, [x0, #3776]
    ldr q2, [x0, #3856]
    str q25, [x0, #3792]
    ldr q4, [x0, #3904]
    str q27, [x0, #3712]
    ldr q6, [x0, #3920]
    str q29, [x0, #3728]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #3968]
    str q23, [x0, #3744]
    ldr q10, [x0, #3984]
    str q25, [x0, #3760]
    ldr q12, [x0, #4032]
    str q27, [x0, #3808]
    ldr q14, [x0, #4048]
    str q29, [x0, #3824]
    neg       v11.16b,  v10.16b
    ext       v3.16b, v8.16b,  v10.16b, #4
    ext       v5.16b, v11.16b, v8.16b, #4
    neg       v11.16b,  v14.16b
    ext       v7.16b, v12.16b,  v14.16b, #4
    ext       v9.16b, v11.16b,  v12.16b, #4
    sub       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    sub       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    add       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    add       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #2
    ext       v5.16b,  v20.16b, v22.16b, #2
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #2
    ext       v9.16b,  v11.16b, v28.16b, #2
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #3840]
    str q25, [x0, #3856]
    str q27, [x0, #3904]
    str q29, [x0, #3920]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #3872]
    str q25, [x0, #3888]
    str q27, [x0, #3936]
    str q29, [x0, #3952]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    str q23, [x0, #4032]
    str q25, [x0, #4048]
    str q27, [x0, #3968]
    str q29, [x0, #3984]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    str q23, [x0, #4000]
    str q25, [x0, #4016]
    str q27, [x0, #4064]
    str q29, [x0, #4080]
    ldr q0, [x1, #512]
    ldr q2, [x1, #272]
    ldr q4, [x1, #32]
    ldr q6, [x1, #560]
    ldr q8, [x1, #320]
    ldr q10, [x1, #80]
    ldr q12, [x1, #608]
    ldr q14, [x1, #368]
    ldr q16, [x1, #128]
    ldr q18, [x1, #656]
    ldr q20, [x1, #416]
    ldr q22, [x1, #176]
    ldr q24, [x1, #704]
    ldr q26, [x1, #464]
    ldr q28, [x1, #224]
    mov    v30.16b,  v31.16b
    ldr    d30, [x1, #752]
    ldr    w4, [x1, #760]
    mov    v30.B[8],  w4

    add       v3.16b,  v0.16b, v16.16b
    add       v5.16b,  v2.16b, v18.16b
    add       v11.16b,  v8.16b, v24.16b
    add       v13.16b,  v10.16b, v26.16b
    add       v7.16b,  v3.16b, v11.16b
    add       v9.16b,  v5.16b, v13.16b
    sub       v15.16b,  v3.16b, v11.16b
    sub       v17.16b,  v5.16b, v13.16b
    str q7, [x0, #4096]
    str q9, [x0, #4160]
    str q15, [x0, #4352]
    str q17, [x0, #4416]
    add       v7.16b,  v4.16b, v20.16b
    add       v9.16b,  v6.16b, v22.16b
    add       v15.16b,  v12.16b, v28.16b
    add       v17.16b,  v14.16b, v30.16b
    add       v3.16b,  v7.16b, v15.16b
    add       v5.16b,  v9.16b, v17.16b
    sub       v11.16b,  v7.16b, v15.16b
    sub       v13.16b,  v9.16b, v17.16b
    str q3, [x0, #4224]
    str q5, [x0, #4288]
    str q11, [x0, #4480]
    str q13, [x0, #4544]
    sub       v3.16b,  v0.16b, v16.16b
    sub       v5.16b,  v2.16b, v18.16b
    sub       v7.16b,  v4.16b, v20.16b
    sub       v9.16b,  v6.16b, v22.16b
    sub       v11.16b,  v8.16b, v24.16b
    sub       v13.16b,  v10.16b, v26.16b
    sub       v15.16b,  v12.16b, v28.16b
    sub       v17.16b,  v14.16b, v30.16b
    str q3, [x0, #4608]
    str q5, [x0, #4672]
    str q7, [x0, #4736]
    str q9, [x0, #4800]
    str q11, [x0, #4864]
    str q13, [x0, #4928]
    str q15, [x0, #4992]
    str q17, [x0, #5056]
    neg       v15.16b,  v8.16b
    ext       v3.16b,  v24.16b, v8.16b,  #8
    ext       v5.16b,  v15.16b, v24.16b, #8
    sub       v7.16b,  v0.16b, v3.16b
    add       v9.16b,  v16.16b, v5.16b
    add       v11.16b,  v0.16b, v3.16b
    sub       v13.16b,  v16.16b, v5.16b
    str q7, [x0, #5120]
    str q9, [x0, #5136]
    str q11, [x0, #5376]
    str q13, [x0, #5392]
    neg       v15.16b,  v26.16b
    ext       v3.16b,  v26.16b, v10.16b, #8
    ext       v5.16b,  v10.16b,  v15.16b, #8
    sub       v7.16b,  v3.16b, v2.16b
    add       v9.16b,  v5.16b, v18.16b
    add       v11.16b,  v2.16b,  v3.16b
    neg       v11.16b,  v11.16b
    sub       v13.16b,  v18.16b,  v5.16b
    str q7, [x0, #5184]
    str q9, [x0, #5200]
    str q11, [x0, #5440]
    str q13, [x0, #5456]
    neg       v15.16b,  v28.16b
    ext       v3.16b,  v15.16b, v12.16b,  #8
    ext       v5.16b,  v12.16b,  v28.16b, #8
    add       v7.16b,  v4.16b,  v3.16b
    sub       v9.16b,  v5.16b, v20.16b
    sub       v11.16b,  v4.16b,  v3.16b
    add       v13.16b,  v20.16b, v5.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #5248]
    str q9, [x0, #5264]
    str q11, [x0, #5504]
    str q13, [x0, #5520]
    ext       v3.16b,  v30.16b, v14.16b,  #8
    neg       v15.16b,  v14.16b
    ext       v5.16b,  v15.16b, v30.16b, #8
    sub       v7.16b,  v6.16b,  v3.16b
    add       v9.16b,  v22.16b, v5.16b
    add       v11.16b,  v6.16b,  v3.16b
    sub       v13.16b,  v22.16b, v5.16b
    str q7, [x0, #5312]
    str q9, [x0, #5328]
    str q11, [x0, #5568]
    str q13, [x0, #5584]
    ext       v3.16b,  v8.16b,  v24.16b, #8
    neg       v15.16b,  v8.16b
    ext       v5.16b,  v24.16b, v15.16b, #8
    add       v7.16b,  v0.16b,  v3.16b
    sub       v9.16b,  v5.16b, v16.16b
    sub       v11.16b,  v0.16b,  v3.16b
    add       v13.16b,  v16.16b,  v5.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #5632]
    str q9, [x0, #5648]
    str q11, [x0, #5888]
    str q13, [x0, #5904]
    neg       v15.16b,  v26.16b
    ext       v3.16b,  v10.16b,  v26.16b, #8
    ext       v5.16b,  v15.16b, v10.16b, #8
    add       v7.16b,  v2.16b,  v3.16b
    neg       v7.16b,  v7.16b
    sub       v9.16b,  v5.16b, v18.16b
    sub       v11.16b,  v3.16b, v2.16b
    add       v13.16b,  v18.16b,  v5.16b
    neg       v13.16b,  v13.16b
    str q7, [x0, #5696]
    str q9, [x0, #5712]
    str q11, [x0, #5952]
    str q13, [x0, #5968]
    neg       v15.16b,  v12.16b
    ext       v3.16b,  v15.16b, v28.16b, #8
    ext       v5.16b,  v28.16b, v12.16b, #8
    add       v7.16b,  v4.16b,  v3.16b
    add       v9.16b,  v20.16b, v5.16b
    sub       v11.16b,  v4.16b,  v3.16b
    sub       v13.16b,  v20.16b, v5.16b
    str q7, [x0, #5760]
    str q9, [x0, #5776]
    str q11, [x0, #6016]
    str q13, [x0, #6032]
    ext       v3.16b,  v14.16b,  v30.16b, #8
    neg       v15.16b,  v14.16b
    ext       v5.16b,  v30.16b, v15.16b,  #8
    add       v7.16b,  v6.16b,  v3.16b
    sub       v9.16b,  v5.16b, v22.16b
    sub       v11.16b,  v6.16b,  v3.16b
    add       v13.16b,  v22.16b, v5.16b
    neg       v13.16b,  v13.16b
    ldr q0, [x0, #4096]
    str q7, [x0, #5824]
    ldr q2, [x0, #4160]
    str q9, [x0, #5840]
    ldr q4, [x0, #4224]
    str q11, [x0, #6080]
    ldr q6, [x0, #4288]
    str q13, [x0, #6096]
    add       v3.16b,  v0.16b, v4.16b
    add       v5.16b,  v2.16b, v6.16b
    saddl     v23.8h,  v3.8b,   v5.8b
    saddl2    v25.8h,  v3.16b,  v5.16b
    ssubl     v27.8h,  v3.8b,   v5.8b
    ssubl2    v29.8h,  v3.16b,  v5.16b
    str q23, [x0, #4096]
    str q25, [x0, #4112]
    str q27, [x0, #4160]
    str q29, [x0, #4176]
    ssubl        v23.8h, v0.8b, v4.8b
    ssubl2       v25.8h, v0.16b, v4.16b
    ssubl        v27.8h, v2.8b, v6.8b
    ssubl2       v29.8h, v2.16b, v6.16b
    str q23, [x0, #4224]
    str q25, [x0, #4240]
    str q27, [x0, #4256]
    str q29, [x0, #4272]
    ldr q0, [x0, #4352]
    str q23, [x0, #4288]
    ldr q2, [x0, #4416]
    ldr q4, [x0, #4480]
    str q25, [x0, #4304]
    neg       v27.8h,  v27.8h
    neg       v29.8h,  v29.8h
    ldr q6, [x0, #4544]
    str q27, [x0, #4320]
    str q29, [x0, #4336]
    ext       v5.16b, v2.16b, v6.16b, #8
    neg       v8.16b,  v6.16b
    ext       v3.16b, v8.16b, v2.16b, #8
    saddl        v23.8h, v0.8b, v3.8b
    saddl2       v25.8h, v0.16b, v3.16b
    saddl        v27.8h, v4.8b, v5.8b
    saddl2       v29.8h, v4.16b, v5.16b
    str q23, [x0, #4352]
    str q25, [x0, #4368]
    str q27, [x0, #4384]
    str q29, [x0, #4400]
    ssubl        v23.8h, v0.8b, v3.8b
    ssubl2       v25.8h, v0.16b, v3.16b
    ssubl        v27.8h, v4.8b, v5.8b
    ssubl2       v29.8h, v4.16b, v5.16b
    str q23, [x0, #4416]
    str q25, [x0, #4432]
    str q27, [x0, #4448]
    str q29, [x0, #4464]
    ext       v9.16b, v6.16b, v2.16b, #8
    neg       v8.16b,  v2.16b
    ext       v7.16b, v8.16b, v6.16b, #8
    saddl        v23.8h, v0.8b, v7.8b
    saddl2       v25.8h, v0.16b, v7.16b
    ssubl        v27.8h, v9.8b, v4.8b
    ssubl2       v29.8h, v9.16b, v4.16b
    ldr q8, [x0, #4864]
    str q23, [x0, #4480]
    ldr q10, [x0, #4928]
    str q25, [x0, #4496]
    ldr q12, [x0, #4992]
    str q27, [x0, #4512]
    ldr q14, [x0, #5056]
    str q29, [x0, #4528]
    ssubl        v23.8h, v0.8b, v7.8b
    ssubl2       v25.8h, v0.16b, v7.16b
    saddl        v27.8h, v4.8b, v9.8b
    saddl2       v29.8h, v4.16b, v9.16b
    neg       v27.8h,  v27.8h
    neg       v29.8h,  v29.8h
    ldr q0, [x0, #4608]
    str q23, [x0, #4544]
    ldr q2, [x0, #4672]
    str q25, [x0, #4560]
    ldr q4, [x0, #4736]
    str q27, [x0, #4576]
    ldr q6, [x0, #4800]
    str q29, [x0, #4592]
    neg       v11.16b,  v12.16b
    ext       v3.16b,  v11.16b, v4.16b, #8
    ext       v5.16b, v4.16b, v12.16b, #8
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v11.16b, v6.16b, #8
    ext       v9.16b,  v6.16b, v14.16b, #8
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v8.16b, v5.16b
    add       v20.16b,  v2.16b, v7.16b
    add       v22.16b,  v10.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v8.16b, v5.16b
    sub       v28.16b,  v2.16b, v7.16b
    sub       v30.16b,  v10.16b, v9.16b
    ext       v5.16b,  v20.16b, v22.16b, #12
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #12
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #12
    ext       v9.16b,  v11.16b, v28.16b, #12
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #4608]
    str q25, [x0, #4624]
    str q27, [x0, #4672]
    str q29, [x0, #4688]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #4640]
    str q25, [x0, #4656]
    str q27, [x0, #4704]
    str q29, [x0, #4720]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    str q23, [x0, #4800]
    str q25, [x0, #4816]
    str q27, [x0, #4736]
    str q29, [x0, #4752]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    str q23, [x0, #4768]
    str q25, [x0, #4784]
    str q27, [x0, #4832]
    str q29, [x0, #4848]
    neg       v11.16b,  v4.16b
    ext       v3.16b,  v11.16b, v12.16b, #8
    ext       v5.16b,  v12.16b, v4.16b, #8
    neg       v11.16b,  v6.16b
    ext       v7.16b,  v11.16b, v14.16b, #8
    ext       v9.16b,  v14.16b, v6.16b, #8
    add       v16.16b,   v0.16b, v3.16b
    sub       v18.16b,   v5.16b, v8.16b
    add       v20.16b,  v2.16b, v7.16b
    sub       v22.16b,  v9.16b, v10.16b
    sub       v24.16b,  v0.16b, v3.16b
    add       v26.16b,  v5.16b, v8.16b
    neg       v26.16b,  v26.16b
    sub       v28.16b,  v2.16b, v7.16b
    add       v30.16b,  v9.16b, v10.16b
    neg       v30.16b,  v30.16b
    ext       v5.16b,  v20.16b, v22.16b, #4
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #4
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #4
    ext       v9.16b,  v11.16b, v28.16b, #4
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #4864]
    str q25, [x0, #4880]
    str q27, [x0, #4928]
    str q29, [x0, #4944]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #4896]
    str q25, [x0, #4912]
    str q27, [x0, #4960]
    str q29, [x0, #4976]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #5120]
    str q23, [x0, #5056]
    ldr q2, [x0, #5136]
    str q25, [x0, #5072]
    ldr q4, [x0, #5184]
    str q27, [x0, #4992]
    ldr q6, [x0, #5200]
    str q29, [x0, #5008]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #5248]
    str q23, [x0, #5024]
    ldr q10, [x0, #5264]
    str q25, [x0, #5040]
    ldr q12, [x0, #5312]
    str q27, [x0, #5088]
    ldr q14, [x0, #5328]
    str q29, [x0, #5104]
    neg       v11.16b,  v10.16b
    ext       v3.16b,  v11.16b, v8.16b, #12
    ext       v5.16b, v8.16b, v10.16b, #12
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v11.16b, v12.16b, #12
    ext       v9.16b,  v12.16b, v14.16b, #12
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    add       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    sub       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #14
    ext       v5.16b,  v20.16b, v22.16b, #14
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #14
    ext       v9.16b,  v11.16b, v28.16b, #14
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #5120]
    str q25, [x0, #5136]
    str q27, [x0, #5184]
    str q29, [x0, #5200]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #5152]
    str q25, [x0, #5168]
    str q27, [x0, #5216]
    str q29, [x0, #5232]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #5376]
    str q23, [x0, #5312]
    ldr q2, [x0, #5392]
    str q25, [x0, #5328]
    ldr q4, [x0, #5440]
    str q27, [x0, #5248]
    ldr q6, [x0, #5456]
    str q29, [x0, #5264]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #5504]
    str q23, [x0, #5280]
    ldr q10, [x0, #5520]
    str q25, [x0, #5296]
    ldr q12, [x0, #5568]
    str q27, [x0, #5344]
    ldr q14, [x0, #5584]
    str q29, [x0, #5360]
    neg       v11.16b,  v10.16b
    ext       v3.16b,  v8.16b, v10.16b, #12
    ext       v5.16b, v11.16b, v8.16b, #12
    neg       v11.16b,  v14.16b
    ext       v7.16b,  v12.16b, v14.16b, #12
    ext       v9.16b,  v11.16b, v12.16b, #12
    sub       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    sub       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    add       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    add       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #6
    ext       v5.16b,  v20.16b, v22.16b, #6
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #6
    ext       v9.16b,  v11.16b, v28.16b, #6
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #5376]
    str q25, [x0, #5392]
    str q27, [x0, #5440]
    str q29, [x0, #5456]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #5408]
    str q25, [x0, #5424]
    str q27, [x0, #5472]
    str q29, [x0, #5488]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #5632]
    str q23, [x0, #5568]
    ldr q2, [x0, #5648]
    str q25, [x0, #5584]
    ldr q4, [x0, #5696]
    str q27, [x0, #5504]
    ldr q6, [x0, #5712]
    str q29, [x0, #5520]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #5760]
    str q23, [x0, #5536]
    ldr q10, [x0, #5776]
    str q25, [x0, #5552]
    ldr q12, [x0, #5824]
    str q27, [x0, #5600]
    ldr q14, [x0, #5840]
    str q29, [x0, #5616]
    neg       v11.16b,  v10.16b
    ext       v3.16b, v11.16b, v8.16b, #4
    ext       v5.16b, v8.16b,  v10.16b, #4
    neg       v11.16b,  v14.16b
    ext       v7.16b, v11.16b, v12.16b, #4
    ext       v9.16b, v12.16b,  v14.16b, #4
    add       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    add       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    sub       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    sub       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #10
    ext       v5.16b,  v20.16b, v22.16b, #10
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #10
    ext       v9.16b,  v11.16b, v28.16b, #10
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #5632]
    str q25, [x0, #5648]
    str q27, [x0, #5696]
    str q29, [x0, #5712]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #5664]
    str q25, [x0, #5680]
    str q27, [x0, #5728]
    str q29, [x0, #5744]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    ldr q0, [x0, #5888]
    str q23, [x0, #5824]
    ldr q2, [x0, #5904]
    str q25, [x0, #5840]
    ldr q4, [x0, #5952]
    str q27, [x0, #5760]
    ldr q6, [x0, #5968]
    str q29, [x0, #5776]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    ldr q8, [x0, #6016]
    str q23, [x0, #5792]
    ldr q10, [x0, #6032]
    str q25, [x0, #5808]
    ldr q12, [x0, #6080]
    str q27, [x0, #5856]
    ldr q14, [x0, #6096]
    str q29, [x0, #5872]
    neg       v11.16b,  v10.16b
    ext       v3.16b, v8.16b,  v10.16b, #4
    ext       v5.16b, v11.16b, v8.16b, #4
    neg       v11.16b,  v14.16b
    ext       v7.16b, v12.16b,  v14.16b, #4
    ext       v9.16b, v11.16b,  v12.16b, #4
    sub       v16.16b,   v0.16b, v3.16b
    add       v18.16b,   v2.16b, v5.16b
    sub       v20.16b,  v4.16b, v7.16b
    add       v22.16b,  v6.16b, v9.16b
    add       v24.16b,  v0.16b, v3.16b
    sub       v26.16b,  v2.16b, v5.16b
    add       v28.16b,  v4.16b, v7.16b
    sub       v30.16b,  v6.16b, v9.16b
    neg       v11.16b,  v22.16b
    ext       v3.16b,  v11.16b, v20.16b, #2
    ext       v5.16b,  v20.16b, v22.16b, #2
    neg       v11.16b,  v30.16b
    ext       v7.16b,  v28.16b, v30.16b, #2
    ext       v9.16b,  v11.16b, v28.16b, #2
    saddl        v23.8h, v16.8b,  v3.8b
    saddl2       v25.8h, v16.16b, v3.16b
    ssubl        v27.8h, v16.8b,  v3.8b
    ssubl2       v29.8h, v16.16b, v3.16b
    str q23, [x0, #5888]
    str q25, [x0, #5904]
    str q27, [x0, #5952]
    str q29, [x0, #5968]
    saddl        v23.8h, v18.8b,  v5.8b
    saddl2       v25.8h, v18.16b, v5.16b
    ssubl        v27.8h, v18.8b,  v5.8b
    ssubl2       v29.8h, v18.16b, v5.16b
    str q23, [x0, #5920]
    str q25, [x0, #5936]
    str q27, [x0, #5984]
    str q29, [x0, #6000]
    saddl        v23.8h, v24.8b,  v7.8b
    saddl2       v25.8h, v24.16b, v7.16b
    ssubl        v27.8h, v24.8b,  v7.8b
    ssubl2       v29.8h, v24.16b, v7.16b
    str q23, [x0, #6080]
    str q25, [x0, #6096]
    str q27, [x0, #6016]
    str q29, [x0, #6032]
    saddl        v23.8h, v26.8b,  v9.8b
    saddl2       v25.8h, v26.16b, v9.16b
    ssubl        v27.8h, v26.8b,  v9.8b
    ssubl2       v29.8h, v26.16b, v9.16b
    str q23, [x0, #6048]
    str q25, [x0, #6064]
    str q27, [x0, #6112]
    str q29, [x0, #6128]
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
