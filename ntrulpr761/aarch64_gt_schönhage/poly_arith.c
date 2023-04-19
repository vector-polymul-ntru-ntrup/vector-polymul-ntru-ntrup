
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

  int16_t lo, res;
  int32_t t;
  lo = x & 0xffff;
  lo = lo * (-15631);
  res = (int32_t)((lo * q + x) >> 16);

  t = (int32_t)(res * (-433));
  lo = t & 0xffff;
  lo = lo * (-15631);
  res = (int32_t)((lo * q + t) >> 16);

  lo = (2295 - res) >> 15;
  res += lo * q;
  lo = (res + 2295) >> 15;
  res -= lo * q;

  return res;

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

/* h = f*g in the ring Rq */
void Rq_mult_small(Fq *h, Fq *f, small *g)
{
  for(size_t i = p; i < POLY_N; i++){
    f[i] = g[i] = 0;
  }

  polymul(h, f, g);

}

/* ----- rounded polynomials mod q */

void Round(Fq *out,const Fq *a)
{
  int i;
  for (i = 0;i < p;++i)
    out[i] = a[i]-F3_freeze(a[i]);
}



