.POSIX:

PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin
LIBDIR ?= ${PREFIX}/lib

CC ?= cc
AR ?= ar

XCFLAGS   = -O3 -fPIC
XCPPFLAGS = -D_REENTRANT -DNDEBUG
INCLUDES  = -I. -Iinclude
FLAGS 	  = ${XCPPFLAGS} ${CPPFLAGS} ${INCLUDES} ${XCFLAGS} ${CFLAGS}
STA_FLAGS = -DLIBXML_STATIC -DNDEBUG ${CPPFLAGS} ${INCLUDES} -O3 ${CFLAGS} 

OBJS = buf.o c14n.o catalog.o chvalid.o debugXML.o dict.o encoding.o entities.o \
	error.o globals.o hash.o HTMLparser.o HTMLtree.o legacy.o list.o nanoftp.o \
	nanohttp.o parser.o parserInternals.o pattern.o relaxng.o SAX.o SAX2.o \
	schematron.o threads.o tree.o uri.o valid.o xinclude.o xlink.o xmlIO.o \
	xmlmemory.o xmlmodule.o xmlreader.o xmlregexp.o xmlsave.o xmlschemas.o \
	xmlschemastypes.o xmlstring.o xmlunicode.o xmlwriter.o xpath.o xpointer.o \
	xzlib.o DOCBparser.o

XMLCAT_OBJ = xmlcatalog.o

XMLLINT_OBJ = xmllint.o

.PHONY: all
all: libxml2.a xmlcatalog xmllint

.c.o:
	${CC} ${FLAGS} -c -o $@ $<

xmlcatalog.o: xmlcatalog.c
	${CC} ${STA_FLAGS} -o $@ -c xmlcatalog.c


xmllint.o: xmllint.c
	${CC} ${STA_FLAGS} -o $@ -c xmllint.c


libxml2.a: ${OBJS}
	${AR} qcs $@ ${OBJS}

xmlcatalog: libxml2.a ${XMLCAT_OBJ}
	${CC} ${FLAGS} -o $@ ${XMLCAT_OBJ} libxml2.a -ldl -lm /usr/lib/liblzma.a /usr/lib/libz.so

xmllint: libxml2.a ${XMLLINT_OBJ}
	${CC} ${FLAGS} -o $@ ${XMLLINT_OBJ} libxml2.a -ldl -lm /usr/lib/liblzma.a /usr/lib/libz.so

.PHONY: install
install: libxml2.a xmlcatalog xmllint
	install -Dm644 libxml2.a ${DESTDIR}${LIBDIR}/libxml2.a
	install -Dm755 xmlcatalog ${DESTDIR}${BINDIR}/xmlcatalog
	install -Dm755 xmllint ${DESTDIR}${BINDIR}/xmllint

.PHONY: clean
clean:
	find -name \*.o -exec rm -f {} \;
	rm -f libxml2.a xmllint xmlcatalog
