#ifndef POLYMUL_H
#define POLYMUL_H

#include <stddef.h>
#include <stdint.h>
#include <arm_neon.h>

#define Q 4591
// 65536 mod 4591
#define RmodQ (1262)
// -4591^{-1} mod 65536
#define Qprime (-15631)

extern void _load_good_radix_3_2_2(int16_t UA[3][32][32], const int16_t *big, int16_t *args);
extern void _radix_2_2_2(int32_t res[32][16], const int16_t a[32][32], int16_t *args);
extern void _NTT_inv(int16_t res[32][32], const int16_t a[32][32], int16_t *args);
extern void _load_good_NTT_32_small(int16_t B[3][32][32], const int8_t *small_8);
extern void _radix_3(int32_t res[3][32][16], const int16_t a[3][32][32], int16_t *args);
extern void inv_3_2_store_asm(int16_t res[761], const int16_t A[3][32][32], int16_t *args);

void polymul(int16_t *res, const int16_t *big, const int8_t *small);
void good_radix_2_3_store(int16_t res[761], const int16_t A[3][32][32]);

#endif


