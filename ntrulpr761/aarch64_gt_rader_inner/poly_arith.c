
#include <stddef.h>

#include "params.h"
#include "poly_type.h"
#include "poly_arith.h"

#include "polymul/NTT_params.h"
#include "polymul/polymul.h"

/* ----- masks */

/* return -1 if x<0; otherwise return 0 */
int int16_negative_mask(int16 x)
{
  uint16 u = x;
  u >>= 15;
  return -(int) u;
  /* alternative with gcc -fwrapv: */
  /* x>>15 compiles to CPU's arithmetic right shift */
}

/* ----- arithmetic mod 3 */

/* F3 is always represented as -1,0,1 */
/* so ZZ_fromF3 is a no-op */

/* x must not be close to top int16 */
small F3_freeze(int16_t x)
{
    int32_t t;
    t = (int32_t)x * 21845;
    t = (t + (1LL << 15)) >> 16;
    return x - (int16_t)t * 3;

}

/* ----- arithmetic mod q */

/* always represented as -q12...q12 */
/* so ZZ_fromFq is a no-op */

/* x must not be close to top int32 */
Fq Fq_freeze(int32_t x)
{

    int64_t t;
    t = (int64_t)x * 935519;
    t = (t + (1LL << 31)) >> 32;

    return x - (int32_t)t * q;

}

/* ----- Top and Right */


int8 Top(Fq C)
{
  return (tau1*(int32)(C+tau0)+16384)>>15;
}

Fq Right(int8 T)
{
  return Fq_freeze(tau3*(int32)T-tau2);
}


/* ----- polynomials mod q */

// h = fg mod (Z_q, x^p - x - 1)
static void Rq_reduce(Fq *h, Fq *fg){

    size_t i;
    int16x8_t t0, t1;

    for(i = p; i < p + p - 1 - 8; i += 8){
        t0 = vld1q_s16(fg + i);
        t1 = vld1q_s16(fg + i - p + 1);
        t0 = t0 + t1;
        t1 = vqdmulhq_n_s16(t0, 29235);
        t1 = vrshrq_n_s16(t1, 12);
        t0 = vmlsq_n_s16(t0, t1, Q);
        vst1q_s16(fg + i - p + 1, t0);
    }
    for(; i < p + p - 1; i++){
        fg[i - p + 1] = Fq_freeze(fg[i - p + 1] + fg[i]);
    }
    for(i = p; i < p + p - 1 - 8; i += 8){
        t0 = vld1q_s16(fg + i);
        t1 = vld1q_s16(fg + i - p);
        t0 = t0 + t1;
        t1 = vqdmulhq_n_s16(t0, 29235);
        t1 = vrshrq_n_s16(t1, 12);
        t0 = vmlsq_n_s16(t0, t1, Q);
        vst1q_s16(fg + i - p, t0);
    }
    for(; i < p + p - 1; i++){
        fg[i - p] = Fq_freeze(fg[i - p] + fg[i]);
    }

    for(i = 0; i < p; i++){
        h[i] = fg[i];
    }

}

/* h = f*g in the ring Rq */
void Rq_mult_small(Fq *h, Fq *f, small *g)
{
  Fq fg[POLY_N];
  int16_t poly1[POLY_N];
  int16_t poly2[POLY_N];

  size_t i;

  for(i = 0; i < p; i++){
    poly1[i] = f[i];
    poly2[i] = g[i];
  }
  for(; i < POLY_N; i++){
    poly1[i] = poly2[i] = 0;
  }
  polymul(fg, poly1, poly2);

  Rq_reduce(h, fg);

}

/* ----- rounded polynomials mod q */

void Round(Fq *out,const Fq *a)
{
  int i;
  for (i = 0;i < p;++i)
    out[i] = a[i]-F3_freeze(a[i]);
}



