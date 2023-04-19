#include <stdint.h>
#include "opt.h"

#include "opt-ntt3x128x4_basemul.S-const.h"
extern void ntt3x128x4_basemul_S(   int32_t r[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                                    int32_t a[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                                    int32_t b[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                                    int64_t *table, int32_t p, int32_t m);

void ntt3x128x4_basemul(int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                        int32_t A[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                        int32_t B[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z] ){

    ntt3x128x4_basemul_S(R, A, B, table, NTT_P, NTT_M);

}
