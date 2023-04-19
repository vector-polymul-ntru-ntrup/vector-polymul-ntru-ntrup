
#include "hash.h"
#include "sha2.h"
#include "aes.h"

int crypto_stream_aes256ctr(
    uint8_t *out,
    size_t outlen,
    const uint8_t nonce[AESCTR_NONCEBYTES],
    const uint8_t key[AES256_KEYBYTES]) {

    aes256ctx state;
    aes256_ctr_keyexp(&state, key);
    aes256_ctr(out, outlen, nonce, &state);
    aes256_ctx_release(&state);
    return 0;
}

/* ----- underlying hash function */

/* e.g., b = 0 means out = Hash0(in) */
void Hash_prefix(unsigned char *out,int b,const unsigned char *in,int inlen)
{
  unsigned char x[inlen+1];
  unsigned char h[64];
  int i;

  x[0] = b;
  for (i = 0;i < inlen;++i) x[i+1] = in[i];
  sha512(h,x,inlen+1);
  for (i = 0;i < 32;++i) out[i] = h[i];
}

