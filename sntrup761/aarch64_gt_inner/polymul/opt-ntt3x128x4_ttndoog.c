#include <stdint.h>
#include "opt.h"


extern void ntt3x128x4_ttndoog_S(int32_t S[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z],\
                                 int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z],\
                                 int64_t p );


void ntt3x128x4_ttndoog(int32_t S[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], \
                        int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z]){

    ntt3x128x4_ttndoog_S(S, R, NTT_P);

}
