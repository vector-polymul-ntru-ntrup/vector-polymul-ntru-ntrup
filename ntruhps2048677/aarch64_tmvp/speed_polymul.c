

#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "api.h"
#include "params.h"
#include "poly.h"
#include "tmvp.h"
#include "batch_multiplication.h"

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

    poly src1, src2;
    poly des;

    uint16_t tmp[SB0 * 9 * 4]; // SB0 = 144
    uint16_t toepa3[SB1 * 5 * 2]; // SB1 = 48



    uint16_t *toepa = &tmp[0 * SB0]; /* nine 144*144 toeplitz matrix, needs nine length-288 vectors to store */
    uint16_t *kbw   = &tmp[18* SB0]; /* nine 144*144 vectors*/
    uint16_t *kcw   = &tmp[27* SB0]; /* nine 144*144 vectors*/
    uint16_t *toepa332 = &tmp[5 * 5 * SB2 * 0];
    uint16_t *kbcw = &tmp[5 * 5 * SB2 * 3];

    WRAP_FUNC("polymul (Z_q[x] / (x^677 - 1)): " CYCLE_TYPE " \n",
            cycles, time0, time1,
            poly_Rq_mul(&(des), &(src1), &(src2)));

    WRAP_FUNC("(TC5^{-1})^*: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            ittc5(toepa, &(src1.coeffs[0])));

    WRAP_FUNC("TC5: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            tc5(kbw, &(src2.coeffs[0])));

    WRAP_FUNC("(TC3^{-1})^*: " CYCLE_TYPE " (x9)\n",
            cycles, time0, time1,
            ittc3(toepa3,  toepa));

    WRAP_FUNC("(TC32^{-1})^*: " CYCLE_TYPE " (x9)\n",
            cycles, time0, time1,
            ittc32(toepa332, toepa3));

    WRAP_FUNC("TC33: " CYCLE_TYPE " (x9)\n",
            cycles, time0, time1,
            tc33(kbcw, kbw));

    WRAP_FUNC("TMVP2_8x8: " CYCLE_TYPE " (x9)\n",
            cycles, time0, time1,
            tmvp2_8x8(kbcw, toepa332));

    WRAP_FUNC("TC33^*: " CYCLE_TYPE " (x9)\n",
            cycles, time0, time1,
            ttc33(kcw, kbcw));

    WRAP_FUNC("TC5^*: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            ttc5(&(des.coeffs[0]), kcw));




  return 0;

}









