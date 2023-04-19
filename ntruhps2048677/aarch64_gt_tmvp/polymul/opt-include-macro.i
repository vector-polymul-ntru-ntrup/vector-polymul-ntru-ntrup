#include "opt-implement-macro.i"

.macro CT_8x f0,f1,f2,f3,f4,f5,f6,f7, g0,g1,g2,g3,g4,g5,g6,g7, t0,t1,t2,t3,t4,t5,t6,t7, zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3,zl4,zh4,zl5,zh5,zl6,zh6,zl7,zh7
	r_CT_8x_interleaved .4s,\f0,\f1,\f2,\f3,\f4,\f5,\f6,\f7, \g0,\g1,\g2,\g3,\g4,\g5,\g6,\g7, \t0,\t1,\t2,\t3,\t0,\t1,\t2,\t3, \zl0,\zh0,\zl1,\zh1,\zl2,\zh2,\zl3,\zh3,\zl4,\zh4,\zl5,\zh5,\zl6,\zh6,\zl7,\zh7, v8.s[0]
.endm

.macro ASYMMUL_4x y0,y1,y2,y3, f0,f1,f2,f3,g0,g1,g2,g3, t0,t1,zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3
	r_ASYMMUL_4x .2d,.4s,.2s, \y0,\y1,\y2,\y3, \f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3, \t0,\t1, \zl0,\zh0,\zl1,\zh1,\zl2,\zh2,\zl3,\zh3, v8.s[0],v8.s[1]
.endm

.macro GS_4x f0,f1,f2,f3, g0,g1,g2,g3, t0,t1,t2,t3, zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3
	r_GS_4x_interleaved .4s,\f0,\f1,\f2,\f3, \g0,\g1,\g2,\g3, \t0,\t1,\t2,\t3, \zl0,\zh0,\zl1,\zh1,\zl2,\zh2,\zl3,\zh3, v8.s[0]
.endm

/* ttndoog */

.macro GS_2x_top f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3
	// sub-add (f0,f1), (g0,g1)
	r_GS_2x_top .4s,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3
.endm
.macro GS_2x_mix f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3,zl0,zh0,zl1,zh1
	// sub-add (f2,f3), (g2,g3) with b.mult (f0,f1), (g0,g1)
	r_GS_2x_mix .4s,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3,\
				\zl0,\zh0,\zl1,\zh1,v0.s[0]
.endm
.macro GS_2x_bot f0,f1,f2,f3,g0,g1,g2,g3,t0,t1,t2,t3,zl2,zh2,zl3,zh3
	// b.mult (f2,f3), (g2,g3)
	r_GS_2x_bot .4s,\f0,\f1,\f2,\f3,\g0,\g1,\g2,\g3,\t0,\t1,\t2,\t3,\
				\zl2,\zh2,\zl3,\zh3,v0.s[0]
.endm

.macro GS_12x   f0,f1,f2,f3,f4,f5,f6,f7,f8,f9,fa,fb,						\
				g0,g1,g2,g3,g4,g5,g6,g7,g8,g9,ga,gb,						\
				t0,t1,t2,t3,												\
				zl0,zh0,zl1,zh1,zl2,zh2,zl3,zh3,zl4,zh4,zl5,zh5,			\
				zl6,zh6,zl7,zh7,zl8,zh8,zl9,zh9,zla,zha,zlb,zhb

	r_GS_12x_interleaved	.4s,\f0,\f1,\f2,\f3,\f4,\f5,					\
								\f6,\f7,\f8,\f9,\fa,\fb,					\
								\g0,\g1,\g2,\g3,\g4,\g5,					\
								\g6,\g7,\g8,\g9,\ga,\gb,					\
								\t0,\t1,\t2,\t3,\t0,\t1,					\
								\t2,\t3,\t0,\t1,\t2,\t3,					\
								\zl0,\zh0,\zl1,\zh1,\zl2,\zh2,\zl3,\zh3,	\
								\zl4,\zh4,\zl5,\zh5,\zl6,\zh6,\zl7,\zh7,	\
								\zl8,\zh8,\zl9,\zh9,\zla,\zha,\zlb,\zhb,	\
								v31.s[2]
.endm

.macro NTT6_2x	f00,f01,f10,f11,f20,f21,\
				g00,g01,g10,g11,g20,g21,\
				ft0,ft1,gt0,gt1,tt0,tt1,\
				ptr_s00_0,ptr_s10_0,ptr_s20_0,\
				ptr_s01_0,ptr_s11_0,ptr_s21_0,\
				ptr_s00_1,ptr_s10_1,ptr_s20_1,\
				ptr_s01_1,ptr_s11_1,ptr_s21_1

	r_NTT6_2x .4s,	\f00,\f01,\f10,\f11,\f20,\f21,\
					\g00,\g01,\g10,\g11,\g20,\g21,\
					\ft0,\ft1,\gt0,\gt1,\tt0,\tt1,\
					\ptr_s00_0,\ptr_s10_0,\ptr_s20_0,\
					\ptr_s01_0,\ptr_s11_0,\ptr_s21_0,\
					\ptr_s00_1,\ptr_s10_1,\ptr_s20_1,\
					\ptr_s01_1,\ptr_s11_1,\ptr_s21_1,\
					v30.s[0],v30.s[1],v30.s[2],v30.s[3],v31.s[2]
.endm



