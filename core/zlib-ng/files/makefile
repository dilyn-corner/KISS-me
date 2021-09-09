.POSIX:

PREFIX ?= /usr/local
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include
PKGCONFDIR ?= ${LIBDIR}/pkgconfig

CC ?= cc
AR ?= ar

XCPPFLAGS = -D_LARGEFILE64_SOURCE=1 -DZLIB_COMPAT -DHAVE_BUILTIN_CTZ \
	-DHAVE_BUILTIN_CTZLL -DUNALIGNED_OK -DUNALIGNED64_OK -DX86_FEATURES \
	-DX86_AVX2 -DX86_AVX2_ADLER32 -DX86_AVX_CHUNKSET -DX86_SSE42_CRC_HASH \
	-DX86_SSE42_CRC_INTRIN -DX86_SSE42_CMP_STR -DX86_SSE2 -DX86_SSE2_CHUNKSET \
	-DX86_SSSE3 -DX86_SSSE3_ADLER32 -DX86_PCLMULQDQ_CRC -DWITH_GZFILEOP

FLAGS = -fPIC ${CFLAGS} ${XCPPFLAGS} ${CPPFLAGS}

ARCH_OBJ= arch/x86/x86.o arch/x86/slide_avx.o \
	arch/x86/chunkset_avx.o arch/x86/compare258_avx.o arch/x86/adler32_avx.o \
	arch/x86/insert_string_sse.o arch/x86/compare258_sse.o \
	arch/x86/chunkset_sse.o arch/x86/slide_sse.o arch/x86/adler32_ssse3.o \
	arch/x86/crc_folding.o

ARCH_PIC_OBJ= arch/x86/x86.lo arch/x86/slide_avx.lo \
	arch/x86/chunkset_avx.lo arch/x86/compare258_avx.lo \
	arch/x86/adler32_avx.lo arch/x86/insert_string_sse.lo \
	arch/x86/compare258_sse.lo arch/x86/chunkset_sse.lo arch/x86/slide_sse.lo \
	arch/x86/adler32_ssse3.lo arch/x86/crc_folding.lo

OBJ = gzlib.o gzread.o gzwrite.o adler32.o chunkset.o compare258.o \
	compress.o crc32.o crc32_comb.o deflate.o deflate_fast.o deflate_medium.o \
	deflate_quick.o deflate_slow.o functable.o infback.o inffast.o inflate.o \
	inftrees.o insert_string.o trees.o uncompr.o zutil.o ${ARCH_OBJ}

PIC_OBJ = gzlib.lo gzread.lo gzwrite.lo adler32.lo chunkset.lo \
	compare258.lo compress.lo crc32.lo crc32_comb.lo deflate.lo \
	deflate_fast.lo deflate_medium.lo deflate_quick.lo deflate_slow.lo \
	functable.lo infback.lo inffast.lo inflate.lo inftrees.lo insert_string.lo \
	trees.lo uncompr.lo zutil.lo ${ARCH_PIC_OBJ}

.SUFFIXES: .lo

.PHONY: all
all: libz.a libz.so

.c.o:
	${CC} ${FLAGS} -I. -c -o $@ $<

.c.lo:
	${CC} ${FLAGS} -DPIC -I. -c -o $@ $<

zconf.h:
	mv zconf.h.in $@

${OBJ} ${PIC_OBJ}: zconf.h

${ARCH_OBJ}:
	${CC} ${FLAGS} -Iarch/x86 -I. -c -o $@ $<

${ARCH_PIC_OBJ}:
	${CC} ${FLAGS} -DPIC -Iarch/x86 -I. -c -o $@ $<

libz.a: ${OBJ}
	${AR} rcs $@ ${OBJ}

libz.so: ${PIC_OBJ}
	${CC} ${FLAGS} -shared -o $@ ${PIC_OBJ}

zlib.pc: zlib.pc.in
	sed -e "s|@prefix@|${PREFIX}|g" \
		-e "s|@exec_prefix@|${PREFIX}|g" \
		-e "s|@libdir@|${LIBDIR}|g" \
		-e "s|@sharedlibdir@|${LIBDIR}|g" \
		-e "s|@includedir@|${INCDIR}|g" \
		-e 's|@SUFFIX@||g' \
		-e 's|@VERSION@|1.2.11|g' \
		zlib.pc.in > zlib.pc

.PHONY: install
install: libz.a libz.so zlib.pc
	install -Dm755 libz.a ${DESTDIR}${LIBDIR}/libz.a
	install -Dm644 zlib.h ${DESTDIR}${INCDIR}/zlib.h
	install -Dm644 zconf.h ${DESTDIR}${INCDIR}/zconf.h
	install -Dm755 libz.so ${DESTDIR}${LIBDIR}/libz.so.1.2.11
	ln -sf libz.so.1.2.11 ${DESTDIR}${LIBDIR}/libz.so.1
	ln -sf libz.so.1.2.11 ${DESTDIR}${LIBDIR}/libz.so
	install -Dm644 zlib.pc ${DESTDIR}${PKGCONFDIR}/zlib.pc

.PHONY: clean
clean:
	rm -f ${OBJ} ${PIC_OBJ} libz.a libz.so
