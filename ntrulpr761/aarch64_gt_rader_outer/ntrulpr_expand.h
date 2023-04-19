#ifndef NTRULPR_EXPAND_H
#define NTRULPR_EXPAND_H

#include "params.h"
#include "poly_type.h"
#include "poly_encode_decode.h"

/* ----- encoding I-bit inputs */

#define Inputs_bytes (I/8)
typedef int8 Inputs[I]; /* passed by reference */

void Inputs_encode(unsigned char *s,const Inputs r);

/* ----- Expand */

extern const unsigned char aes_nonce[16];

void Expand(uint32 *L,const unsigned char *k);

/* ----- Seeds */
#define Seeds_bytes 32
void Seeds_random(unsigned char *s);

/* ----- Generator, HashShort */

/* G = Generator(k) */
void Generator(Fq *G,const unsigned char *k);

/* out = HashShort(r) */
void HashShort(small *out,const Inputs r);

/* ----- NTRU LPRime Expand */

/* (S,A),a = XKeyGen() */
void XKeyGen(unsigned char *S,Fq *A,small *a);
/* B,T = XEncrypt(r,(S,A)) */
void XEncrypt(Fq *B,int8 *T,const int8 *r,const unsigned char *S, Fq *A);
#define XDecrypt Decrypt

/* ----- NTRU LPRime Expand plus encoding */

#define Ciphertexts_bytes (Rounded_bytes+Top_bytes)
#define SecretKeys_bytes Small_bytes
#define PublicKeys_bytes (Seeds_bytes+Rounded_bytes)

void Inputs_random(Inputs r);

/* pk,sk = ZKeyGen() */
void ZKeyGen(unsigned char *pk,unsigned char *sk);

/* c = ZEncrypt(r,pk) */
void ZEncrypt(unsigned char *c,const Inputs r,const unsigned char *pk);

/* r = ZDecrypt(C,sk) */
void ZDecrypt(Inputs r,const unsigned char *c,const unsigned char *sk);

#endif

