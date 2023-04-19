
#include <stddef.h>
#include <stdint.h>

#include "../params.h"

#include "polymul.h"

#include "opt.h"

void polymul(int32_t *r, int16_t *a, int16_t *b){
    int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];
    int32_t B[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];

    ntt3x128x4_goodntt((int32_t (*)[NTT_DIM_Y][NTT_DIM_Z])r, a);
    ntt3x128x4_goodntt(B, b);
    ntt3x128x4_basemul(R, (int32_t (*)[NTT_DIM_Y][NTT_DIM_Z])r, B);
    ntt3x128x4_ttndoog((int32_t (*)[NTT_DIM_Y][NTT_DIM_Z])r, R);

}


