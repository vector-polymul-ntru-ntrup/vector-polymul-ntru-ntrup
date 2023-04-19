.align 6
.global _NTT_inv
.global __NTT_inv
_NTT_inv:
__NTT_inv:
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
    mov v12.H[0], w4
    mov v12.H[1], w5
    movi  v31.8h, #0

    add    x8,  x1, 1792
    ld4   {v0.4s - v3.4s}, [x8]
    add    x8,  x1, 1856
    ld4   {v4.4s - v7.4s}, [x8]
    add    x8,  x1, 1920
    ld4   {v8.4s - v11.4s}, [x8]
    add    x8,  x1, 1984
    ld4   {v13.4s - v16.4s}, [x8]
    add v17.8h,  v2.8h,  v3.8h
    add v18.8h,  v6.8h,  v7.8h
    add v19.8h,  v10.8h,  v11.8h
    add v20.8h,  v15.8h,  v16.8h
    sub v3.8h,  v3.8h,  v2.8h
    sub v7.8h,  v7.8h,  v6.8h
    sub v11.8h,  v11.8h,  v10.8h
    sub v16.8h,  v16.8h,  v15.8h
    ext v6.16b,  v3.16b,  v7.16b,  #12
    ext v10.16b,  v7.16b,  v11.16b,  #12
    ext v15.16b,  v11.16b,  v16.16b,  #12
    neg v16.8h, v16.8h
    ext v2.16b,  v16.16b,  v3.16b,  #12
    add v3.8h,  v0.8h,  v1.8h
    add v7.8h,  v4.8h,  v5.8h
    add v11.8h,  v8.8h,  v9.8h
    add v16.8h,  v13.8h,  v14.8h
    sub v0.8h,  v1.8h,  v0.8h
    sub v4.8h,  v4.8h,  v5.8h
    sub v8.8h,  v8.8h,  v9.8h
    sub v13.8h,  v13.8h,  v14.8h
    ext v1.16b,  v4.16b,  v8.16b,  #12
    ext v5.16b,  v8.16b,  v13.16b,  #12
    ext v9.16b,  v13.16b,  v0.16b,  #12
    neg v4.8h, v4.8h
    ext v14.16b,  v0.16b,  v4.16b,  #12
    add v0.8h,  v3.8h,  v17.8h
    add v4.8h,  v7.8h,  v18.8h
    add v8.8h,  v11.8h,  v19.8h
    add v13.8h,  v16.8h,  v20.8h
    sub v17.8h,  v17.8h,  v3.8h
    sub v18.8h,  v18.8h,  v7.8h
    sub v19.8h,  v19.8h,  v11.8h
    sub v20.8h,  v20.8h,  v16.8h
    ext v7.16b,  v17.16b,  v18.16b,  #8
    ext v11.16b,  v18.16b,  v19.16b,  #8
    ext v16.16b,  v19.16b,  v20.16b,  #8
    neg v20.8h, v20.8h
    ext v3.16b,  v20.16b,  v17.16b,  #8
    add v17.8h,  v1.8h,  v2.8h
    add v18.8h,  v5.8h,  v6.8h
    add v19.8h,  v9.8h,  v10.8h
    add v20.8h,  v14.8h,  v15.8h
    sub v2.8h,  v2.8h,  v1.8h
    sub v6.8h,  v6.8h,  v5.8h
    sub v10.8h,  v10.8h,  v9.8h
    sub v15.8h,  v15.8h,  v14.8h
    ext v5.16b,  v2.16b,  v6.16b,  #8
    ext v9.16b,  v6.16b,  v10.16b,  #8
    ext v14.16b,  v10.16b,  v15.16b,  #8
    neg v15.8h, v15.8h
    ext v1.16b,  v15.16b,  v2.16b,  #8
    str q0, [x0, #1792]
    str q1, [x0, #1984]
    str q3, [x0, #1920]
    add    x8,  x1, 1536
    ld4   {v0.4s - v3.4s}, [x8]
    str q4, [x0, #1808]
    str q5, [x0, #2000]
    str q7, [x0, #1936]
    add    x8,  x1, 1600
    ld4   {v4.4s - v7.4s}, [x8]
    str q8, [x0, #1824]
    str q9, [x0, #2016]
    str q11, [x0, #1952]
    add    x8,  x1, 1664
    ld4   {v8.4s - v11.4s}, [x8]
    str q13, [x0, #1840]
    str q14, [x0, #2032]
    str q16, [x0, #1968]
    add    x8,  x1, 1728
    ld4   {v13.4s - v16.4s}, [x8]
    str q17, [x0, #1856]
    str q18, [x0, #1872]
    str q19, [x0, #1888]
    str q20, [x0, #1904]
    add v17.8h,  v2.8h,  v3.8h
    add v18.8h,  v6.8h,  v7.8h
    add v19.8h,  v10.8h,  v11.8h
    add v20.8h,  v15.8h,  v16.8h
    sub v3.8h,  v3.8h,  v2.8h
    sub v7.8h,  v7.8h,  v6.8h
    sub v11.8h,  v11.8h,  v10.8h
    sub v16.8h,  v15.8h,  v16.8h
    ext v6.16b,  v16.16b,  v3.16b,  #12
    ext v10.16b,  v3.16b,  v7.16b,  #12
    ext v15.16b,  v7.16b,  v11.16b,  #12
    neg v11.8h, v11.8h
    ext v2.16b,  v11.16b,  v16.16b,  #12
    add v3.8h,  v0.8h,  v1.8h
    add v7.8h,  v4.8h,  v5.8h
    add v11.8h,  v8.8h,  v9.8h
    add v16.8h,  v13.8h,  v14.8h
    sub v0.8h,  v0.8h,  v1.8h
    sub v4.8h,  v4.8h,  v5.8h
    sub v8.8h,  v8.8h,  v9.8h
    sub v13.8h,  v13.8h,  v14.8h
    ext v1.16b,  v0.16b,  v4.16b,  #12
    ext v5.16b,  v4.16b,  v8.16b,  #12
    ext v9.16b,  v8.16b,  v13.16b,  #12
    neg v0.8h, v0.8h
    ext v14.16b,  v13.16b,  v0.16b,  #12
    add v0.8h,  v3.8h,  v17.8h
    add v4.8h,  v7.8h,  v18.8h
    add v8.8h,  v11.8h,  v19.8h
    add v13.8h,  v16.8h,  v20.8h
    sub v17.8h,  v17.8h,  v3.8h
    sub v18.8h,  v7.8h,  v18.8h
    sub v19.8h,  v11.8h,  v19.8h
    sub v20.8h,  v16.8h,  v20.8h
    ext v3.16b,  v18.16b,  v19.16b,  #8
    ext v7.16b,  v19.16b,  v20.16b,  #8
    ext v11.16b,  v20.16b,  v17.16b,  #8
    neg v18.8h, v18.8h
    ext v16.16b,  v17.16b,  v18.16b,  #8
    add v17.8h,  v1.8h,  v2.8h
    add v18.8h,  v5.8h,  v6.8h
    add v19.8h,  v9.8h,  v10.8h
    add v20.8h,  v14.8h,  v15.8h
    sub v2.8h,  v2.8h,  v1.8h
    sub v6.8h,  v5.8h,  v6.8h
    sub v10.8h,  v9.8h,  v10.8h
    sub v15.8h,  v14.8h,  v15.8h
    ext v1.16b,  v6.16b,  v10.16b,  #8
    ext v5.16b,  v10.16b,  v15.16b,  #8
    ext v9.16b,  v15.16b,  v2.16b,  #8
    neg v6.8h, v6.8h
    ext v14.16b,  v2.16b,  v6.16b,  #8
    str q0, [x0, #1536]
    str q1, [x0, #1728]
    str q3, [x0, #1664]
    add    x8,  x1, 1280
    ld4   {v0.4s - v3.4s}, [x8]
    str q4, [x0, #1552]
    str q5, [x0, #1744]
    str q7, [x0, #1680]
    add    x8,  x1, 1344
    ld4   {v4.4s - v7.4s}, [x8]
    str q8, [x0, #1568]
    str q9, [x0, #1760]
    str q11, [x0, #1696]
    add    x8,  x1, 1408
    ld4   {v8.4s - v11.4s}, [x8]
    str q13, [x0, #1584]
    str q14, [x0, #1776]
    str q16, [x0, #1712]
    add    x8,  x1, 1472
    ld4   {v13.4s - v16.4s}, [x8]
    str q17, [x0, #1600]
    str q18, [x0, #1616]
    str q19, [x0, #1632]
    str q20, [x0, #1648]
    add v17.8h,  v2.8h,  v3.8h
    add v18.8h,  v6.8h,  v7.8h
    add v19.8h,  v10.8h,  v11.8h
    add v20.8h,  v15.8h,  v16.8h
    sub v3.8h,  v3.8h,  v2.8h
    sub v7.8h,  v7.8h,  v6.8h
    sub v11.8h,  v11.8h,  v10.8h
    sub v16.8h,  v16.8h,  v15.8h
    ext v6.16b,  v3.16b,  v7.16b,  #4
    ext v10.16b,  v7.16b,  v11.16b,  #4
    ext v15.16b,  v11.16b,  v16.16b,  #4
    neg v16.8h, v16.8h
    ext v2.16b,  v16.16b,  v3.16b,  #4
    add v3.8h,  v0.8h,  v1.8h
    add v7.8h,  v4.8h,  v5.8h
    add v11.8h,  v8.8h,  v9.8h
    add v16.8h,  v13.8h,  v14.8h
    sub v0.8h,  v1.8h,  v0.8h
    sub v4.8h,  v4.8h,  v5.8h
    sub v8.8h,  v8.8h,  v9.8h
    sub v13.8h,  v13.8h,  v14.8h
    ext v1.16b,  v4.16b,  v8.16b,  #4
    ext v5.16b,  v8.16b,  v13.16b,  #4
    ext v9.16b,  v13.16b,  v0.16b,  #4
    neg v4.8h, v4.8h
    ext v14.16b,  v0.16b,  v4.16b,  #4
    add v0.8h,  v3.8h,  v17.8h
    add v4.8h,  v7.8h,  v18.8h
    add v8.8h,  v11.8h,  v19.8h
    add v13.8h,  v16.8h,  v20.8h
    sub v17.8h,  v17.8h,  v3.8h
    sub v18.8h,  v18.8h,  v7.8h
    sub v19.8h,  v11.8h,  v19.8h
    sub v20.8h,  v16.8h,  v20.8h
    ext v3.16b,  v19.16b,  v20.16b,  #8
    ext v7.16b,  v20.16b,  v17.16b,  #8
    ext v11.16b,  v17.16b,  v18.16b,  #8
    neg v19.8h, v19.8h
    ext v16.16b,  v18.16b,  v19.16b,  #8
    add v17.8h,  v1.8h,  v2.8h
    add v18.8h,  v5.8h,  v6.8h
    add v19.8h,  v9.8h,  v10.8h
    add v20.8h,  v14.8h,  v15.8h
    sub v2.8h,  v2.8h,  v1.8h
    sub v6.8h,  v6.8h,  v5.8h
    sub v10.8h,  v9.8h,  v10.8h
    sub v15.8h,  v14.8h,  v15.8h
    ext v1.16b,  v10.16b,  v15.16b,  #8
    ext v5.16b,  v15.16b,  v2.16b,  #8
    ext v9.16b,  v2.16b,  v6.16b,  #8
    neg v10.8h, v10.8h
    ext v14.16b,  v6.16b,  v10.16b,  #8
    str q0, [x0, #1280]
    str q1, [x0, #1472]
    str q3, [x0, #1408]
    add    x8,  x1, 1024
    ld4   {v0.4s - v3.4s}, [x8]
    str q4, [x0, #1296]
    str q5, [x0, #1488]
    str q7, [x0, #1424]
    add    x8,  x1, 1088
    ld4   {v4.4s - v7.4s}, [x8]
    str q8, [x0, #1312]
    str q9, [x0, #1504]
    str q11, [x0, #1440]
    add    x8,  x1, 1152
    ld4   {v8.4s - v11.4s}, [x8]
    str q13, [x0, #1328]
    str q14, [x0, #1520]
    str q16, [x0, #1456]
    add    x8,  x1, 1216
    ld4   {v13.4s - v16.4s}, [x8]
    str q17, [x0, #1344]
    str q18, [x0, #1360]
    str q19, [x0, #1376]
    str q20, [x0, #1392]
    add v17.8h,  v2.8h,  v3.8h
    add v18.8h,  v6.8h,  v7.8h
    add v19.8h,  v10.8h,  v11.8h
    add v20.8h,  v15.8h,  v16.8h
    sub v3.8h,  v3.8h,  v2.8h
    sub v7.8h,  v7.8h,  v6.8h
    sub v11.8h,  v10.8h,  v11.8h
    sub v16.8h,  v15.8h,  v16.8h
    ext v2.16b,  v11.16b,  v16.16b,  #4
    ext v6.16b,  v16.16b,  v3.16b,  #4
    ext v10.16b,  v3.16b,  v7.16b,  #4
    neg v11.8h, v11.8h
    ext v15.16b,  v7.16b,  v11.16b,  #4
    add v3.8h,  v0.8h,  v1.8h
    add v7.8h,  v4.8h,  v5.8h
    add v11.8h,  v8.8h,  v9.8h
    add v16.8h,  v13.8h,  v14.8h
    sub v0.8h,  v0.8h,  v1.8h
    sub v4.8h,  v4.8h,  v5.8h
    sub v8.8h,  v8.8h,  v9.8h
    sub v13.8h,  v13.8h,  v14.8h
    ext v1.16b,  v0.16b,  v4.16b,  #4
    ext v5.16b,  v4.16b,  v8.16b,  #4
    ext v9.16b,  v8.16b,  v13.16b,  #4
    neg v0.8h, v0.8h
    ext v14.16b,  v13.16b,  v0.16b,  #4
    add v0.8h,  v3.8h,  v17.8h
    add v4.8h,  v7.8h,  v18.8h
    add v8.8h,  v11.8h,  v19.8h
    add v13.8h,  v16.8h,  v20.8h
    sub v17.8h,  v3.8h,  v17.8h
    sub v18.8h,  v7.8h,  v18.8h
    sub v19.8h,  v11.8h,  v19.8h
    sub v20.8h,  v16.8h,  v20.8h
    ext v3.16b,  v17.16b,  v18.16b,  #8
    ext v7.16b,  v18.16b,  v19.16b,  #8
    ext v11.16b,  v19.16b,  v20.16b,  #8
    neg v17.8h, v17.8h
    ext v16.16b,  v20.16b,  v17.16b,  #8
    add v17.8h,  v1.8h,  v2.8h
    add v18.8h,  v5.8h,  v6.8h
    add v19.8h,  v9.8h,  v10.8h
    add v20.8h,  v14.8h,  v15.8h
    sub v2.8h,  v1.8h,  v2.8h
    sub v6.8h,  v5.8h,  v6.8h
    sub v10.8h,  v9.8h,  v10.8h
    sub v15.8h,  v14.8h,  v15.8h
    ext v1.16b,  v2.16b,  v6.16b,  #8
    ext v5.16b,  v6.16b,  v10.16b,  #8
    ext v9.16b,  v10.16b,  v15.16b,  #8
    neg v2.8h, v2.8h
    ext v14.16b,  v15.16b,  v2.16b,  #8
    str q0, [x0, #1024]
    str q1, [x0, #1216]
    str q3, [x0, #1152]
    add    x8,  x1, 768
    ld4   {v0.4s - v3.4s}, [x8]
    str q4, [x0, #1040]
    str q5, [x0, #1232]
    str q7, [x0, #1168]
    add    x8,  x1, 832
    ld4   {v4.4s - v7.4s}, [x8]
    str q8, [x0, #1056]
    str q9, [x0, #1248]
    str q11, [x0, #1184]
    add    x8,  x1, 896
    ld4   {v8.4s - v11.4s}, [x8]
    str q13, [x0, #1072]
    str q14, [x0, #1264]
    str q16, [x0, #1200]
    add    x8,  x1, 960
    ld4   {v13.4s - v16.4s}, [x8]
    str q17, [x0, #1088]
    str q18, [x0, #1104]
    str q19, [x0, #1120]
    str q20, [x0, #1136]
    add v17.8h,  v2.8h,  v3.8h
    add v18.8h,  v6.8h,  v7.8h
    add v19.8h,  v10.8h,  v11.8h
    add v20.8h,  v15.8h,  v16.8h
    sub v3.8h,  v3.8h,  v2.8h
    sub v7.8h,  v7.8h,  v6.8h
    sub v11.8h,  v11.8h,  v10.8h
    sub v16.8h,  v15.8h,  v16.8h
    ext v2.16b,  v16.16b,  v3.16b,  #8
    ext v6.16b,  v3.16b,  v7.16b,  #8
    ext v10.16b,  v7.16b,  v11.16b,  #8
    neg v16.8h, v16.8h
    ext v15.16b,  v11.16b,  v16.16b,  #8
    add v3.8h,  v0.8h,  v1.8h
    add v7.8h,  v4.8h,  v5.8h
    add v11.8h,  v8.8h,  v9.8h
    add v16.8h,  v13.8h,  v14.8h
    sub v0.8h,  v1.8h,  v0.8h
    sub v4.8h,  v4.8h,  v5.8h
    sub v8.8h,  v8.8h,  v9.8h
    sub v13.8h,  v13.8h,  v14.8h
    ext v1.16b,  v4.16b,  v8.16b,  #8
    ext v5.16b,  v8.16b,  v13.16b,  #8
    ext v9.16b,  v13.16b,  v0.16b,  #8
    neg v4.8h, v4.8h
    ext v14.16b,  v0.16b,  v4.16b,  #8
    sub v0.8h,  v16.8h,  v20.8h
    sub v4.8h,  v17.8h,  v3.8h
    sub v8.8h,  v18.8h,  v7.8h
    sub v13.8h,  v19.8h,  v11.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    sub v17.8h,  v14.8h,  v15.8h
    sub v18.8h,  v2.8h,  v1.8h
    sub v19.8h,  v6.8h,  v5.8h
    sub v20.8h,  v10.8h,  v9.8h
    add v1.8h,  v1.8h,  v2.8h
    add v5.8h,  v5.8h,  v6.8h
    add v9.8h,  v9.8h,  v10.8h
    add v14.8h,  v14.8h,  v15.8h
    str q0, [x0, #896]
    str q1, [x0, #832]
    str q3, [x0, #768]
    add    x8,  x1, 512
    ld4   {v0.4s - v3.4s}, [x8]
    str q4, [x0, #912]
    str q5, [x0, #848]
    str q7, [x0, #784]
    add    x8,  x1, 576
    ld4   {v4.4s - v7.4s}, [x8]
    str q8, [x0, #928]
    str q9, [x0, #864]
    str q11, [x0, #800]
    add    x8,  x1, 640
    ld4   {v8.4s - v11.4s}, [x8]
    str q13, [x0, #944]
    str q14, [x0, #880]
    str q16, [x0, #816]
    add    x8,  x1, 704
    ld4   {v13.4s - v16.4s}, [x8]
    str q17, [x0, #960]
    str q18, [x0, #976]
    str q19, [x0, #992]
    str q20, [x0, #1008]
    add v17.8h,  v2.8h,  v3.8h
    add v18.8h,  v6.8h,  v7.8h
    add v19.8h,  v10.8h,  v11.8h
    add v20.8h,  v15.8h,  v16.8h
    sub v3.8h,  v3.8h,  v2.8h
    sub v7.8h,  v7.8h,  v6.8h
    sub v11.8h,  v10.8h,  v11.8h
    sub v16.8h,  v15.8h,  v16.8h
    ext v2.16b,  v11.16b,  v16.16b,  #8
    ext v6.16b,  v16.16b,  v3.16b,  #8
    ext v10.16b,  v3.16b,  v7.16b,  #8
    neg v11.8h, v11.8h
    ext v15.16b,  v7.16b,  v11.16b,  #8
    add v3.8h,  v0.8h,  v1.8h
    add v7.8h,  v4.8h,  v5.8h
    add v11.8h,  v8.8h,  v9.8h
    add v16.8h,  v13.8h,  v14.8h
    sub v0.8h,  v0.8h,  v1.8h
    sub v4.8h,  v4.8h,  v5.8h
    sub v8.8h,  v8.8h,  v9.8h
    sub v13.8h,  v13.8h,  v14.8h
    ext v1.16b,  v0.16b,  v4.16b,  #8
    ext v5.16b,  v4.16b,  v8.16b,  #8
    ext v9.16b,  v8.16b,  v13.16b,  #8
    neg v0.8h, v0.8h
    ext v14.16b,  v13.16b,  v0.16b,  #8
    sub v0.8h,  v7.8h,  v18.8h
    sub v4.8h,  v11.8h,  v19.8h
    sub v8.8h,  v16.8h,  v20.8h
    sub v13.8h,  v17.8h,  v3.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    sub v17.8h,  v5.8h,  v6.8h
    sub v18.8h,  v9.8h,  v10.8h
    sub v19.8h,  v14.8h,  v15.8h
    sub v20.8h,  v2.8h,  v1.8h
    add v1.8h,  v1.8h,  v2.8h
    add v5.8h,  v5.8h,  v6.8h
    add v9.8h,  v9.8h,  v10.8h
    add v14.8h,  v14.8h,  v15.8h
    str q0, [x0, #640]
    str q1, [x0, #576]
    str q3, [x0, #512]
    add    x8,  x1, 256
    ld4   {v0.4s - v3.4s}, [x8]
    str q4, [x0, #656]
    str q5, [x0, #592]
    str q7, [x0, #528]
    add    x8,  x1, 320
    ld4   {v4.4s - v7.4s}, [x8]
    str q8, [x0, #672]
    str q9, [x0, #608]
    str q11, [x0, #544]
    add    x8,  x1, 384
    ld4   {v8.4s - v11.4s}, [x8]
    str q13, [x0, #688]
    str q14, [x0, #624]
    str q16, [x0, #560]
    add    x8,  x1, 448
    ld4   {v13.4s - v16.4s}, [x8]
    str q17, [x0, #704]
    str q18, [x0, #720]
    str q19, [x0, #736]
    str q20, [x0, #752]
    sub v17.8h,  v15.8h,  v16.8h
    sub v18.8h,  v3.8h,  v2.8h
    sub v19.8h,  v7.8h,  v6.8h
    sub v20.8h,  v11.8h,  v10.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v4.8h,  v5.8h
    sub v7.8h,  v8.8h,  v9.8h
    sub v11.8h,  v13.8h,  v14.8h
    sub v16.8h,  v1.8h,  v0.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v8.8h,  v10.8h
    sub v5.8h,  v13.8h,  v15.8h
    sub v9.8h,  v2.8h,  v0.8h
    sub v14.8h,  v6.8h,  v4.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v11.8h,  v19.8h
    sub v6.8h,  v16.8h,  v20.8h
    sub v10.8h,  v17.8h,  v3.8h
    sub v15.8h,  v18.8h,  v7.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #256]
    str q1, [x0, #384]
    str q2, [x0, #448]
    str q3, [x0, #320]
    add    x8,  x1, 0
    ld4   {v0.4s - v3.4s}, [x8]
    str q4, [x0, #272]
    str q5, [x0, #400]
    str q6, [x0, #464]
    str q7, [x0, #336]
    add    x8,  x1, 64
    ld4   {v4.4s - v7.4s}, [x8]
    str q8, [x0, #288]
    str q9, [x0, #416]
    str q10, [x0, #480]
    str q11, [x0, #352]
    add    x8,  x1, 128
    ld4   {v8.4s - v11.4s}, [x8]
    str q13, [x0, #304]
    str q14, [x0, #432]
    str q15, [x0, #496]
    str q16, [x0, #368]
    add    x8,  x1, 192
    ld4   {v13.4s - v16.4s}, [x8]
    sub v17.8h,  v10.8h,  v11.8h
    sub v18.8h,  v15.8h,  v16.8h
    sub v19.8h,  v3.8h,  v2.8h
    sub v20.8h,  v7.8h,  v6.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v0.8h,  v1.8h
    sub v7.8h,  v4.8h,  v5.8h
    sub v11.8h,  v8.8h,  v9.8h
    sub v16.8h,  v13.8h,  v14.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v0.8h,  v2.8h
    sub v5.8h,  v4.8h,  v6.8h
    sub v9.8h,  v8.8h,  v10.8h
    sub v14.8h,  v13.8h,  v15.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v3.8h,  v17.8h
    sub v6.8h,  v7.8h,  v18.8h
    sub v10.8h,  v11.8h,  v19.8h
    sub v15.8h,  v16.8h,  v20.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q1, [x0, #128]
    ldr q1, [x0, #1280]
    sqdmulh  v21.8h, v1.8h, v12.H[1]
    str q0, [x0, #0]
    ldr q0, [x0, #1024]
    srshr    v21.8h, v21.8h, #12
    mls      v1.8h, v21.8h, v12.H[0]
    str q2, [x0, #192]
    ldr q2, [x0, #1536]
    sqdmulh  v22.8h, v2.8h, v12.H[1]
    str q3, [x0, #64]
    ldr q3, [x0, #1792]
    srshr    v22.8h, v22.8h, #12
    mls      v2.8h, v22.8h, v12.H[0]
    str q4, [x0, #16]
    ldr q4, [x0, #1040]
    sqdmulh  v23.8h, v3.8h, v12.H[1]
    str q5, [x0, #144]
    ldr q5, [x0, #1296]
    srshr    v23.8h, v23.8h, #12
    mls      v3.8h, v23.8h, v12.H[0]
    str q6, [x0, #208]
    ldr q6, [x0, #1552]
    sqdmulh  v24.8h, v5.8h, v12.H[1]
    str q7, [x0, #80]
    ldr q7, [x0, #1808]
    srshr    v24.8h, v24.8h, #12
    mls      v5.8h, v24.8h, v12.H[0]
    str q8, [x0, #32]
    ldr q8, [x0, #1056]
    sqdmulh  v25.8h, v6.8h, v12.H[1]
    str q9, [x0, #160]
    ldr q9, [x0, #1312]
    srshr    v25.8h, v25.8h, #12
    mls      v6.8h, v25.8h, v12.H[0]
    str q10, [x0, #224]
    ldr q10, [x0, #1568]
    sqdmulh  v26.8h, v7.8h, v12.H[1]
    str q11, [x0, #96]
    ldr q11, [x0, #1824]
    srshr    v26.8h, v26.8h, #12
    mls      v7.8h, v26.8h, v12.H[0]
    str q13, [x0, #48]
    ldr q13, [x0, #1072]
    sqdmulh  v27.8h, v9.8h, v12.H[1]
    str q14, [x0, #176]
    ldr q14, [x0, #1328]
    srshr    v27.8h, v27.8h, #12
    mls      v9.8h, v27.8h, v12.H[0]
    str q15, [x0, #240]
    ldr q15, [x0, #1584]
    sqdmulh  v28.8h, v10.8h, v12.H[1]
    str q16, [x0, #112]
    ldr q16, [x0, #1840]
    srshr    v28.8h, v28.8h, #12
    mls      v10.8h, v28.8h, v12.H[0]
    sqdmulh  v29.8h, v11.8h, v12.H[1]
    srshr    v29.8h, v29.8h, #12
    mls      v11.8h, v29.8h, v12.H[0]
    sqdmulh  v30.8h, v14.8h, v12.H[1]
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v12.H[0]
    sqdmulh  v21.8h, v15.8h, v12.H[1]
    srshr    v21.8h, v21.8h, #12
    mls      v15.8h, v21.8h, v12.H[0]
    sqdmulh  v22.8h, v16.8h, v12.H[1]
    srshr    v22.8h, v22.8h, #12
    mls      v16.8h, v22.8h, v12.H[0]
    sub v17.8h,  v15.8h,  v16.8h
    sub v18.8h,  v3.8h,  v2.8h
    sub v19.8h,  v7.8h,  v6.8h
    sub v20.8h,  v11.8h,  v10.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v4.8h,  v5.8h
    sub v7.8h,  v8.8h,  v9.8h
    sub v11.8h,  v13.8h,  v14.8h
    sub v16.8h,  v1.8h,  v0.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v8.8h,  v10.8h
    sub v5.8h,  v13.8h,  v15.8h
    sub v9.8h,  v2.8h,  v0.8h
    sub v14.8h,  v6.8h,  v4.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v11.8h,  v19.8h
    sub v6.8h,  v16.8h,  v20.8h
    sub v10.8h,  v17.8h,  v3.8h
    sub v15.8h,  v18.8h,  v7.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #1024]
    ldr q0, [x0, #1088]
    str q1, [x0, #1536]
    ldr q1, [x0, #1344]
    sqdmulh  v21.8h, v1.8h, v12.H[1]
    srshr    v21.8h, v21.8h, #12
    mls      v1.8h, v21.8h, v12.H[0]
    str q2, [x0, #1792]
    ldr q2, [x0, #1600]
    str q3, [x0, #1280]
    ldr q3, [x0, #1856]
    str q4, [x0, #1040]
    ldr q4, [x0, #1104]
    sqdmulh  v22.8h, v2.8h, v12.H[1]
    srshr    v22.8h, v22.8h, #12
    mls      v2.8h, v22.8h, v12.H[0]
    str q5, [x0, #1552]
    ldr q5, [x0, #1360]
    str q6, [x0, #1808]
    ldr q6, [x0, #1616]
    sqdmulh  v23.8h, v3.8h, v12.H[1]
    srshr    v23.8h, v23.8h, #12
    mls      v3.8h, v23.8h, v12.H[0]
    sqdmulh  v24.8h, v5.8h, v12.H[1]
    str q7, [x0, #1296]
    ldr q7, [x0, #1872]
    srshr    v24.8h, v24.8h, #12
    mls      v5.8h, v24.8h, v12.H[0]
    str q8, [x0, #1056]
    ldr q8, [x0, #1120]
    sqdmulh  v25.8h, v6.8h, v12.H[1]
    str q9, [x0, #1568]
    ldr q9, [x0, #1376]
    srshr    v25.8h, v25.8h, #12
    mls      v6.8h, v25.8h, v12.H[0]
    str q10, [x0, #1824]
    ldr q10, [x0, #1632]
    sqdmulh  v26.8h, v7.8h, v12.H[1]
    str q13, [x0, #1072]
    ldr q13, [x0, #1136]
    srshr    v26.8h, v26.8h, #12
    mls      v7.8h, v26.8h, v12.H[0]
    str q11, [x0, #1312]
    ldr q11, [x0, #1888]
    sqdmulh  v27.8h, v9.8h, v12.H[1]
    str q14, [x0, #1584]
    ldr q14, [x0, #1392]
    srshr    v27.8h, v27.8h, #12
    mls      v9.8h, v27.8h, v12.H[0]
    str q16, [x0, #1328]
    ldr q16, [x0, #1904]
    sqdmulh  v28.8h, v10.8h, v12.H[1]
    str q15, [x0, #1840]
    ldr q15, [x0, #1648]
    srshr    v28.8h, v28.8h, #12
    mls      v10.8h, v28.8h, v12.H[0]
    sqdmulh  v29.8h, v11.8h, v12.H[1]
    srshr    v29.8h, v29.8h, #12
    mls      v11.8h, v29.8h, v12.H[0]
    sqdmulh  v30.8h, v14.8h, v12.H[1]
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v12.H[0]
    sqdmulh  v21.8h, v15.8h, v12.H[1]
    srshr    v21.8h, v21.8h, #12
    mls      v15.8h, v21.8h, v12.H[0]
    sqdmulh  v22.8h, v16.8h, v12.H[1]
    srshr    v22.8h, v22.8h, #12
    mls      v16.8h, v22.8h, v12.H[0]
    sub v17.8h,  v15.8h,  v16.8h
    sub v18.8h,  v3.8h,  v2.8h
    sub v19.8h,  v7.8h,  v6.8h
    sub v20.8h,  v11.8h,  v10.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v4.8h,  v5.8h
    sub v7.8h,  v8.8h,  v9.8h
    sub v11.8h,  v13.8h,  v14.8h
    sub v16.8h,  v1.8h,  v0.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v8.8h,  v10.8h
    sub v5.8h,  v13.8h,  v15.8h
    sub v9.8h,  v2.8h,  v0.8h
    sub v14.8h,  v6.8h,  v4.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v11.8h,  v19.8h
    sub v6.8h,  v16.8h,  v20.8h
    sub v10.8h,  v17.8h,  v3.8h
    sub v15.8h,  v18.8h,  v7.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #1088]
    ldr q0, [x0, #1152]
    str q1, [x0, #1600]
    ldr q1, [x0, #1408]
    sqdmulh  v21.8h, v1.8h, v12.H[1]
    srshr    v21.8h, v21.8h, #12
    mls      v1.8h, v21.8h, v12.H[0]
    str q2, [x0, #1856]
    ldr q2, [x0, #1664]
    str q3, [x0, #1344]
    ldr q3, [x0, #1920]
    str q4, [x0, #1104]
    ldr q4, [x0, #1168]
    sqdmulh  v22.8h, v2.8h, v12.H[1]
    srshr    v22.8h, v22.8h, #12
    mls      v2.8h, v22.8h, v12.H[0]
    str q5, [x0, #1616]
    ldr q5, [x0, #1424]
    str q6, [x0, #1872]
    ldr q6, [x0, #1680]
    sqdmulh  v23.8h, v3.8h, v12.H[1]
    srshr    v23.8h, v23.8h, #12
    mls      v3.8h, v23.8h, v12.H[0]
    sqdmulh  v24.8h, v5.8h, v12.H[1]
    str q7, [x0, #1360]
    ldr q7, [x0, #1936]
    srshr    v24.8h, v24.8h, #12
    mls      v5.8h, v24.8h, v12.H[0]
    str q8, [x0, #1120]
    ldr q8, [x0, #1184]
    sqdmulh  v25.8h, v6.8h, v12.H[1]
    str q9, [x0, #1632]
    ldr q9, [x0, #1440]
    srshr    v25.8h, v25.8h, #12
    mls      v6.8h, v25.8h, v12.H[0]
    str q10, [x0, #1888]
    ldr q10, [x0, #1696]
    sqdmulh  v26.8h, v7.8h, v12.H[1]
    str q13, [x0, #1136]
    ldr q13, [x0, #1200]
    srshr    v26.8h, v26.8h, #12
    mls      v7.8h, v26.8h, v12.H[0]
    str q11, [x0, #1376]
    ldr q11, [x0, #1952]
    sqdmulh  v27.8h, v9.8h, v12.H[1]
    str q14, [x0, #1648]
    ldr q14, [x0, #1456]
    srshr    v27.8h, v27.8h, #12
    mls      v9.8h, v27.8h, v12.H[0]
    str q16, [x0, #1392]
    ldr q16, [x0, #1968]
    sqdmulh  v28.8h, v10.8h, v12.H[1]
    str q15, [x0, #1904]
    ldr q15, [x0, #1712]
    srshr    v28.8h, v28.8h, #12
    mls      v10.8h, v28.8h, v12.H[0]
    sqdmulh  v29.8h, v11.8h, v12.H[1]
    srshr    v29.8h, v29.8h, #12
    mls      v11.8h, v29.8h, v12.H[0]
    sqdmulh  v30.8h, v14.8h, v12.H[1]
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v12.H[0]
    sqdmulh  v21.8h, v15.8h, v12.H[1]
    srshr    v21.8h, v21.8h, #12
    mls      v15.8h, v21.8h, v12.H[0]
    sqdmulh  v22.8h, v16.8h, v12.H[1]
    srshr    v22.8h, v22.8h, #12
    mls      v16.8h, v22.8h, v12.H[0]
    sub v17.8h,  v15.8h,  v16.8h
    sub v18.8h,  v3.8h,  v2.8h
    sub v19.8h,  v7.8h,  v6.8h
    sub v20.8h,  v11.8h,  v10.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v4.8h,  v5.8h
    sub v7.8h,  v8.8h,  v9.8h
    sub v11.8h,  v13.8h,  v14.8h
    sub v16.8h,  v1.8h,  v0.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v8.8h,  v10.8h
    sub v5.8h,  v13.8h,  v15.8h
    sub v9.8h,  v2.8h,  v0.8h
    sub v14.8h,  v6.8h,  v4.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v11.8h,  v19.8h
    sub v6.8h,  v16.8h,  v20.8h
    sub v10.8h,  v17.8h,  v3.8h
    sub v15.8h,  v18.8h,  v7.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #1152]
    ldr q0, [x0, #1216]
    str q1, [x0, #1664]
    ldr q1, [x0, #1472]
    sqdmulh  v21.8h, v1.8h, v12.H[1]
    srshr    v21.8h, v21.8h, #12
    mls      v1.8h, v21.8h, v12.H[0]
    str q2, [x0, #1920]
    ldr q2, [x0, #1728]
    str q3, [x0, #1408]
    ldr q3, [x0, #1984]
    str q4, [x0, #1168]
    ldr q4, [x0, #1232]
    sqdmulh  v22.8h, v2.8h, v12.H[1]
    srshr    v22.8h, v22.8h, #12
    mls      v2.8h, v22.8h, v12.H[0]
    str q5, [x0, #1680]
    ldr q5, [x0, #1488]
    str q6, [x0, #1936]
    ldr q6, [x0, #1744]
    sqdmulh  v23.8h, v3.8h, v12.H[1]
    srshr    v23.8h, v23.8h, #12
    mls      v3.8h, v23.8h, v12.H[0]
    sqdmulh  v24.8h, v5.8h, v12.H[1]
    str q7, [x0, #1424]
    ldr q7, [x0, #2000]
    srshr    v24.8h, v24.8h, #12
    mls      v5.8h, v24.8h, v12.H[0]
    str q8, [x0, #1184]
    ldr q8, [x0, #1248]
    sqdmulh  v25.8h, v6.8h, v12.H[1]
    str q9, [x0, #1696]
    ldr q9, [x0, #1504]
    srshr    v25.8h, v25.8h, #12
    mls      v6.8h, v25.8h, v12.H[0]
    str q10, [x0, #1952]
    ldr q10, [x0, #1760]
    sqdmulh  v26.8h, v7.8h, v12.H[1]
    str q13, [x0, #1200]
    ldr q13, [x0, #1264]
    srshr    v26.8h, v26.8h, #12
    mls      v7.8h, v26.8h, v12.H[0]
    str q11, [x0, #1440]
    ldr q11, [x0, #2016]
    sqdmulh  v27.8h, v9.8h, v12.H[1]
    str q14, [x0, #1712]
    ldr q14, [x0, #1520]
    srshr    v27.8h, v27.8h, #12
    mls      v9.8h, v27.8h, v12.H[0]
    str q16, [x0, #1456]
    ldr q16, [x0, #2032]
    sqdmulh  v28.8h, v10.8h, v12.H[1]
    str q15, [x0, #1968]
    ldr q15, [x0, #1776]
    srshr    v28.8h, v28.8h, #12
    mls      v10.8h, v28.8h, v12.H[0]
    sqdmulh  v29.8h, v11.8h, v12.H[1]
    srshr    v29.8h, v29.8h, #12
    mls      v11.8h, v29.8h, v12.H[0]
    sqdmulh  v30.8h, v14.8h, v12.H[1]
    srshr    v30.8h, v30.8h, #12
    mls      v14.8h, v30.8h, v12.H[0]
    sqdmulh  v21.8h, v15.8h, v12.H[1]
    srshr    v21.8h, v21.8h, #12
    mls      v15.8h, v21.8h, v12.H[0]
    sqdmulh  v22.8h, v16.8h, v12.H[1]
    srshr    v22.8h, v22.8h, #12
    mls      v16.8h, v22.8h, v12.H[0]
    sub v17.8h,  v15.8h,  v16.8h
    sub v18.8h,  v3.8h,  v2.8h
    sub v19.8h,  v7.8h,  v6.8h
    sub v20.8h,  v11.8h,  v10.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v4.8h,  v5.8h
    sub v7.8h,  v8.8h,  v9.8h
    sub v11.8h,  v13.8h,  v14.8h
    sub v16.8h,  v1.8h,  v0.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v8.8h,  v10.8h
    sub v5.8h,  v13.8h,  v15.8h
    sub v9.8h,  v2.8h,  v0.8h
    sub v14.8h,  v6.8h,  v4.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v11.8h,  v19.8h
    sub v6.8h,  v16.8h,  v20.8h
    sub v10.8h,  v17.8h,  v3.8h
    sub v15.8h,  v18.8h,  v7.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #1216]
    ldr q0, [x0, #0]
    sqdmulh  v17.8h, v0.8h, v12.H[1]
    str q1, [x0, #1728]
    ldr q1, [x0, #256]
    srshr    v17.8h, v17.8h, #12
    mls      v0.8h, v17.8h, v12.H[0]
    str q2, [x0, #1984]
    ldr q2, [x0, #512]
    sqdmulh  v18.8h, v1.8h, v12.H[1]
    str q3, [x0, #1472]
    ldr q3, [x0, #768]
    srshr    v18.8h, v18.8h, #12
    mls      v1.8h, v18.8h, v12.H[0]
    str q4, [x0, #1232]
    ldr q4, [x0, #16]
    sqdmulh  v19.8h, v2.8h, v12.H[1]
    str q5, [x0, #1744]
    ldr q5, [x0, #272]
    srshr    v19.8h, v19.8h, #12
    mls      v2.8h, v19.8h, v12.H[0]
    str q6, [x0, #2000]
    ldr q6, [x0, #528]
    sqdmulh  v20.8h, v3.8h, v12.H[1]
    str q7, [x0, #1488]
    ldr q7, [x0, #784]
    srshr    v20.8h, v20.8h, #12
    mls      v3.8h, v20.8h, v12.H[0]
    str q8, [x0, #1248]
    ldr q8, [x0, #32]
    sqdmulh  v17.8h, v4.8h, v12.H[1]
    str q9, [x0, #1760]
    ldr q9, [x0, #288]
    srshr    v17.8h, v17.8h, #12
    mls      v4.8h, v17.8h, v12.H[0]
    str q10, [x0, #2016]
    ldr q10, [x0, #544]
    sqdmulh  v18.8h, v5.8h, v12.H[1]
    str q11, [x0, #1504]
    ldr q11, [x0, #800]
    srshr    v18.8h, v18.8h, #12
    mls      v5.8h, v18.8h, v12.H[0]
    str q13, [x0, #1264]
    ldr q13, [x0, #48]
    sqdmulh  v19.8h, v6.8h, v12.H[1]
    str q14, [x0, #1776]
    ldr q14, [x0, #304]
    srshr    v19.8h, v19.8h, #12
    mls      v6.8h, v19.8h, v12.H[0]
    str q15, [x0, #2032]
    ldr q15, [x0, #560]
    sqdmulh  v20.8h, v7.8h, v12.H[1]
    str q16, [x0, #1520]
    ldr q16, [x0, #816]
    srshr    v20.8h, v20.8h, #12
    mls      v7.8h, v20.8h, v12.H[0]
    sqdmulh  v17.8h, v8.8h, v12.H[1]
    srshr    v17.8h, v17.8h, #12
    mls      v8.8h, v17.8h, v12.H[0]
    sqdmulh  v18.8h, v9.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v9.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v10.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v10.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v11.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v11.8h, v20.8h, v12.H[0]
    sqdmulh  v17.8h, v13.8h, v12.H[1]
    srshr    v17.8h, v17.8h, #12
    mls      v13.8h, v17.8h, v12.H[0]
    sqdmulh  v18.8h, v14.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v14.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v15.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v15.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v16.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v16.8h, v20.8h, v12.H[0]
    sub v17.8h,  v10.8h,  v11.8h
    sub v18.8h,  v15.8h,  v16.8h
    sub v19.8h,  v3.8h,  v2.8h
    sub v20.8h,  v7.8h,  v6.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v0.8h,  v1.8h
    sub v7.8h,  v4.8h,  v5.8h
    sub v11.8h,  v8.8h,  v9.8h
    sub v16.8h,  v13.8h,  v14.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v0.8h,  v2.8h
    sub v5.8h,  v4.8h,  v6.8h
    sub v9.8h,  v8.8h,  v10.8h
    sub v14.8h,  v13.8h,  v15.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v3.8h,  v17.8h
    sub v6.8h,  v7.8h,  v18.8h
    sub v10.8h,  v11.8h,  v19.8h
    sub v15.8h,  v16.8h,  v20.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #0]
    ldr q0, [x0, #64]
    sqdmulh  v17.8h, v0.8h, v12.H[1]
    str q1, [x0, #512]
    ldr q1, [x0, #320]
    srshr    v17.8h, v17.8h, #12
    mls      v0.8h, v17.8h, v12.H[0]
    str q2, [x0, #768]
    ldr q2, [x0, #576]
    sqdmulh  v18.8h, v1.8h, v12.H[1]
    str q3, [x0, #256]
    ldr q3, [x0, #832]
    srshr    v18.8h, v18.8h, #12
    mls      v1.8h, v18.8h, v12.H[0]
    str q4, [x0, #16]
    ldr q4, [x0, #80]
    sqdmulh  v19.8h, v2.8h, v12.H[1]
    str q5, [x0, #528]
    ldr q5, [x0, #336]
    srshr    v19.8h, v19.8h, #12
    mls      v2.8h, v19.8h, v12.H[0]
    str q6, [x0, #784]
    ldr q6, [x0, #592]
    sqdmulh  v20.8h, v3.8h, v12.H[1]
    str q7, [x0, #272]
    ldr q7, [x0, #848]
    srshr    v20.8h, v20.8h, #12
    mls      v3.8h, v20.8h, v12.H[0]
    str q8, [x0, #32]
    ldr q8, [x0, #96]
    sqdmulh  v17.8h, v4.8h, v12.H[1]
    str q9, [x0, #544]
    ldr q9, [x0, #352]
    srshr    v17.8h, v17.8h, #12
    mls      v4.8h, v17.8h, v12.H[0]
    str q10, [x0, #800]
    ldr q10, [x0, #608]
    sqdmulh  v18.8h, v5.8h, v12.H[1]
    str q11, [x0, #288]
    ldr q11, [x0, #864]
    srshr    v18.8h, v18.8h, #12
    mls      v5.8h, v18.8h, v12.H[0]
    str q13, [x0, #48]
    ldr q13, [x0, #112]
    sqdmulh  v19.8h, v6.8h, v12.H[1]
    str q14, [x0, #560]
    ldr q14, [x0, #368]
    srshr    v19.8h, v19.8h, #12
    mls      v6.8h, v19.8h, v12.H[0]
    str q15, [x0, #816]
    ldr q15, [x0, #624]
    sqdmulh  v20.8h, v7.8h, v12.H[1]
    str q16, [x0, #304]
    ldr q16, [x0, #880]
    srshr    v20.8h, v20.8h, #12
    mls      v7.8h, v20.8h, v12.H[0]
    sqdmulh  v17.8h, v8.8h, v12.H[1]
    srshr    v17.8h, v17.8h, #12
    mls      v8.8h, v17.8h, v12.H[0]
    sqdmulh  v18.8h, v9.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v9.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v10.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v10.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v11.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v11.8h, v20.8h, v12.H[0]
    sqdmulh  v18.8h, v13.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v13.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v14.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v14.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v16.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v16.8h, v20.8h, v12.H[0]
    sub v17.8h,  v10.8h,  v11.8h
    sub v18.8h,  v15.8h,  v16.8h
    sub v19.8h,  v3.8h,  v2.8h
    sub v20.8h,  v7.8h,  v6.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v0.8h,  v1.8h
    sub v7.8h,  v4.8h,  v5.8h
    sub v11.8h,  v8.8h,  v9.8h
    sub v16.8h,  v13.8h,  v14.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v0.8h,  v2.8h
    sub v5.8h,  v4.8h,  v6.8h
    sub v9.8h,  v8.8h,  v10.8h
    sub v14.8h,  v13.8h,  v15.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v3.8h,  v17.8h
    sub v6.8h,  v7.8h,  v18.8h
    sub v10.8h,  v11.8h,  v19.8h
    sub v15.8h,  v16.8h,  v20.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #64]
    ldr q0, [x0, #128]
    sqdmulh  v17.8h, v0.8h, v12.H[1]
    str q1, [x0, #576]
    ldr q1, [x0, #384]
    srshr    v17.8h, v17.8h, #12
    mls      v0.8h, v17.8h, v12.H[0]
    str q2, [x0, #832]
    ldr q2, [x0, #640]
    sqdmulh  v18.8h, v1.8h, v12.H[1]
    str q3, [x0, #320]
    ldr q3, [x0, #896]
    srshr    v18.8h, v18.8h, #12
    mls      v1.8h, v18.8h, v12.H[0]
    str q4, [x0, #80]
    ldr q4, [x0, #144]
    sqdmulh  v19.8h, v2.8h, v12.H[1]
    str q5, [x0, #592]
    ldr q5, [x0, #400]
    srshr    v19.8h, v19.8h, #12
    mls      v2.8h, v19.8h, v12.H[0]
    str q6, [x0, #848]
    ldr q6, [x0, #656]
    sqdmulh  v20.8h, v3.8h, v12.H[1]
    str q7, [x0, #336]
    ldr q7, [x0, #912]
    srshr    v20.8h, v20.8h, #12
    mls      v3.8h, v20.8h, v12.H[0]
    str q8, [x0, #96]
    ldr q8, [x0, #160]
    sqdmulh  v17.8h, v4.8h, v12.H[1]
    str q9, [x0, #608]
    ldr q9, [x0, #416]
    srshr    v17.8h, v17.8h, #12
    mls      v4.8h, v17.8h, v12.H[0]
    str q10, [x0, #864]
    ldr q10, [x0, #672]
    sqdmulh  v18.8h, v5.8h, v12.H[1]
    str q11, [x0, #352]
    ldr q11, [x0, #928]
    srshr    v18.8h, v18.8h, #12
    mls      v5.8h, v18.8h, v12.H[0]
    str q13, [x0, #112]
    ldr q13, [x0, #176]
    sqdmulh  v19.8h, v6.8h, v12.H[1]
    str q14, [x0, #624]
    ldr q14, [x0, #432]
    srshr    v19.8h, v19.8h, #12
    mls      v6.8h, v19.8h, v12.H[0]
    str q15, [x0, #880]
    ldr q15, [x0, #688]
    sqdmulh  v20.8h, v7.8h, v12.H[1]
    str q16, [x0, #368]
    ldr q16, [x0, #944]
    srshr    v20.8h, v20.8h, #12
    mls      v7.8h, v20.8h, v12.H[0]
    sqdmulh  v17.8h, v8.8h, v12.H[1]
    srshr    v17.8h, v17.8h, #12
    mls      v8.8h, v17.8h, v12.H[0]
    sqdmulh  v18.8h, v9.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v9.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v10.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v10.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v11.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v11.8h, v20.8h, v12.H[0]
    sqdmulh  v18.8h, v13.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v13.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v14.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v14.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v16.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v16.8h, v20.8h, v12.H[0]
    sub v17.8h,  v10.8h,  v11.8h
    sub v18.8h,  v15.8h,  v16.8h
    sub v19.8h,  v3.8h,  v2.8h
    sub v20.8h,  v7.8h,  v6.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v0.8h,  v1.8h
    sub v7.8h,  v4.8h,  v5.8h
    sub v11.8h,  v8.8h,  v9.8h
    sub v16.8h,  v13.8h,  v14.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v0.8h,  v2.8h
    sub v5.8h,  v4.8h,  v6.8h
    sub v9.8h,  v8.8h,  v10.8h
    sub v14.8h,  v13.8h,  v15.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v3.8h,  v17.8h
    sub v6.8h,  v7.8h,  v18.8h
    sub v10.8h,  v11.8h,  v19.8h
    sub v15.8h,  v16.8h,  v20.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #128]
    ldr q0, [x0, #192]
    sqdmulh  v17.8h, v0.8h, v12.H[1]
    str q1, [x0, #640]
    ldr q1, [x0, #448]
    srshr    v17.8h, v17.8h, #12
    mls      v0.8h, v17.8h, v12.H[0]
    str q2, [x0, #896]
    ldr q2, [x0, #704]
    sqdmulh  v18.8h, v1.8h, v12.H[1]
    str q3, [x0, #384]
    ldr q3, [x0, #960]
    srshr    v18.8h, v18.8h, #12
    mls      v1.8h, v18.8h, v12.H[0]
    str q4, [x0, #144]
    ldr q4, [x0, #208]
    sqdmulh  v19.8h, v2.8h, v12.H[1]
    str q5, [x0, #656]
    ldr q5, [x0, #464]
    srshr    v19.8h, v19.8h, #12
    mls      v2.8h, v19.8h, v12.H[0]
    str q6, [x0, #912]
    ldr q6, [x0, #720]
    sqdmulh  v20.8h, v3.8h, v12.H[1]
    str q7, [x0, #400]
    ldr q7, [x0, #976]
    srshr    v20.8h, v20.8h, #12
    mls      v3.8h, v20.8h, v12.H[0]
    str q8, [x0, #160]
    ldr q8, [x0, #224]
    sqdmulh  v17.8h, v4.8h, v12.H[1]
    str q9, [x0, #672]
    ldr q9, [x0, #480]
    srshr    v17.8h, v17.8h, #12
    mls      v4.8h, v17.8h, v12.H[0]
    str q10, [x0, #928]
    ldr q10, [x0, #736]
    sqdmulh  v18.8h, v5.8h, v12.H[1]
    str q11, [x0, #416]
    ldr q11, [x0, #992]
    srshr    v18.8h, v18.8h, #12
    mls      v5.8h, v18.8h, v12.H[0]
    str q13, [x0, #176]
    ldr q13, [x0, #240]
    sqdmulh  v19.8h, v6.8h, v12.H[1]
    str q14, [x0, #688]
    ldr q14, [x0, #496]
    srshr    v19.8h, v19.8h, #12
    mls      v6.8h, v19.8h, v12.H[0]
    str q15, [x0, #944]
    ldr q15, [x0, #752]
    sqdmulh  v20.8h, v7.8h, v12.H[1]
    str q16, [x0, #432]
    ldr q16, [x0, #1008]
    srshr    v20.8h, v20.8h, #12
    mls      v7.8h, v20.8h, v12.H[0]
    sqdmulh  v17.8h, v8.8h, v12.H[1]
    srshr    v17.8h, v17.8h, #12
    mls      v8.8h, v17.8h, v12.H[0]
    sqdmulh  v18.8h, v9.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v9.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v10.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v10.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v11.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v11.8h, v20.8h, v12.H[0]
    sqdmulh  v18.8h, v13.8h, v12.H[1]
    srshr    v18.8h, v18.8h, #12
    mls      v13.8h, v18.8h, v12.H[0]
    sqdmulh  v19.8h, v14.8h, v12.H[1]
    srshr    v19.8h, v19.8h, #12
    mls      v14.8h, v19.8h, v12.H[0]
    sqdmulh  v20.8h, v16.8h, v12.H[1]
    srshr    v20.8h, v20.8h, #12
    mls      v16.8h, v20.8h, v12.H[0]
    sub v17.8h,  v10.8h,  v11.8h
    sub v18.8h,  v15.8h,  v16.8h
    sub v19.8h,  v3.8h,  v2.8h
    sub v20.8h,  v7.8h,  v6.8h
    add v2.8h,  v2.8h,  v3.8h
    add v6.8h,  v6.8h,  v7.8h
    add v10.8h,  v10.8h,  v11.8h
    add v15.8h,  v15.8h,  v16.8h
    sub v3.8h,  v0.8h,  v1.8h
    sub v7.8h,  v4.8h,  v5.8h
    sub v11.8h,  v8.8h,  v9.8h
    sub v16.8h,  v13.8h,  v14.8h
    add v0.8h,  v0.8h,  v1.8h
    add v4.8h,  v4.8h,  v5.8h
    add v8.8h,  v8.8h,  v9.8h
    add v13.8h,  v13.8h,  v14.8h
    sub v1.8h,  v0.8h,  v2.8h
    sub v5.8h,  v4.8h,  v6.8h
    sub v9.8h,  v8.8h,  v10.8h
    sub v14.8h,  v13.8h,  v15.8h
    add v0.8h,  v0.8h,  v2.8h
    add v4.8h,  v4.8h,  v6.8h
    add v8.8h,  v8.8h,  v10.8h
    add v13.8h,  v13.8h,  v15.8h
    sub v2.8h,  v3.8h,  v17.8h
    sub v6.8h,  v7.8h,  v18.8h
    sub v10.8h,  v11.8h,  v19.8h
    sub v15.8h,  v16.8h,  v20.8h
    add v3.8h,  v3.8h,  v17.8h
    add v7.8h,  v7.8h,  v18.8h
    add v11.8h,  v11.8h,  v19.8h
    add v16.8h,  v16.8h,  v20.8h
    str q0, [x0, #192]
    str q4, [x0, #208]
    str q8, [x0, #224]
    str q13, [x0, #240]
    str q3, [x0, #448]
    str q7, [x0, #464]
    str q11, [x0, #480]
    str q16, [x0, #496]
    str q1, [x0, #704]
    str q5, [x0, #720]
    str q9, [x0, #736]
    str q14, [x0, #752]
    str q2, [x0, #960]
    str q6, [x0, #976]
    str q10, [x0, #992]
    str q15, [x0, #1008]
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
