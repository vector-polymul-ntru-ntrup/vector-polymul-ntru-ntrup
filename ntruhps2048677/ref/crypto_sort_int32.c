// Based on supercop-20190110/crypto_sort/int32/x86

#include "crypto_sort_int32.h"

#include <stdint.h>
#define int32 int32_t

#ifdef BENCH_SORT
#define ACC sort_cycles

#define TIME0 sort_time0
#define TIME1 sort_time1

extern uint64_t ACC;
uint64_t TIME0, TIME1;


#ifdef __APPLE__
#include "m1cycles.h"
#define GET_TIME rdtsc()
#else
#include "hal.h"
#define GET_TIME hal_get_time()
#endif

#define BENCH_INIT() { TIME0 = GET_TIME;}
#define BENCH_TAIL() { TIME1 = GET_TIME; ACC += TIME1 - TIME0;}

#else

#define BENCH_INIT() {}
#define BENCH_TAIL() {}

#endif

#define int32_MINMAX(a,b) \
do { \
  int32_t ab = (b) ^ (a); \
  int32_t c = (int32_t)((int64_t)(b) - (int64_t)(a)); \
  c ^= ab & (c ^ (b)); \
  c >>= 31; \
  c &= ab; \
  (a) ^= c; \
  (b) ^= c; \
} while(0)

/* assume 2 <= n <= 0x40000000 */
void crypto_sort_int32(int32 *array,size_t n)
{
  BENCH_INIT();
  size_t top,p,q,r,i,j;
  int32 *x = array;

  top = 1;
  while (top < n - top) top += top;

  for (p = top;p >= 1;p >>= 1) {
    i = 0;
    while (i + 2 * p <= n) {
      for (j = i;j < i + p;++j) {
        int32_MINMAX(x[j],x[j+p]);
      }
      i += 2 * p;
    }
    for (j = i;j < n - p;++j) {
      int32_MINMAX(x[j],x[j+p]);
    }

    i = 0;
    j = 0;
    for (q = top;q > p;q >>= 1) {
      if (j != i) {
        for (;;) {
          if (j == n - q) goto done;
          int32 a = x[j + p];
          for (r = q;r > p;r >>= 1) {
            int32_MINMAX(a,x[j + r]);
          }
          x[j + p] = a;
          ++j;
          if (j == i + p) {
            i += 2 * p;
            break;
          }
        }
      }
      while (i + p <= n - q) {
        for (j = i;j < i + p;++j) {
          int32 a = x[j + p];
          for (r = q;r > p;r >>= 1) {
            int32_MINMAX(a,x[j+r]);
          }
          x[j + p] = a;
        }
        i += 2 * p;
      }
      /* now i + p > n - q */
      j = i;
      while (j < n - q) {
        int32 a = x[j + p];
        for (r = q;r > p;r >>= 1) {
          int32_MINMAX(a,x[j+r]);
        }
        x[j + p] = a;
        ++j;
      }

      done: ;
    }
  }
  BENCH_TAIL();
}
