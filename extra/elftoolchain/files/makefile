.POSIX:

PREFIX ?= /usr/local
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include

CC ?= cc
AR ?= ar
M4 ?= m4

INCLUDE = -I./libelf -I./common

LIBELF_M4 = libelf/elf_types.c libelf/libelf_convert.c \
	libelf/libelf_fsize.c libelf/libelf_msize.c

LIBELF_OBJ = libelf/elf.o libelf/elf_begin.o libelf/elf_cntl.o libelf/elf_data.o \
	libelf/elf_end.o libelf/elf_errmsg.o libelf/elf_errno.o libelf/elf_fill.o \
	libelf/elf_flag.o libelf/elf_getarhdr.o libelf/elf_getarsym.o \
	libelf/elf_getbase.o libelf/elf_getident.o libelf/elf_getversion.o \
	libelf/elf_hash.o libelf/elf_kind.o libelf/elf_memory.o libelf/elf_next.o \
	libelf/elf_open.o libelf/elf_phnum.o libelf/elf_rand.o libelf/elf_rawfile.o \
	libelf/elf_scn.o libelf/elf_shnum.o libelf/elf_shstrndx.o libelf/elf_strptr.o \
	libelf/elf_types.o libelf/elf_update.o libelf/elf_version.o libelf/gelf_cap.o \
	libelf/gelf_checksum.o libelf/gelf_dyn.o libelf/gelf_ehdr.o libelf/gelf_fsize.o \
	libelf/gelf_getclass.o libelf/gelf_move.o libelf/gelf_phdr.o libelf/gelf_rel.o \
	libelf/gelf_rela.o libelf/gelf_shdr.o libelf/gelf_sym.o libelf/gelf_syminfo.o \
	libelf/gelf_symshndx.o libelf/gelf_xlate.o libelf/libelf_align.o \
	libelf/libelf_allocate.o libelf/libelf_ar.o libelf/libelf_ar_util.o \
	libelf/libelf_checksum.o libelf/libelf_convert.o libelf/libelf_data.o \
	libelf/libelf_ehdr.o libelf/libelf_elfmachine.o libelf/libelf_extended.o \
	libelf/libelf_fsize.o libelf/libelf_memory.o libelf/libelf_msize.o \
	libelf/libelf_open.o libelf/libelf_phdr.o libelf/libelf_shdr.o \
	libelf/libelf_xlate.o

.SUFFIXES: m4

.PHONY: all
all: libelf.so.1 libelf.a

${LIBELF_OBJ}: ${LIBELF_M4} common/sys/elfdefinitions.h

common/sys/elfdefinitions.h:
	${M4} -I common/sys common/sys/elfdefinitions.m4 > $@

.m4.c:
	${M4} -DSRCDIR=libelf $< > $@

.c.o:
	${CC} ${INCLUDE} -fPIC ${CFLAGS} -c -o $@ $<

libelf.so.1: ${LIBELF_OBJ}
	${CC} ${INCLUDE} ${CFLAGS} -shared -o $@ ${LIBELF_OBJ}

libelf.a: ${LIBELF_OBJ}
	${AR} rcs $@ ${LIBELF_OBJ}

.PHONY: install
install: libelf.so.1 libelf.a
	mkdir -p ${DESTDIR}${LIBDIR} ${DESTDIR}${INCDIR}/sys
	cp -f libelf.so.1 ${DESTDIR}${LIBDIR}
	cp -f libelf.a ${DESTDIR}${LIBDIR}
	cp -f libelf/gelf.h ${DESTDIR}${INCDIR}
	cp -f libelf/libelf.h ${DESTDIR}${INCDIR}
	cp -f common/sys/elfdefinitions.h ${DESTDIR}${INCDIR}/sys
	ln -fs libelf.so.1 ${DESTDIR}${LIBDIR}/libelf.so

.PHONY: clean
clean:
	rm -f ${LIBELF_OBJ} \
		${LIBELF_M4} \
		libelf.so.1 \
		libelf.a \
		common/sys/elfdefinitions.h
