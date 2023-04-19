p = 16760833
# w^2 + w + 1 = 0 = v^2 + v + 1
w = 2933918
v = 13826914
# g^64 = -1
g = 4802559

# signed mod p
smp = lambda x: (lambda y: (y if (2*y<p) else (y-p)))(x%p)
# bit reversal (cite: https://stackoverflow.com/questions/12681945/reversing-bits-of-python-integer)
brv = lambda x,n: int('{:0{width}b}'.format(x,width=n)[::-1],2)
brv6 = lambda x: brv(x,6)
brv7 = lambda x: brv(x,7)
# barrett multiplier
bm = lambda x: ((x<<32)//p+1)//2
int2uint = lambda x,n: x+((x<0)<<n)
i32x2 = lambda l,h: (lambda f: '0x%08x%08xLL' %(f(h), f(l)))(lambda x: int2uint(x,32))
i64zlzh = lambda x: (lambda y: i32x2(y,bm(y)))(smp(x))

table_ntt_2 = 16*8*3 # 16*8*3 = |table_asymmul|
table_ntt_4 = 16*8*3 + 16*8 # 16*8 = |table_ntt_4|
table_ntt_8 = 16*8*3 + 16*8 + 16*4 # 16*4 = |table_ntt_2|


print('''#include <stdint.h>

static int64_t table[0x%x] = {'''%(16*(8*3+8+4+2)))
fas = lambda x: i64zlzh([1,w,v][x//128] * (g**brv7(x%128)))
fct = lambda x: i64zlzh(g**(    brv6(x)))
fgs = lambda x: i64zlzh(g**(128-brv6(x)))
for j in range(16):
    for i in range(3):
        print(f'\t/* (i, j) = ({i}, {j}) */')
        print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
            24*j+8*i+0,fas(128*i+8*j+0),24*j+8*i+1,fas(128*i+8*j+1)))
        print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
            24*j+8*i+2,fas(128*i+8*j+2),24*j+8*i+3,fas(128*i+8*j+3)))
        print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
            24*j+8*i+4,fas(128*i+8*j+4),24*j+8*i+5,fas(128*i+8*j+5)))
        print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
            24*j+8*i+6,fas(128*i+8*j+6),24*j+8*i+7,fas(128*i+8*j+7)))
    print()
print('\t// table_ntt_2 = table + 0x180')
for j in range(16):
    print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
        table_ntt_2 + 8*j+0, fct(4*j+0), table_ntt_2 + 8*j+1, fct(4*j+1), \
    ))
    print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
        table_ntt_2 + 8*j+2, fct(4*j+2), table_ntt_2 + 8*j+3, fct(4*j+3), \
    ))
    print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
        table_ntt_2 + 8*j+4, fgs(4*j+0), table_ntt_2 + 8*j+5, fgs(4*j+1), \
    ))
    print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
        table_ntt_2 + 8*j+6, fgs(4*j+2), table_ntt_2 + 8*j+7, fgs(4*j+3), \
    ))
print('\t// table_ntt_4 = table + 0x200')
for j in range(16):
    print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
        table_ntt_4 + 4*j+0, fct(2*j+0), table_ntt_4 + 4*j+1, fct(2*j+1), \
    ))
    print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
        table_ntt_4 + 4*j+2, fgs(2*j+0), table_ntt_4 + 4*j+3, fgs(2*j+1), \
    ))
print('\t// table_ntt_2 = table + 0x240')
for j in range(16):
    print('\t[0x%02x] = %s, \t[0x%02x] = %s, '%( \
        table_ntt_8 + 2*j+0, fct(j), \
        table_ntt_8 + 2*j+1, fgs(j), \
    ))
print('''};
''')

print(i64zlzh(g**32))