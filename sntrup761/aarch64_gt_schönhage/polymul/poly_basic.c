
#include <stddef.h>

#include "poly_basic.h"

#include <arm_neon.h>

#ifndef Q
#define Q 4591
#endif
#ifndef RmodQ
#define RmodQ (1262)
#endif
#ifndef Qprime
#define Qprime (-15631)
#endif

int16_t cmod_int16(int16_t v){

    int16_t t = v % Q;
    if(t >= (Q >> 1)){
        t -= Q;
    }
    if(t <= -(Q >> 1)){
        t += Q;
    }
    return t;
}

int32_t cmod_int32(int32_t v){

    int32_t t = v % Q;
    if(t >= (Q >> 1)){
        t -= Q;
    }
    if(t <= -(Q >> 1)){
        t += Q;
    }
    return t;
}

int16_t mulmod_int16(int16_t a, int16_t b){
    return (int16_t)cmod_int32((int32_t)a * b);
}

int16x8_t cmod_int16x8(int16x8_t v){

    int16x8_t t;

    for(size_t i = 0; i < 8; i++){
        t[i] = cmod_int16(v[i]);
    }

    return t;

}

int16x8_t mulmod_int16x8(int16x8_t a, int16x8_t b){

    int16x8_t t;

    for(size_t i = 0; i < 8; i++){
        t[i] = mulmod_int16(a[i], b[i]);
    }

   return t;

}

void schoolbook_Rmodx8(int16x8_t *des, int16x8_t *src1, int16x8_t *src2, size_t len){

    int32x4_t lo, hi;
    int16x8_t t;

    for(size_t i = 0; i < len; i++){
        lo = hi = vdupq_n_s32(0);
        for(size_t j = 0; j <= i; j++){
            lo = vmlal_s16(lo, vget_low_s16(src1[j]), vget_low_s16(src2[i - j]));
            hi = vmlal_high_s16(hi, src1[j], src2[i - j]);
        }
        t = vuzp1q_s16((int16x8_t)lo, (int16x8_t)hi);
        t = vmulq_n_s16(t, Qprime);
        lo = vmlal_n_s16(lo, vget_low_s16(t), Q);
        hi = vmlal_high_n_s16(hi, t, Q);
        t = vuzp2q_s16((int16x8_t)lo, (int16x8_t)hi);
        des[i] = t;
    }

    for(size_t i = len; i < 2 * len - 1; i++){
        lo = hi = vdupq_n_s32(0);
        for(size_t j = i - len + 1; j < len; j++){
            lo = vmlal_s16(lo, vget_low_s16(src1[j]), vget_low_s16(src2[i - j]));
            hi = vmlal_high_s16(hi, src1[j], src2[i - j]);
        }
        t = vuzp1q_s16((int16x8_t)lo, (int16x8_t)hi);
        t = vmulq_n_s16(t, Qprime);
        lo = vmlal_n_s16(lo, vget_low_s16(t), Q);
        hi = vmlal_high_n_s16(hi, t, Q);
        t = vuzp2q_s16((int16x8_t)lo, (int16x8_t)hi);
        des[i] = t;
    }
    des[2 * len - 1] = vdupq_n_s16(0);

}

void polymul_Rmodx8(int16x8_t *des, int16x8_t *src1, int16x8_t *src2, size_t len){

    int32x4_t lo, hi;
    int16x8_t t;


    for(size_t i = 0; i < len; i++){
        lo = hi = vdupq_n_s32(0);
        for(size_t j = 0; j <= i; j++){
            lo = vmlal_s16(lo, vget_low_s16(src1[j]), vget_low_s16(src2[i - j]));
            hi = vmlal_high_s16(hi, src1[j], src2[i - j]);
        }
        t = vuzp1q_s16((int16x8_t)lo, (int16x8_t)hi);
        t = vmulq_n_s16(t, Qprime);
        lo = vmlal_n_s16(lo, vget_low_s16(t), Q);
        hi = vmlal_high_n_s16(hi, t, Q);
        t = vuzp2q_s16((int16x8_t)lo, (int16x8_t)hi);
        des[i] = t;
    }

    for(size_t i = len; i < 2 * len - 1; i++){
        lo = hi = vdupq_n_s32(0);
        for(size_t j = i - len + 1; j < len; j++){
            lo = vmlal_s16(lo, vget_low_s16(src1[j]), vget_low_s16(src2[i - j]));
            hi = vmlal_high_s16(hi, src1[j], src2[i - j]);
        }
        t = vuzp1q_s16((int16x8_t)lo, (int16x8_t)hi);
        t = vmulq_n_s16(t, Qprime);
        lo = vmlal_n_s16(lo, vget_low_s16(t), Q);
        hi = vmlal_high_n_s16(hi, t, Q);
        t = vuzp2q_s16((int16x8_t)lo, (int16x8_t)hi);
        des[i - len] = des[i - len] - t;
    }


}

void polymulx8(int16x8_t *des, int16x8_t *src1, int16x8_t *src2, size_t len){

    int16_t scale = RmodQ;

    polymul_Rmodx8(des, src1, src2, len);

    for(size_t i = 0; i < len; i++){
        des[i] = mulmod_int16x8(des[i], vdupq_n_s16(scale));
    }

}

void interleave16x8(int16_t *des, 
		int16_t *src0, int16_t *src1, int16_t *src2, int16_t *src3,
	        int16_t *src4, int16_t *src5, int16_t *src6, int16_t *src7,
		size_t len){
   
    for(size_t i = 0; i < len; i++){
        des[i * 8 + 0] = src0[i];
        des[i * 8 + 1] = src1[i];
        des[i * 8 + 2] = src2[i];
        des[i * 8 + 3] = src3[i];
        des[i * 8 + 4] = src4[i];
        des[i * 8 + 5] = src5[i];
        des[i * 8 + 6] = src6[i];
        des[i * 8 + 7] = src7[i];
    }

}

void deinterleave16x8(int16_t *des0, int16_t *des1, int16_t *des2, int16_t *des3,
		      int16_t *des4, int16_t *des5, int16_t *des6, int16_t *des7,
		int16_t *src, size_t len){

    for(size_t i = 0; i < len; i++){
        des0[i] = src[i * 8 + 0];
        des1[i] = src[i * 8 + 1];
        des2[i] = src[i * 8 + 2];
        des3[i] = src[i * 8 + 3];
        des4[i] = src[i * 8 + 4];
        des5[i] = src[i * 8 + 5];
        des6[i] = src[i * 8 + 6];
        des7[i] = src[i * 8 + 7];
    }  

}




