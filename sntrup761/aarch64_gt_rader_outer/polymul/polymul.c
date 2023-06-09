
#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

#include <arm_neon.h>

#include "NTT_params.h"

#include "polymul.h"
#include "poly_basic.h"
#include "poly_vec.h"
#include "rader.h"

int16_t pi_table[256] = {
0, 1, 102, 103, 68, 69, 170, 171, 136, 137, 34, 35, 36, 37, 138, 139, 104, 105, 2, 3, 172, 173, 70, 71, 72, 73, 174, 175, 140, 141, 38, 39, 4, 5, 106, 107, 108, 109, 6, 7, 176, 177, 74, 75, 40, 41, 142, 143, 144, 145, 42, 43, 8, 9, 110, 111, 76, 77, 178, 179, 180, 181, 78, 79, 44, 45, 146, 147, 112, 113, 10, 11, 12, 13, 114, 115, 80, 81, 182, 183, 148, 149, 46, 47, 48, 49, 150, 151, 116, 117, 14, 15, 184, 185, 82, 83, 84, 85, 186, 187, 152, 153, 50, 51, 16, 17, 118, 119, 120, 121, 18, 19, 188, 189, 86, 87, 52, 53, 154, 155, 156, 157, 54, 55, 20, 21, 122, 123, 88, 89, 190, 191, 192, 193, 90, 91, 56, 57, 158, 159, 124, 125, 22, 23, 24, 25, 126, 127, 92, 93, 194, 195, 160, 161, 58, 59, 60, 61, 162, 163, 128, 129, 26, 27, 196, 197, 94, 95, 96, 97, 198, 199, 164, 165, 62, 63, 28, 29, 130, 131, 132, 133, 30, 31, 200, 201, 98, 99, 64, 65, 166, 167, 168, 169, 66, 67, 32, 33, 134, 135, 100, 101, 202, 203
};

int16_t std_table[17] = {
0, 12, 24, 36, 48, 60, 72, 84, 96, 108, 120, 132, 144, 156, 168, 180, 192
};

int16_t in_table[12][17] = {
{0, 36, 72, 108, 144, 180, 12, 48, 84, 120, 156, 192, 24, 60, 96, 132, 168},
{1, 37, 73, 109, 145, 181, 13, 49, 85, 121, 157, 193, 25, 61, 97, 133, 169},
{102, 138, 174, 6, 42, 78, 114, 150, 186, 18, 54, 90, 126, 162, 198, 30, 66},
{103, 139, 175, 7, 43, 79, 115, 151, 187, 19, 55, 91, 127, 163, 199, 31, 67},
{68, 104, 140, 176, 8, 44, 80, 116, 152, 188, 20, 56, 92, 128, 164, 200, 32},
{69, 105, 141, 177, 9, 45, 81, 117, 153, 189, 21, 57, 93, 129, 165, 201, 33},
{170, 2, 38, 74, 110, 146, 182, 14, 50, 86, 122, 158, 194, 26, 62, 98, 134},
{171, 3, 39, 75, 111, 147, 183, 15, 51, 87, 123, 159, 195, 27, 63, 99, 135},
{136, 172, 4, 40, 76, 112, 148, 184, 16, 52, 88, 124, 160, 196, 28, 64, 100},
{137, 173, 5, 41, 77, 113, 149, 185, 17, 53, 89, 125, 161, 197, 29, 65, 101},
{34, 70, 106, 142, 178, 10, 46, 82, 118, 154, 190, 22, 58, 94, 130, 166, 202},
{35, 71, 107, 143, 179, 11, 47, 83, 119, 155, 191, 23, 59, 95, 131, 167, 203}
};

int16_t __attribute__((aligned (16)))radix3_args[8] = {Q, Qprime, OMEGA3lo, OMEGA3hi, Qbar};
int16_t __attribute__((aligned (16)))iradix3_args[8] = {Q, Qprime, OMEGA3SQlo, OMEGA3SQhi, Qbar};

int16_t __attribute__((aligned (16)))basemul_table[128] = {
1, -1, -311, 311, 310, -310, 1152, -1152, -174, 174, -978, 978, 305, -305, 1556, -1556, -1861, 1861, -2147, 2147, 2022, -2022, 125, -125, 1205, -1205, 1707, -1707, 1679, -1679, 1678, -1678, 1516, -1516, 1397, -1397, 245, -245, 1852, -1852, -2097, 2097, 2189, -2189, -1311, 1311, -878, 878, 1269, -1269, 167, -167, -1436, 1436, 1950, -1950, -438, 438, -1512, 1512, 1401, -1401, 434, -434, -1835, 1835, -2080, 2080, -451, 451, -2060, 2060, 342, -342, -769, 769, 427, -427, -842, 842, 175, -175, 667, -667, -1283, 1283, -404, 404, 1687, -1687, 286, -286, -1717, 1717, 1431, -1431, -1080, 1080, 737, -737, 343, -343
};

int16_t __attribute__((aligned (16)))basemul_full_table[256] = {
1, 7, -1, -7, -311, -2220, 311, 2220, 310, 2213, -310, -2213, 1152, 8222, -1152, -8222, -174, -1242, 174, 1242, -978, -6980, 978, 6980, 305, 2177, -305, -2177, 1556, 11106, -1556, -11106, -1861, -13283, 1861, 13283, -2147, -15324, 2147, 15324, 2022, 14432, -2022, -14432, 125, 892, -125, -892, 1205, 8601, -1205, -8601, 1707, 12184, -1707, -12184, 1679, 11984, -1679, -11984, 1678, 11977, -1678, -11977, 1516, 10820, -1516, -10820, 1397, 9971, -1397, -9971, 245, 1749, -245, -1749, 1852, 13219, -1852, -13219, -2097, -14967, 2097, 14967, 2189, 15624, -2189, -15624, -1311, -9357, 1311, 9357, -878, -6267, 878, 6267, 1269, 9057, -1269, -9057, 167, 1192, -167, -1192, -1436, -10249, 1436, 10249, 1950, 13918, -1950, -13918, -438, -3126, 438, 3126, -1512, -10792, 1512, 10792, 1401, 10000, -1401, -10000, 434, 3098, -434, -3098, -1835, -13097, 1835, 13097, -2080, -14846, 2080, 14846, -451, -3219, 451, 3219, -2060, -14703, 2060, 14703, 342, 2441, -342, -2441, -769, -5489, 769, 5489, 427, 3048, -427, -3048, -842, -6010, 842, 6010, 175, 1249, -175, -1249, 667, 4761, -667, -4761, -1283, -9157, 1283, 9157, -404, -2884, 404, 2884, 1687, 12041, -1687, -12041, 286, 2041, -286, -2041, -1717, -12255, 1717, 12255, 1431, 10214, -1431, -10214, -1080, -7708, 1080, 7708, 737, 5260, -737, -5260, 343, 2448, -343, -2448
};

const int16x8_t lastwlo = {-1080, 1080, 737, -737, 343, -343, 0, 0
};
const int16x8_t lastwhi = {-7708, 7708, 5260, -5260, 2448, -2448, 0, 0
};

// in: (c0, c1, c2, c3)
// out: (c0, c1, c2, c3)
#define TRN4(c0, c1, c2, c3, b0, b1, b2, b3) { \
    b0 = (int16x8_t)vtrn1q_s16(c0, c1); \
    b1 = (int16x8_t)vtrn2q_s16(c0, c1); \
    b2 = (int16x8_t)vtrn1q_s16(c2, c3); \
    b3 = (int16x8_t)vtrn2q_s16(c2, c3); \
    c0 = (int16x8_t)vtrn1q_s32((int32x4_t)b0, (int32x4_t)b2); \
    c2 = (int16x8_t)vtrn2q_s32((int32x4_t)b0, (int32x4_t)b2); \
    c1 = (int16x8_t)vtrn1q_s32((int32x4_t)b1, (int32x4_t)b3); \
    c3 = (int16x8_t)vtrn2q_s32((int32x4_t)b1, (int32x4_t)b3); \
}

// in: (b0, b1, b2, b3)
// out: (c0, c1, c2, c3)
#define TRN8(c0, c1, c2, c3, c4, c5, c6, c7, b0, b1, b2, b3, b4, b5, b6, b7) { \
    TRN4(b0, b1, b2, b3, c0, c1, c2, c3); \
    TRN4(b4, b5, b6, b7, c4, c5, c6, c7); \
    c0 = (int16x8_t)vtrn1q_s64((int64x2_t)b0, (int64x2_t)b4); \
    c4 = (int16x8_t)vtrn2q_s64((int64x2_t)b0, (int64x2_t)b4); \
    c1 = (int16x8_t)vtrn1q_s64((int64x2_t)b1, (int64x2_t)b5); \
    c5 = (int16x8_t)vtrn2q_s64((int64x2_t)b1, (int64x2_t)b5); \
    c2 = (int16x8_t)vtrn1q_s64((int64x2_t)b2, (int64x2_t)b6); \
    c6 = (int16x8_t)vtrn2q_s64((int64x2_t)b2, (int64x2_t)b6); \
    c3 = (int16x8_t)vtrn1q_s64((int64x2_t)b3, (int64x2_t)b7); \
    c7 = (int16x8_t)vtrn2q_s64((int64x2_t)b3, (int64x2_t)b7); \
}

#define RADIX3(c0, c1, c2) { \
    t0 = c1 - c2; \
    t3 = vmulq_n_s16(t0, mul_args[2]); \
    t2 = vqrdmulhq_n_s16(t0, mul_args[3]); \
    t3 = vmlsq_n_s16(t3, t2, mul_args[0]); \
    t1 = c0 - c2; \
    t2 = c0 - c1; \
    c0 = c0 + c1 + c2; \
    c1 = t1 + t3; \
    c2 = t2 - t3; \
}

// ================================
// build table for 3D permutation of dimension 17 x 3 x 32
// this is slightly different from the usual one
void setup_pi_table(void){

    size_t t;

    for(size_t i = 0; i < _POLY_N / 8; i++){
        t = i / 2;
        pi_table[(((t % 17) * 6 + (t % 3) * 2 + (t % 2) ) * 2 + (i % 2))] = i;
    }

    for(size_t j = 0; j < 17; j++){
        std_table[j] = 12 * j;
    }
    for(size_t i = 0; i < 12; i++){
        for(size_t j = 0; j < 17; j++){
            in_table[i][j] = pi_table[12 * j + i];
        }
    }

}

// ================================
// set up table for base multiplications
// require twiddle_table[17][17]
void setup_basemul_table(void){

    for(size_t i = 0; i < 17; i++){
        basemul_table[i * 6 + 0] = mulmod_int16(twiddle_table[1][i], 1);
        basemul_table[i * 6 + 1] = -basemul_table[i * 6 + 0];
        basemul_table[i * 6 + 2] = mulmod_int16(twiddle_table[1][i], OMEGA3);
        basemul_table[i * 6 + 3] = -basemul_table[i * 6 + 2];
        basemul_table[i * 6 + 4] = mulmod_int16(twiddle_table[1][i], OMEGA3SQ);
        basemul_table[i * 6 + 5] = -basemul_table[i * 6 + 4];
    }

}

void polymul(int16_t *des, int16_t *src1, int16_t *src2){


    int16_t poly1_NTT[51 * 32], poly2_NTT[51 * 32];
    int16_t *res_NTT = poly1_NTT;

    // Rader-17

    for(size_t i = 0; i < 12; i++){
        __asm_rader_17_mix_pre((int16x8_t*)(poly1_NTT + (i) * 8), (int16x8_t*)src1, in_table[i], twiddle_permutedx8);
    }

    for(size_t i = 0; i < 12; i++){
        __asm_rader_17_mix_pre((int16x8_t*)(poly2_NTT + (i) * 8), (int16x8_t*)src2, in_table[i], twiddle_permutedx8);
    }

    __asm_radix32(poly1_NTT, radix3_args);
    __asm_radix32(poly2_NTT, radix3_args);

    __asm_weighted16x16(res_NTT, poly1_NTT, poly2_NTT, basemul_full_table);

// ================================

    __asm_radix32(res_NTT, iradix3_args);

    // Rader-17
    for(size_t i = 0; i < 12; i++){

        __asm_rader_17_mix_post((int16x8_t*)(des), (int16x8_t*)(res_NTT + i * 8), in_table[i], twiddle_inv_permutedx8);

    }

}

