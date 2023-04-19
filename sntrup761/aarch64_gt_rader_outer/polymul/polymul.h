#ifndef POLYMUL
#define POLYMUL

#include <stdint.h>

#include <arm_neon.h>

extern int16_t pi_table[256];
extern int16_t std_table[17];
extern int16_t in_table[12][17];

extern int16_t radix3_args[8];
extern int16_t iradix3_args[8];

extern int16_t basemul_table[128];
extern int16_t basemul_full_table[256];

extern const int16x8_t lastwlo;
extern const int16x8_t lastwhi;

void setup_pi_table(void);
void setup_basemul_table(void);
void setup_CT_Bruun_table(void);
void setup_streamlined_CT_table(void);
void setup_streamlined_Bruun_table(void);


extern void __asm_radix32(int16_t*, int16_t*);
extern void __asm_weighted8x8(int16_t*, int16_t*, int16_t*, int16_t*);

extern void __asm_weighted16x16(int16_t*, int16_t*, int16_t*, int16_t*);

void polymul(int16_t *des, int16_t *src1, int16_t *src2);


#endif


