.POSIX:

PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include
PKGCONFDIR ?= ${LIBDIR}/pkgconfig

CC ?= cc
AR ?= ar
SH ?= /bin/sh

TOOL_TIC = tic/tic
TOOL_NBPERF = nbperf/nbperf

SCRIPT_ENV = TERMINFODIR=./terminfo \
				TOOL_AWK=awk \
				TOOL_NBPERF=${TOOL_NBPERF} \
				TOOL_SED=sed \
				TOOL_SORT=sort \
				TOOL_TIC=${TOOL_TIC}

XCFLAGS = -fPIC ${CFLAGS}
INCFLAGS = -I. -I./libterminfo -I./tic -I./libcurses \
			-I./libmenu -I./libform -I./libpanel

XCPPFLAGS = -DHAVE_WCHAR -DTERMINFO_COMPILE -DTERMINFO_DB \
			-DTERMINFO_COMPAT -DINSTALL_PREFIX=\"${PREFIX}\" ${CPPFLAGS}
FLAGS = ${INCFLAGS} ${XCPPFLAGS} ${XCFLAGS}

TIC_OBJ = tic/tic.o tic/cdbw.o tic/mi_vector_hash.o tic/compile.o

NBPERF_OBJ = nbperf/graph2.o nbperf/graph3.o nbperf/mi_vector_hash.o \
	nbperf/nbperf-bdz.o nbperf/nbperf-chm.o nbperf/nbperf-chm3.o nbperf/nbperf.o

LIBTERMINFO_OBJ = libterminfo/ti.o libterminfo/setupterm.o \
	libterminfo/curterm.o libterminfo/tparm.o libterminfo/tputs.o \
	libterminfo/compile.o libterminfo/cdbr.o libterminfo/mi_vector_hash.o

LIBCURSES_OBJ = libcurses/acs.o libcurses/add_wch.o libcurses/add_wchstr.o \
	libcurses/addbytes.o libcurses/addch.o libcurses/addchnstr.o \
	libcurses/addnstr.o libcurses/addwstr.o libcurses/attributes.o \
	libcurses/background.o libcurses/bell.o libcurses/border.o libcurses/box.o \
	libcurses/cchar.o libcurses/chgat.o libcurses/clear.o libcurses/clearok.o \
	libcurses/clrtobot.o libcurses/clrtoeol.o libcurses/color.o \
	libcurses/copywin.o libcurses/cr_put.o libcurses/ctrace.o \
	libcurses/cur_hash.o libcurses/curs_set.o libcurses/curses.o \
	libcurses/delch.o libcurses/deleteln.o libcurses/delwin.o \
	libcurses/echo_wchar.o libcurses/echochar.o libcurses/erase.o \
	libcurses/fileio.o libcurses/flushok.o libcurses/fullname.o \
	libcurses/get_wch.o libcurses/get_wstr.o libcurses/getch.o \
	libcurses/getstr.o libcurses/getyx.o libcurses/id_subwins.o \
	libcurses/idcok.o libcurses/idlok.o libcurses/immedok.o libcurses/in_wch.o \
	libcurses/in_wchstr.o libcurses/inch.o libcurses/inchstr.o \
	libcurses/initscr.o libcurses/ins_wch.o libcurses/ins_wstr.o \
	libcurses/insch.o libcurses/insdelln.o libcurses/insertln.o \
	libcurses/insstr.o libcurses/instr.o libcurses/inwstr.o \
	libcurses/keyname.o libcurses/keypad.o libcurses/leaveok.o \
	libcurses/line.o libcurses/meta.o libcurses/mouse.o libcurses/move.o \
	libcurses/mvwin.o libcurses/newwin.o libcurses/nodelay.o \
	libcurses/notimeout.o libcurses/overlay.o libcurses/overwrite.o \
	libcurses/pause.o libcurses/printw.o libcurses/putchar.o \
	libcurses/refresh.o libcurses/resize.o libcurses/ripoffline.o \
	libcurses/scanw.o libcurses/screen.o libcurses/scroll.o \
	libcurses/scrollok.o libcurses/setterm.o libcurses/slk.o \
	libcurses/standout.o libcurses/syncok.o libcurses/timeout.o \
	libcurses/toucholap.o libcurses/touchwin.o libcurses/tstp.o libcurses/tty.o \
	libcurses/unctrl.o libcurses/underscore.o libcurses/version.o

LIBPANEL_OBJ = libpanel/_deck.o libpanel/above.o libpanel/below.o \
	libpanel/bottom.o libpanel/del.o libpanel/getuser.o libpanel/hidden.o \
	libpanel/hide.o libpanel/move.o libpanel/new.o libpanel/replace.o \
	libpanel/setuser.o libpanel/show.o libpanel/top.o libpanel/update.o \
	libpanel/window.o

LIBMENU_OBJ = libmenu/attributes.o libmenu/driver.o libmenu/internals.o \
	libmenu/item.o libmenu/menu.o libmenu/post.o libmenu/userptr.o

LIBFORM_OBJ = libform/driver.o libform/field.o libform/field_types.o \
	libform/form.o libform/internals.o libform/post.o libform/std_header.o \
	libform/type_alnum.o libform/type_alpha.o libform/type_enum.o \
	libform/type_integer.o libform/type_ipv4.o libform/type_ipv6.o \
	libform/type_numeric.o libform/type_regex.o

TSET_OBJ = tset/map.o tset/misc.o tset/set.o tset/term.o tset/tset.o

TPUT_OBJ = tput/tput.o

INFOCMP_OBJ = infocmp/infocmp.o

TABS_OBJ = tabs/tabs.o

OBJ = ${TIC_OBJ} ${NBPERF_OBJ} ${LIBTERMINFO_OBJ} \
		${LIBCURSES_OBJ} ${LIBPANEL_OBJ} ${LIBMENU_OBJ} \
		${LIBFORM_OBJ} ${TSET_OBJ} ${INFOCMP_OBJ} ${TABS_OBJ}

.PHONY: all progs stalibs shalibs
all: progs stalibs shalibs

progs: tabs/tabs tput/tput tset/tset infocmp/infocmp
stalibs: libform.a libmenu.a libpanel.a libcurses.a libterminfo.a
shalibs: libform.so libmenu.so libpanel.so libcurses.so libterminfo.so

.c.o:
	$(CC) ${FLAGS} -c -o $@ $<

nbperf/nbperf: ${NBPERF_OBJ}
	${CC} ${INCFLAGS} -o $@ ${NBPERF_OBJ}

libterminfo/hash.c: libterminfo/term.h
	${SCRIPT_ENV} ${SH} libterminfo/genhash libterminfo/term.h > $@

tic/hash.c: libterminfo/hash.c
	cp libterminfo/hash.c tic/hash.c

TIC_OBJ += tic/hash.o

tic/tic: ${TIC_OBJ} tic/hash.c
	${CC} -static ${TIC_OBJ} -o $@

libterminfo/compiled_terms.c: libterminfo/term.h tic/tic
	${SCRIPT_ENV} ${SH} libterminfo/genterms \
						libterminfo/term.h \
						terminfo/terminfo > $@

libterminfo/hash.c: nbperf/nbperf
libterminfo/termcap_hash.c: nbperf/nbperf
libterminfo/compiled_terms.c: tic/tic
libterminfo/term.c: libterminfo/compiled_terms.c
libterminfo/term.o: libterminfo/compiled_terms.c
libterminfo/termcap.c: libterminfo/termcap_hash.c

libterminfo/termcap_hash.c: libterminfo/genthash libterminfo/termcap_map.c
	${SCRIPT_ENV} ${SH} libterminfo/genthash \
						libterminfo/termcap_map.c > $@

LIBTERMINFO_OBJ += libterminfo/hash.o libterminfo/termcap.o libterminfo/term.o

libterminfo.a: ${LIBTERMINFO_OBJ}
	${AR} rcs $@ ${LIBTERMINFO_OBJ}

libcurses.a: ${LIBCURSES_OBJ}
	${AR} rcs $@ ${LIBCURSES_OBJ}

libpanel.a: ${LIBPANEL_OBJ}
	${AR} rcs $@ ${LIBPANEL_OBJ}

libmenu.a: ${LIBMENU_OBJ}
	${AR} rcs $@ ${LIBMENU_OBJ}

libform.a: ${LIBFORM_OBJ}
	${AR} rcs $@ ${LIBFORM_OBJ}

tset/tset: ${TSET_OBJ} libterminfo.a
	${CC} -static -o $@ ${TSET_OBJ} libterminfo.a

tput/tput: ${TPUT_OBJ} libterminfo.a
	${CC} -static -o $@ ${TPUT_OBJ} libterminfo.a

tabs/tabs: ${TABS_OBJ} libterminfo.a
	${CC} -static -o $@ ${TABS_OBJ} libterminfo.a

infocmp/infocmp: ${INFOCMP_OBJ} libterminfo.a
	${CC} -static -o $@ ${INFOCMP_OBJ} libterminfo.a

libterminfo.so: ${LIBTERMINFO_OBJ}
	${CC} -shared -o $@ ${LIBTERMINFO_OBJ} -Wl,-soname=$@

libcurses.so: ${LIBCURSES_OBJ} libterminfo.so
	${CC} -shared -o $@ ${LIBCURSES_OBJ} libterminfo.so -Wl,-soname=$@

libpanel.so: ${LIBPANEL_OBJ} libcurses.so
	${CC} -shared -o $@ ${LIBPANEL_OBJ} libcurses.so -Wl,-soname=$@

libmenu.so: ${LIBMENU_OBJ} libcurses.so
	${CC} -shared -o $@ ${LIBMENU_OBJ} libcurses.so -Wl,-soname=$@

libform.so: ${LIBFORM_OBJ} libcurses.so
	${CC} -shared -o $@ ${LIBFORM_OBJ} libcurses.so -Wl,-soname=$@

.PHONY: install install-libs install-progs install-headers install-pc
install: install-libs install-progs install-headers install-pc

install-libs: libform libmenu libpanel libcurses libterminfo
	install -Dm644 libform.a      ${DESTDIR}${LIBDIR}/libform.a
	install -Dm644 libform.so     ${DESTDIR}${LIBDIR}/libform.so
	install -Dm644 libmenu.a      ${DESTDIR}${LIBDIR}/libmenu.a
	install -Dm644 libmenu.so     ${DESTDIR}${LIBDIR}/libmenu.so
	install -Dm644 libpanel.a     ${DESTDIR}${LIBDIR}/libpanel.a
	install -Dm644 libpanel.so    ${DESTDIR}${LIBDIR}/libpanel.so
	install -Dm644 libcurses.a    ${DESTDIR}${LIBDIR}/libcurses.a
	install -Dm644 libcurses.so   ${DESTDIR}${LIBDIR}/libcurses.so
	install -Dm644 libterminfo.a  ${DESTDIR}${LIBDIR}/libterminfo.a
	install -Dm644 libterminfo.so ${DESTDIR}${LIBDIR}/libterminfo.so
	ln -sf libmenu.a              ${DESTDIR}${LIBDIR}/libmenuw.a
	ln -sf libform.a              ${DESTDIR}${LIBDIR}/libformw.a
	ln -sf libpanel.a             ${DESTDIR}${LIBDIR}/libpanelw.a
	ln -sf libcurses.a            ${DESTDIR}${LIBDIR}/libncurses.a
	ln -sf libterminfo.a          ${DESTDIR}${LIBDIR}/libtermcap.a
	ln -sf libcurses.a            ${DESTDIR}${LIBDIR}/libncursesw.a
	ln -sf libmenu.so             ${DESTDIR}${LIBDIR}/libmenuw.so
	ln -sf libform.so             ${DESTDIR}${LIBDIR}/libformw.so
	ln -sf libpanel.so            ${DESTDIR}${LIBDIR}/libpanelw.so
	ln -sf libterminfo.so         ${DESTDIR}${LIBDIR}/libtermcap.so
	ln -sf libcurses.so           ${DESTDIR}${LIBDIR}/libncurses.so
	ln -sf libcurses.so           ${DESTDIR}${LIBDIR}/libncursesw.so

install-progs: tabs tput tset infocmp
	install -Dm755 tic/tic         ${DESTDIR}${BINDIR}/tic
	install -Dm755 tabs/tabs       ${DESTDIR}${BINDIR}/tabs
	install -Dm755 tput/tput       ${DESTDIR}${BINDIR}/tput
	install -Dm755 tset/tset       ${DESTDIR}${BINDIR}/tset
	install -Dm755 infocmp/infocmp ${DESTDIR}${BINDIR}/infocmp
	install -Dm755 tput/clear.sh   ${DESTDIR}${BINDIR}/clear
	ln -sf tset                    ${DESTDIR}${BINDIR}/reset

install-headers:
	install -Dm644 libmenu/eti.h         ${DESTDIR}${INCDIR}/eti.h
	install -Dm644 libform/form.h        ${DESTDIR}${INCDIR}/form.h
	install -Dm644 libterminfo/term.h    ${DESTDIR}${INCDIR}/term.h
	install -Dm644 libmenu/menu.h        ${DESTDIR}${INCDIR}/menu.h
	install -Dm644 libpanel/panel.h      ${DESTDIR}${INCDIR}/panel.h
	install -Dm644 libcurses/curses.h    ${DESTDIR}${INCDIR}/curses.h
	install -Dm644 libcurses/unctrl.h    ${DESTDIR}${INCDIR}/unctrl.h
	install -Dm644 libterminfo/termcap.h ${DESTDIR}${INCDIR}/termcap.h
	ln -sf curses.h                      ${DESTDIR}${INCDIR}/ncurses.h

install-pc:
	mkdir -p ${DESTDIR}${PKGCONFDIR}
	./genpc curses "curses terminal library" "-lcurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/curses.pc
	./genpc ncurses "ncurses terminal library" "-lncurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/ncurses.pc
	./genpc ncursesw "ncurses terminal library" "-lncurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/ncursesw.pc
	./genpc terminfo "terminfo library" "-lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/terminfo.pc
	./genpc termcap "termcap library" "-lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/termcap.pc
	./genpc panel "curses panel library" "-lpanel -lcurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/panel.pc
	./genpc panelw "curses panel library" "-lpanel -lncurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/panelw.pc
	./genpc menu "curses menu library" "-lmenu -lcurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/menu.pc
	./genpc menuw "curses menu library" "-lmenu -lcurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/menuw.pc
	./genpc form "curses form library" "-lform -lcurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/form.pc
	./genpc formw "curses form library" "-lform -lcurses -lterminfo" > \
		${DESTDIR}${PKGCONFDIR}/formw.pc

.PHONY: clean
clean:
	rm -f progs shalibs stalibs ${OBJ}
