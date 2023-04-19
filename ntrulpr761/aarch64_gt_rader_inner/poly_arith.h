
#include "poly_type.h"

#define tau 16

/* ----- masks */

/* return -1 if x<0; otherwise return 0 */
int int16_negative_mask(int16 x);

/* ----- arithmetic mod 3 */

/* F3 is always represented as -1,0,1 */
/* so ZZ_fromF3 is a no-op */

/* x must not be close to top int16 */
small F3_freeze(int16 x);
/* ----- arithmetic mod q */

/* always represented as -q12...q12 */
/* so ZZ_fromFq is a no-op */

/* x must not be close to top int32 */
Fq Fq_freeze(int32 x);

/* ----- Top and Right */

int8 Top(Fq C);
Fq Right(int8 T);

/* ----- polynomials mod q */

/* h = f*g in the ring Rq */
void Rq_mult_small(Fq *h, Fq *f, small *g);

/* ----- rounded polynomials mod q */

void Round(Fq *out,const Fq *a);



