CC ?= /usr/bin/cc
CFLAGS += -Wall -Wextra -Wpedantic -Wmissing-prototypes -Wredundant-decls \
          -Wshadow -Wpointer-arith -fomit-frame-pointer -mtune=native -O3
NISTFLAGS += -Wno-unused-result -mpopcnt -maes \
             -mtune=native -O3 -fomit-frame-pointer
RM = /bin/rm

HASH_PATH = ../../hash
HASH_HEADERS = $(HASH_PATH)/aes.h $(HASH_PATH)/sha2.h
HASH_SOURCES = $(HASH_PATH)/aes.c $(HASH_PATH)/sha2.c

SORT_PATH = ../../sort
SORT_HEADERS = $(SORT_PATH)/crypto_sort.h
SORT_SOURCES = $(SORT_PATH)/crypto_sort.c

RAND_PATH = ../../randombytes
RAND_HEADERS = $(RAND_PATH)/randombytes.h $(RAND_PATH)/rng.h $(RAND_PATH)/chacha20.h
RAND_SOURCES = $(RAND_PATH)/randombytes.c $(RAND_PATH)/rng.c $(RAND_PATH)/chacha20.c

CFLAGS += -I$(HASH_PATH) -I$(SORT_PATH) -I$(RAND_PATH)

CYCLES_PATH = ../../cycles
M1_CYCLES_HEADERS = $(CYCLES_PATH)/m1cycles.h
M1_CYCLES_SOURCES = $(CYCLES_PATH)/m1cycles.c
A72_CYCLES_HEADERS = $(CYCLES_PATH)/hal.h
A72_CYCLES_SOURCES = $(CYCLES_PATH)/hal.c
CYCLES_HEADERS = $(M1_CYCLES_HEADERS) $(A72_CYCLES_HEADERS)
CYCLES_SOURCES = $(M1_CYCLES_SOURCES) $(A72_CYCLES_SOURCES)

BENCHFLAGS = -I$(CYCLES_PATH)

ASM_HEADERS = polymul/opt-implement-macro.i polymul/opt-include-macro.i
ASM_SOURCES = polymul/opt-ntt3x128x4_basemul.S polymul/opt-ntt3x128x4_goodntt.S \
	polymul/opt-ntt3x128x4_ttndoog.S
C_HEADERS = api.h crypto_kem.h crypto_kem_ntrulpr761.h Decode.h Encode.h \
	poly_type.h poly_arith.h poly_rand.h hash.h ntrulpr_core.h ntrulpr_expand.h params.h paramsmenu.h poly_encode_decode.h
C_SOURCES = Decode.c Encode.c kem.c type/int32.c type/uint32.c poly_arith.c poly_rand.c hash.c \
	ntrulpr_core.c ntrulpr_expand.c poly_encode_decode.c \
	polymul/opt-ntt3x128x4_basemul.c polymul/opt-ntt3x128x4_goodntt.c \
	polymul/opt-ntt3x128x4_ttndoog.c polymul/polymul.c

HEADERS = $(HASH_HEADERS) $(SORT_HEADERS) $(RAND_HEADERS) $(ASM_HEADERS) $(C_HEADERS)
SOURCES = $(HASH_SOURCES) $(SORT_SOURCES) $(RAND_SOURCES) $(ASM_SOURCES) $(C_SOURCES)

all: test testvectors

test: $(HEADERS) $(SOURCES) test.c
	$(CC) $(CFLAGS) $(SOURCES) test.c -o test

testvectors: $(HEADERS) $(SOURCES) testvectors.c
	$(CC) $(CFLAGS) $(SOURCES) -DNORAND testvectors.c -o testvectors

speed: $(HEADERS) $(SOURCES) $(CYCLES_HEADERS) $(CYCLES_SOURCES) speed.c
	$(CC) $(CFLAGS) $(BENCHFLAGS) -DBENCH $(SOURCES) $(CYCLES_SOURCES) speed.c -o speed

speed_rand: $(HEADERS) $(SOURCES) $(CYCLES_HEADERS) $(CYCLES_SOURCES) speed_rand.c
	$(CC) $(CFLAGS) $(BENCHFLAGS) -DBENCH_RAND $(SOURCES) $(CYCLES_SOURCES) speed_rand.c -o speed_rand

speed_sort: $(HEADERS) $(SOURCES) $(CYCLES_HEADERS) $(CYCLES_SOURCES) speed_sort.c
	$(CC) $(CFLAGS) $(BENCHFLAGS) -DBENCH_SORT $(SOURCES) $(CYCLES_SOURCES) speed_sort.c -o speed_sort

speed_hash: $(HEADERS) $(SOURCES) $(CYCLES_HEADERS) $(CYCLES_SOURCES) speed_hash.c
	$(CC) $(CFLAGS) $(BENCHFLAGS) -DBENCH_HASH $(SOURCES) $(CYCLES_SOURCES) speed_hash.c -o speed_hash

.PHONY: bench clean

clean:
	-$(RM) -rf *.o
	-$(RM) -rf *.gch
	-$(RM) -rf test
	-$(RM) -rf speed
	-$(RM) -rf speed_rand
	-$(RM) -rf speed_sort
	-$(RM) -rf speed_hash
	-$(RM) -rf testvectors

