
#include "poly_encode_decode.h"
#include "Encode.h"
#include "Decode.h"

/* ----- encoding small polynomials (including short polynomials) */

/* these are the only functions that rely on p mod 4 = 1 */

void Small_encode(unsigned char *s,const small *f)
{
  small x;
  int i;

  for (i = 0;i < p/4;++i) {
    x = *f++ + 1;
    x += (*f++ + 1)<<2;
    x += (*f++ + 1)<<4;
    x += (*f++ + 1)<<6;
    *s++ = x;
  }
  x = *f++ + 1;
  *s++ = x;
}

void Small_decode(small *f,const unsigned char *s)
{
  unsigned char x;
  int i;

  for (i = 0;i < p/4;++i) {
    x = *s++;
    *f++ = ((small)(x&3))-1; x >>= 2;
    *f++ = ((small)(x&3))-1; x >>= 2;
    *f++ = ((small)(x&3))-1; x >>= 2;
    *f++ = ((small)(x&3))-1;
  }
  x = *s++;
  *f++ = ((small)(x&3))-1;
}

/* ----- encoding rounded polynomials */

void Rounded_encode(unsigned char *s,const Fq *r)
{
  uint16 R[p],M[p];
  int i;

  for (i = 0;i < p;++i) R[i] = ((r[i]+q12)*10923)>>15;
  for (i = 0;i < p;++i) M[i] = (q+2)/3;
  Encode(s,R,M,p);
}

void Rounded_decode(Fq *r,const unsigned char *s)
{
  uint16 R[p],M[p];
  int i;

  for (i = 0;i < p;++i) M[i] = (q+2)/3;
  Decode(R,s,M,p);
  for (i = 0;i < p;++i) r[i] = R[i]*3-q12;
}

/* ----- encoding top polynomials */

void Top_encode(unsigned char *s,const int8 *T)
{
  int i;
  for (i = 0;i < Top_bytes;++i)
    s[i] = T[2*i]+(T[2*i+1]<<4);
}

void Top_decode(int8 *T,const unsigned char *s)
{
  int i;
  for (i = 0;i < Top_bytes;++i) {
    T[2*i] = s[i]&15;
    T[2*i+1] = s[i]>>4;
  }
}


