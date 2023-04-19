#ifndef POLY_H
#define POLY_H

#include <stdint.h>

#include <arm_neon.h>

#define Q 4591
// 65536 mod 4591
#define RmodQ (1262)
// -4591^{-1} mod 65536
#define Qprime (-15631)

// Barrett multiplication for the constant z (r = 65536):
// zlo = z
// zhi = ((even (z r cmod q) in [-q, q]) * Qprime cmod r) / 2

// ((, ), (, )) = Bruun(a0, a1, a2, a3)
// (a0, a1, a2, a3)
// (a0 - a2 + zeta a3, a1 + (zeta^2 - 1) a3 - zeta a2)
// (a0 - a2 - zeta a3, a1 + (zeta^2 - 1) a3 + zeta a2)

// (, , , ) iBruun((b0, b1), (c0, c1))
// (b0, b1), (c0, c1)
// b0 + c0 + zeta^{-1} (c1 - b1)
// b1 + c1 - (zeta^2 - 1) zeta^{-1} (b0 - c0)
// zeta^{-1} (c1 - b1)
// zeta^{-1} (b0 - c0)

// sqrt(2) mod 4591
#define SQRT2 (1229)
// sqrt(2)^{-1} mod 4591
#define SQRT2INV (-1681)
// 2^{-1} mod 4591
#define TWOINV (-2295)

// sqrt(2 - sqrt(2)) mod 4591
#define SQRT2NEGSQRT2 (58)
#define SQRT2NEGSQRT2INV (-1029)
#define SQRT2NEGSQRT2SQNEGONE (-1228)

// sqrt(2 + sqrt(2)) mod 4591
#define SQRT2POSSQRT2 (2116)
#define SQRT2POSSQRT2INV (1087)
#define SQRT2POSSQRT2SQNEGONE (1230)

// we need to generate the following constants in a more systematic way
#define SQRT2lo (1229)
#define SQRT2hi (8772)
#define SQRT2INVlo (-1681)
#define SQRT2INVhi (-11998)

#define SQRT2NEGSQRT2lo (58)
#define SQRT2NEGSQRT2hi (414)
#define SQRT2NEGSQRT2INVlo (-1029)
#define SQRT2NEGSQRT2INVhi (-7344)
#define SQRT2NEGSQRT2SQNEGONElo (-1228)
#define SQRT2NEGSQRT2SQNEGONEhi (-8765)
#define SQRT2POSSQRT2lo (2116)
#define SQRT2POSSQRT2hi (15103)
#define SQRT2POSSQRT2INVlo (1087)
#define SQRT2POSSQRT2INVhi (7758)
#define SQRT2POSSQRT2SQNEGONElo (1230)
#define SQRT2POSSQRT2SQNEGONEhi (8779)

extern int16_t Bruun_mul_args[16];
extern int16_t iBruun_mul_args[16];
extern int16_t negacyclic_mul_arg[16];

extern void __asm_Bruun_permuted(int16x8_t*, int32x4_t*, int16_t*);
extern void __asm_iBruun_permuted(int32x4_t*, int16x8_t*, int16_t*);
extern void __asm_basemul(int16x8_t *des, int16x8_t *src1, int16x8_t *src2, int16_t *mul_arg);

void polymul32x8_permuted(int32x4_t *des, int32x4_t *src1, int32x4_t *src2);



#endif


