
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "api.h"
#include "params.h"
#include "crypto_kem.h"
#include "ntrulpr_expand.h"
#include "ntrulpr_core.h"

#define NTESTS 1000

uint64_t rand_cycles;
uint64_t rand_all_cycles[NTESTS];

#ifdef __APPLE__

#include "m1cycles.h"
#define __MEDIAN__
#define SETUP_COUNTER() {setup_rdtsc();}
#define CYCLE_TYPE "%lld"
#define GET_TIME rdtsc()

#else

#include "hal.h"
#define __MEDIAN__
#define SETUP_COUNTER() {}
#define CYCLE_TYPE "%ld"
#define GET_TIME hal_get_time()

#endif

#ifdef __AVERAGE__

#pragma message("average mode not supported!")

#define LOOP_INIT(__clock) {}
#define LOOP_TAIL(__f_string, records, __clock) {}
#define BODY_INIT(__clock) {}
#define BODY_TAIL(records, __clock) {}

#elif defined(__MEDIAN__)

#define LOOP_INIT(__clock) {}
#define LOOP_TAIL(__f_string, records, __clock) { \
    qsort(records, sizeof(uint64_t), NTESTS, cmp_uint64); \
    printf(__f_string, records[NTESTS >> 1]); \
}
#define BODY_INIT(__clock) { \
    __clock = 0; \
}
#define BODY_TAIL(records, __clock) { \
    records[i] = __clock; \
}

static int cmp_uint64(const void *a, const void *b){
    return ((*((const uint64_t*)a)) - ((*((const uint64_t*)b))));
}

#else

#error "unknown benchmark mode!"

#endif

#define WRAP_PROFILE_FUNC(__f_string, records, __clock, func){ \
    LOOP_INIT(__clock); \
    for(size_t i = 0; i < NTESTS; i++){ \
        BODY_INIT(__clock); \
        func; \
        BODY_TAIL(records, __clock); \
    } \
    LOOP_TAIL(__f_string, records, __clock); \
}

int main()
{

    Fq G[POLY_N];
    Fq A[POLY_N];
    small a[POLY_N];


    SETUP_COUNTER();

    WRAP_PROFILE_FUNC("KeyGen: " CYCLE_TYPE "\n",
            rand_all_cycles, rand_cycles,
            KeyGen(A,a,G));


    return 0;

}









