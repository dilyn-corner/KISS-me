.POSIX:

PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include
PKGCONFIGDIR ?= ${LIBDIR}/pkgconfig

CC ?= cc
AR ?= ar

CPPFLAGS = -DXXH_NAMESPACE=ZSTD_ -DDEBUGLEVEL=0 -DZSTD_MULTITHREAD \
			-DZSTD_GZCOMPRESS -DZSTD_GZDECOMPRESS -DZSTD_LZMACOMPRESS \
			-DZSTD_LZMADECOMPRESS

LTO = -flto -ffat-lto-objects -fuse-linker-plugin -ffunction-sections \
		-fdata-sections -fmerge-all-constants -Wl,--gc-sections \
		-Wl,-z,norelro -Wno-unused-command-line-argument \
		-Wno-ignored-optimization-argument

LIBS = -lz -llzma

FLAGS = ${CFLAGS} ${CPPFLAGS} ${LIBS} -static -pthread
LFLAGS = ${CFLAGS} ${CPPFLAGS} ${LTO}

LIB_OBJ = lib/common/debug.o \
			lib/common/entropy_common.o \
			lib/common/error_private.o \
			lib/common/fse_decompress.o \
			lib/common/pool.o \
			lib/common/threading.o \
			lib/common/xxhash.o \
			lib/common/zstd_common.o \
			lib/compress/fse_compress.o \
			lib/compress/hist.o \
			lib/compress/huf_compress.o \
			lib/compress/zstd_compress.o \
			lib/compress/zstd_compress_literals.o \
			lib/compress/zstd_compress_sequences.o \
			lib/compress/zstd_compress_superblock.o \
			lib/compress/zstd_double_fast.o \
			lib/compress/zstd_fast.o \
			lib/compress/zstd_lazy.o \
			lib/compress/zstd_ldm.o \
			lib/compress/zstd_opt.o \
			lib/compress/zstdmt_compress.o \
			lib/decompress/huf_decompress.o \
			lib/decompress/zstd_ddict.o \
			lib/decompress/zstd_decompress.o \
			lib/decompress/zstd_decompress_block.o \
			lib/dictBuilder/cover.o \
			lib/dictBuilder/divsufsort.o \
			lib/dictBuilder/fastcover.o \
			lib/dictBuilder/zdict.o

OBJ = programs/benchfn.o \
		programs/benchzstd.o \
		programs/datagen.o \
		programs/dibio.o \
		programs/fileio.o \
		programs/timefn.o \
		programs/util.o \
		programs/zstdcli.o \
		programs/zstdcli_trace.o \
		${LIB_OBJ}

.PHONY: all
all: libzstd.a libzstd.pc zstd-pgo

.c.o:
	${CC} ${LFLAGS} ${MOREFLAGS} -c -o $@ $<

libzstd.a: ${LIB_OBJ}
	${AR} rcs $@ ${LIB_OBJ}

.PHONY: zstd-pgo
zstd-pgo:
	make clean
	make zstd MOREFLAGS=-fprofile-generate
	./zstd -b19i1
	./zstd -b16i1
	./zstd -b9i2
	./zstd -b
	./zstd -b7i2
	./zstd -b5
	make clean
	llvm-profdata merge -output=default.profdata default*.profraw
	make zstd MOREFLAGS=-fprofile-use

zstd: ${OBJ}
	${CC} ${MOREFLAGS} ${FLAGS} -o $@ ${OBJ}

libzstd.pc: lib/libzstd.pc.in
	sed -e "s|@VERSION@|1.5.0|g" \
		-e "s|@PREFIX@|${PREFIX}|g" \
		-e "s|@LIBDIR@|${LIBDIR}|g" \
		-e "s|@EXEC_PREFIX@|${PREFIX}|g" \
		-e "s|@INCLUDEDIR@|${INCDIR}|g" \
		lib/libzstd.pc.in > libzstd.pc

.PHONY: install
install: zstd libzstd.a libzstd.pc
	mkdir -p ${DESTDIR}${BINDIR} ${DESTDIR}${LIBDIR}
	mkdir -p ${DESTDIR}${INCDIR} ${DESTDIR}${PKGCONFIGDIR}
	cp -f zstd ${DESTDIR}${BINDIR}
	cp -f programs/zstdless ${DESTDIR}${BINDIR}
	cp -f programs/zstdgrep ${DESTDIR}${BINDIR}
	cp -f libzstd.a ${DESTDIR}${LIBDIR}
	cp -f libzstd.pc ${DESTDIR}${PKGCONFIGDIR}
	cp -f lib/zstd.h ${DESTDIR}${INCDIR}
	cp -f lib/zdict.h ${DESTDIR}${INCDIR}
	cp -f lib/zstd_errors.h ${DESTDIR}${INCDIR}
	ln -fs zstd ${DESTDIR}${BINDIR}/gzip
	ln -fs zstd ${DESTDIR}${BINDIR}/lzma
	ln -fs zstd ${DESTDIR}${BINDIR}/xz
	ln -fs zstd ${DESTDIR}${BINDIR}/zcat
	ln -fs zstd ${DESTDIR}${BINDIR}/ungz
	ln -fs zstd ${DESTDIR}${BINDIR}/unlzma
	ln -fs zstd ${DESTDIR}${BINDIR}/unxz
	ln -fs zstd ${DESTDIR}${BINDIR}/unzstd
	ln -fs zstd ${DESTDIR}${BINDIR}/zstdcat
	ln -fs zstd ${DESTDIR}${BINDIR}/zstdmt

.PHONY: clean
clean:
	rm -f zstd libzstd.a libzstd.pc ${OBJ}
