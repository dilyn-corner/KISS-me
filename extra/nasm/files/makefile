.POSIX:

PREFIX ?= /usr/local

CC ?= cc
AR ?= ar

XCFLAGS = ${CFLAGS} -std=c17 -fwrapv -fno-common \
			-ffunction-sections -fdata-sections -fvisibility=hidden \
			-pedantic -Wno-long-long -Wno-shift-negative-value \

XCPPFLAGS = ${CPPFLAGS} -U__STRICT_ANSI__ -DHAVE_CONFIG_H

IFLAGS = -I. -I./include -I./x86 -I./asm -I./disasm -I./output

FLAGS = ${XCFLAGS} ${XCPPFLAGS} ${IFLAGS}

N_OBJ = asm/assemble.o \
		asm/directbl.o \
		asm/directiv.o \
		asm/error.o \
		asm/eval.o \
		asm/exprdump.o \
		asm/exprlib.o \
		asm/floats.o \
		asm/labels.o \
		asm/listing.o \
		asm/nasm.o \
		asm/parser.o \
		asm/pptok.o \
		asm/pragma.o \
		asm/preproc-nop.o \
		asm/preproc.o \
		asm/quote.o \
		asm/rdstrnum.o \
		asm/segalloc.o \
		asm/srcfile.o \
		asm/stdscan.o \
		asm/strfunc.o \
		asm/tokhash.o \
		asm/warnings.o

DIS_OBJ = disasm/disasm.o \
			disasm/ndisasm.o \
			disasm/sync.o

LIB_OBJ = asm/assemble.o \
			asm/directbl.o \
			asm/directiv.o \
			asm/error.o \
			asm/eval.o \
			asm/exprdump.o \
			asm/exprlib.o \
			asm/floats.o \
			asm/labels.o \
			asm/listing.o \
			asm/nasm.o \
			asm/parser.o \
			asm/pptok.o \
			asm/pragma.o \
			asm/preproc-nop.o \
			asm/preproc.o \
			asm/quote.o \
			asm/rdstrnum.o \
			asm/segalloc.o \
			asm/srcfile.o \
			asm/stdscan.o \
			asm/strfunc.o \
			asm/tokhash.o \
			asm/warnings.o \
			common/common.o \
			disasm/disasm.o \
			disasm/sync.o \
			macros/macros.o \
			nasmlib/alloc.o \
			nasmlib/asprintf.o \
			nasmlib/badenum.o \
			nasmlib/bsi.o \
			nasmlib/crc64.o \
			nasmlib/errfile.o \
			nasmlib/file.o \
			nasmlib/filename.o \
			nasmlib/hashtbl.o \
			nasmlib/ilog2.o \
			nasmlib/md5c.o \
			nasmlib/mmap.o \
			nasmlib/nctype.o \
			nasmlib/path.o \
			nasmlib/perfhash.o \
			nasmlib/raa.o \
			nasmlib/rbtree.o \
			nasmlib/readnum.o \
			nasmlib/realpath.o \
			nasmlib/rlimit.o \
			nasmlib/saa.o \
			nasmlib/string.o \
			nasmlib/strlist.o \
			nasmlib/ver.o \
			nasmlib/zerobuf.o \
			output/codeview.o \
			output/legacy.o \
			output/nulldbg.o \
			output/nullout.o \
			output/outaout.o \
			output/outas86.o \
			output/outbin.o \
			output/outcoff.o \
			output/outdbg.o \
			output/outelf.o \
			output/outform.o \
			output/outieee.o \
			output/outlib.o \
			output/outmacho.o \
			output/outobj.o \
			output/outrdf2.o \
			stdlib/snprintf.o \
			stdlib/strlcpy.o \
			stdlib/strnlen.o \
			stdlib/strrchrnul.o \
			stdlib/vsnprintf.o \
			x86/disp8.o \
			x86/iflag.o \
			x86/insnsa.o \
			x86/insnsb.o \
			x86/insnsd.o \
			x86/insnsn.o \
			x86/regdis.o \
			x86/regflags.o \
			x86/regs.o \
			x86/regvals.o \

.PHONY: all
all: nasm ndisasm libnasm.a

.c.o:
	${CC} ${FLAGS} ${CFLAGS} -c -o $@ $<

libnasm.a: ${LIB_OBJ}
	${AR} rcs $@ ${LIB_OBJ}

nasm: ${N_OBJ} libnasm.a
	${CC} ${FLAGS} -Wl,--gc-sections -o $@ ${N_OBJ} libnasm.a

ndisasm: ${DIS_OBJ} libnasm.a
	${CC} ${FLAGS} -Wl,--gc-sections -o $@ ${DIS_OBJ} libnasm.a

.PHONY: install
install: nasm ndisasm
	mkdir -p ${DESTDIR}${PREFIX}/bin
	cp nasm ${DESTDIR}${PREFIX}/bin/nasm
	cp ndisasm ${DESTDIR}${PREFIX}/bin/ndisasm

.PHONY: clean
clean:
	rm -f libnasm.a nasm ndisasm ${LIB_OBJ}
