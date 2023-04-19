#ifndef OPT_H
#define OPT_H

#include "../poly.h"

#define NTT_3_128_4_ASM_NTT

#define NTT_3_128_4_ASM_GOODNTT
#define NTT_3_128_4_ASM_BASEMUL
#define NTT_3_128_4_ASM_TTNDOOG
#define NTT_3_128_4_ASM_POLYMOD


#define NTT_P ((int32_t)16760833)
#define NTT_H ((int32_t)8380416)    // H = -1/2 mod P
#define NTT_M ((int64_t)-251674625) // M = -1/P mod 2^32

#define NTT_DIM 1536
#define NTT_DIM_X 3
#define NTT_DIM_Y 128
#define NTT_DIM_Z 4

void ntt3x128x4_goodntt(int32_t A[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                        const poly* a);
void ntt3x128x4_basemul(int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                        int32_t A[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                        int32_t B[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z] );
void ntt3x128x4_ttndoog(int32_t S[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                        int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z] );
void ntt3x128x4_polymod(poly* s, \
                        int32_t S[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z]);


#endif

