#include "poly.h"

#include "tmvp.h"

#include "polymul/polymul.h"

/* Map {0, 1, 2} -> {0,1,q-1} in place */
void poly_Z3_to_Zq(poly *r) {
    int i;
    for (i = 0; i < NTRU_N; i++) {
        r->coeffs[i] = r->coeffs[i] | ((-(r->coeffs[i] >> 1)) & (NTRU_Q - 1));
    }
}

/* Map {0, 1, 2} -> {0,1,-1} in place */
void poly_Z3_to_SignedZ3(poly *r) {
    int i;
    for (i = 0; i < NTRU_N; i++) {
        r->coeffs[i] = r->coeffs[i] | (-(r->coeffs[i] >> 1));
    }
}

/* Map {0, 1, q-1} -> {0,1,2} in place */
void poly_trinary_Zq_to_Z3(poly *r) {
    int i;
    for (i = 0; i < NTRU_N; i++) {
        r->coeffs[i] = MODQ(r->coeffs[i]);
        r->coeffs[i] = 3 & (r->coeffs[i] ^ (r->coeffs[i] >> (NTRU_LOGQ - 1)));
    }
}

void poly_S3_mul(poly *r, const poly *a, const poly *b) {
    int i;

    /* Our S3 multiplications do not overflow mod q,    */
    /* so we can re-purpose poly_Rq_mul, as long as we  */
    /* follow with an explicit reduction mod q.         */
    polymul(r, (poly*)a, (poly*)b);
    // poly_Rq_mul(r, (poly*)a, (poly*)b);
    for (i = 0; i < NTRU_N; i++) {
        r->coeffs[i] = MODQ(r->coeffs[i]);
    }
    poly_mod_3_Phi_n(r);
}

void poly_Rq_mul(poly *r, poly *a, poly *b)
{
    uint16_t coeffs_L[SIZE_L];
    uint16_t coeffs_R[SIZE_R];
    uint16_t coeffs_I[SIZE_I];

    // 677 - 680
    b->coeffs[NTRU_N] = 0;
    b->coeffs[NTRU_N+1] = 0;
    b->coeffs[NTRU_N+2] = 0;

    F_L(coeffs_L, a->coeffs);
    F_R(coeffs_R, b->coeffs);
    F_MUL(coeffs_I, coeffs_L, coeffs_R);
    F_I(r->coeffs, coeffs_I);

}

static void poly_R2_inv_to_Rq_inv(poly *r, const poly *ai, const poly *a) {

    poly b, c;
    poly s;

    // for 0..4
    //    ai = ai * (2 - a*ai)  mod q
    for (size_t i = 0; i < NTRU_N; i++) {
        b.coeffs[i] = MODQ(-a->coeffs[i]);
    }

    for (size_t i = 0; i < NTRU_N; i++) {
        r->coeffs[i] = ai->coeffs[i];
    }

    // Instead of caching the transformation of operands,
    // we should use faster polynomial multipliers over Z
    poly_Rq_mul(&c, r, &b);
    c.coeffs[0] += 2; // c = 2 - a*ai
    poly_Rq_mul(&s, &c, r); // s = ai*c

    poly_Rq_mul(&c, &s, &b);
    c.coeffs[0] += 2; // c = 2 - a*s
    poly_Rq_mul(r, &c, &s); // r = s*c

    poly_Rq_mul(&c, r, &b);
    c.coeffs[0] += 2; // c = 2 - a*r
    poly_Rq_mul(&s, &c, r); // s = r*c

    poly_Rq_mul(&c, &s, &b);
    c.coeffs[0] += 2; // c = 2 - a*s
    poly_Rq_mul(r, &c, &s); // r = s*c
}

void poly_Rq_inv(poly *r, const poly *a) {
    poly ai2;
    poly_R2_inv(&ai2, a);
    poly_R2_inv_to_Rq_inv(r, &ai2, a);
}
