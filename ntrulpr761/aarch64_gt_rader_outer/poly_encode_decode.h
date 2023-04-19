#ifndef POLY_ENCODE_DECODE_H
#define POLY_ENCODE_DECODE_H

#include "params.h"
#include "poly_type.h"

/* ----- encoding small polynomials (including short polynomials) */

#define Small_bytes ((p+3)/4)

/* these are the only functions that rely on p mod 4 = 1 */

void Small_encode(unsigned char *s,const small *f);
void Small_decode(small *f,const unsigned char *s);

/* ----- encoding rounded polynomials */

void Rounded_encode(unsigned char *s,const Fq *r);
void Rounded_encode_neon(unsigned char *s,const Fq *r);
void Rounded_decode(Fq *r,const unsigned char *s);
void Rounded_decode_neon(Fq *v, const unsigned char *s);

/* ----- encoding top polynomials */

#define Top_bytes (I/2)

void Top_encode(unsigned char *s,const int8 *T);
void Top_decode(int8 *T,const unsigned char *s);

#endif

