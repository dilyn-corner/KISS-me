.POSIX:

PREFIX ?= /usr/local
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include
DATADIR ?= ${PREFIX}/share
LOCALEDIR ?= ${PREFIX}/locale
PKGCONFDIR ?= ${LIBDIR}/pkgconfig

CPPFLAGS = -DHAVE_CONFIG_H -DG_LOG_DOMAIN=\"xdg-desktop-portal\" \
	-DGETTEXT_PACKAGE=\"xdg-desktop-portal\" -DLOCALEDIR=\"${LOCALEDIR}\" \
	-DDATADIR=\"${DATADIR}\" -DLIBEXECDIR=\"${LIBDIR}\" -DBWRAP=\"\"

GLIB_INC = -I/usr/include/glib-2.0 -I/usr/lib/glib-2.0/include \
	-I/usr/include/gio-unix-2.0 -I/usr/include/json-glib-1.0

PIPE_INC = -I/usr/include/pipewire-0.3 -I/usr/include/spa-0.2

INTERNAL_INC = -I. -Isrc -Idocument-portal

LIBS = -ljson-glib-1.0 -lgio-2.0 -lgobject-2.0 -lffi \
	-lgmodule-2.0 -lglib-2.0 -lm -lz -pthread

PERM_OBJ = document-portal/permission-store.o \
	document-portal/xdg-permission-store.o document-portal/permission-db.o \
	document-portal/gvdb/gvdb-reader.o document-portal/gvdb/gvdb-builder.o \
	document-portal/permission-store-dbus.o

DOC_OBJ = document-portal/document-portal.o \
	document-portal/file-transfer.o document-portal/document-store.o \
	document-portal/document-portal-fuse.o document-portal/document-portal-dbus.o

DESK_OBJ = src/xdg-desktop-portal.o src/file-chooser.o \
	src/open-uri.o src/print.o src/memory-monitor.o src/network-monitor.o \
	src/power-profile-monitor.o src/proxy-resolver.o src/screenshot.o \
	src/notification.o src/inhibit.o src/device.o src/account.o src/realtime.o \
	src/request.o src/call.o src/documents.o src/permissions.o src/email.o \
	src/settings.o src/session.o src/trash.o src/wallpaper.o src/background.o \
	src/gamemode.o src/secret.o src/flatpak-instance.o src/portal-impl.o \
	src/screen-cast.o src/remote-desktop.o src/pipewire.o src/camera.o \
	src/xdp-dbus.o src/xdp-impl-dbus.o src/xdg-desktop-resources.o

.PHONY: all
all: make-portals make-pc make-services

.c.o:
	${CC} ${FLAGS} -c -o $@ $<

src/perm-xdp-utils.o: src/xdp-utils.c
	${CC} ${CPPFLAGS} ${GLIB_INC} ${INTERNAL_INC} ${CFLAGS} -c -o $@ src/xdp-utils.c

src/doc-xdp-utils.o: src/xdp-utils.c
	${CC} ${CPPFLAGS} -D_FILE_OFFSET_BITS=64 \
		${GLIB_INC} ${INTERNAL_INC} ${CFLAGS} -pthread -c -o $@ src/xdp-utils.c

src/desk-xdp-utils.o: src/xdp-utils.c
	${CC} -D_REENTRANT ${CPPFLAGS} ${GLIB_INC} \
		${PIPE_INC} ${INTERNAL_INC} ${CFLAGS} -pthread -c -o $@ src/xdp-utils.c

document-portal/permission-store-dbus.c:
	gdbus-codegen --interface-prefix org.freedesktop.impl.portal. --c-namespace \
		Xdg --generate-c-code document-portal/permission-store-dbus \
		data/org.freedesktop.impl.portal.PermissionStore.xml

document-portal/document-portal-dbus.c:
	gdbus-codegen --interface-prefix org.freedesktop.portal. --c-namespace \
		XdpDbus --generate-c-code document-portal/document-portal-dbus \
		data/org.freedesktop.portal.Documents.xml \
		data/org.freedesktop.portal.FileTransfer.xml

src/xdp-dbus.c:
	gdbus-codegen --interface-prefix org.freedesktop.portal. --c-namespace \
		Xdp --generate-c-code src/xdp-dbus \
		data/org.freedesktop.portal.Documents.xml \
		data/org.freedesktop.portal.Request.xml \
		data/org.freedesktop.portal.Session.xml \
		data/org.freedesktop.portal.FileChooser.xml \
		data/org.freedesktop.portal.Trash.xml \
		data/org.freedesktop.portal.OpenURI.xml \
		data/org.freedesktop.portal.Print.xml \
		data/org.freedesktop.portal.MemoryMonitor.xml \
		data/org.freedesktop.portal.NetworkMonitor.xml \
		data/org.freedesktop.portal.ProxyResolver.xml \
		data/org.freedesktop.portal.Screenshot.xml \
		data/org.freedesktop.portal.Notification.xml \
		data/org.freedesktop.portal.Inhibit.xml \
		data/org.freedesktop.portal.Device.xml \
		data/org.freedesktop.portal.Account.xml \
		data/org.freedesktop.portal.Email.xml \
		data/org.freedesktop.portal.ScreenCast.xml \
		data/org.freedesktop.portal.Realtime.xml \
		data/org.freedesktop.portal.RemoteDesktop.xml \
		data/org.freedesktop.portal.Location.xml \
		data/org.freedesktop.portal.Settings.xml \
		data/org.freedesktop.portal.Background.xml \
		data/org.freedesktop.portal.GameMode.xml \
		data/org.freedesktop.portal.Camera.xml \
		data/org.freedesktop.portal.Secret.xml \
		data/org.freedesktop.portal.Wallpaper.xml \
		data/org.freedesktop.portal.PowerProfileMonitor.xml

src/xdp-impl-dbus.c:
	gdbus-codegen --interface-prefix org.freedesktop.impl.portal. --c-namespace \
		XdpImpl --generate-c-code ./src/xdp-impl-dbus \
		data/org.freedesktop.impl.portal.PermissionStore.xml \
		data/org.freedesktop.impl.portal.Request.xml \
		data/org.freedesktop.impl.portal.Session.xml \
		data/org.freedesktop.impl.portal.FileChooser.xml \
		data/org.freedesktop.impl.portal.AppChooser.xml \
		data/org.freedesktop.impl.portal.Print.xml \
		data/org.freedesktop.impl.portal.Screenshot.xml \
		data/org.freedesktop.impl.portal.Notification.xml \
		data/org.freedesktop.impl.portal.Inhibit.xml \
		data/org.freedesktop.impl.portal.Access.xml \
		data/org.freedesktop.impl.portal.Account.xml \
		data/org.freedesktop.impl.portal.Email.xml \
		data/org.freedesktop.impl.portal.ScreenCast.xml \
		data/org.freedesktop.impl.portal.RemoteDesktop.xml \
		data/org.freedesktop.impl.portal.Settings.xml \
		data/org.freedesktop.impl.portal.Lockdown.xml \
		data/org.freedesktop.impl.portal.Background.xml \
		data/org.freedesktop.impl.portal.Secret.xml \
		data/org.freedesktop.impl.portal.Wallpaper.xml

src/xdg-desktop-resources.c:
	glib-compile-resources src/xdg-desktop-portal.gresource.xml \
		--target=src/xdg-desktop-resources.c --sourcedir=. \
		--c-name _xdg_desktop --generate-source

${PERM_OBJ}:
	${CC} ${CPPFLAGS} ${GLIB_INC} ${INTERNAL_INC} ${CFLAGS} -c -o $@ $<

${DOC_OBJ}:
	${CC} ${CPPFLAGS} -D_FILE_OFFSET_BITS=64 \
		${GLIB_INC} ${INTERNAL_INC} ${CFLAGS} -pthread -c -o $@ $<

${DESK_OBJ}:
	${CC} ${CPPFLAGS} -D_REENTRANT ${GLIB_INC} \
		${PIPE_INC} ${INTERNAL_INC} ${CFLAGS} -pthread -c -o $@ $<

PERM_OBJ += src/perm-xdp-utils.o

DOC_OBJ += src/doc-xdp-utils.o document-portal/permission-db.o \
	document-portal/permission-store-dbus.o

DESK_OBJ += src/desk-xdp-utils.o

make-portals: xdg-permission-store xdg-document-portal xdg-desktop-portal

xdg-permission-store: ${PERM_OBJ}
	${CC} ${GLIB_INC} ${INTERNAL_INC} ${CFLAGS} -o $@ ${PERM_OBJ} ${LIBS}

xdg-document-portal: ${DOC_OBJ}
	${CC} -D_FILE_OFFSET_BITS=64 ${GLIB_INC} ${INTERNAL_INC} ${CFLAGS} -o \
		$@ ${DOC_OBJ} ${LIBS} lib/libfuse.a

xdg-desktop-portal: ${DESK_OBJ}
	${CC} ${CPPFLAGS} -D_REENTRANT ${GLIB_INC} ${PIPE_INC} ${INTERNAL_INC} \
		${CFLAGS} -o $@ ${DESK_OBJ} ${LIBS} -lpipewire-0.3

make-services:
	sed -e "s|@libexecdir@|${LIBDIR}|" \
		-e "s|@extraargs@||" \
		document-portal/org.freedesktop.impl.portal.PermissionStore.service.in > \
		document-portal/org.freedesktop.impl.portal.PermissionStore.service
	
	sed -e "s|@libexecdir@|${LIBDIR}|" \
		-e "s|@extraargs@||" \
		document-portal/org.freedesktop.portal.Documents.service.in > \
		document-portal/org.freedesktop.portal.Documents.service
	
	sed -e "s|@libexecdir@|${LIBDIR}|" \
		-e "s|@extraargs@||" \
		src/org.freedesktop.portal.Desktop.service.in > \
		src/org.freedesktop.portal.Desktop.service
	
	sed -e "s|@libexecdir@|${LIBDIR}|" \
		-e "s|@extraargs@||" \
		document-portal/xdg-permission-store.service.in > \
		document-portal/xdg-permission-store.service
	
	sed -e "s|@libexecdir@|${LIBDIR}|" \
		-e "s|@extraargs@||" \
		document-portal/xdg-document-portal.service.in > \
		document-portal/xdg-document-portal.service
	
	sed -e "s|@libexecdir@|${LIBDIR}|" \
		-e "s|@extraargs@||" \
		src/xdg-desktop-portal.service.in > src/xdg-desktop-portal.service

make-pc:
	sed -e "s|@prefix@|${PREFIX}|" \
		-e "s|@datarootdir@|${DATADIR}|" \
		-e "s|@datadir@|${DATADIR}|" \
		-e "s|@VERSION@|1.12.1|" \
		xdg-desktop-portal.pc.in > \
		xdg-desktop-portal.pc

.PHONY: install
install: portals xdg-pc services interfaces

portals: xdg-permission-store xdg-document-portal xdg-desktop-portal
	install -Dm755 xdg-permission-store ${DESTDIR}${LIBDIR}/xdg-permission-store
	install -Dm755 xdg-document-portal ${DESTDIR}${LIBDIR}/xdg-document-portal
	install -Dm755 xdg-desktop-portal ${DESTDIR}${LIBDIR}/xdg-desktop-portal

services: make-services
	install -Dm644 document-portal/org.freedesktop.impl.portal.PermissionStore.service \
		${DESTDIR}${DATADIR}/dbus-1/services/org.freedesktop.impl.portal.PermissionStore.service
	install -Dm644 document-portal/org.freedesktop.portal.Documents.service \
		${DESTDIR}${DATADIR}/dbus-1/services/org.freedesktop.portal.Documents.service
	install -Dm644 src/org.freedesktop.portal.Desktop.service \
		${DESTDIR}${DATADIR}/dbus-1/services/org.freedesktop.portal.Desktop.service
	install -Dm644 document-portal/xdg-permission-store.service \
		${DESTDIR}${LIBDIR}/systemd/user/xdg-permission-store.service
	install -Dm644 document-portal/xdg-document-portal.service \
		${DESTDIR}${LIBDIR}/systemd/user/xdg-document-portal.service
	install -Dm644 src/xdg-desktop-portal.service \
		${DESTDIR}${LIBDIR}/systemd/user/xdg-desktop-portal.service

interfaces:
	install -Dm644 data/org.freedesktop.portal.Account.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Account.xml
	install -Dm644 data/org.freedesktop.portal.Background.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Background.xml
	install -Dm644 data/org.freedesktop.portal.Camera.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Camera.xml
	install -Dm644 data/org.freedesktop.portal.Device.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Device.xml
	install -Dm644 data/org.freedesktop.portal.Documents.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Documents.xml
	install -Dm644 data/org.freedesktop.portal.Email.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Email.xml
	install -Dm644 data/org.freedesktop.portal.FileChooser.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.FileChooser.xml
	install -Dm644 data/org.freedesktop.portal.FileTransfer.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.FileTransfer.xml
	install -Dm644 data/org.freedesktop.portal.GameMode.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.GameMode.xml
	install -Dm644 data/org.freedesktop.portal.Inhibit.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Inhibit.xml
	install -Dm644 data/org.freedesktop.portal.Location.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Location.xml
	install -Dm644 data/org.freedesktop.portal.MemoryMonitor.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.MemoryMonitor.xml
	install -Dm644 data/org.freedesktop.portal.NetworkMonitor.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.NetworkMonitor.xml
	install -Dm644 data/org.freedesktop.portal.Notification.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Notification.xml
	install -Dm644 data/org.freedesktop.portal.OpenURI.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.OpenURI.xml
	install -Dm644 data/org.freedesktop.portal.PowerProfileMonitor.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.PowerProfileMonitor.xml
	install -Dm644 data/org.freedesktop.portal.Print.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Print.xml
	install -Dm644 data/org.freedesktop.portal.ProxyResolver.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.ProxyResolver.xml
	install -Dm644 data/org.freedesktop.portal.RemoteDesktop.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.RemoteDesktop.xml
	install -Dm644 data/org.freedesktop.portal.Request.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Request.xml
	install -Dm644 data/org.freedesktop.portal.ScreenCast.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.ScreenCast.xml
	install -Dm644 data/org.freedesktop.portal.Screenshot.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Screenshot.xml
	install -Dm644 data/org.freedesktop.portal.Secret.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Secret.xml
	install -Dm644 data/org.freedesktop.portal.Session.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Session.xml
	install -Dm644 data/org.freedesktop.portal.Settings.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Settings.xml
	install -Dm644 data/org.freedesktop.portal.Trash.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Trash.xml
	install -Dm644 data/org.freedesktop.portal.Wallpaper.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.portal.Wallpaper.xml
	install -Dm644 data/org.freedesktop.impl.portal.Access.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Access.xml
	install -Dm644 data/org.freedesktop.impl.portal.Account.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Account.xml
	install -Dm644 data/org.freedesktop.impl.portal.AppChooser.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.AppChooser.xml
	install -Dm644 data/org.freedesktop.impl.portal.Background.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Background.xml
	install -Dm644 data/org.freedesktop.impl.portal.Email.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Email.xml
	install -Dm644 data/org.freedesktop.impl.portal.FileChooser.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.FileChooser.xml
	install -Dm644 data/org.freedesktop.impl.portal.Inhibit.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Inhibit.xml
	install -Dm644 data/org.freedesktop.impl.portal.Lockdown.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Lockdown.xml
	install -Dm644 data/org.freedesktop.impl.portal.Notification.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Notification.xml
	install -Dm644 data/org.freedesktop.impl.portal.PermissionStore.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.PermissionStore.xml
	install -Dm644 data/org.freedesktop.impl.portal.Print.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Print.xml
	install -Dm644 data/org.freedesktop.impl.portal.RemoteDesktop.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.RemoteDesktop.xml
	install -Dm644 data/org.freedesktop.impl.portal.Request.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Request.xml
	install -Dm644 data/org.freedesktop.impl.portal.ScreenCast.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.ScreenCast.xml
	install -Dm644 data/org.freedesktop.impl.portal.Screenshot.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Screenshot.xml
	install -Dm644 data/org.freedesktop.impl.portal.Secret.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Secret.xml
	install -Dm644 data/org.freedesktop.impl.portal.Session.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Session.xml
	install -Dm644 data/org.freedesktop.impl.portal.Settings.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Settings.xml
	install -Dm644 data/org.freedesktop.impl.portal.Wallpaper.xml \
		${DESTDIR}${DATADIR}/dbus-1/interfaces/org.freedesktop.impl.portal.Wallpaper.xml

xdg-pc: make-pc
	install -Dm644 xdg-desktop-portal.pc \
		${DESTDIR}${PKGCONFDIR}/xdg-desktop-portal.pc

.PHONY: clean
clean:
	find -name \*.o -exec rm -f {} \;
