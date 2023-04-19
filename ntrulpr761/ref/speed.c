
#include <stddef.h>
#include <stdint.h>
#include <stdlib.h>
#include <stdio.h>
#include "api.h"
#include "params.h"
#include "crypto_kem.h"
#include "ntrulpr_expand.h"
#include "ntrulpr_core.h"



#define NTESTS 100

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
    unsigned char pk[CRYPTO_PUBLICKEYBYTES] = {0};
    unsigned char sk[CRYPTO_SECRETKEYBYTES] = {0};
    unsigned char ct[CRYPTO_CIPHERTEXTBYTES] = {0};
    unsigned char key_a[CRYPTO_BYTES] = {0};
    unsigned char key_b[CRYPTO_BYTES] = {0};

    Fq G[POLY_N];
    Fq A[POLY_N];
    Fq B[POLY_N];
    small a[POLY_N];
    small b[POLY_N];
    int8 T[I];

    Inputs r;

    SETUP_COUNTER();

    WRAP_FUNC("crypto_kem_keypair: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            crypto_kem_keypair(pk, sk));
    WRAP_FUNC("crypto_kem_enc: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            crypto_kem_enc(ct, key_b, pk));
    WRAP_FUNC("crypto_kem_dec: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            crypto_kem_dec(key_a, ct, sk));

    WRAP_FUNC("ZKeyGen: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            ZKeyGen(pk, sk));
    WRAP_FUNC("ZEncrypt: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            ZEncrypt(ct, r, pk));
    WRAP_FUNC("ZDecrypt: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            ZDecrypt(r, ct, sk));

    WRAP_FUNC("XKeyGen: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            XKeyGen(pk,A,a));
    WRAP_FUNC("XEncrypt: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            XEncrypt(B,T,r,pk,A));


    WRAP_FUNC("KeyGen: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            KeyGen(A,a,G));
    WRAP_FUNC("Encrypt: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            Encrypt(B,T,r,G,A,b));
    WRAP_FUNC("Decrypt: " CYCLE_TYPE "\n",
            cycles, time0, time1,
            Decrypt(r,B,T,a));



  return 0;

}






