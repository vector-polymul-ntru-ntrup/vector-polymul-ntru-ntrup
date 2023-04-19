
#include <stdio.h>
#include <stdint.h>
#include <stddef.h>

#include <arm_neon.h>

#include "poly_basic.h"
#include "negacyclic_mul.h"

int16_t Bruun_mul_args[16] = {
Q,
SQRT2lo,                 SQRT2hi,
SQRT2NEGSQRT2lo,         SQRT2NEGSQRT2hi,
SQRT2NEGSQRT2SQNEGONElo, SQRT2NEGSQRT2SQNEGONEhi,
SQRT2POSSQRT2lo,         SQRT2POSSQRT2hi,
SQRT2POSSQRT2SQNEGONElo, SQRT2POSSQRT2SQNEGONEhi
};

int16_t iBruun_mul_args[16] = {
Q, 29235,
SQRT2INVlo,              SQRT2INVhi,
SQRT2NEGSQRT2INVlo,      SQRT2NEGSQRT2INVhi,
SQRT2NEGSQRT2SQNEGONElo, SQRT2NEGSQRT2SQNEGONEhi,
SQRT2POSSQRT2INVlo,      SQRT2POSSQRT2INVhi,
SQRT2POSSQRT2SQNEGONElo, SQRT2POSSQRT2SQNEGONEhi
};

int16_t negacyclic_mul_arg[16] = {
Qprime, Q,
SQRT2NEGSQRT2lo, SQRT2NEGSQRT2hi, -SQRT2NEGSQRT2lo, -SQRT2NEGSQRT2hi,
SQRT2POSSQRT2lo, SQRT2POSSQRT2hi, -SQRT2POSSQRT2lo, -SQRT2POSSQRT2hi
};


void polymul32x8_permuted(int32x4_t *des, int32x4_t *src1, int32x4_t *src2){


    int16_t buf1[8][32], buf2[8][32];
    int16_t buf3[8][32];

    __asm_Bruun_permuted((int16x8_t*)&buf1[0][0], src1, Bruun_mul_args);
    __asm_Bruun_permuted((int16x8_t*)&buf2[0][0], src2, Bruun_mul_args);

    __asm_basemul((int16x8_t*)&buf3[0][0], (int16x8_t*)&buf1[0][0], (int16x8_t*)&buf2[0][0], negacyclic_mul_arg);

    __asm_iBruun_permuted(des, (int16x8_t*)&buf3[0][0], iBruun_mul_args);



}





