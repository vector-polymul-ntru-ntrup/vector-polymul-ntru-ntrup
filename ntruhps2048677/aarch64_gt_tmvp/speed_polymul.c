

#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "api.h"
#include "params.h"
#include "poly.h"
#include "tmvp.h"
#include "batch_multiplication.h"

#include "polymul/polymul.h"
#include "polymul/opt.h"

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
    int32_t R[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];
    int32_t A[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];
    int32_t B[NTT_DIM_X][NTT_DIM_Y][NTT_DIM_Z];

    WRAP_FUNC("polymul (Z_q[x] / (x^677 - 1)): " CYCLE_TYPE " \n",
            cycles, time0, time1,
            polymul(&des, &src1, &src2));

    WRAP_FUNC("NTT (x2): " CYCLE_TYPE " (x2)\n",
            cycles, time0, time1,
            ntt3x128x4_goodntt(A, &src1));

    WRAP_FUNC("Base multiplication: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            ntt3x128x4_basemul(R, A, B));

    WRAP_FUNC("iNTT: " CYCLE_TYPE " \n",
            cycles, time0, time1,
            ntt3x128x4_ttndoog(A, R));









  return 0;

}









