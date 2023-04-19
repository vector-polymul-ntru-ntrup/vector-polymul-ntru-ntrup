#ifndef POLY_BASIC_H
#define POLY_BASIC_H


#include <stdint.h>
#include <stddef.h>

#include <arm_neon.h>


int16_t cmod_int16(int16_t v);
int32_t cmod_int32(int32_t v);
int16_t mulmod_int16(int16_t a, int16_t b);
int16x8_t cmod_int16x8(int16x8_t v);
int16x8_t mulmod_int16x8(int16x8_t a, int16x8_t b);
void schoolbook_Rmodx8(int16x8_t *des, int16x8_t *src1, int16x8_t *src2, size_t len);

void polymul_Rmodx8(int16x8_t *des, int16x8_t *src1, int16x8_t *src2, size_t len);
void polymulx8(int16x8_t *des, int16x8_t *src1, int16x8_t *src2, size_t len);

void interleave16x8(int16_t*, int16_t*, int16_t*, int16_t*, int16_t*,
	                      int16_t*, int16_t*, int16_t*, int16_t*,
			      size_t);

void deinterleave16x8(int16_t*, int16_t*, int16_t*, int16_t*, 
		      int16_t*, int16_t*, int16_t*, int16_t*,
		      int16_t*, size_t);


#endif


