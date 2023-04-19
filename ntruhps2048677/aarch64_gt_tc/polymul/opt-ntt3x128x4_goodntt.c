#include <stdint.h>
#include "opt.h"

extern void ntt3x128x4_goodntt_S(int32_t A[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], const poly* a, int64_t p);

void ntt3x128x4_goodntt(int32_t A[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z], const poly* a){

	ntt3x128x4_goodntt_S(A, a, NTT_P);

}
