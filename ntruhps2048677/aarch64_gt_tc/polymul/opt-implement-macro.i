// 合併：
	// r_BAR_2x \qs,\y2,\y3,\g2,\g3,\t0,\t1,\zl2,\zh2,\zl3,\zh3,\p
	// r_TR_4x \qd,\qs,\f0,\f1,\f2,\f3,\t0,\t1
/* common */

.macro ABI_push
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
	v00 .req v0
	v01 .req v1
	v02 .req v2
	v03 .req v3
	v04 .req v4
	v05 .req v5
	v06 .req v6
	v07 .req v7
	v08 .req v8
	v09 .req v9
.endm
.macro ABI_pop
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
	.unreq v00
	.unreq v01
	.unreq v02
	.unreq v03
	.unreq v04
	.unreq v05
	.unreq v06
	.unreq v07
	.unreq v08
	.unreq v09
.endm

/* basemul */
	//--- original 
.macro r_GS_2x_top qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3
	sub \t0\qs, \f0\qs, \g0\qs
	sub \t1\qs, \f1\qs, \g1\qs
	add \f0\qs, \f0\qs, \g0\qs
	add \f1\qs, \f1\qs, \g1\qs
.endm
.macro r_GS_2x_mix qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_bot qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	mul \g2\qs, \t2\qs, \zl2
	mul \g3\qs, \t3\qs, \zl3
	sqrdmulh \t2\qs, \t2\qs, \zh2
	sqrdmulh \t3\qs, \t3\qs, \zh3
	mls \g2\qs, \t2\qs, \p
	mls \g3\qs, \t3\qs, \p
.endm
	//--- warp 
.macro wrap_CT_4x_top qs, f0,f1,f2,f3, g0,g1,g2,g3,\
						t0,t1,t2,t3, t4,t5,t6,t7,\
						zl0,zh0,zl1,zh1, p

	mul \t0\qs, \g0\qs, \zl0
	sqrdmulh \g0\qs, \g0\qs, \zh0
	mul \t1\qs, \g1\qs, \zl1
	sqrdmulh \g1\qs, \g1\qs, \zh1
	mul \t4\qs, \g2\qs, \zl0
	sqrdmulh \g2\qs, \g2\qs, \zh0
	mul \t5\qs, \g3\qs, \zl1
	sqrdmulh \g3\qs, \g3\qs, \zh1
	
	mls \t0\qs, \g0\qs, \p
	mls \t1\qs, \g1\qs, \p
	mls \t4\qs, \g2\qs, \p
	mls \t5\qs, \g3\qs, \p
.endm
.macro wrap_CT_4x_top_l qs, f0,f1,f2,f3, g0,g1,g2,g3,\
						t0,t1,t2,t3, t4,t5,t6,t7,\
						zl0,zh0,zl1,zh1, p,\
						ptr,\
						q_0,q_1,q_2,q_3,\
						a_idx0,a_idx1,a_idx2,a_idx3,\
						q_4,q_5,q_6,q_7,\
						a_idx4,a_idx5,a_idx6,a_idx7\

	ldr \q_0, [\ptr, \a_idx0]
	mul \t0\qs, \g0\qs, \zl0
	sqrdmulh \g0\qs, \g0\qs, \zh0
	ldr \q_1, [\ptr, \a_idx1]
	mul \t1\qs, \g1\qs, \zl1
	sqrdmulh \g1\qs, \g1\qs, \zh1
	ldr \q_2, [\ptr, \a_idx2]
	mul \t4\qs, \g2\qs, \zl0
	sqrdmulh \g2\qs, \g2\qs, \zh0
	ldr \q_3, [\ptr, \a_idx3]
	mul \t5\qs, \g3\qs, \zl1
	sqrdmulh \g3\qs, \g3\qs, \zh1
	
	ldr \q_4, [\ptr, \a_idx4]
	mls \t0\qs, \g0\qs, \p
	ldr \q_5, [\ptr, \a_idx5]
	mls \t1\qs, \g1\qs, \p
	ldr \q_6, [\ptr, \a_idx6]
	mls \t4\qs, \g2\qs, \p
	ldr \q_7, [\ptr, \a_idx7]
	mls \t5\qs, \g3\qs, \p
.endm
.macro wrap_CT_4x_mix qs, f0,f1,f2,f3, g0,g1,g2,g3,\
					  	  t0,t1,t2,t3, t4,t5,t6,t7,\
					  	  zl0,zh0,zl1,zh1,\
						  zl2,zh2,zl3,zh3, p,\
						  b0,b1, b2,b3
	//---	
	sub \g0\qs, \f0\qs, \t0\qs
	mul \t2\qs, \b0\qs, \zl0
	sub \g1\qs, \f1\qs, \t1\qs
	mul \t3\qs, \b1\qs, \zl1
	sub \g2\qs, \f2\qs, \t4\qs
	mul \t6\qs, \b2\qs, \zl2
	sub \g3\qs, \f3\qs, \t5\qs
	mul \t7\qs, \b3\qs, \zl3

	add \f0\qs, \f0\qs, \t0\qs
	sqrdmulh \b0\qs, \b0\qs, \zh0
	add \f1\qs, \f1\qs, \t1\qs
	sqrdmulh \b1\qs, \b1\qs, \zh1
	add \f2\qs, \f2\qs, \t4\qs
	sqrdmulh \b2\qs, \b2\qs, \zh2
	add \f3\qs, \f3\qs, \t5\qs
	sqrdmulh \b3\qs, \b3\qs, \zh3

	mls \t2\qs, \b0\qs, \p 
	mls \t3\qs, \b1\qs, \p
	mls \t6\qs, \b2\qs, \p 
	mls \t7\qs, \b3\qs, \p
.endm
.macro wrap_CT_4x_mix_l qs, f0,f1,f2,f3, g0,g1,g2,g3,\
					  	  t0,t1,t2,t3, t4,t5,t6,t7,\
					  	  zl0,zh0,zl1,zh1,\
						  zl2,zh2,zl3,zh3, p,\
						  b0,b1, b2,b3,\
						  ptr, q_0,q_1,q_2,q_3,\
						  a_idx0,a_idx1,a_idx2,a_idx3
	//---	
	ldr \q_0, [\ptr, \a_idx0]
	sub \g0\qs, \f0\qs, \t0\qs
	mul \t2\qs, \b0\qs, \zl0
	ldr \q_1, [\ptr, \a_idx1]
	sub \g1\qs, \f1\qs, \t1\qs
	mul \t3\qs, \b1\qs, \zl1
	ldr \q_2, [\ptr, \a_idx2]
	sub \g2\qs, \f2\qs, \t4\qs
	mul \t6\qs, \b2\qs, \zl2
	ldr \q_3, [\ptr, \a_idx3]
	sub \g3\qs, \f3\qs, \t5\qs
	mul \t7\qs, \b3\qs, \zl3

	add \f0\qs, \f0\qs, \t0\qs
	sqrdmulh \b0\qs, \b0\qs, \zh0
	add \f1\qs, \f1\qs, \t1\qs
	sqrdmulh \b1\qs, \b1\qs, \zh1
	add \f2\qs, \f2\qs, \t4\qs
	sqrdmulh \b2\qs, \b2\qs, \zh2
	add \f3\qs, \f3\qs, \t5\qs
	sqrdmulh \b3\qs, \b3\qs, \zh3

	mls \t2\qs, \b0\qs, \p 
	mls \t3\qs, \b1\qs, \p
	mls \t6\qs, \b2\qs, \p 
	mls \t7\qs, \b3\qs, \p
.endm
.macro wrap_CT_4x_bot qs, f0,f1,f2,f3,g0,g1,g2,g3,\
						  t0,t1,t2,t3, t4,t5,t6,t7
	sub \g0\qs, \f0\qs, \t2\qs
	sub \g1\qs, \f1\qs, \t3\qs
	sub \g2\qs, \f2\qs, \t6\qs
	sub \g3\qs, \f3\qs, \t7\qs

	add \f0\qs, \f0\qs, \t2\qs
	add \f1\qs, \f1\qs, \t3\qs
	add \f2\qs, \f2\qs, \t6\qs
	add \f3\qs, \f3\qs, \t7\qs
.endm


	//--- top, mix with ld or ld/str
.macro r_CT_2x_top_l qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, q_0,q_1,q_2,q_3, ptr_0,ptr_1,ptr_2,ptr_3, idx0,idx1,idx2,idx3
    ldr \q_0, [\ptr_0, \idx0]     // L
	ldr \q_1, [\ptr_1, \idx1]     // L
	ldr \q_2, [\ptr_2, \idx2]
	ldr \q_3, [\ptr_3, \idx3]
	mul \t0\qs, \g0\qs, \zl0    // M
	mul \t1\qs, \g1\qs, \zl1    // M
	sqrdmulh \g0\qs, \g0\qs, \zh0 // F0/F1
	sqrdmulh \g1\qs, \g1\qs, \zh1 // F0/F1
	mls \t0\qs, \g0\qs, \p      // M
	mls \t1\qs, \g1\qs, \p      // M
.endm
.macro r_CT_2x_mix_l qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, q_0,q_1,q_2,q_3, ptr_0,ptr_1,ptr_2,ptr_3, idx0,idx1,idx2,idx3
	ldr \q_0, [\ptr_0, \idx0]
	ldr \q_1, [\ptr_1, \idx1]
	ldr \q_3, [\ptr_3, \idx3]
	ldr \q_2, [\ptr_2, \idx2]
	sub \g0\qs, \f0\qs, \t0\qs
	sub \g1\qs, \f1\qs, \t1\qs
	mul \t2\qs, \g2\qs, \zl2
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	add \f0\qs, \f0\qs, \t0\qs
	sqrdmulh \g2\qs, \g2\qs, \zh2
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p 
	mls \t3\qs, \g3\qs, \p 
.endm
.macro r_CT_2x_top_ls qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, q_0,q_1,q_2,q_3, ptr_a,ptr_b, a_idx0,a_idx1,a_idx2,a_idx3, r_0,r_1,r_2,r_3, ptr_r, r_idx0,r_idx1,r_idx2,r_idx3
    str \r_0, [\ptr_r, \r_idx0]
    ldr \q_0, [\ptr_a, \a_idx0]     // L
	mul \t0\qs, \g0\qs, \zl0    // M
	str \r_1, [\ptr_r, \r_idx1]
	ldr \q_1, [\ptr_a, \a_idx1]     // L
	mul \t1\qs, \g1\qs, \zl1    // M
	str \r_2, [\ptr_r, \r_idx2]
	sqrdmulh \g0\qs, \g0\qs, \zh0 // F0/F1
	str \r_3, [\ptr_r, \r_idx3]
	sqrdmulh \g1\qs, \g1\qs, \zh1 // F0/F1
	ldr \q_2, [\ptr_b, \a_idx2]
	mls \t0\qs, \g0\qs, \p      // M
	ldr \q_3, [\ptr_b, \a_idx3]
	mls \t1\qs, \g1\qs, \p      // M
.endm
.macro r_CT_2x_mix_ls qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p,  q_0,q_1,q_2,q_3, ptr_0,ptr_1,ptr_2,ptr_3, a_idx0,a_idx1,a_idx2,a_idx3, r_0,r_1, ptr_r, r_idx0,r_idx1
	str \r_0, [\ptr_r, \r_idx0]
	ldr \q_0, [\ptr_0, \a_idx0]
	sub \g0\qs, \f0\qs, \t0\qs
	ldr \q_1, [\ptr_1, \a_idx1]
	mul \t2\qs, \g2\qs, \zl2
	str \r_1, [\ptr_r, \r_idx1]
	ldr \q_2, [\ptr_2, \a_idx2]
	sub \g1\qs, \f1\qs, \t1\qs
	ldr \q_3, [\ptr_3, \a_idx3]
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
	//---	r_GS_4x
.macro r_GS_4x_com_store  qs, ptr_r1, q_0, q_1, q_2, q_3, q_4, q_5, q_6, q_7, rr0, rr1, rr2, rr3, rr4, rr5, rr6, rr7
	// first GS_4x 
	// r_GS_2x_top
	sub v14\qs, v0\qs, v1\qs
	add v0\qs, v0\qs, v1\qs
	
	mul v1\qs, v14\qs, v30.s[0]
	sub v15\qs, v2\qs, v3\qs
	sqrdmulh v14\qs, v14\qs, v30.s[1]
	add v2\qs, v2\qs, v3\qs
	mul v3\qs, v15\qs, v30.s[2]
	sqrdmulh v15\qs, v15\qs, v30.s[3]
	
	// r_GS_2x_mix
	sub v16\qs, v10\qs, v11\qs
	mls v1\qs, v14\qs, v8.s[0]
	sub v17\qs, v12\qs, v13\qs
	mls v3\qs, v15\qs, v8.s[0]

	// r_GS_2x_bot
	add v10\qs, v10\qs, v11\qs
	mul v11\qs, v16\qs, v31.s[0]
	add v12\qs, v12\qs, v13\qs
	mul v13\qs, v17\qs, v31.s[2]
	sub v14\qs, v0\qs, v2\qs
	sqrdmulh v16\qs, v16\qs, v31.s[1]
	sub v15\qs, v1\qs, v3\qs
	sqrdmulh v17\qs, v17\qs, v31.s[3]
	add v0\qs, v0\qs, v2\qs
	mls v11\qs, v16\qs, v8.s[0]
	add v1\qs, v1\qs, v3\qs
	mls v13\qs, v17\qs, v8.s[0]

	// second GS_4x
	// r_GS_2x_top -> upper
	
	// r_GS_2x_mix
	sub v16\qs, v10\qs, v12\qs
	mul v2\qs, v14\qs, v19.s[0]
	sub v17\qs, v11\qs, v13\qs
	mul v3\qs, v15\qs, v19.s[0]
	add v10\qs, v10\qs, v12\qs
	sqrdmulh v14\qs, v14\qs, v19.s[1]
	add v11\qs, v11\qs, v13\qs
	sqrdmulh v15\qs, v15\qs, v19.s[1]
	mls v2\qs, v14\qs, v8.s[0]
	mls v3\qs, v15\qs, v8.s[0]

	// r_GS_2x_bot
	mul v12\qs, v16\qs, v19.s[2]
	mul v13\qs, v17\qs, v19.s[2]
	sub v14\qs, v0\qs, v10\qs
	sqrdmulh v16\qs, v16\qs, v19.s[3]
	sub v15\qs, v1\qs, v11\qs
	sqrdmulh v17\qs, v17\qs, v19.s[3]
	add v0\qs, v0\qs, v10\qs
	str \q_0, [\ptr_r1, \rr0]
	mls v12\qs, v16\qs, v8.s[0]
	add v1\qs, v1\qs, v11\qs
	str \q_1, [\ptr_r1, \rr1]
	mls v13\qs, v17\qs, v8.s[0]

	// third GS_4x
	// r_GS_2x_top -> upper

	// r_GS_2x_mix
	sub v16\qs, v2\qs, v12\qs
	mul v10\qs, v14\qs, v9.s[2]
	sub v17\qs, v3\qs, v13\qs
	mul v11\qs, v15\qs, v9.s[2]
	add v2\qs, v2\qs, v12\qs
	str \q_2, [\ptr_r1, \rr2]
	sqrdmulh v14\qs, v14\qs, v9.s[3]
	add v3\qs, v3\qs, v13\qs
	str \q_3, [\ptr_r1, \rr3]
	sqrdmulh v15\qs, v15\qs, v9.s[3]
	mls v10\qs, v14\qs, v8.s[0]
	str \q_4, [\ptr_r1, \rr4]
	mls v11\qs, v15\qs, v8.s[0]
	str \q_5, [\ptr_r1, \rr5]
	// r_GS_2x_bot
	mul v12\qs, v16\qs, v9.s[2]
	mul v13\qs, v17\qs, v9.s[2]
	sqrdmulh v16\qs, v16\qs, v9.s[3]
	sqrdmulh v17\qs, v17\qs, v9.s[3]
	mls v12\qs, v16\qs, v8.s[0]
	str \q_6, [\ptr_r1, \rr6]
	mls v13\qs, v17\qs, v8.s[0]
	str \q_7, [\ptr_r1, \rr7]
.endm
	//--- r_ASYMMUL_4x related, new
.macro r_TR_8x qd,qs, f0,f1,f2,f3, t0,t1, g0,g1,g2,g3, t2,t3
	trn1 \t0\qs, \f0\qs, \f1\qs  // F0/F1
	trn1 \t2\qs, \g0\qs, \g1\qs  // g0/g1
	trn2 \f1\qs, \f0\qs, \f1\qs  // F0/F1
	trn2 \g1\qs, \g0\qs, \g1\qs  // g0/g1
	trn2 \t1\qs, \f2\qs, \f3\qs  // F0/F1
	trn2 \t3\qs, \g2\qs, \g3\qs  // g0/g1
	trn1 \f2\qs, \f2\qs, \f3\qs  // F0/F1
	trn1 \g2\qs, \g2\qs, \g3\qs  // g0/g1
	trn1 \f0\qd, \t0\qd, \f2\qd  // F0/F1
	trn1 \g0\qd, \t2\qd, \g2\qd  // g0/g1
	trn2 \f2\qd, \t0\qd, \f2\qd  // F0/F1
	trn2 \g2\qd, \t2\qd, \g2\qd  // g0/g1
	trn2 \f3\qd, \f1\qd, \t1\qd  // F0/F1
	trn2 \g3\qd, \g1\qd, \t3\qd  // g0/g1
	trn1 \f1\qd, \f1\qd, \t1\qd  // F0/F1
	trn1 \g1\qd, \g1\qd, \t3\qd  // g0/g1
.endm
.macro r_TR_4x qd,qs, f0,f1,f2,f3, t0,t1
	trn1 \t0\qs, \f0\qs, \f1\qs  // F0/F1
	trn2 \f1\qs, \f0\qs, \f1\qs  // F0/F1
	trn2 \t1\qs, \f2\qs, \f3\qs  // F0/F1
	trn1 \f2\qs, \f2\qs, \f3\qs  // F0/F1
	trn1 \f0\qd, \t0\qd, \f2\qd  // F0/F1
	trn2 \f2\qd, \t0\qd, \f2\qd  // F0/F1
	trn2 \f3\qd, \f1\qd, \t1\qd  // F0/F1
	trn1 \f1\qd, \f1\qd, \t1\qd  // F0/F1
.endm
.macro r_BAR_2x qs,y0,y1,g0,g1,t0,t1, zl0,zh0,zl1,zh1,p
	mul \y0\qs, \g0\qs, \zl0  // F0
	mul \y1\qs, \g1\qs, \zl1  // F0
	sqrdmulh \t0\qs, \g0\qs, \zh0  // F0
	sqrdmulh \t1\qs, \g1\qs, \zh1  // F0
	mls \y0\qs, \t0\qs, \p  // F0
	mls \y1\qs, \t1\qs, \p  // F0
.endm
.macro r_BAR_2x_dummy qs,y0,y1,g0,g1,t0,t1, zl0,zh0,zl1,zh1,p
        mov \y0\().16B, \g0\().16B
        mov \y1\().16B, \g1\().16B
.endm
.macro r_CONV qd,qs,ds, t0,t1,f0,f1,f2,f3,g0,g1,g2,g3
			// (t0|t1).4D = f0.4S * g0.4S
	smull	\t0\qd, \f0\ds, \g0\ds  // M
	smull2	\t1\qd, \f0\qs, \g0\qs  // M
			// (t0|t1).4D += f2.4S * g2.4S + f3.4S * g1.4S
	smlal	\t0\qd, \f2\ds, \g2\ds  // M
	smlal2	\t1\qd, \f2\qs, \g2\qs  // M
	smlal	\t0\qd, \f3\ds, \g1\ds  // M
	smlal2	\t1\qd, \f3\qs, \g1\qs  // M
			// (t0|t1).4D += f1.4S * g3.4S
	smlal	\t0\qd, \f1\ds, \g3\ds  // M
	smlal2	\t1\qd, \f1\qs, \g3\qs  // M
.endm
.macro r_MONT qd,qs,ds, y0,t0,t1,p,m
	uzp1	\y0\qs, \t0\qs, \t1\qs	// lowerhalf  // F0/F1
	mul	    \y0\qs, \y0\qs, \m                    // M
	smlal	\t0\qd, \y0\ds, \p                    // M
	smlal2	\t1\qd, \y0\qs, \p                    // M
	uzp2	\y0\qs, \t0\qs, \t1\qs	// higherhalf // F0/F1
.endm
.macro wrap_r_CONV_MONT_2x qd,qs,ds, t0,t1,f0,f1,f2,f3,g0,g1,g2,g3,  t2,t3,k0,k1,k2,k3,l0,l1,l2,l3, out0,out1, p,m
			// (t0|t1).4D = f0.4S * g0.4S
			// (t2|t3).4D = k0.4S * l0.4S
	smull	\t0\qd, \f0\ds, \g0\ds  // M
	smull	\t2\qd, \k0\ds, \l0\ds  // M
	smull2	\t1\qd, \f0\qs, \g0\qs  // M
	smull2	\t3\qd, \k0\qs, \l0\qs  // M
			// (t0|t1).4D += f2.4S * g2.4S + f3.4S * g1.4S
			// (t2|t3).4D += k2.4S * l2.4S + k3.4S * l1.4S
	smlal	\t0\qd, \f2\ds, \g2\ds  // M
	smlal	\t2\qd, \k2\ds, \l2\ds  // M
	smlal2	\t1\qd, \f2\qs, \g2\qs  // M
	smlal2	\t3\qd, \k2\qs, \l2\qs  // M
	smlal	\t0\qd, \f3\ds, \g1\ds  // M
	smlal	\t2\qd, \k3\ds, \l1\ds  // M
	smlal2	\t1\qd, \f3\qs, \g1\qs  // M
	smlal2	\t3\qd, \k3\qs, \l1\qs  // M
			// (t0|t1).4D += f1.4S * g3.4S
			// (t2|t3).4D += k1.4S * l3.4S
	smlal	\t0\qd, \f1\ds, \g3\ds  // M
	smlal	\t2\qd, \k1\ds, \l3\ds  // M
	smlal2	\t1\qd, \f1\qs, \g3\qs  // M
	smlal2	\t3\qd, \k1\qs, \l3\qs  // M
	//---
	uzp1	\out0\qs, \t0\qs, \t1\qs	// lowerhalf  // F0/F1
	uzp1	\out1\qs, \t2\qs, \t3\qs	// lowerhalf  // F0/F1
	mul	    \out0\qs, \out0\qs, \m                    // M
	mul	    \out1\qs, \out1\qs, \m                    // M
	smlal	\t0\qd, \out0\ds, \p                    // M
	smlal	\t2\qd, \out1\ds, \p                    // M
	smlal2	\t1\qd, \out0\qs, \p                    // M
	smlal2	\t3\qd, \out1\qs, \p                    // M
	uzp2	\out0\qs, \t0\qs, \t1\qs	// higherhalf // F0/F1
	uzp2	\out1\qs, \t2\qs, \t3\qs	// higherhalf // F0/F1	
.endm
.macro wrap_r_CONV_2x qd,qs,ds, t0,t1,f0,f1,f2,f3,g0,g1,g2,g3,  t2,t3,k0,k1,k2,k3,l0,l1,l2,l3
			// (t0|t1).4D = f0.4S * g0.4S
	smull	\t0\qd, \f0\ds, \g0\ds  // M
	smull2	\t1\qd, \f0\qs, \g0\qs  // M
			// (t0|t1).4D += f2.4S * g2.4S + f3.4S * g1.4S
	smlal	\t0\qd, \f2\ds, \g2\ds  // M
	smlal2	\t1\qd, \f2\qs, \g2\qs  // M
	smlal	\t0\qd, \f3\ds, \g1\ds  // M
	smlal2	\t1\qd, \f3\qs, \g1\qs  // M
			// (t0|t1).4D += f1.4S * g3.4S
	smlal	\t0\qd, \f1\ds, \g3\ds  // M
	smlal2	\t1\qd, \f1\qs, \g3\qs  // M
	//---
			// (t2|t3).4D = k0.4S * l0.4S
	smull	\t2\qd, \k0\ds, \l0\ds  // M
	smull2	\t3\qd, \k0\qs, \l0\qs  // M
			// (t2|t3).4D += k2.4S * l2.4S + k3.4S * l1.4S
	smlal	\t2\qd, \k2\ds, \l2\ds  // M
	smlal2	\t3\qd, \k2\qs, \l2\qs  // M
	smlal	\t2\qd, \k3\ds, \l1\ds  // M
	smlal2	\t3\qd, \k3\qs, \l1\qs  // M
			// (t2|t3).4D += k1.4S * l3.4S
	smlal	\t2\qd, \k1\ds, \l3\ds  // M
	smlal2	\t3\qd, \k1\qs, \l3\qs  // M
.endm
.macro wrap_r_MONT_2x qd,qs,ds, y0,t0,t1, y1,t2,t3, p,m
	uzp1	\y0\qs, \t0\qs, \t1\qs	// lowerhalf  // F0/F1
	mul	    \y0\qs, \y0\qs, \m                    // M
	smlal	\t0\qd, \y0\ds, \p                    // M
	smlal2	\t1\qd, \y0\qs, \p                    // M
	uzp2	\y0\qs, \t0\qs, \t1\qs	// higherhalf // F0/F1
	//---
	uzp1	\y1\qs, \t2\qs, \t3\qs	// lowerhalf  // F0/F1
	mul	    \y1\qs, \y1\qs, \m                    // M
	smlal	\t2\qd, \y1\ds, \p                    // M
	smlal2	\t3\qd, \y1\qs, \p                    // M
	uzp2	\y1\qs, \t2\qs, \t3\qs	// higherhalf // F0/F1
.endm
.macro r_ASYMMUL_4x qd,qs,ds,y0,y1,y2,y3,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3,		\
					zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3,p,m

.if 1

    sqrdmulh \y3\qs, \g0\qs, \zh0
    smull   \t0\qd, \g0\ds, \f0\().S[0]
    mul      \y0\qs, \g0\qs, \zl0
    smull2  \t1\qd, \g0\qs, \f0\().S[0]
    mls      \y0\qs, \y3\qs, \p

    ext \y1\().16B, \y0\().16B, \g0\().16B, #12
    smlal   \t0\qd, \y1\ds, \f0\().S[1]
    ext \y2\().16B, \y0\().16B, \g0\().16B, #8
    smlal2  \t1\qd, \y1\qs, \f0\().S[1]
    ext \y3\().16B, \y0\().16B, \g0\().16B, #4

    smlal   \t0\qd, \y2\ds, \f0\().S[2]
    smlal2  \t1\qd, \y2\qs, \f0\().S[2]
    smlal   \t0\qd, \y3\ds, \f0\().S[3]
    smlal2  \t1\qd, \y3\qs, \f0\().S[3]

    uzp1   \f0\qs, \t0\qs, \t1\qs
    mul    \f0\qs, \f0\qs, \m
    smlal  \t0\qd, \f0\ds, \p
    smlal2 \t1\qd, \f0\qs, \p
    uzp2   \f0\qs, \t0\qs, \t1\qs

    //r_MONT \qd,\qs,\ds, \f0,\t0,\t1,\p,\m

    sqrdmulh \t0\qs, \g1\qs, \zh1
    mul      \y0\qs, \g1\qs, \zl1
    mls      \y0\qs, \t0\qs, \p

    ext \y1\().16B, \y0\().16B, \g1\().16B, #12
    ext \y2\().16B, \y0\().16B, \g1\().16B, #8
    ext \y3\().16B, \y0\().16B, \g1\().16B, #4

    smull   \t0\qd, \g1\ds, \f1\().S[0]
    smull2  \t1\qd, \g1\qs, \f1\().S[0]
    smlal   \t0\qd, \y1\ds, \f1\().S[1]
    smlal2  \t1\qd, \y1\qs, \f1\().S[1]
    smlal   \t0\qd, \y2\ds, \f1\().S[2]
    smlal2  \t1\qd, \y2\qs, \f1\().S[2]
    smlal   \t0\qd, \y3\ds, \f1\().S[3]
    smlal2  \t1\qd, \y3\qs, \f1\().S[3]

    uzp1   \f1\qs, \t0\qs, \t1\qs
    mul    \f1\qs, \f1\qs, \m
    smlal  \t0\qd, \f1\ds, \p
    smlal2 \t1\qd, \f1\qs, \p
    uzp2   \f1\qs, \t0\qs, \t1\qs

    //r_MONT \qd,\qs,\ds, \f1,\t0,\t1,\p,\m

    sqrdmulh \t0\qs, \g2\qs, \zh2
    mul      \y0\qs, \g2\qs, \zl2
    mls      \y0\qs, \t0\qs, \p

    ext \y1\().16B, \y0\().16B, \g2\().16B, #12
    ext \y2\().16B, \y0\().16B, \g2\().16B, #8
    ext \y3\().16B, \y0\().16B, \g2\().16B, #4

    smull   \t0\qd, \g2\ds, \f2\().S[0]
    smull2  \t1\qd, \g2\qs, \f2\().S[0]
    smlal   \t0\qd, \y1\ds, \f2\().S[1]
    smlal2  \t1\qd, \y1\qs, \f2\().S[1]
    smlal   \t0\qd, \y2\ds, \f2\().S[2]
    smlal2  \t1\qd, \y2\qs, \f2\().S[2]
    smlal   \t0\qd, \y3\ds, \f2\().S[3]
    smlal2  \t1\qd, \y3\qs, \f2\().S[3]

    uzp1   \f2\qs, \t0\qs, \t1\qs
    mul    \f2\qs, \f2\qs, \m
    smlal  \t0\qd, \f2\ds, \p
    smlal2 \t1\qd, \f2\qs, \p
    uzp2   \f2\qs, \t0\qs, \t1\qs


    sqrdmulh \t0\qs, \g3\qs, \zh3
    mul      \y0\qs, \g3\qs, \zl3
    mls      \y0\qs, \t0\qs, \p

    ext \y1\().16B, \y0\().16B, \g3\().16B, #12
    ext \y2\().16B, \y0\().16B, \g3\().16B, #8
    ext \y3\().16B, \y0\().16B, \g3\().16B, #4

    smull   \t0\qd, \g3\ds, \f3\().S[0]
    smull2  \t1\qd, \g3\qs, \f3\().S[0]
    smlal   \t0\qd, \y1\ds, \f3\().S[1]
    smlal2  \t1\qd, \y1\qs, \f3\().S[1]
    smlal   \t0\qd, \y2\ds, \f3\().S[2]
    smlal2  \t1\qd, \y2\qs, \f3\().S[2]
    smlal   \t0\qd, \y3\ds, \f3\().S[3]
    smlal2  \t1\qd, \y3\qs, \f3\().S[3]

    uzp1   \f3\qs, \t0\qs, \t1\qs
    mul    \f3\qs, \f3\qs, \m
    smlal  \t0\qd, \f3\ds, \p
    smlal2 \t1\qd, \f3\qs, \p
    uzp2   \y3\qs, \t0\qs, \t1\qs

    mov \y0\().16B, \f0\().16B
    mov \y1\().16B, \f1\().16B
    mov \y2\().16B, \f2\().16B

.else


	
	r_BAR_2x \qs,\y0,\y1,\g0,\g1,\t0,\t1,\zl0,\zh0,\zl1,\zh1,\p
	r_BAR_2x \qs,\y2,\y3,\g2,\g3,\t0,\t1,\zl2,\zh2,\zl3,\zh3,\p
	
	// below: v6, v7 free
	r_TR_4x \qd,\qs,\f0,\f1,\f2,\f3,\t0,\t1
	r_TR_8x \qd,\qs,\g0,\g1,\g2,\g3,\t0,\t1, \y0,\y1,\y2,\y3,\t2,\t3

	wrap_r_CONV_MONT_2x \qd,\qs,\ds, \t0,\t1,\f0,\f1,\f2,\f3,\g0,\y1,\y2,\y3, \t2,\t3,\f0,\f1,\f2,\f3,\g1,\y2,\y3,\g0, \y0,\y1, \p,\m
	wrap_r_CONV_MONT_2x \qd,\qs,\ds, \t0,\t1,\f0,\f1,\f2,\f3,\g2,\y3,\g0,\g1, \t2,\t3,\f0,\f1,\f2,\f3,\g3,\g0,\g1,\g2, \y2,\y3, \p,\m

	r_TR_4x \qd,\qs,\y0,\y1,\y2,\y3,\t0,\t1

.endif


.endm
//--- basemulend

/* goodntt, goodntt_small */
	//--- original
.macro r_CT_2x_top qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	mul \t0\qs, \g0\qs, \zl0
	sqrdmulh \g0\qs, \g0\qs, \zh0
	mul \t1\qs, \g1\qs, \zl1
	sqrdmulh \g1\qs, \g1\qs, \zh1
	mls \t0\qs, \g0\qs, \p
	mls \t1\qs, \g1\qs, \p
.endm
.macro r_CT_2x_mix qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_bot qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3
	sub \g2\qs, \f2\qs, \t2\qs
	sub \g3\qs, \f3\qs, \t3\qs
	add \f2\qs, \f2\qs, \t2\qs
	add \f3\qs, \f3\qs, \t3\qs
.endm
.macro r_CT_2x_mix_com_store_load_ls qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, k0,l0,k1,l1, q_0,q_1,q_2,q_3, a_idx0,a_idx1,a_idx2,a_idx3, r_0,r_1,r_2,r_3, r_idx0,r_idx1,r_idx2,r_idx3, ptr
	sub \g0\qs, \f0\qs, \t0\qs 
	str \r_0, [\ptr, \r_idx0]
	ldr \q_0, [\ptr, \a_idx0]
	mul \t2\qs, \g2\qs, \zl2

	sub \g1\qs, \f1\qs, \t1\qs
	str \r_1, [\ptr, \r_idx1]
	ldr \q_1, [\ptr, \a_idx1]
	mul \t3\qs, \g3\qs, \zl3

	add \k1\qs, \k1\qs, \l1\qs // f0,t0,f1,t1
	str \r_2, [\ptr, \r_idx2]
	ldr \q_2, [\ptr, \a_idx2]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	mls \t2\qs, \g2\qs, \p // M

	add \k0\qs, \k0\qs, \l0\qs
	str \r_3, [\ptr, \r_idx3]
	ldr \q_3, [\ptr, \a_idx3]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_bot_s qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, idx, q_0,q_1,q_2,q_3, a_idx0,a_idx1,a_idx2,a_idx3, ptr
	sub \g2\qs, \f2\qs, \t2\qs
	str \q_0, [\ptr, \a_idx0]	
	sub \g3\qs, \f3\qs, \t3\qs
	str \q_1, [\ptr, \a_idx1]	
	add \f2\qs, \f2\qs, \t2\qs
	str \q_2, [\ptr, \a_idx2]	
	add \f3\qs, \f3\qs, \t3\qs
	str \q_3, [\ptr, \a_idx3]	
.endm
	//--- ld1
.macro r_CT_2x_mix_com_store_load_1_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	str q13, [ptr_ret, 0x080 + 16*(\idx+1)]
	ldr q13, [ptr_ret, 0x080 + 16*(\idx+2)]
	mul \t2\qs, \g2\qs, \zl2

	sub \g1\qs, \f1\qs, \t1\qs
	str q15, [ptr_ret, 0x180 + 16*(\idx+1)]
	ldr q15, [ptr_ret, 0x180 + 16*(\idx+2)]
	mul \t3\qs, \g3\qs, \zl3

	add \f1\qs, \f1\qs, \t1\qs
	str q14, [ptr_ret, 0x100 + 16*(\idx+1)]
	ldr q14, [ptr_ret, 0x100 + 16*(\idx+2)]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	mls \t2\qs, \g2\qs, \p // M

	add \f0\qs, \f0\qs, \t0\qs
	str q12, [ptr_ret, 0x000 + 16*(\idx+1)]
	ldr q12, [ptr_ret, 0x000 + 16*(\idx+2)]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_load_2_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	str q17, [ptr_ret, 0x280 + 16*(\idx+1)]
	ldr q17, [ptr_ret, 0x280 + 16*(\idx+2)]
	mul \t2\qs, \g2\qs, \zl2
	
	sub \g1\qs, \f1\qs, \t1\qs
	str q19, [ptr_ret, 0x380 + 16*(\idx+1)]
	ldr q19, [ptr_ret, 0x380 + 16*(\idx+2)]
	mul \t3\qs, \g3\qs, \zl3
	
	add \f1\qs, \f1\qs, \t1\qs
	str q18, [ptr_ret, 0x300 + 16*(\idx+1)]
	ldr q18, [ptr_ret, 0x300 + 16*(\idx+2)]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	mls \t2\qs, \g2\qs, \p // M
	
	add \f0\qs, \f0\qs, \t0\qs
	str q16, [ptr_ret, 0x200 + 16*(\idx+1)]
	ldr q16, [ptr_ret, 0x200 + 16*(\idx+2)]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_load_3_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	str q21, [ptr_ret, 0x480 + 16*(\idx+1)]
	ldr q21, [ptr_ret, 0x480 + 16*(\idx+2)]
	mul \t2\qs, \g2\qs, \zl2

	sub \g1\qs, \f1\qs, \t1\qs
	str q23, [ptr_ret, 0x580 + 16*(\idx+1)]
	ldr q23, [ptr_ret, 0x580 + 16*(\idx+2)]
	mul \t3\qs, \g3\qs, \zl3

	add \f1\qs, \f1\qs, \t1\qs
	str q22, [ptr_ret, 0x500 + 16*(\idx+1)]
	ldr q22, [ptr_ret, 0x500 + 16*(\idx+2)]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	mls \t2\qs, \g2\qs, \p // M

	add \f0\qs, \f0\qs, \t0\qs
	str q20, [ptr_ret, 0x400 + 16*(\idx+1)]
	ldr q20, [ptr_ret, 0x400 + 16*(\idx+2)]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_bot_com_store_load_r_CT_2x_top_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3 ,k0,k1,k2,k3, zl0,zh0,zl1,zh1,p, idx
	sub \g2\qs, \f2\qs, \t2\qs
	str q25, [ptr_ret, 0x680+16*\idx]
	ldr q25, [ptr_ret, 0x680+16*\idx+16]
	mul \t0\qs, \k0\qs, \zl0
	
	sub \g3\qs, \f3\qs, \t3\qs
	str q27, [ptr_ret, 0x780+16*\idx] 
	ldr q27, [ptr_ret, 0x780+16*\idx+16]
	mul \t1\qs, \k1\qs, \zl1

	add \f2\qs, \f2\qs, \t2\qs
	str q24, [ptr_ret, 0x600+16*\idx]
	ldr q24, [ptr_ret, 0x600+16*\idx+16]
	sqrdmulh \k0\qs, \k0\qs, \zh0
	mls \t0\qs, \k0\qs, \p
	
	add \f3\qs, \f3\qs, \t3\qs
	str q26, [ptr_ret, 0x700+16*\idx]
	ldr q26, [ptr_ret, 0x700+16*\idx+16]
	sqrdmulh \k1\qs, \k1\qs, \zh1
	mls \t1\qs, \k1\qs, \p
.endm
.macro r_CT_2x_bot_com_store_load_r_CT_2x_top_h_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx, k0,l0,k1,l1
	sub \g0\qs, \f0\qs, \t0\qs
	str q25, [ptr_ret, 0x680+16*\idx]
	ldr q25, [ptr_ret, 0x680+16*\idx+16]
	mul \t2\qs, \g2\qs, \zl2
	
	sub \g1\qs, \f1\qs, \t1\qs
	str q27, [ptr_ret, 0x780+16*\idx] 
	ldr q27, [ptr_ret, 0x780+16*\idx+16]
	mul \t3\qs, \g3\qs, \zl3
	
	add \k1\qs, \k1\qs, \l1\qs
	str q24, [ptr_ret, 0x600+16*\idx]
	ldr q24, [ptr_ret, 0x600+16*\idx+16]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	mls \t2\qs, \g2\qs, \p
	
	add \k0\qs, \k0\qs, \l0\qs
	str q26, [ptr_ret, 0x700+16*\idx]
	ldr q26, [ptr_ret, 0x700+16*\idx+16]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t3\qs, \g3\qs, \p
.endm
.macro r_CT_2x_mix_com_cssl_1_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	str q13, [ptr_ret, 0x080 + 16*(\idx+0)]
	ldr q13, [ptr_ret, 0x080 + 16*(\idx+1)+0x780]
	mul \t2\qs, \g2\qs, \zl2

	sub \g1\qs, \f1\qs, \t1\qs
	str q15, [ptr_ret, 0x180 + 16*(\idx+0)]
	ldr q15, [ptr_ret, 0x180 + 16*(\idx+1)+0x780]
	mul \t3\qs, \g3\qs, \zl3

	add \f1\qs, \f1\qs, \t1\qs
	str q14, [ptr_ret, 0x100 + 16*(\idx+0)]
	ldr q14, [ptr_ret, 0x100 + 16*(\idx+1)+0x780]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	mls \t2\qs, \g2\qs, \p

	add \f0\qs, \f0\qs, \t0\qs
	str q12, [ptr_ret, 0x000 + 16*(\idx+0)]
	ldr q12, [ptr_ret, 0x000 + 16*(\idx+1)+0x780]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t3\qs, \g3\qs, \p
.endm
.macro r_CT_2x_mix_com_cssl_2_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	//st1 {lo5.4s}, [ptr_lo5], 16
	str q17, [ptr_ret, 0x280 + 16*(\idx+0)]
	//ld1 {lo5.4s}, [ptr_lo5]
	ldr q17, [ptr_ret, 0x280 + 16*(\idx+1)+0x780]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	//st1 {lo7.4s}, [ptr_lo7], 16
	str q19, [ptr_ret, 0x380 + 16*(\idx+0)]
	//ld1 {lo7.4s}, [ptr_lo7]	
	ldr q19, [ptr_ret, 0x380 + 16*(\idx+1)+0x780]	
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	//st1 {lo6.4s}, [ptr_lo6], 16
	str q18, [ptr_ret, 0x300 + 16*(\idx+0)]
	//ld1 {lo6.4s}, [ptr_lo6]
	ldr q18, [ptr_ret, 0x300 + 16*(\idx+1)+0x780]	
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	//st1 {lo4.4s}, [ptr_lo4], 16
	str q16, [ptr_ret, 0x200 + 16*(\idx+0)]
	//ld1 {lo4.4s}, [ptr_lo4]
	ldr q16, [ptr_ret, 0x200 + 16*(\idx+1)+0x780]	
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_cssl_3_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	//st1 {hi1.4s}, [ptr_hi1], 16
	str q21, [ptr_ret, 0x480 + 16*(\idx+0)]	
	//ld1 {hi1.4s}, [ptr_hi1]
	ldr q21, [ptr_ret, 0x480 + 16*(\idx+1)+0x780]	
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	//st1 {hi3.4s}, [ptr_hi3], 16
	str q23, [ptr_ret, 0x580 + 16*(\idx+0)]	
	//ld1 {hi3.4s}, [ptr_hi3]	
	ldr q23, [ptr_ret, 0x580 + 16*(\idx+1)+0x780]	
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	//st1 {hi2.4s}, [ptr_hi2], 16
	str q22, [ptr_ret, 0x500 + 16*(\idx+0)]	
	//ld1 {hi2.4s}, [ptr_hi2]
	ldr q22, [ptr_ret, 0x500 + 16*(\idx+1)+0x780]	
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	//st1 {hi0.4s}, [ptr_hi0], 16
	str q20, [ptr_ret, 0x400 + 16*(\idx+0)]	
	//add ptr_hi0, ptr_hi0, 0x780
	//ld1 {hi0.4s}, [ptr_hi0]
	ldr q20, [ptr_ret, 0x400 + 16*(\idx+1)+0x780]	
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_bot_com_cssl_com_r_CT_2x_top_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, k0,k1,k2,k3, zl0,zh0,zl1,zh1,p, idx
	sub \g2\qs, \f2\qs, \t2\qs
	str q25, [ptr_ret, 0x680 + 16*(\idx+0)]	
	ldr q25, [ptr_ret, 0x680 + 16*(\idx+1)+0x780]	
	mul \t0\qs, \k0\qs, \zl0
	
	sub \g3\qs, \f3\qs, \t3\qs
	str q27, [ptr_ret, 0x780 + 16*(\idx+0)]	
	ldr q27, [ptr_ret, 0x780 + 16*(\idx+1)+0x780]	
	mul \t1\qs, \k1\qs, \zl1
	
	add \f2\qs, \f2\qs, \t2\qs
	str q24, [ptr_ret, 0x600 + 16*(\idx+0)]	
	ldr q24, [ptr_ret, 0x600 + 16*(\idx+1)+0x780]	
	sqrdmulh \k0\qs, \k0\qs, \zh0
	mls \t0\qs, \k0\qs, \p
	
	add \f3\qs, \f3\qs, \t3\qs
	str q26, [ptr_ret, 0x700 + 16*(\idx+0)]	
	ldr q26, [ptr_ret, 0x700 + 16*(\idx+1)+0x780]	
	sqrdmulh \k1\qs, \k1\qs, \zh1
	mls \t1\qs, \k1\qs, \p
.endm
.macro r_CT_2x_mix_com_store_1_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	//st1 {lo1.4s}, [ptr_lo1], 16
	str q13, [ptr_ret, 0x080 + 16*(\idx+1)]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	//st1 {lo3.4s}, [ptr_lo3], 16
	str q15, [ptr_ret, 0x180 + 16*(\idx+1)]
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	//st1 {lo2.4s}, [ptr_lo2], 16
	str q14, [ptr_ret, 0x100 + 16*(\idx+1)]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	//st1 {lo0.4s}, [ptr_lo0], 16
	str q12, [ptr_ret, 0x000 + 16*(\idx+1)]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_2_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	//st1 {lo5.4s}, [ptr_lo5], 16
	str q17, [ptr_ret, 0x280 + 16*(\idx+1)]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	//st1 {lo7.4s}, [ptr_lo7], 16
	str q19, [ptr_ret, 0x380 + 16*(\idx+1)]
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	//st1 {lo6.4s}, [ptr_lo6], 16
	str q18, [ptr_ret, 0x300 + 16*(\idx+1)]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	//st1 {lo4.4s}, [ptr_lo4], 16
	str q16, [ptr_ret, 0x200 + 16*(\idx+1)]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_3_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx
	sub \g0\qs, \f0\qs, \t0\qs
	//st1 {hi1.4s}, [ptr_hi1], 16
	str q21, [ptr_ret, 0x480 + 16*(\idx+1)]	
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	//st1 {hi3.4s}, [ptr_hi3], 16
	str q23, [ptr_ret, 0x580 + 16*(\idx+1)]	
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	//st1 {hi2.4s}, [ptr_hi2], 16
	str q22, [ptr_ret, 0x500 + 16*(\idx+1)]	
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	//st1 {hi0.4s}, [ptr_hi0], 16
	str q20, [ptr_ret, 0x400 + 16*(\idx+1)]	
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_bot_com_store_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, idx
	sub \g2\qs, \f2\qs, \t2\qs
	//st1 {hi5.4s}, [ptr_hi5], 16
	str q25, [ptr_ret, 0x680 + 16*(\idx+1)]	
	sub \g3\qs, \f3\qs, \t3\qs
	//st1 {hi7.4s}, [ptr_hi7], 16
	str q27, [ptr_ret, 0x780 + 16*(\idx+1)]	
	add \f2\qs, \f2\qs, \t2\qs
	//st1 {hi4.4s}, [ptr_hi4], 16
	str q24, [ptr_ret, 0x600 + 16*(\idx+1)]	
	add \f3\qs, \f3\qs, \t3\qs
	//st1 {hi6.4s}, [ptr_hi6], 16
	str q26, [ptr_ret, 0x700 + 16*(\idx+1)]	
.endm
.macro r_CT_2x_bot_com_cssl_com_r_CT_2x_top qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, k0,k1,k2,k3, zl0,zh0,zl1,zh1,p
	sub \g2\qs, \f2\qs, \t2\qs
	st1 {hi5.4s}, [ptr_hi5], 16
	add ptr_hi5, ptr_hi5, 0x780
	ld1 {hi5.4s}, [ptr_hi5]
	sub \g3\qs, \f3\qs, \t3\qs
	st1 {hi7.4s}, [ptr_hi7], 16
	add ptr_hi7, ptr_hi7, 0x780
	ld1 {hi7.4s}, [ptr_hi7]
	add \f2\qs, \f2\qs, \t2\qs
	st1 {hi4.4s}, [ptr_hi4], 16
	add ptr_hi4, ptr_hi4, 0x780
	ld1 {hi4.4s}, [ptr_hi4]
	add \f3\qs, \f3\qs, \t3\qs
	st1 {hi6.4s}, [ptr_hi6], 16
	add ptr_hi6, ptr_hi6, 0x780
	ld1 {hi6.4s}, [ptr_hi6]
	mul \t0\qs, \k0\qs, \zl0
	mul \t1\qs, \k1\qs, \zl1
	sqrdmulh \k0\qs, \k0\qs, \zh0
	sqrdmulh \k1\qs, \k1\qs, \zh1
	mls \t0\qs, \k0\qs, \p
	mls \t1\qs, \k1\qs, \p
.endm
	//--- ldr
.macro r_CT_2x_bot_com_store_load_r_CT_2x_top qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3 ,k0,k1,k2,k3, zl0,zh0,zl1,zh1,p
	sub \g2\qs, \f2\qs, \t2\qs
	st1 {hi5.4s}, [ptr_hi5], 16
	mul \t0\qs, \k0\qs, \zl0
	ld1 {hi5.4s}, [ptr_hi5]
	mul \t1\qs, \k1\qs, \zl1
	
	sub \g3\qs, \f3\qs, \t3\qs
	st1 {hi7.4s}, [ptr_hi7], 16
	sqrdmulh \k0\qs, \k0\qs, \zh0
	ld1 {hi7.4s}, [ptr_hi7]	
	sqrdmulh \k1\qs, \k1\qs, \zh1
	
	add \f2\qs, \f2\qs, \t2\qs
	st1 {hi4.4s}, [ptr_hi4], 16
	ld1 {hi4.4s}, [ptr_hi4]
	mls \t0\qs, \k0\qs, \p
	
	add \f3\qs, \f3\qs, \t3\qs
	st1 {hi6.4s}, [ptr_hi6], 16
	ld1 {hi6.4s}, [ptr_hi6]
	mls \t1\qs, \k1\qs, \p
.endm
.macro r_CT_2x_mix_com_store_load_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {lo1.4s}, [ptr_lo1], 16
	ld1 {lo1.4s}, [ptr_lo1]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {lo3.4s}, [ptr_lo3], 16
	ld1 {lo3.4s}, [ptr_lo3]
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {lo2.4s}, [ptr_lo2], 16
	ld1 {lo2.4s}, [ptr_lo2]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {lo0.4s}, [ptr_lo0], 16
	ld1 {lo0.4s}, [ptr_lo0]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_load_2 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {lo5.4s}, [ptr_lo5], 16
	ld1 {lo5.4s}, [ptr_lo5]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {lo7.4s}, [ptr_lo7], 16
	ld1 {lo7.4s}, [ptr_lo7]	
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {lo6.4s}, [ptr_lo6], 16
	ld1 {lo6.4s}, [ptr_lo6]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {lo4.4s}, [ptr_lo4], 16
	ld1 {lo4.4s}, [ptr_lo4]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_load_3 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {hi1.4s}, [ptr_hi1], 16
	ld1 {hi1.4s}, [ptr_hi1]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {hi3.4s}, [ptr_hi3], 16
	ld1 {hi3.4s}, [ptr_hi3]
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {hi2.4s}, [ptr_hi2], 16
	ld1 {hi2.4s}, [ptr_hi2]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {hi0.4s}, [ptr_hi0], 16
	ld1 {hi0.4s}, [ptr_hi0]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_bot_com_store_load qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3
	sub \g2\qs, \f2\qs, \t2\qs
	st1 {hi5.4s}, [ptr_hi5], 16
	ld1 {hi5.4s}, [ptr_hi5]
	sub \g3\qs, \f3\qs, \t3\qs
	st1 {hi7.4s}, [ptr_hi7], 16
	ld1 {hi7.4s}, [ptr_hi7]	
	add \f2\qs, \f2\qs, \t2\qs
	st1 {hi4.4s}, [ptr_hi4], 16
	ld1 {hi4.4s}, [ptr_hi4]
	add \f3\qs, \f3\qs, \t3\qs
	st1 {hi6.4s}, [ptr_hi6], 16
	ld1 {hi6.4s}, [ptr_hi6]
.endm
.macro r_CT_2x_mix_com_store_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {lo1.4s}, [ptr_lo1], 16
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {lo3.4s}, [ptr_lo3], 16
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {lo2.4s}, [ptr_lo2], 16
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {lo0.4s}, [ptr_lo0], 16
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_2 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {lo5.4s}, [ptr_lo5], 16
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {lo7.4s}, [ptr_lo7], 16
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {lo6.4s}, [ptr_lo6], 16
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {lo4.4s}, [ptr_lo4], 16
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_store_3 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {hi1.4s}, [ptr_hi1], 16
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {hi3.4s}, [ptr_hi3], 16
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {hi2.4s}, [ptr_hi2], 16
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {hi0.4s}, [ptr_hi0], 16
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_bot_com_store qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3
	sub \g2\qs, \f2\qs, \t2\qs
	st1 {hi5.4s}, [ptr_hi5], 16
	sub \g3\qs, \f3\qs, \t3\qs
	st1 {hi7.4s}, [ptr_hi7], 16
	add \f2\qs, \f2\qs, \t2\qs
	st1 {hi4.4s}, [ptr_hi4], 16
	add \f3\qs, \f3\qs, \t3\qs
	st1 {hi6.4s}, [ptr_hi6], 16
.endm
.macro r_CT_2x_mix_com_cssl_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {lo1.4s}, [ptr_lo1], 16
	add ptr_lo1, ptr_lo1, 0x780
	ld1 {lo1.4s}, [ptr_lo1]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {lo3.4s}, [ptr_lo3], 16
	add ptr_lo3, ptr_lo3, 0x780
	ld1 {lo3.4s}, [ptr_lo3]
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {lo2.4s}, [ptr_lo2], 16
	add ptr_lo2, ptr_lo2, 0x780
	ld1 {lo2.4s}, [ptr_lo2]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {lo0.4s}, [ptr_lo0], 16
	add ptr_lo0, ptr_lo0, 0x780
	ld1 {lo0.4s}, [ptr_lo0] // L, F0/F1
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_cssl_2 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {lo5.4s}, [ptr_lo5], 16
	add ptr_lo5, ptr_lo5, 0x780
	ld1 {lo5.4s}, [ptr_lo5]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {lo7.4s}, [ptr_lo7], 16
	add ptr_lo7, ptr_lo7, 0x780
	ld1 {lo7.4s}, [ptr_lo7]	
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {lo6.4s}, [ptr_lo6], 16
	add ptr_lo6, ptr_lo6, 0x780
	ld1 {lo6.4s}, [ptr_lo6]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {lo4.4s}, [ptr_lo4], 16
	add ptr_lo4, ptr_lo4, 0x780
	ld1 {lo4.4s}, [ptr_lo4]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_2x_mix_com_cssl_3 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	sub \g0\qs, \f0\qs, \t0\qs
	st1 {hi1.4s}, [ptr_hi1], 16
	add ptr_hi1, ptr_hi1, 0x780
	ld1 {hi1.4s}, [ptr_hi1]
	mul \t2\qs, \g2\qs, \zl2
	sub \g1\qs, \f1\qs, \t1\qs
	st1 {hi3.4s}, [ptr_hi3], 16
	add ptr_hi3, ptr_hi3, 0x780
	ld1 {hi3.4s}, [ptr_hi3]	
	mul \t3\qs, \g3\qs, \zl3
	add \f1\qs, \f1\qs, \t1\qs
	st1 {hi2.4s}, [ptr_hi2], 16
	add ptr_hi2, ptr_hi2, 0x780
	ld1 {hi2.4s}, [ptr_hi2]
	sqrdmulh \g2\qs, \g2\qs, \zh2
	add \f0\qs, \f0\qs, \t0\qs
	st1 {hi0.4s}, [ptr_hi0], 16
	add ptr_hi0, ptr_hi0, 0x780
	ld1 {hi0.4s}, [ptr_hi0]
	sqrdmulh \g3\qs, \g3\qs, \zh3
	mls \t2\qs, \g2\qs, \p // M
	mls \t3\qs, \g3\qs, \p // M
.endm
.macro r_CT_8x_interleaved   qs,f0,f1,f2,f3,f4,f5,f6,f7,					\
								g0,g1,g2,g3,g4,g5,g6,g7,					\
								t0,t1,t2,t3,t4,t5,t6,t7,					\
								zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3,			\
								zl4,zh4,zl5,zh5,zl6,zh6,zl7,zh7,p

	r_CT_2x_top \qs,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3,		\
				\zl0,\zh0,\zl1,\zh1,\p
	r_CT_2x_mix \qs,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3,		\
				\zl2,\zh2,\zl3,\zh3,\p
	r_CT_2x_mix \qs,\f2,\f3,\f4,\f5,\g2,\g3,\g4,\g5,\t2,\t3,\t4,\t5,		\
				\zl4,\zh4,\zl5,\zh5,\p
	r_CT_2x_mix \qs,\f4,\f5,\f6,\f7,\g4,\g5,\g6,\g7,\t4,\t5,\t6,\t7,		\
				\zl6,\zh6,\zl7,\zh7,\p
	r_CT_2x_bot \qs,\f4,\f5,\f6,\f7,\g4,\g5,\g6,\g7,\t4,\t5,\t6,\t7

.endm
.macro r_GS_4x_interleaved   qs,f0,f1,f2,f3,								\
								g0,g1,g2,g3,								\
								t0,t1,t2,t3,								\
								zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3,p

	/*r_GS_2x_top \qs,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3
	r_GS_2x_mix \qs,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3,		\
				\zl0,\zh0,\zl1,\zh1,\p
	r_GS_2x_bot \qs,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3,		\
				\zl2,\zh2,\zl3,\zh3,\p*/
	// r_GS_2x_top
	sub \t0\qs, \f0\qs, \g0\qs
	sub \t1\qs, \f1\qs, \g1\qs
	add \f0\qs, \f0\qs, \g0\qs
	add \f1\qs, \f1\qs, \g1\qs

	// r_GS_2x_mix
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p

	// r_GS_2x_bot
	mul \g2\qs, \t2\qs, \zl2
	mul \g3\qs, \t3\qs, \zl3
	sqrdmulh \t2\qs, \t2\qs, \zh2
	sqrdmulh \t3\qs, \t3\qs, \zh3
	mls \g2\qs, \t2\qs, \p
	mls \g3\qs, \t3\qs, \p
.endm
//---


/* ttndoog */
.macro r_GS_2x_top_l qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, q_0,q_1,q_2,q_3, ptr_0,ptr_1,ptr_2,ptr_3, idx0,idx1,idx2,idx3
	ldr \q_0, [\ptr_0, \idx0]
	ldr \q_1, [\ptr_1, \idx1]
	sub \t0\qs, \f0\qs, \g0\qs
	
	ldr \q_2, [\ptr_2, \idx2]
	ldr \q_3, [\ptr_3, \idx3]
	sub \t1\qs, \f1\qs, \g1\qs
	
	add \f0\qs, \f0\qs, \g0\qs
	add \f1\qs, \f1\qs, \g1\qs
.endm
.macro r_GS_2x_bot_s qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, q_0,q_1, ptr_0,ptr_1, idx0,idx1
	mul \g2\qs, \t2\qs, \zl2
	sqrdmulh \t2\qs, \t2\qs, \zh2
	mls \g2\qs, \t2\qs, \p
	str \q_0, [\ptr_0, \idx0]

	mul \g3\qs, \t3\qs, \zl3
	sqrdmulh \t3\qs, \t3\qs, \zh3
	mls \g3\qs, \t3\qs, \p
	str \q_1, [\ptr_1, \idx1]
.endm
.macro r_GS_2x_mix_l qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, q_0,q_1,q_2,q_3, ptr_0,ptr_1,ptr_2,ptr_3, idx0,idx1,idx2,idx3
	ldr \q_0, [\ptr_0, \idx0] // f3
	mul \g0\qs, \t0\qs, \zl0
	ldr \q_1, [\ptr_1, \idx1] // g3
	sub \t3\qs, \f3\qs, \g3\qs
	
	ldr \q_2, [\ptr_2, \idx2] // f2
	mul \g1\qs, \t1\qs, \zl1
	ldr \q_3, [\ptr_3, \idx3] // g2
	sub \t2\qs, \f2\qs, \g2\qs
	
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p
	
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_2s qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, q_0,q_1, ptr_0,ptr_1, idx0,idx1
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0	
	add \f2\qs, \f2\qs, \g2\qs
	str \q_0, [\ptr_0, \idx0]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p

	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1	
	add \f3\qs, \f3\qs, \g3\qs
	str \q_1, [\ptr_1, \idx1]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_4s qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, q_0,q_1,q_2,q_3, ptr_0,ptr_1,ptr_2,ptr_3, idx0,idx1,idx2,idx3
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	add \f2\qs, \f2\qs, \g2\qs
	str \q_0, [\ptr_0, \idx0]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p
	str \q_1, [\ptr_0, \idx1]
	
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f3\qs, \f3\qs, \g3\qs
	str \q_2, [\ptr_0, \idx2]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
	str \q_3, [\ptr_0, \idx3]
.endm
.macro r_GS_2x_bot_ls qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, k0,k1,k2,k3, l0,l1,l2,l3, q_0,q_1,q_2,q_3, ptr, a_idx0,a_idx1,a_idx2,a_idx3, r_0,r_1, r_idx0,r_idx1
	mul \g2\qs, \t2\qs, \zl2
	ldr \q_0, [\ptr, \a_idx0]
	sqrdmulh \t2\qs, \t2\qs, \zh2
	ldr \q_1, [\ptr, \a_idx1]
	mls \g2\qs, \t2\qs, \p
	str \r_0, [\ptr, \r_idx0]
	
	mul \g3\qs, \t3\qs, \zl3
	ldr \q_2, [\ptr, \a_idx2]
	sqrdmulh \t3\qs, \t3\qs, \zh3
	ldr \q_3, [\ptr, \a_idx3]
	mls \g3\qs, \t3\qs, \p
	str \r_1, [\ptr, \r_idx1]
	
	sub \t0\qs, \k0\qs, \l0\qs
	sub \t1\qs, \k1\qs, \l1\qs

	add \k0\qs, \k0\qs, \l0\qs
	add \k1\qs, \k1\qs, \l1\qs
.endm

	//--- ld1
.macro r_GS_2x_top_com_NTT_8_address_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3 // done
	ldr q12, [ptr_src, 0x000]
	ldr q13, [ptr_src, 0x080]
	sub \t0\qs, \f0\qs, \g0\qs
	
	ldr q14, [ptr_src, 0x100]
	ldr q15, [ptr_src, 0x180]
	sub \t1\qs, \f1\qs, \g1\qs
	
	add \f0\qs, \f0\qs, \g0\qs
	add \f1\qs, \f1\qs, \g1\qs
.endm
.macro r_GS_2x_mix_com_NTT_8_address_1_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p // done
	ldr q18, [ptr_src, 0x300] // f3
	mul \g0\qs, \t0\qs, \zl0
	ldr q19, [ptr_src, 0x380] // g3
	sub \t3\qs, \f3\qs, \g3\qs

	ldr q16, [ptr_src, 0x200] // f2
	mul \g1\qs, \t1\qs, \zl1
	ldr q17, [ptr_src, 0x280] // g2
	sub \t2\qs, \f2\qs, \g2\qs

	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p

	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_address_2_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p // done
	//ld1 {hi2.4s}, [ptr_hi2]
	ldr q22, [ptr_src, 0x500]
	mul \g0\qs, \t0\qs, \zl0
	//ld1 {hi3.4s}, [ptr_hi3]
	ldr q23, [ptr_src, 0x580]
	sub \t3\qs, \f3\qs, \g3\qs
	//ld1 {hi0.4s}, [ptr_hi0]
	ldr q20, [ptr_src, 0x400]
	mul \g1\qs, \t1\qs, \zl1
	//ld1 {hi1.4s}, [ptr_hi1]
	ldr q21, [ptr_src, 0x480]
	sub \t2\qs, \f2\qs, \g2\qs
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_address_3_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p // done
	//ld1 {hi6.4s}, [ptr_hi6]
	ldr q26, [ptr_src, 0x700]
	mul \g0\qs, \t0\qs, \zl0
	//ld1 {hi7.4s}, [ptr_hi7]
	ldr q27, [ptr_src, 0x780]
	sub \t3\qs, \f3\qs, \g3\qs
	//ld1 {hi4.4s}, [ptr_hi4]
	ldr q24, [ptr_src, 0x600]
	mul \g1\qs, \t1\qs, \zl1
	//ld1 {hi5.4s}, [ptr_hi5]
	ldr q25, [ptr_src, 0x680]
	sub \t2\qs, \f2\qs, \g2\qs	
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm

.macro r_GS_2x_top_com_NTT_8_load_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, idx // done
	ldr q12, [ptr_src, 0x000 + 16*(\idx)]
	ldr q13, [ptr_src, 0x080 + 16*(\idx)]
	sub \t0\qs, \f0\qs, \g0\qs
	ldr q14, [ptr_src, 0x100 + 16*(\idx)]
	ldr q15, [ptr_src, 0x180 + 16*(\idx)]
	sub \t1\qs, \f1\qs, \g1\qs
	add \f0\qs, \f0\qs, \g0\qs
	add \f1\qs, \f1\qs, \g1\qs
.endm
.macro r_GS_2x_mix_com_NTT_8_load_1_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	ldr q18, [ptr_src, 0x300 + 16*(\idx)]
	mul \g0\qs, \t0\qs, \zl0
	ldr q19, [ptr_src, 0x380 + 16*(\idx)]
	sub \t3\qs, \f3\qs, \g3\qs
	ldr q16, [ptr_src, 0x200 + 16*(\idx)]
	mul \g1\qs, \t1\qs, \zl1
	ldr q17, [ptr_src, 0x280 + 16*(\idx)]
	sub \t2\qs, \f2\qs, \g2\qs
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_load_2_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	//ld1 {hi2.4s}, [ptr_hi2]
	ldr q22, [ptr_src, 0x500 + 16*(\idx)]
	mul \g0\qs, \t0\qs, \zl0
	//ld1 {hi3.4s}, [ptr_hi3]
	ldr q23, [ptr_src, 0x580 + 16*(\idx)]
	sub \t3\qs, \f3\qs, \g3\qs
	//ld1 {hi0.4s}, [ptr_hi0]
	ldr q20, [ptr_src, 0x400 + 16*(\idx)]
	mul \g1\qs, \t1\qs, \zl1
	//ld1 {hi1.4s}, [ptr_hi1]
	ldr q21, [ptr_src, 0x480 + 16*(\idx)]
	sub \t2\qs, \f2\qs, \g2\qs
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_load_3_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	//ld1 {hi6.4s}, [ptr_hi6]
	ldr q26, [ptr_src, 0x700 + 16*(\idx)]
	mul \g0\qs, \t0\qs, \zl0
	//ld1 {hi7.4s}, [ptr_hi7]
	ldr q27, [ptr_src, 0x780 + 16*(\idx)]
	sub \t3\qs, \f3\qs, \g3\qs
	//ld1 {hi4.4s}, [ptr_hi4]
	ldr q24, [ptr_src, 0x600 + 16*(\idx)]
	mul \g1\qs, \t1\qs, \zl1
	//ld1 {hi5.4s}, [ptr_hi5]
	ldr q25, [ptr_src, 0x680 + 16*(\idx)]
	sub \t2\qs, \f2\qs, \g2\qs	
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm

.macro r_GS_2x_mix_com_NTT_8_store_0_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	
	add \f2\qs, \f2\qs, \g2\qs
	str q12, [ptr_src, 0x000 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p
	
	add \f3\qs, \f3\qs, \g3\qs
	str q13, [ptr_src, 0x080 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_store_1_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	add \f2\qs, \f2\qs, \g2\qs
	str q14, [ptr_src, 0x100 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p
	str q16, [ptr_src, 0x200 + 16*(\idx)]	
	
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f3\qs, \f3\qs, \g3\qs
	str q15, [ptr_src, 0x180 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
	str q17, [ptr_src, 0x280 + 16*(\idx)]
.endm
.macro r_GS_2x_mix_com_NTT_8_store_2_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	add \f2\qs, \f2\qs, \g2\qs
	str q20, [ptr_src, 0x400 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p
	str q18, [ptr_src, 0x300 + 16*(\idx)]
	
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1	
	add \f3\qs, \f3\qs, \g3\qs
	str q21, [ptr_src, 0x480 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
	str q19, [ptr_src, 0x380 + 16*(\idx)]
.endm
.macro r_GS_2x_mix_com_NTT_8_store_3_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	add \f2\qs, \f2\qs, \g2\qs
	str q22, [ptr_src, 0x500 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p
	str q24, [ptr_src, 0x600 + 16*(\idx)]
	
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f3\qs, \f3\qs, \g3\qs
	str q23, [ptr_src, 0x580 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
	str q25, [ptr_src, 0x680 + 16*(\idx)]
.endm
.macro r_GS_2x_bot_com_NTT_8_store_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx // done
	mul \g2\qs, \t2\qs, \zl2
	sqrdmulh \t2\qs, \t2\qs, \zh2
	mls \g2\qs, \t2\qs, \p
	str q26, [ptr_src, 0x700 + 16*(\idx)]

	mul \g3\qs, \t3\qs, \zl3
	sqrdmulh \t3\qs, \t3\qs, \zh3
	mls \g3\qs, \t3\qs, \p
	str q27, [ptr_src, 0x780 + 16*(\idx)]
.endm
.macro r_GS_2x_bot_com_NTT_8_store_com_r_GS_2x_top_com_NTT_8_load_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, k0,k1,k2,k3, l0,l1,l2,l3, idx // done
	mul \g2\qs, \t2\qs, \zl2
	ldr q12, [ptr_src, 0x000 + 16*(\idx + 1)]
	sqrdmulh \t2\qs, \t2\qs, \zh2
	ldr q14, [ptr_src, 0x100 + 16*(\idx + 1)]
	mls \g2\qs, \t2\qs, \p
	str q26, [ptr_src, 0x700 + 16*(\idx)]
	
	mul \g3\qs, \t3\qs, \zl3
	ldr q13, [ptr_src, 0x080 + 16*(\idx + 1)]
	sqrdmulh \t3\qs, \t3\qs, \zh3
	ldr q15, [ptr_src, 0x180 + 16*(\idx + 1)]
	mls \g3\qs, \t3\qs, \p
	str q27, [ptr_src, 0x780 + 16*(\idx)]
	
	sub \t0\qs, \k0\qs, \l0\qs
	sub \t1\qs, \k1\qs, \l1\qs

	add \k0\qs, \k0\qs, \l0\qs
	add \k1\qs, \k1\qs, \l1\qs
.endm

.macro r_GS_2x_mix_com_NTT_8_shift_0_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	
	add \f2\qs, \f2\qs, \g2\qs
	str q12, [ptr_src, 0x000 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p

	add \f3\qs, \f3\qs, \g3\qs
	str q13, [ptr_src, 0x080 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_shift_1_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	add \f2\qs, \f2\qs, \g2\qs
	str q14, [ptr_src, 0x100 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	mls \g0\qs, \t0\qs, \p
	str q16, [ptr_src, 0x200 + 16*(\idx)]
	
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f3\qs, \f3\qs, \g3\qs
	str q15, [ptr_src, 0x180 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1	
	mls \g1\qs, \t1\qs, \p
	str q17, [ptr_src, 0x280 + 16*(\idx)]
.endm
.macro r_GS_2x_mix_com_NTT_8_shift_2_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx //done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	//st1 {hi0.4s}, [ptr_hi0], 16
	str q20, [ptr_src, 0x400 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	//st1 {hi1.4s}, [ptr_hi1], 16
	str q21, [ptr_src, 0x480 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	//st1 {lo6.4s}, [ptr_lo6], 16
	str q18, [ptr_src, 0x300 + 16*(\idx)]
	mls \g1\qs, \t1\qs, \p
	//st1 {lo7.4s}, [ptr_lo7], 16
	str q19, [ptr_src, 0x380 + 16*(\idx)]
.endm
.macro r_GS_2x_mix_com_NTT_8_shift_3_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p, idx // done
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	str q22, [ptr_src, 0x500 + 16*(\idx)]
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	str q23, [ptr_src, 0x580 + 16*(\idx)]
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	str q24, [ptr_src, 0x600 + 16*(\idx)]
	mls \g1\qs, \t1\qs, \p
	str q25, [ptr_src, 0x680 + 16*(\idx)]
.endm
.macro r_GS_2x_bot_com_NTT_8_shift_h qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, idx // done
	mul \g2\qs, \t2\qs, \zl2
	sqrdmulh \t2\qs, \t2\qs, \zh2
	mls \g2\qs, \t2\qs, \p
	str q26, [ptr_src, 0x700 + 16*(\idx)]

	mul \g3\qs, \t3\qs, \zl3
	sqrdmulh \t3\qs, \t3\qs, \zh3
	mls \g3\qs, \t3\qs, \p
	str q27, [ptr_src, 0x780 + 16*(\idx)]
.endm

	//--- ldr 
.macro r_GS_2x_top_com_NTT_8_address qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3
	add ptr_lo0, ptr_src, 0x000 // ptr_lo0: q12
	ld1 {lo0.4s}, [ptr_lo0] // lo0: q12
	add ptr_lo1, ptr_src, 0x080
	ld1 {lo1.4s}, [ptr_lo1]
	sub \t0\qs, \f0\qs, \g0\qs
	
	add ptr_lo2, ptr_src, 0x100
	ld1 {lo2.4s}, [ptr_lo2]
	add ptr_lo3, ptr_src, 0x180
	ld1 {lo3.4s}, [ptr_lo3]
	sub \t1\qs, \f1\qs, \g1\qs
	
	add \f0\qs, \f0\qs, \g0\qs
	add \f1\qs, \f1\qs, \g1\qs
.endm
.macro r_GS_2x_mix_com_NTT_8_address_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	add ptr_lo6, ptr_src, 0x300
	ld1 {lo6.4s}, [ptr_lo6]
	mul \g0\qs, \t0\qs, \zl0
	add ptr_lo7, ptr_src, 0x380
	ld1 {lo7.4s}, [ptr_lo7]
	sub \t3\qs, \f3\qs, \g3\qs
	add ptr_lo4, ptr_src, 0x200
	ld1 {lo4.4s}, [ptr_lo4]
	mul \g1\qs, \t1\qs, \zl1
	add ptr_lo5, ptr_src, 0x280
	ld1 {lo5.4s}, [ptr_lo5]
	sub \t2\qs, \f2\qs, \g2\qs
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_address_2 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	add ptr_hi2, ptr_src, 0x500
	ld1 {hi2.4s}, [ptr_hi2]
	mul \g0\qs, \t0\qs, \zl0
	add ptr_hi3, ptr_src, 0x580
	ld1 {hi3.4s}, [ptr_hi3]
	sub \t3\qs, \f3\qs, \g3\qs
	add ptr_hi0, ptr_src, 0x400
	ld1 {hi0.4s}, [ptr_hi0]
	mul \g1\qs, \t1\qs, \zl1
	add ptr_hi1, ptr_src, 0x480
	ld1 {hi1.4s}, [ptr_hi1]
	sub \t2\qs, \f2\qs, \g2\qs
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_address_3 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	add ptr_hi6, ptr_src, 0x700
	ld1 {hi6.4s}, [ptr_hi6]
	mul \g0\qs, \t0\qs, \zl0
	add ptr_hi7, ptr_src, 0x780
	ld1 {hi7.4s}, [ptr_hi7]
	sub \t3\qs, \f3\qs, \g3\qs
	add ptr_hi4, ptr_src, 0x600
	ld1 {hi4.4s}, [ptr_hi4]
	mul \g1\qs, \t1\qs, \zl1
	add ptr_hi5, ptr_src, 0x680
	ld1 {hi5.4s}, [ptr_hi5]
	sub \t2\qs, \f2\qs, \g2\qs	
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm

.macro r_GS_2x_top_com_NTT_8_load qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3
	ld1 {lo0.4s}, [ptr_lo0]
	ld1 {lo1.4s}, [ptr_lo1]
	sub \t0\qs, \f0\qs, \g0\qs
	ld1 {lo2.4s}, [ptr_lo2]
	ld1 {lo3.4s}, [ptr_lo3]
	sub \t1\qs, \f1\qs, \g1\qs
	add \f0\qs, \f0\qs, \g0\qs
	add \f1\qs, \f1\qs, \g1\qs
.endm
.macro r_GS_2x_mix_com_NTT_8_load_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	ld1 {lo6.4s}, [ptr_lo6]
	mul \g0\qs, \t0\qs, \zl0
	ld1 {lo7.4s}, [ptr_lo7]
	sub \t3\qs, \f3\qs, \g3\qs
	ld1 {lo4.4s}, [ptr_lo4]
	mul \g1\qs, \t1\qs, \zl1
	ld1 {lo5.4s}, [ptr_lo5]
	sub \t2\qs, \f2\qs, \g2\qs
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_load_2 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	ld1 {hi2.4s}, [ptr_hi2]
	mul \g0\qs, \t0\qs, \zl0
	ld1 {hi3.4s}, [ptr_hi3]
	sub \t3\qs, \f3\qs, \g3\qs
	ld1 {hi0.4s}, [ptr_hi0]
	mul \g1\qs, \t1\qs, \zl1
	ld1 {hi1.4s}, [ptr_hi1]
	sub \t2\qs, \f2\qs, \g2\qs
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_load_3 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	ld1 {hi6.4s}, [ptr_hi6]
	mul \g0\qs, \t0\qs, \zl0
	ld1 {hi7.4s}, [ptr_hi7]
	sub \t3\qs, \f3\qs, \g3\qs
	ld1 {hi4.4s}, [ptr_hi4]
	mul \g1\qs, \t1\qs, \zl1
	ld1 {hi5.4s}, [ptr_hi5]
	sub \t2\qs, \f2\qs, \g2\qs	
	add \f2\qs, \f2\qs, \g2\qs
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm

.macro r_GS_2x_mix_com_NTT_8_store_0 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {lo0.4s}, [ptr_lo0], 16
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {lo1.4s}, [ptr_lo1], 16
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_store_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {lo2.4s}, [ptr_lo2], 16
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {lo3.4s}, [ptr_lo3], 16
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	st1 {lo4.4s}, [ptr_lo4], 16
	mls \g1\qs, \t1\qs, \p
	st1 {lo5.4s}, [ptr_lo5], 16
.endm
.macro r_GS_2x_mix_com_NTT_8_store_2 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {hi0.4s}, [ptr_hi0], 16
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {hi1.4s}, [ptr_hi1], 16
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	st1 {lo6.4s}, [ptr_lo6], 16
	mls \g1\qs, \t1\qs, \p
	st1 {lo7.4s}, [ptr_lo7], 16
.endm
.macro r_GS_2x_mix_com_NTT_8_store_3 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {hi2.4s}, [ptr_hi2], 16
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {hi3.4s}, [ptr_hi3], 16
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	st1 {hi4.4s}, [ptr_hi4], 16
	mls \g1\qs, \t1\qs, \p
	st1 {hi5.4s}, [ptr_hi5], 16
.endm
.macro r_GS_2x_bot_com_NTT_8_store qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	mul \g2\qs, \t2\qs, \zl2
	mul \g3\qs, \t3\qs, \zl3
	sqrdmulh \t2\qs, \t2\qs, \zh2
	sqrdmulh \t3\qs, \t3\qs, \zh3
	mls \g2\qs, \t2\qs, \p
	st1 {hi6.4s}, [ptr_hi6], 16
	mls \g3\qs, \t3\qs, \p
	st1 {hi7.4s}, [ptr_hi7], 16
.endm
.macro r_GS_2x_bot_com_NTT_8_store_com_r_GS_2x_top_com_NTT_8_load qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p, k0,k1,k2,k3, l0,l1,l2,l3
	mul \g2\qs, \t2\qs, \zl2
	ld1 {lo0.4s}, [ptr_lo0]
	mul \g3\qs, \t3\qs, \zl3
	ld1 {lo1.4s}, [ptr_lo1]
	sqrdmulh \t2\qs, \t2\qs, \zh2
	sub \t0\qs, \k0\qs, \l0\qs
	ld1 {lo2.4s}, [ptr_lo2]
	sqrdmulh \t3\qs, \t3\qs, \zh3
	ld1 {lo3.4s}, [ptr_lo3]
	mls \g2\qs, \t2\qs, \p
	sub \t1\qs, \k1\qs, \l1\qs
	st1 {hi6.4s}, [ptr_hi6], 16
	add \k0\qs, \k0\qs, \l0\qs
	mls \g3\qs, \t3\qs, \p
	add \k1\qs, \k1\qs, \l1\qs
	st1 {hi7.4s}, [ptr_hi7], 16
.endm

.macro r_GS_2x_mix_com_NTT_8_shift_0 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {lo0.4s}, [ptr_lo0], 16
	add ptr_lo0, ptr_lo0, 0x780
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {lo1.4s}, [ptr_lo1], 16
	add ptr_lo1, ptr_lo1, 0x780
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	mls \g1\qs, \t1\qs, \p
.endm
.macro r_GS_2x_mix_com_NTT_8_shift_1 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {lo2.4s}, [ptr_lo2], 16
	add ptr_lo2, ptr_lo2, 0x780
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {lo3.4s}, [ptr_lo3], 16
	add ptr_lo3, ptr_lo3, 0x780
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	st1 {lo4.4s}, [ptr_lo4], 16
	add ptr_lo4, ptr_lo4, 0x780
	mls \g1\qs, \t1\qs, \p
	st1 {lo5.4s}, [ptr_lo5], 16
	add ptr_lo5, ptr_lo5, 0x780
.endm
.macro r_GS_2x_mix_com_NTT_8_shift_2 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {hi0.4s}, [ptr_hi0], 16
	add ptr_hi0, ptr_hi0, 0x780
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {hi1.4s}, [ptr_hi1], 16
	add ptr_hi1, ptr_hi1, 0x780
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	st1 {lo6.4s}, [ptr_lo6], 16
	add ptr_lo6, ptr_lo6, 0x780
	mls \g1\qs, \t1\qs, \p
	st1 {lo7.4s}, [ptr_lo7], 16
	add ptr_lo7, ptr_lo7, 0x780
.endm
.macro r_GS_2x_mix_com_NTT_8_shift_3 qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl0,zh0,zl1,zh1,p
	sub \t2\qs, \f2\qs, \g2\qs
	mul \g0\qs, \t0\qs, \zl0
	sub \t3\qs, \f3\qs, \g3\qs
	mul \g1\qs, \t1\qs, \zl1
	add \f2\qs, \f2\qs, \g2\qs
	st1 {hi2.4s}, [ptr_hi2], 16
	add ptr_hi2, ptr_hi2, 0x780
	sqrdmulh \t0\qs, \t0\qs, \zh0
	add \f3\qs, \f3\qs, \g3\qs
	st1 {hi3.4s}, [ptr_hi3], 16
	add ptr_hi3, ptr_hi3, 0x780
	sqrdmulh \t1\qs, \t1\qs, \zh1
	mls \g0\qs, \t0\qs, \p
	st1 {hi4.4s}, [ptr_hi4], 16
	add ptr_hi4, ptr_hi4, 0x780
	mls \g1\qs, \t1\qs, \p
	st1 {hi5.4s}, [ptr_hi5], 16
	add ptr_hi5, ptr_hi5, 0x780
.endm
.macro r_GS_2x_bot_com_NTT_8_shift qs,f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3, zl2,zh2,zl3,zh3,p
	mul \g2\qs, \t2\qs, \zl2
	mul \g3\qs, \t3\qs, \zl3
	sqrdmulh \t2\qs, \t2\qs, \zh2
	sqrdmulh \t3\qs, \t3\qs, \zh3
	mls \g2\qs, \t2\qs, \p
	st1 {hi6.4s}, [ptr_hi6], 16
	add ptr_hi6, ptr_hi6, 0x780
	mls \g3\qs, \t3\qs, \p
	st1 {hi7.4s}, [ptr_hi7], 16
	add ptr_hi7, ptr_hi7, 0x780
.endm
	// ---
.macro r_GS_12x_interleaved  qs,f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,fa,fb,		\
								g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,ga,gb,		\
								t0,t1,t2,t3,t4,t5,t6,t7,t8,t9,ta,tb,		\
								zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3,			\
								zl4,zh4,zl5,zh5,zl6,zh6,zl7,zh7,			\
								zl8,zh8,zl9,zh9,zla,zha,zlb,zhb, p

	r_GS_2x_top \qs,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3
	r_GS_2x_mix \qs,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3,		\
				\zl0,\zh0,\zl1,\zh1,\p
	r_GS_2x_mix \qs,\f2,\f3,\f4,\f5,\g2,\g3,\g4,\g5,\t2,\t3,\t4,\t5,		\
				\zl2,\zh2,\zl3,\zh3,\p
	r_GS_2x_mix \qs,\f4,\f5,\f6,\f7,\g4,\g5,\g6,\g7,\t4,\t5,\t6,\t7,		\
				\zl4,\zh4,\zl5,\zh5,\p
	r_GS_2x_mix \qs,\f6,\f7,\f8,\f9,\g6,\g7,\g8,\g9,\t6,\t7,\t8,\t9,		\
				\zl6,\zh6,\zl7,\zh7,\p
	r_GS_2x_mix \qs,\f8,\f9,\fa,\fb,\g8,\g9,\ga,\gb,\t8,\t9,\ta,\tb,		\
				\zl8,\zh8,\zl9,\zh9,\p
	r_GS_2x_bot \qs,\f8,\f9,\fa,\fb,\g8,\g9,\ga,\gb,\t8,\t9,\ta,\tb,		\
				\zla,\zha,\zlb,\zhb,\p
.endm

.macro r_NTT6_bfly_2x qs, f0,f1,f2,ft,g0,g1,g2,gt,root3_lo,root3_hi,p
	sub \f2\qs, \f0\qs, \f2\qs			// f2 = U0 - U2
	sub \g2\qs, \g0\qs, \g2\qs			// g2 = V0 - V2
	sub \ft\qs, \f0\qs, \f1\qs			// ft = U0 - U1
	sub \gt\qs, \g0\qs, \g1\qs			// gt = V0 - V1
	sub \f0\qs, \f2\qs, \ft\qs			// f0 = U1 - U2
	sub \g0\qs, \g2\qs, \gt\qs			// g0 = V1 - V2

	add \f1\qs, \f2\qs, \g2\qs			// f1 = U0 - U2 + (V0 - V2)
	sub \g1\qs, \f2\qs, \g2\qs			// g1 = U0 - U2 - (V0 - V2)
	add \f2\qs, \ft\qs, \gt\qs			// f2 = U0 - U1 + (V0 - V1)
	sub \g2\qs, \ft\qs, \gt\qs			// g2 = U0 - U1 - (V0 - V1)

	mul \ft\qs, \f0\qs, \root3_lo		// Barrett multiplication
	mul \gt\qs, \g0\qs, \root3_lo		// with v29.d[0] = root3
	sqrdmulh \f0\qs, \f0\qs, \root3_hi
	sqrdmulh \g0\qs, \g0\qs, \root3_hi
	mls \ft\qs, \f0\qs, \p				// ft = v (U1 - U2)
	mls \gt\qs, \g0\qs, \p				// gt = v (V1 - V2)

	add \f0\qs, \ft\qs, \gt\qs			// f0 = v ((U1 - U2) + (V1 - V2))
	sub \g0\qs, \ft\qs, \gt\qs			// g0 = v ((U1 - U2) - (V1 - V2))

	add \f1\qs, \f1\qs, \f0\qs			// 6NTT f1
	sub \f2\qs, \f2\qs, \f0\qs			// 6NTT f2
	add \g1\qs, \g1\qs, \g0\qs			// 6NTT g1
	sub \g2\qs, \g2\qs, \g0\qs			// 6NTT g2
.endm
.macro r_NTT6_demon_store_2x qs, t0,t1,f0,f1,ptr_t0,ptr_t1,demon_lo,demon_hi,p
	mul \t0\qs, \f0\qs, \demon_lo
	mul \t1\qs, \f1\qs, \demon_lo
	sqrdmulh \f0\qs, \f0\qs, \demon_hi
	sqrdmulh \f1\qs, \f1\qs, \demon_hi
	mls \t0\qs, \f0\qs, \p
	mls \t1\qs, \f1\qs, \p
	st1 {\t0\qs}, [\ptr_t0]
	st1 {\t1\qs}, [\ptr_t1]
	add \ptr_t0, \ptr_t0, 32
	add \ptr_t1, \ptr_t1, 32
.endm

.macro r_NTT6_2x qs,	f00,f01,f10,f11,f20,f21,\
						g00,g01,g10,g11,g20,g21,\
						ft0,ft1,gt0,gt1,tt0,tt1,\
						ptr_s00_0,ptr_s10_0,ptr_s20_0,\
						ptr_s01_0,ptr_s11_0,ptr_s21_0,\
						ptr_s00_1,ptr_s10_1,ptr_s20_1,\
						ptr_s01_1,ptr_s11_1,ptr_s21_1,\
						root3_lo, root3_hi, demon_lo, demon_hi, p

	add \tt0\qs, \f00\qs, \f10\qs
	add \tt1\qs, \f01\qs, \f11\qs
        add \gt0\qs, \g00\qs, \g10\qs
        add \gt1\qs, \g01\qs, \g11\qs

	add \tt0\qs, \tt0\qs, \f20\qs
	add \tt1\qs, \tt1\qs, \f21\qs
	add \gt0\qs, \gt0\qs, \g20\qs
	add \gt1\qs, \gt1\qs, \g21\qs

	add \ft0\qs, \tt0\qs, \gt0\qs
	add \ft1\qs, \tt1\qs, \gt1\qs
	sub \gt0\qs, \tt0\qs, \gt0\qs
	sub \gt1\qs, \tt1\qs, \gt1\qs

	r_NTT6_demon_store_2x \qs,\tt0,\tt1,\ft0,\ft1,\ptr_s00_0,\ptr_s00_1,\demon_lo,\demon_hi,\p
	r_NTT6_demon_store_2x \qs,\tt0,\tt1,\gt0,\gt1,\ptr_s01_0,\ptr_s01_1,\demon_lo,\demon_hi,\p


	r_NTT6_bfly_2x \qs, \f00,\f10,\f20,\ft0,\g00,\g10,\g20,\gt0,\root3_lo,\root3_hi,\p
	r_NTT6_bfly_2x \qs, \f01,\f11,\f21,\ft1,\g01,\g11,\g21,\gt1,\root3_lo,\root3_hi,\p
	
	r_NTT6_demon_store_2x \qs,\tt0,\tt1,\f10,\f11,\ptr_s10_0,\ptr_s10_1,\demon_lo,\demon_hi,\p
	r_NTT6_demon_store_2x \qs,\tt0,\tt1,\g10,\g11,\ptr_s11_0,\ptr_s11_1,\demon_lo,\demon_hi,\p
	r_NTT6_demon_store_2x \qs,\tt0,\tt1,\f20,\f21,\ptr_s20_0,\ptr_s20_1,\demon_lo,\demon_hi,\p
	r_NTT6_demon_store_2x \qs,\tt0,\tt1,\g20,\g21,\ptr_s21_0,\ptr_s21_1,\demon_lo,\demon_hi,\p
.endm




