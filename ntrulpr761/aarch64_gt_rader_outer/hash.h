#ifndef HASH_H
#define HASH_H

#include <stdint.h>
#include <stddef.h>

#include "aes.h"

int crypto_stream_aes256ctr(
    uint8_t *out,
    size_t outlen,
    const uint8_t nonce[AESCTR_NONCEBYTES],
    const uint8_t key[AES256_KEYBYTES]);

/* ----- underlying hash function */

#define Hash_bytes 32

/* e.g., b = 0 means out = Hash0(in) */
void Hash_prefix(unsigned char *out,int b,const unsigned char *in,int inlen);

#endif

