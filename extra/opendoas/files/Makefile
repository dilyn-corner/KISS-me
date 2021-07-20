PROG = doas
MAN = doas.1 doas.conf.5

SRCS = parse.y doas.c env.c

include config.mk

CFLAGS := -I. -Ilibopenbsd -O2 -Wall -Wextra -std=c99 ${OS_CFLAGS} ${CFLAGS}

all: ${PROG}

OBJS := ${SRCS:.y=.c}
OBJS := ${OBJS:.c=.o}

${PROG}: ${OBJS}
	@[ -f ./libopenbsd/strlcat.o ] && mv libopenbsd/*.o . || true
	${CC} ${CFLAGS} *.o -o $@ ${LDFLAGS} ${LDLIBS}

install: ${PROG} ${MAN}
	mkdir -p -m 0755 ${DESTDIR}${BINDIR}
	mkdir -p -m 0755 ${DESTDIR}${MANDIR}/man1
	mkdir -p -m 0755 ${DESTDIR}${MANDIR}/man5
	cp -f ${PROG} ${DESTDIR}${BINDIR}
	chmod ${BINMODE} ${DESTDIR}${BINDIR}/${PROG}
	cp -f doas.1 ${DESTDIR}${MANDIR}/man1
	cp -f doas.conf.5 ${DESTDIR}${MANDIR}/man5

uninstall:
	rm -f ${DESTDIR}${BINDIR}/${PROG}
	rm -f ${DESTDIR}${MANDIR}/man1/doas.1
	rm -f ${DESTDIR}${MANDIR}/man5/doas.conf.5

clean:
	rm -f ${PROG} ${OBJS} ${OBJS:.o=.d} parse.c

-include ${OBJS:.o=.d}

.PHONY: all clean install uninstall
