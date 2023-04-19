
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "api.h"
#include "params.h"
#include "crypto_kem.h"
#include "sntrup_core.h"
#include "poly_arith.h"
#include "polymul/polymul.h"
#include "polymul/negacyclic_mul.h"

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
    __clock0 = rdtsc(); \
}
#define LOOP_TAIL(__f_string, records, __clock0, __clock1) { \
    __clock1 = rdtsc(); \
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

    int16_t big_src[POLY_N];
    int8_t small_src[POLY_N];
    int16_t res[POLY_N];

    int16_t A[3][32][32] = {0};
    int16_t B[3][32][32] = {0};
    int32_t AA[3][32][16] = {0};
    int32_t BB[3][32][16] = {0};
    int16_t args[4] = {4591, 310, 2212, 29235};
    int16_t args2[4] = {4591, 29235};
    int16_t args3[4] = {4591, 310, 2212};

    int16_t buf1[8][32], buf2[8][32];
    int16_t buf3[8][32];




    SETUP_COUNTER();

    WRAP_FUNC("polymul (Z_q[x] / (x^761 - x - 1)): " CYCLE_TYPE "\n",
            cycles, time0, time1,
            polymul(res, big_src, small_src));


    WRAP_FUNC("Good + radix-3 + 2 x radix-2 (x1): " CYCLE_TYPE " (x1)\n",
            cycles, time0, time1,
            _load_good_radix_3_2_2(A, big_src, args));

    WRAP_FUNC("3 x radix-2 (x3): " CYCLE_TYPE " (x3)\n",
            cycles, time0, time1,
            _radix_2_2_2(AA[0], (const int16_t (*)[32])A[0], args2));


    WRAP_FUNC("Good + 5 x radix-2 (x1): " CYCLE_TYPE " (x1)\n",
            cycles, time0, time1,
            _load_good_NTT_32_small(B, small_src));

    WRAP_FUNC("radix-3 (x1): " CYCLE_TYPE " (x1)\n",
            cycles, time0, time1,
            _radix_3(BB, (const int16_t (*)[32][32])B, args3));

    WRAP_FUNC("Bruun (x24): " CYCLE_TYPE " (x24)\n",
            cycles, time0, time1,
            __asm_Bruun_permuted((int16x8_t*)&buf1[0][0], (int32x4_t*)AA[0][0], Bruun_mul_args));

    WRAP_FUNC("trinomial 8x8 (x12): " CYCLE_TYPE " (x12)\n",
            cycles, time0, time1,
            __asm_basemul((int16x8_t*)&buf3[0][0], (int16x8_t*)&buf1[0][0], (int16x8_t*)&buf2[0][0], negacyclic_mul_arg));

    WRAP_FUNC("iBruun (x12): " CYCLE_TYPE " (x12)\n",
            cycles, time0, time1,
            __asm_iBruun_permuted((int32x4_t*)B[0][0], (int16x8_t*)&buf3[0][0], iBruun_mul_args));

    WRAP_FUNC("4 x radix-2 inverse (x3): " CYCLE_TYPE " (x3)\n",
            cycles, time0, time1,
            _NTT_inv(A[0], (const int16_t (*)[32])B[0], args2));


    WRAP_FUNC("radix-2, radix-3, Good, x^761 - x - 1 (x1): " CYCLE_TYPE " (x1)\n",
            cycles, time0, time1,
            good_radix_2_3_store(res, (const int16_t (*)[32][32])A));



  return 0;

}






