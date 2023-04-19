
#include <stddef.h>
#include <stdint.h>

#include "../params.h"

#include "polymul.h"

#include "opt.h"

void polymul(poly *r, poly *a, poly *b){

    int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];
    int32_t A[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];
    int32_t B[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];

    int32_t *ptr_A;

    for(size_t i = NTRU_N; i < 768; i++){
        a->coeffs[i] = b->coeffs[i] = 0;
    }

    ntt3x128x4_goodntt(A, a);
    ntt3x128x4_goodntt(B, b);
    ntt3x128x4_basemul(R, A, B);
    ntt3x128x4_ttndoog(A, R);

    ptr_A = &A[0][0][0];

    for(size_t i = 0; i < NTRU_N; i++){
        r->coeffs[i] = ptr_A[i] + ptr_A[i + NTRU_N];
    }

}


