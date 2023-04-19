
#include "params.h"
#include "poly_type.h"
#include "poly_arith.h"

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
small F3_freeze(int16 x)
{
  return int32_mod_uint14(x+1,3)-1;
}

/* ----- arithmetic mod q */

/* always represented as -q12...q12 */
/* so ZZ_fromFq is a no-op */

/* x must not be close to top int32 */
Fq Fq_freeze(int32 x)
{
  return int32_mod_uint14(x+q12,q)-q12;
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
  Fq fg[p+p-1];
  Fq result;
  int i,j;

  for (i = 0;i < p;++i) {
    result = 0;
    for (j = 0;j <= i;++j) result = Fq_freeze(result+f[j]*(int32)g[i-j]);
    fg[i] = result;
  }
  for (i = p;i < p+p-1;++i) {
    result = 0;
    for (j = i-p+1;j < p;++j) result = Fq_freeze(result+f[j]*(int32)g[i-j]);
    fg[i] = result;
  }

  for (i = p+p-2;i >= p;--i) {
    fg[i-p] = Fq_freeze(fg[i-p]+fg[i]);
    fg[i-p+1] = Fq_freeze(fg[i-p+1]+fg[i]);
  }

  for (i = 0;i < p;++i) h[i] = fg[i];
}

/* ----- rounded polynomials mod q */

void Round(Fq *out,const Fq *a)
{
  int i;
  for (i = 0;i < p;++i) out[i] = a[i]-F3_freeze(a[i]);
}



