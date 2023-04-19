

#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "api.h"
#include "params.h"
#include "poly.h"
#include "tc.h"
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

    uint16_t tmp_ab[SB0 * 9 * 2];
    uint16_t tmp_c[SB0_RES * 9];
    uint16_t tmp_aabb[9*SB2*50+224*8*2], tmp_cc[9*SB2_RES*25+224*32]; // 50, 25
    uint16_t *tmp_aa = &tmp_aabb[9*SB2*0],
             *tmp_bb = &tmp_aabb[9*SB2*25+224*8],
             *tmp_aa1 = &tmp_aabb[9*SB2*25],
             *tmp_cc1 = &tmp_cc[9*SB2_RES*25];
    uint16_t *kaw[9], *kcw[9];




    kaw[0] = &tmp_ab[0 * SB0]; // A(0)
    kaw[1] = &tmp_ab[2 * SB0];
    kaw[2] = &tmp_ab[4 * SB0];
    kaw[3] = &tmp_ab[6 * SB0];
    kaw[4] = &tmp_ab[8 * SB0];
    kaw[5] = &tmp_ab[10 * SB0];
    kaw[6] = &tmp_ab[12 * SB0];
    kaw[7] = &tmp_ab[14 * SB0];
    kaw[8] = &tmp_ab[16 * SB0]; // A(f)

    // kcw
    kcw[0] = &tmp_c[0 * SB0_RES];
    kcw[1] = &tmp_c[1 * SB0_RES];
    kcw[2] = &tmp_c[2 * SB0_RES];
    kcw[3] = &tmp_c[3 * SB0_RES];
    kcw[4] = &tmp_c[4 * SB0_RES];
    kcw[5] = &tmp_c[5 * SB0_RES];
    kcw[6] = &tmp_c[6 * SB0_RES];
    kcw[7] = &tmp_c[7 * SB0_RES];
    kcw[8] = &tmp_c[8 * SB0_RES];


    WRAP_FUNC("polymul (Z_q[x] / (x^677 - 1)): " CYCLE_TYPE " \n",
            cycles, time0, time1,
            poly_Rq_mul(&(des), &(src1), &(src2)));

    WRAP_FUNC("TC5: " CYCLE_TYPE " (x2) \n",
            cycles, time0, time1,
            tc5(kaw, &(src1.coeffs[0])));

    WRAP_FUNC("TC33: " CYCLE_TYPE " (x18) \n",
            cycles, time0, time1,
            tc33(&tmp_aa[0], kaw[0]));


    WRAP_FUNC("K2: " CYCLE_TYPE " (x2) \n",
            cycles, time0, time1,
            k2(&tmp_aa1[0], &tmp_aa[16]));

    WRAP_FUNC("schoolbook 8x8: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            schoolbook_8x8(&tmp_cc[32], &tmp_aa[16], &tmp_bb[16]));

    WRAP_FUNC("K2^{-1}: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            ik2(&tmp_cc[32], &tmp_cc1[0]));

    WRAP_FUNC("schoolbook 16x16: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            schoolbook_16x16(&tmp_cc[0], &tmp_aa[0] , &tmp_bb[0]));

    WRAP_FUNC("TC33^{-1}: " CYCLE_TYPE " (x9) \n",
            cycles, time0, time1,
            itc33(kcw[0], &tmp_cc[0]));

    WRAP_FUNC("TC5^{-1}: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            itc5(tmp_ab, kcw));








  return 0;

}









