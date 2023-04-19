
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

uint64_t aes_cycles;
uint64_t sha2_cycles;
uint64_t fips202_cycles;

uint64_t aes_all_cycles[NTESTS];
uint64_t sha2_all_cycles[NTESTS];
uint64_t fips202_all_cycles[NTESTS];

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
    unsigned char pk[CRYPTO_PUBLICKEYBYTES] = {0};
    unsigned char sk[CRYPTO_SECRETKEYBYTES] = {0};
    unsigned char ct[CRYPTO_CIPHERTEXTBYTES] = {0};
    unsigned char key_a[CRYPTO_BYTES] = {0};
    unsigned char key_b[CRYPTO_BYTES] = {0};

    Fq A[POLY_N];
    Fq B[POLY_N];
    small a[POLY_N];
    int8 T[I];

    Inputs r;

    SETUP_COUNTER();

    printf("aes\n");
    WRAP_PROFILE_FUNC("XKeyGen: " CYCLE_TYPE "\n",
            aes_all_cycles, aes_cycles,
            XKeyGen(pk,A,a));
    WRAP_PROFILE_FUNC("XEncrypt: " CYCLE_TYPE "\n",
            aes_all_cycles, aes_cycles,
            XEncrypt(B,T,r,pk,A));


    printf("sha2\n");
    WRAP_PROFILE_FUNC("crypto_kem_keypair: " CYCLE_TYPE "\n",
            sha2_all_cycles, sha2_cycles,
            crypto_kem_keypair(pk, sk));
    WRAP_PROFILE_FUNC("crypto_kem_enc: " CYCLE_TYPE "\n",
            sha2_all_cycles, sha2_cycles,
            crypto_kem_enc(ct, key_b, pk));
    WRAP_PROFILE_FUNC("crypto_kem_dec: " CYCLE_TYPE "\n",
            sha2_all_cycles, sha2_cycles,
            crypto_kem_dec(key_a, ct, sk));

    WRAP_PROFILE_FUNC("XEncrypt: " CYCLE_TYPE "\n",
            sha2_all_cycles, sha2_cycles,
            XEncrypt(B,T,r,pk,A));



  return 0;
}









