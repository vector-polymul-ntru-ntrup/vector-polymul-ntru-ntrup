
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "api.h"
#include "params.h"
#include "crypto_kem.h"
#include "poly_arith.h"
#include "polymul/NTT_params.h"
#include "polymul/polymul.h"
#include "polymul/rader.h"
#include "polymul/poly_basic.h"
#include "polymul/poly_vec.h"

#define NTESTS 1000

uint64_t time0, time1;
uint64_t cycles[NTESTS];

#ifdef __APPLE__

#include "m1cycles.h"
#define __AVERAGE__
#define SETUP_COUNTER() {(void)cycles; setup_rdtsc();}
#define CYCLE_TYPE "%lld"
#define GET_TIME rdtsc()

#else

#include "hal.h"
#undef __AVERAGE__
#define __MEDIAN__
#define SETUP_COUNTER() {}
#define CYCLE_TYPE "%ld"
#define GET_TIME hal_get_time()


static int cmp_uint64(const void *a, const void *b){
    return ((*((const uint64_t*)a)) - ((*((const uint64_t*)b))));
}

#endif

#ifdef __AVERAGE__

#define LOOP_INIT(__clock0, __clock1) { \
    __clock0 = GET_TIME; \
}
#define LOOP_TAIL(__f_string, records, __clock0, __clock1) { \
    __clock1 = GET_TIME; \
    printf(__f_string, (__clock1 - __clock0) / NTESTS); \
}
#define BODY_INIT(__clock0, __clock1) {}
#define BODY_TAIL(records, __clock0, __clock1) {}

#elif defined(__MEDIAN__)

#define LOOP_INIT(__clock0, __clock1) {}
#define LOOP_TAIL(__f_string, records, __clock0, __clock1) { \
    qsort(records, sizeof(uint64_t), NTESTS, cmp_uint64); \
    printf(__f_string, records[NTESTS >> 1]); \
}
#define BODY_INIT(__clock0, __clock1) { \
    __clock0 = GET_TIME; \
}
#define BODY_TAIL(records, __clock0, __clock1) { \
    __clock1 = GET_TIME; \
    records[i] = __clock1 - __clock0; \
}

#endif

#define WRAP_FUNC(__f_string, records, __clock0, __clock1, func){ \
    LOOP_INIT(__clock0, __clock1); \
    for(size_t i = 0; i < NTESTS; i++){ \
        BODY_INIT(__clock0, __clock1); \
        func; \
        BODY_TAIL(records, __clock0, __clock1); \
    } \
    LOOP_TAIL(__f_string, records, __clock0, __clock1); \
}



int main()
{


    SETUP_COUNTER();

    int16_t src1[POLY_N], src2[POLY_N];
    int16_t des[POLY_N];

    int16_t poly1_NTT[51 * 32], poly2_NTT[51 * 32];
    int16_t *res_NTT = poly1_NTT;

    WRAP_FUNC("polymul (Z_q[x] / (x^1632 - 1)): " CYCLE_TYPE " \n",
            cycles, time0, time1,
            polymul(des, src1, src2));

    WRAP_FUNC("Rader-17 (x24): " CYCLE_TYPE " (x24)\n",
            cycles, time0, time1,
            __asm_rader_17_mix_pre((int16x8_t*)(poly1_NTT), (int16x8_t*)src1, in_table[0], twiddle_permutedx8));

    WRAP_FUNC("Radix-(3, 2) (x2): " CYCLE_TYPE " (x2)\n",
            cycles, time0, time1,
            __asm_radix32(poly1_NTT, radix3_args));

    WRAP_FUNC("weighted 16x16: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            __asm_weighted16x16(res_NTT, poly1_NTT, poly2_NTT, basemul_full_table));

    WRAP_FUNC("Radix-(3, 2) inverse: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            __asm_radix32(res_NTT, iradix3_args));


    WRAP_FUNC("Radix-17 inverse (x12): " CYCLE_TYPE " (x12)\n",
            cycles, time0, time1,
            __asm_rader_17_mix_post((int16x8_t*)(des), (int16x8_t*)(res_NTT), in_table[0], twiddle_inv_permutedx8));






  return 0;

}






