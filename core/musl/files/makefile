.POSIX:

PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include

CC ?= cc
AR ?= ar
SH ?= /bin/sh

PICFLAGS="$FLAGS -fPIC"

XCPPFLAGS = -D_XOPEN_SOURCE=700

INCLUDES = -Iarch/x86_64 -Iarch/generic -Isrc/include -Isrc/internal \
	-Iinclude -Iinclude/bits

XCFLAGS = -std=c99 -nostdinc -ffreestanding -frounding-math \
	-Wa,--noexecstack -pipe -fomit-frame-pointer -fno-unwind-tables \
	-fno-asynchronous-unwind-tables -ffunction-sections -fdata-sections -w

FLAGS = ${XCPPFLAGS} ${CPPFLAGS} ${INCLUDES} ${XCFLAGS} ${CFLAGS}

CRT_OBJ = crt/Scrt1.o crt/crt1.o crt/rcrt1.o crt/x86_64/crti.o crt/x86_64/crtn.o

DYN_OBJ = ldso/dlstart.o ldso/dynlink.o

LIBC_OBJ = src/aio/aio.o src/aio/aio_suspend.o src/aio/lio_listio.o \
	src/complex/__cexp.o src/complex/__cexpf.o src/complex/cabs.o \
	src/complex/cabsf.o src/complex/cabsl.o src/complex/cacos.o \
	src/complex/cacosf.o src/complex/cacosh.o src/complex/cacoshf.o \
	src/complex/cacoshl.o src/complex/cacosl.o src/complex/carg.o \
	src/complex/cargf.o src/complex/cargl.o src/complex/casin.o \
	src/complex/casinf.o src/complex/casinh.o src/complex/casinhf.o \
	src/complex/casinhl.o src/complex/casinl.o src/complex/catan.o \
	src/complex/catanf.o src/complex/catanh.o src/complex/catanhf.o \
	src/complex/catanhl.o src/complex/catanl.o src/complex/ccos.o \
	src/complex/ccosf.o src/complex/ccosh.o src/complex/ccoshf.o \
	src/complex/ccoshl.o src/complex/ccosl.o src/complex/cexp.o \
	src/complex/cexpf.o src/complex/cexpl.o src/complex/cimag.o \
	src/complex/cimagf.o src/complex/cimagl.o src/complex/clog.o \
	src/complex/clogf.o src/complex/clogl.o src/complex/conj.o \
	src/complex/conjf.o src/complex/conjl.o src/complex/cpow.o \
	src/complex/cpowf.o src/complex/cpowl.o src/complex/cproj.o \
	src/complex/cprojf.o src/complex/cprojl.o src/complex/creal.o \
	src/complex/crealf.o src/complex/creall.o src/complex/csin.o \
	src/complex/csinf.o src/complex/csinh.o src/complex/csinhf.o \
	src/complex/csinhl.o src/complex/csinl.o src/complex/csqrt.o \
	src/complex/csqrtf.o src/complex/csqrtl.o src/complex/ctan.o \
	src/complex/ctanf.o src/complex/ctanh.o src/complex/ctanhf.o \
	src/complex/ctanhl.o src/complex/ctanl.o src/conf/confstr.o \
	src/conf/fpathconf.o src/conf/legacy.o src/conf/pathconf.o \
	src/conf/sysconf.o src/crypt/crypt.o src/crypt/crypt_blowfish.o \
	src/crypt/crypt_des.o src/crypt/crypt_md5.o src/crypt/crypt_r.o \
	src/crypt/crypt_sha256.o src/crypt/crypt_sha512.o src/crypt/encrypt.o \
	src/ctype/__ctype_b_loc.o src/ctype/__ctype_get_mb_cur_max.o \
	src/ctype/__ctype_tolower_loc.o src/ctype/__ctype_toupper_loc.o \
	src/ctype/isalnum.o src/ctype/isalpha.o src/ctype/isascii.o \
	src/ctype/isblank.o src/ctype/iscntrl.o src/ctype/isdigit.o \
	src/ctype/isgraph.o src/ctype/islower.o src/ctype/isprint.o \
	src/ctype/ispunct.o src/ctype/isspace.o src/ctype/isupper.o \
	src/ctype/iswalnum.o src/ctype/iswalpha.o src/ctype/iswblank.o \
	src/ctype/iswcntrl.o src/ctype/iswctype.o src/ctype/iswdigit.o \
	src/ctype/iswgraph.o src/ctype/iswlower.o src/ctype/iswprint.o \
	src/ctype/iswpunct.o src/ctype/iswspace.o src/ctype/iswupper.o \
	src/ctype/iswxdigit.o src/ctype/isxdigit.o src/ctype/toascii.o \
	src/ctype/tolower.o src/ctype/toupper.o src/ctype/towctrans.o \
	src/ctype/wcswidth.o src/ctype/wctrans.o src/ctype/wcwidth.o \
	src/dirent/alphasort.o src/dirent/closedir.o src/dirent/dirfd.o \
	src/dirent/fdopendir.o src/dirent/opendir.o src/dirent/readdir.o \
	src/dirent/readdir_r.o src/dirent/rewinddir.o src/dirent/scandir.o \
	src/dirent/seekdir.o src/dirent/telldir.o src/dirent/versionsort.o \
	src/env/__environ.o src/env/__init_tls.o src/env/__libc_start_main.o \
	src/env/__reset_tls.o src/env/__stack_chk_fail.o src/env/clearenv.o \
	src/env/getenv.o src/env/putenv.o src/env/secure_getenv.o src/env/setenv.o \
	src/env/unsetenv.o src/errno/__errno_location.o src/errno/strerror.o \
	src/exit/_Exit.o src/exit/abort.o src/exit/abort_lock.o src/exit/assert.o \
	src/exit/at_quick_exit.o src/exit/atexit.o src/exit/exit.o \
	src/exit/quick_exit.o src/fcntl/creat.o src/fcntl/fcntl.o src/fcntl/open.o \
	src/fcntl/openat.o src/fcntl/posix_fadvise.o src/fcntl/posix_fallocate.o \
	src/fenv/__flt_rounds.o src/fenv/fegetexceptflag.o src/fenv/feholdexcept.o \
	src/fenv/fesetexceptflag.o src/fenv/fesetround.o src/fenv/feupdateenv.o \
	src/fenv/x86_64/fenv.o src/internal/defsysinfo.o src/internal/floatscan.o \
	src/internal/intscan.o src/internal/libc.o src/internal/procfdname.o \
	src/internal/shgetc.o src/internal/syscall_ret.o src/internal/vdso.o \
	src/internal/version.o src/ipc/ftok.o src/ipc/msgctl.o src/ipc/msgget.o \
	src/ipc/msgrcv.o src/ipc/msgsnd.o src/ipc/semctl.o src/ipc/semget.o \
	src/ipc/semop.o src/ipc/semtimedop.o src/ipc/shmat.o src/ipc/shmctl.o \
	src/ipc/shmdt.o src/ipc/shmget.o src/ldso/__dlsym.o \
	src/ldso/dl_iterate_phdr.o src/ldso/dladdr.o src/ldso/dlclose.o \
	src/ldso/dlerror.o src/ldso/dlinfo.o src/ldso/dlopen.o \
	src/ldso/x86_64/dlsym.o src/ldso/x86_64/tlsdesc.o src/legacy/cuserid.o \
	src/legacy/daemon.o src/legacy/err.o src/legacy/euidaccess.o \
	src/legacy/ftw.o src/legacy/futimes.o src/legacy/getdtablesize.o \
	src/legacy/getloadavg.o src/legacy/getpagesize.o src/legacy/getpass.o \
	src/legacy/getusershell.o src/legacy/isastream.o src/legacy/lutimes.o \
	src/legacy/ulimit.o src/legacy/utmpx.o src/legacy/valloc.o \
	src/linux/adjtime.o src/linux/adjtimex.o src/linux/arch_prctl.o \
	src/linux/brk.o src/linux/cache.o src/linux/cap.o src/linux/chroot.o \
	src/linux/clock_adjtime.o src/linux/clone.o src/linux/copy_file_range.o \
	src/linux/epoll.o src/linux/eventfd.o src/linux/fallocate.o \
	src/linux/fanotify.o src/linux/flock.o src/linux/getdents.o \
	src/linux/getrandom.o src/linux/gettid.o src/linux/inotify.o \
	src/linux/ioperm.o src/linux/iopl.o src/linux/klogctl.o \
	src/linux/membarrier.o src/linux/memfd_create.o src/linux/mlock2.o \
	src/linux/module.o src/linux/mount.o src/linux/name_to_handle_at.o \
	src/linux/open_by_handle_at.o src/linux/personality.o \
	src/linux/pivot_root.o src/linux/ppoll.o src/linux/prctl.o \
	src/linux/prlimit.o src/linux/process_vm.o src/linux/ptrace.o \
	src/linux/quotactl.o src/linux/readahead.o src/linux/reboot.o \
	src/linux/remap_file_pages.o src/linux/sbrk.o src/linux/sendfile.o \
	src/linux/setfsgid.o src/linux/setfsuid.o src/linux/setgroups.o \
	src/linux/sethostname.o src/linux/setns.o src/linux/settimeofday.o \
	src/linux/signalfd.o src/linux/splice.o src/linux/stime.o src/linux/swap.o \
	src/linux/sync_file_range.o src/linux/syncfs.o src/linux/sysinfo.o \
	src/linux/tee.o src/linux/timerfd.o src/linux/unshare.o src/linux/utimes.o \
	src/linux/vhangup.o src/linux/vmsplice.o src/linux/wait3.o \
	src/linux/wait4.o src/linux/xattr.o src/locale/__lctrans.o \
	src/locale/__mo_lookup.o src/locale/bind_textdomain_codeset.o \
	src/locale/c_locale.o src/locale/catclose.o src/locale/catgets.o \
	src/locale/catopen.o src/locale/dcngettext.o src/locale/duplocale.o \
	src/locale/freelocale.o src/locale/iconv.o src/locale/iconv_close.o \
	src/locale/langinfo.o src/locale/locale_map.o src/locale/localeconv.o \
	src/locale/newlocale.o src/locale/pleval.o src/locale/setlocale.o \
	src/locale/strcoll.o src/locale/strfmon.o src/locale/strxfrm.o \
	src/locale/textdomain.o src/locale/uselocale.o src/locale/wcscoll.o \
	src/locale/wcsxfrm.o src/malloc/calloc.o src/malloc/free.o \
	src/malloc/libc_calloc.o src/malloc/lite_malloc.o \
	src/malloc/mallocng/aligned_alloc.o src/malloc/mallocng/donate.o \
	src/malloc/mallocng/free.o src/malloc/mallocng/malloc.o \
	src/malloc/mallocng/malloc_usable_size.o src/malloc/mallocng/realloc.o \
	src/malloc/memalign.o src/malloc/posix_memalign.o src/malloc/realloc.o \
	src/malloc/reallocarray.o src/malloc/replaced.o src/math/__cos.o \
	src/math/__cosdf.o src/math/__cosl.o src/math/__expo2.o \
	src/math/__expo2f.o src/math/__fpclassify.o src/math/__fpclassifyf.o \
	src/math/__fpclassifyl.o src/math/__invtrigl.o src/math/__math_divzero.o \
	src/math/__math_divzerof.o src/math/__math_invalid.o \
	src/math/__math_invalidf.o src/math/__math_invalidl.o \
	src/math/__math_oflow.o src/math/__math_oflowf.o src/math/__math_uflow.o \
	src/math/__math_uflowf.o src/math/__math_xflow.o src/math/__math_xflowf.o \
	src/math/__polevll.o src/math/__rem_pio2.o src/math/__rem_pio2_large.o \
	src/math/__rem_pio2f.o src/math/__rem_pio2l.o src/math/__signbit.o \
	src/math/__signbitf.o src/math/__signbitl.o src/math/__sin.o \
	src/math/__sindf.o src/math/__sinl.o src/math/__tan.o src/math/__tandf.o \
	src/math/__tanl.o src/math/acos.o src/math/acosf.o src/math/acosh.o \
	src/math/acoshf.o src/math/acoshl.o src/math/asin.o src/math/asinf.o \
	src/math/asinh.o src/math/asinhf.o src/math/asinhl.o src/math/atan.o \
	src/math/atan2.o src/math/atan2f.o src/math/atanf.o src/math/atanh.o \
	src/math/atanhf.o src/math/atanhl.o src/math/cbrt.o src/math/cbrtf.o \
	src/math/cbrtl.o src/math/ceil.o src/math/ceilf.o src/math/copysign.o \
	src/math/copysignf.o src/math/copysignl.o src/math/cos.o src/math/cosf.o \
	src/math/cosh.o src/math/coshf.o src/math/coshl.o src/math/cosl.o \
	src/math/erf.o src/math/erff.o src/math/erfl.o src/math/exp.o \
	src/math/exp10.o src/math/exp10f.o src/math/exp10l.o src/math/exp2.o \
	src/math/exp2f.o src/math/exp2f_data.o src/math/exp_data.o src/math/expf.o \
	src/math/expm1.o src/math/expm1f.o src/math/fdim.o src/math/fdimf.o \
	src/math/fdiml.o src/math/finite.o src/math/finitef.o src/math/floor.o \
	src/math/floorf.o src/math/fmal.o src/math/fmax.o src/math/fmaxf.o \
	src/math/fmaxl.o src/math/fmin.o src/math/fminf.o src/math/fminl.o \
	src/math/fmod.o src/math/fmodf.o src/math/frexp.o src/math/frexpf.o \
	src/math/frexpl.o src/math/hypot.o src/math/hypotf.o src/math/hypotl.o \
	src/math/ilogb.o src/math/ilogbf.o src/math/ilogbl.o src/math/j0.o \
	src/math/j0f.o src/math/j1.o src/math/j1f.o src/math/jn.o src/math/jnf.o \
	src/math/ldexp.o src/math/ldexpf.o src/math/ldexpl.o src/math/lgamma.o \
	src/math/lgamma_r.o src/math/lgammaf.o src/math/lgammaf_r.o \
	src/math/lgammal.o src/math/llround.o src/math/llroundf.o \
	src/math/llroundl.o src/math/log.o src/math/log10.o src/math/log10f.o \
	src/math/log1p.o src/math/log1pf.o src/math/log2.o src/math/log2_data.o \
	src/math/log2f.o src/math/log2f_data.o src/math/log_data.o src/math/logb.o \
	src/math/logbf.o src/math/logbl.o src/math/logf.o src/math/logf_data.o \
	src/math/lround.o src/math/lroundf.o src/math/lroundl.o src/math/modf.o \
	src/math/modff.o src/math/modfl.o src/math/nan.o src/math/nanf.o \
	src/math/nanl.o src/math/nearbyint.o src/math/nearbyintf.o \
	src/math/nearbyintl.o src/math/nextafter.o src/math/nextafterf.o \
	src/math/nextafterl.o src/math/nexttoward.o src/math/nexttowardf.o \
	src/math/nexttowardl.o src/math/pow.o src/math/pow_data.o src/math/powf.o \
	src/math/powf_data.o src/math/powl.o src/math/remainder.o \
	src/math/remainderf.o src/math/remquo.o src/math/remquof.o src/math/rint.o \
	src/math/rintf.o src/math/round.o src/math/roundf.o src/math/roundl.o \
	src/math/scalb.o src/math/scalbf.o src/math/scalbln.o src/math/scalblnf.o \
	src/math/scalblnl.o src/math/scalbn.o src/math/scalbnf.o \
	src/math/scalbnl.o src/math/signgam.o src/math/significand.o \
	src/math/significandf.o src/math/sin.o src/math/sincos.o \
	src/math/sincosf.o src/math/sincosl.o src/math/sinf.o src/math/sinh.o \
	src/math/sinhf.o src/math/sinhl.o src/math/sinl.o src/math/sqrt_data.o \
	src/math/tan.o src/math/tanf.o src/math/tanh.o src/math/tanhf.o \
	src/math/tanhl.o src/math/tanl.o src/math/tgamma.o src/math/tgammaf.o \
	src/math/tgammal.o src/math/trunc.o src/math/truncf.o \
	src/math/x86_64/__invtrigl.o src/math/x86_64/acosl.o \
	src/math/x86_64/asinl.o src/math/x86_64/atan2l.o src/math/x86_64/atanl.o \
	src/math/x86_64/ceill.o src/math/x86_64/exp2l.o src/math/x86_64/expl.o \
	src/math/x86_64/expm1l.o src/math/x86_64/fabs.o src/math/x86_64/fabsf.o \
	src/math/x86_64/fabsl.o src/math/x86_64/floorl.o src/math/x86_64/fma.o \
	src/math/x86_64/fmaf.o src/math/x86_64/fmodl.o src/math/x86_64/llrint.o \
	src/math/x86_64/llrintf.o src/math/x86_64/llrintl.o \
	src/math/x86_64/log10l.o src/math/x86_64/log1pl.o src/math/x86_64/log2l.o \
	src/math/x86_64/logl.o src/math/x86_64/lrint.o src/math/x86_64/lrintf.o \
	src/math/x86_64/lrintl.o src/math/x86_64/remainderl.o \
	src/math/x86_64/remquol.o src/math/x86_64/rintl.o src/math/x86_64/sqrt.o \
	src/math/x86_64/sqrtf.o src/math/x86_64/sqrtl.o src/math/x86_64/truncl.o \
	src/misc/a64l.o src/misc/basename.o src/misc/dirname.o src/misc/ffs.o \
	src/misc/ffsl.o src/misc/ffsll.o src/misc/fmtmsg.o src/misc/forkpty.o \
	src/misc/get_current_dir_name.o src/misc/getauxval.o \
	src/misc/getdomainname.o src/misc/getentropy.o src/misc/gethostid.o \
	src/misc/getopt.o src/misc/getopt_long.o src/misc/getpriority.o \
	src/misc/getresgid.o src/misc/getresuid.o src/misc/getrlimit.o \
	src/misc/getrusage.o src/misc/getsubopt.o src/misc/initgroups.o \
	src/misc/ioctl.o src/misc/issetugid.o src/misc/lockf.o \
	src/misc/login_tty.o src/misc/mntent.o src/misc/nftw.o src/misc/openpty.o \
	src/misc/ptsname.o src/misc/pty.o src/misc/realpath.o \
	src/misc/setdomainname.o src/misc/setpriority.o src/misc/setrlimit.o \
	src/misc/syscall.o src/misc/syslog.o src/misc/uname.o src/misc/wordexp.o \
	src/mman/madvise.o src/mman/mincore.o src/mman/mlock.o src/mman/mlockall.o \
	src/mman/mmap.o src/mman/mprotect.o src/mman/mremap.o src/mman/msync.o \
	src/mman/munlock.o src/mman/munlockall.o src/mman/munmap.o \
	src/mman/posix_madvise.o src/mman/shm_open.o src/mq/mq_close.o \
	src/mq/mq_getattr.o src/mq/mq_notify.o src/mq/mq_open.o \
	src/mq/mq_receive.o src/mq/mq_send.o src/mq/mq_setattr.o \
	src/mq/mq_timedreceive.o src/mq/mq_timedsend.o src/mq/mq_unlink.o \
	src/multibyte/btowc.o src/multibyte/c16rtomb.o src/multibyte/c32rtomb.o \
	src/multibyte/internal.o src/multibyte/mblen.o src/multibyte/mbrlen.o \
	src/multibyte/mbrtoc16.o src/multibyte/mbrtoc32.o src/multibyte/mbrtowc.o \
	src/multibyte/mbsinit.o src/multibyte/mbsnrtowcs.o \
	src/multibyte/mbsrtowcs.o src/multibyte/mbstowcs.o src/multibyte/mbtowc.o \
	src/multibyte/wcrtomb.o src/multibyte/wcsnrtombs.o \
	src/multibyte/wcsrtombs.o src/multibyte/wcstombs.o src/multibyte/wctob.o \
	src/multibyte/wctomb.o src/network/accept.o src/network/accept4.o \
	src/network/bind.o src/network/connect.o src/network/dn_comp.o \
	src/network/dn_expand.o src/network/dn_skipname.o src/network/dns_parse.o \
	src/network/ent.o src/network/ether.o src/network/freeaddrinfo.o \
	src/network/gai_strerror.o src/network/getaddrinfo.o \
	src/network/gethostbyaddr.o src/network/gethostbyaddr_r.o \
	src/network/gethostbyname.o src/network/gethostbyname2.o \
	src/network/gethostbyname2_r.o src/network/gethostbyname_r.o \
	src/network/getifaddrs.o src/network/getnameinfo.o \
	src/network/getpeername.o src/network/getservbyname.o \
	src/network/getservbyname_r.o src/network/getservbyport.o \
	src/network/getservbyport_r.o src/network/getsockname.o \
	src/network/getsockopt.o src/network/h_errno.o src/network/herror.o \
	src/network/hstrerror.o src/network/htonl.o src/network/htons.o \
	src/network/if_freenameindex.o src/network/if_indextoname.o \
	src/network/if_nameindex.o src/network/if_nametoindex.o \
	src/network/in6addr_any.o src/network/in6addr_loopback.o \
	src/network/inet_addr.o src/network/inet_aton.o src/network/inet_legacy.o \
	src/network/inet_ntoa.o src/network/inet_ntop.o src/network/inet_pton.o \
	src/network/listen.o src/network/lookup_ipliteral.o \
	src/network/lookup_name.o src/network/lookup_serv.o src/network/netlink.o \
	src/network/netname.o src/network/ns_parse.o src/network/ntohl.o \
	src/network/ntohs.o src/network/proto.o src/network/recv.o \
	src/network/recvfrom.o src/network/recvmmsg.o src/network/recvmsg.o \
	src/network/res_init.o src/network/res_mkquery.o src/network/res_msend.o \
	src/network/res_query.o src/network/res_querydomain.o \
	src/network/res_send.o src/network/res_state.o src/network/resolvconf.o \
	src/network/send.o src/network/sendmmsg.o src/network/sendmsg.o \
	src/network/sendto.o src/network/serv.o src/network/setsockopt.o \
	src/network/shutdown.o src/network/sockatmark.o src/network/socket.o \
	src/network/socketpair.o src/passwd/fgetgrent.o src/passwd/fgetpwent.o \
	src/passwd/fgetspent.o src/passwd/getgr_a.o src/passwd/getgr_r.o \
	src/passwd/getgrent.o src/passwd/getgrent_a.o src/passwd/getgrouplist.o \
	src/passwd/getpw_a.o src/passwd/getpw_r.o src/passwd/getpwent.o \
	src/passwd/getpwent_a.o src/passwd/getspent.o src/passwd/getspnam.o \
	src/passwd/getspnam_r.o src/passwd/lckpwdf.o src/passwd/nscd_query.o \
	src/passwd/putgrent.o src/passwd/putpwent.o src/passwd/putspent.o \
	src/prng/__rand48_step.o src/prng/__seed48.o src/prng/drand48.o \
	src/prng/lcong48.o src/prng/lrand48.o src/prng/mrand48.o src/prng/rand.o \
	src/prng/rand_r.o src/prng/random.o src/prng/seed48.o src/prng/srand48.o \
	src/process/_Fork.o src/process/execl.o src/process/execle.o \
	src/process/execlp.o src/process/execv.o src/process/execve.o \
	src/process/execvp.o src/process/fexecve.o src/process/fork.o \
	src/process/posix_spawn.o src/process/posix_spawn_file_actions_addchdir.o \
	src/process/posix_spawn_file_actions_addclose.o \
	src/process/posix_spawn_file_actions_adddup2.o \
	src/process/posix_spawn_file_actions_addfchdir.o \
	src/process/posix_spawn_file_actions_addopen.o \
	src/process/posix_spawn_file_actions_destroy.o \
	src/process/posix_spawn_file_actions_init.o \
	src/process/posix_spawnattr_destroy.o \
	src/process/posix_spawnattr_getflags.o \
	src/process/posix_spawnattr_getpgroup.o \
	src/process/posix_spawnattr_getsigdefault.o \
	src/process/posix_spawnattr_getsigmask.o \
	src/process/posix_spawnattr_init.o src/process/posix_spawnattr_sched.o \
	src/process/posix_spawnattr_setflags.o \
	src/process/posix_spawnattr_setpgroup.o \
	src/process/posix_spawnattr_setsigdefault.o \
	src/process/posix_spawnattr_setsigmask.o src/process/posix_spawnp.o \
	src/process/system.o src/process/wait.o src/process/waitid.o \
	src/process/waitpid.o src/process/x86_64/vfork.o src/regex/fnmatch.o \
	src/regex/glob.o src/regex/regcomp.o src/regex/regerror.o \
	src/regex/regexec.o src/regex/tre-mem.o src/sched/affinity.o \
	src/sched/sched_cpucount.o src/sched/sched_get_priority_max.o \
	src/sched/sched_getcpu.o src/sched/sched_getparam.o \
	src/sched/sched_getscheduler.o src/sched/sched_rr_get_interval.o \
	src/sched/sched_setparam.o src/sched/sched_setscheduler.o \
	src/sched/sched_yield.o src/search/hsearch.o src/search/insque.o \
	src/search/lsearch.o src/search/tdelete.o src/search/tdestroy.o \
	src/search/tfind.o src/search/tsearch.o src/search/twalk.o \
	src/select/poll.o src/select/pselect.o src/select/select.o \
	src/setjmp/x86_64/longjmp.o src/setjmp/x86_64/setjmp.o src/signal/block.o \
	src/signal/getitimer.o src/signal/kill.o src/signal/killpg.o \
	src/signal/psiginfo.o src/signal/psignal.o src/signal/raise.o \
	src/signal/setitimer.o src/signal/sigaction.o src/signal/sigaddset.o \
	src/signal/sigaltstack.o src/signal/sigandset.o src/signal/sigdelset.o \
	src/signal/sigemptyset.o src/signal/sigfillset.o src/signal/sighold.o \
	src/signal/sigignore.o src/signal/siginterrupt.o \
	src/signal/sigisemptyset.o src/signal/sigismember.o \
	src/signal/siglongjmp.o src/signal/signal.o src/signal/sigorset.o \
	src/signal/sigpause.o src/signal/sigpending.o src/signal/sigprocmask.o \
	src/signal/sigqueue.o src/signal/sigrelse.o src/signal/sigrtmax.o \
	src/signal/sigrtmin.o src/signal/sigset.o src/signal/sigsetjmp_tail.o \
	src/signal/sigsuspend.o src/signal/sigtimedwait.o src/signal/sigwait.o \
	src/signal/sigwaitinfo.o src/signal/x86_64/restore.o \
	src/signal/x86_64/sigsetjmp.o src/stat/__xstat.o src/stat/chmod.o \
	src/stat/fchmod.o src/stat/fchmodat.o src/stat/fstat.o src/stat/fstatat.o \
	src/stat/futimens.o src/stat/futimesat.o src/stat/lchmod.o \
	src/stat/lstat.o src/stat/mkdir.o src/stat/mkdirat.o src/stat/mkfifo.o \
	src/stat/mkfifoat.o src/stat/mknod.o src/stat/mknodat.o src/stat/stat.o \
	src/stat/statvfs.o src/stat/umask.o src/stat/utimensat.o \
	src/stdio/__fclose_ca.o src/stdio/__fdopen.o src/stdio/__fmodeflags.o \
	src/stdio/__fopen_rb_ca.o src/stdio/__lockfile.o src/stdio/__overflow.o \
	src/stdio/__stdio_close.o src/stdio/__stdio_exit.o \
	src/stdio/__stdio_read.o src/stdio/__stdio_seek.o \
	src/stdio/__stdio_write.o src/stdio/__stdout_write.o src/stdio/__toread.o \
	src/stdio/__towrite.o src/stdio/__uflow.o src/stdio/asprintf.o \
	src/stdio/clearerr.o src/stdio/dprintf.o src/stdio/ext.o src/stdio/ext2.o \
	src/stdio/fclose.o src/stdio/feof.o src/stdio/ferror.o src/stdio/fflush.o \
	src/stdio/fgetc.o src/stdio/fgetln.o src/stdio/fgetpos.o src/stdio/fgets.o \
	src/stdio/fgetwc.o src/stdio/fgetws.o src/stdio/fileno.o \
	src/stdio/flockfile.o src/stdio/fmemopen.o src/stdio/fopen.o \
	src/stdio/fopencookie.o src/stdio/fprintf.o src/stdio/fputc.o \
	src/stdio/fputs.o src/stdio/fputwc.o src/stdio/fputws.o src/stdio/fread.o \
	src/stdio/freopen.o src/stdio/fscanf.o src/stdio/fseek.o \
	src/stdio/fsetpos.o src/stdio/ftell.o src/stdio/ftrylockfile.o \
	src/stdio/funlockfile.o src/stdio/fwide.o src/stdio/fwprintf.o \
	src/stdio/fwrite.o src/stdio/fwscanf.o src/stdio/getc.o \
	src/stdio/getc_unlocked.o src/stdio/getchar.o src/stdio/getchar_unlocked.o \
	src/stdio/getdelim.o src/stdio/getline.o src/stdio/gets.o src/stdio/getw.o \
	src/stdio/getwc.o src/stdio/getwchar.o src/stdio/ofl.o src/stdio/ofl_add.o \
	src/stdio/open_memstream.o src/stdio/open_wmemstream.o src/stdio/pclose.o \
	src/stdio/perror.o src/stdio/popen.o src/stdio/printf.o src/stdio/putc.o \
	src/stdio/putc_unlocked.o src/stdio/putchar.o src/stdio/putchar_unlocked.o \
	src/stdio/puts.o src/stdio/putw.o src/stdio/putwc.o src/stdio/putwchar.o \
	src/stdio/remove.o src/stdio/rename.o src/stdio/rewind.o src/stdio/scanf.o \
	src/stdio/setbuf.o src/stdio/setbuffer.o src/stdio/setlinebuf.o \
	src/stdio/setvbuf.o src/stdio/snprintf.o src/stdio/sprintf.o \
	src/stdio/sscanf.o src/stdio/stderr.o src/stdio/stdin.o src/stdio/stdout.o \
	src/stdio/swprintf.o src/stdio/swscanf.o src/stdio/tempnam.o \
	src/stdio/tmpfile.o src/stdio/tmpnam.o src/stdio/ungetc.o \
	src/stdio/ungetwc.o src/stdio/vasprintf.o src/stdio/vdprintf.o \
	src/stdio/vfprintf.o src/stdio/vfscanf.o src/stdio/vfwprintf.o \
	src/stdio/vfwscanf.o src/stdio/vprintf.o src/stdio/vscanf.o \
	src/stdio/vsnprintf.o src/stdio/vsprintf.o src/stdio/vsscanf.o \
	src/stdio/vswprintf.o src/stdio/vswscanf.o src/stdio/vwprintf.o \
	src/stdio/vwscanf.o src/stdio/wprintf.o src/stdio/wscanf.o \
	src/stdlib/abs.o src/stdlib/atof.o src/stdlib/atoi.o src/stdlib/atol.o \
	src/stdlib/atoll.o src/stdlib/bsearch.o src/stdlib/div.o src/stdlib/ecvt.o \
	src/stdlib/fcvt.o src/stdlib/gcvt.o src/stdlib/imaxabs.o \
	src/stdlib/imaxdiv.o src/stdlib/labs.o src/stdlib/ldiv.o \
	src/stdlib/llabs.o src/stdlib/lldiv.o src/stdlib/qsort.o \
	src/stdlib/strtod.o src/stdlib/strtol.o src/stdlib/wcstod.o \
	src/stdlib/wcstol.o src/string/bcmp.o src/string/bcopy.o \
	src/string/bzero.o src/string/explicit_bzero.o src/string/index.o \
	src/string/memccpy.o src/string/memchr.o src/string/memcmp.o \
	src/string/memmem.o src/string/mempcpy.o src/string/memrchr.o \
	src/string/rindex.o src/string/stpcpy.o src/string/stpncpy.o \
	src/string/strcasecmp.o src/string/strcasestr.o src/string/strcat.o \
	src/string/strchr.o src/string/strchrnul.o src/string/strcmp.o \
	src/string/strcpy.o src/string/strcspn.o src/string/strdup.o \
	src/string/strerror_r.o src/string/strlcat.o src/string/strlcpy.o \
	src/string/strlen.o src/string/strncasecmp.o src/string/strncat.o \
	src/string/strncmp.o src/string/strncpy.o src/string/strndup.o \
	src/string/strnlen.o src/string/strpbrk.o src/string/strrchr.o \
	src/string/strsep.o src/string/strsignal.o src/string/strspn.o \
	src/string/strstr.o src/string/strtok.o src/string/strtok_r.o \
	src/string/strverscmp.o src/string/swab.o src/string/wcpcpy.o \
	src/string/wcpncpy.o src/string/wcscasecmp.o src/string/wcscasecmp_l.o \
	src/string/wcscat.o src/string/wcschr.o src/string/wcscmp.o \
	src/string/wcscpy.o src/string/wcscspn.o src/string/wcsdup.o \
	src/string/wcslen.o src/string/wcsncasecmp.o src/string/wcsncasecmp_l.o \
	src/string/wcsncat.o src/string/wcsncmp.o src/string/wcsncpy.o \
	src/string/wcsnlen.o src/string/wcspbrk.o src/string/wcsrchr.o \
	src/string/wcsspn.o src/string/wcsstr.o src/string/wcstok.o \
	src/string/wcswcs.o src/string/wmemchr.o src/string/wmemcmp.o \
	src/string/wmemcpy.o src/string/wmemmove.o src/string/wmemset.o \
	src/string/x86_64/memcpy.o src/string/x86_64/memmove.o \
	src/string/x86_64/memset.o src/temp/__randname.o src/temp/mkdtemp.o \
	src/temp/mkostemp.o src/temp/mkostemps.o src/temp/mkstemp.o \
	src/temp/mkstemps.o src/temp/mktemp.o src/termios/cfgetospeed.o \
	src/termios/cfmakeraw.o src/termios/cfsetospeed.o src/termios/tcdrain.o \
	src/termios/tcflow.o src/termios/tcflush.o src/termios/tcgetattr.o \
	src/termios/tcgetsid.o src/termios/tcgetwinsize.o \
	src/termios/tcsendbreak.o src/termios/tcsetattr.o \
	src/termios/tcsetwinsize.o src/thread/__lock.o src/thread/__syscall_cp.o \
	src/thread/__timedwait.o src/thread/__tls_get_addr.o src/thread/__wait.o \
	src/thread/call_once.o src/thread/cnd_broadcast.o src/thread/cnd_destroy.o \
	src/thread/cnd_init.o src/thread/cnd_signal.o src/thread/cnd_timedwait.o \
	src/thread/cnd_wait.o src/thread/default_attr.o src/thread/lock_ptc.o \
	src/thread/mtx_destroy.o src/thread/mtx_init.o src/thread/mtx_lock.o \
	src/thread/mtx_timedlock.o src/thread/mtx_trylock.o \
	src/thread/mtx_unlock.o src/thread/pthread_atfork.o \
	src/thread/pthread_attr_destroy.o src/thread/pthread_attr_get.o \
	src/thread/pthread_attr_init.o src/thread/pthread_attr_setdetachstate.o \
	src/thread/pthread_attr_setguardsize.o \
	src/thread/pthread_attr_setinheritsched.o \
	src/thread/pthread_attr_setschedparam.o \
	src/thread/pthread_attr_setschedpolicy.o \
	src/thread/pthread_attr_setscope.o src/thread/pthread_attr_setstack.o \
	src/thread/pthread_attr_setstacksize.o \
	src/thread/pthread_barrier_destroy.o src/thread/pthread_barrier_init.o \
	src/thread/pthread_barrier_wait.o src/thread/pthread_barrierattr_destroy.o \
	src/thread/pthread_barrierattr_init.o \
	src/thread/pthread_barrierattr_setpshared.o src/thread/pthread_cancel.o \
	src/thread/pthread_cleanup_push.o src/thread/pthread_cond_broadcast.o \
	src/thread/pthread_cond_destroy.o src/thread/pthread_cond_init.o \
	src/thread/pthread_cond_signal.o src/thread/pthread_cond_timedwait.o \
	src/thread/pthread_cond_wait.o src/thread/pthread_condattr_destroy.o \
	src/thread/pthread_condattr_init.o src/thread/pthread_condattr_setclock.o \
	src/thread/pthread_condattr_setpshared.o src/thread/pthread_create.o \
	src/thread/pthread_detach.o src/thread/pthread_equal.o \
	src/thread/pthread_getattr_np.o src/thread/pthread_getconcurrency.o \
	src/thread/pthread_getcpuclockid.o src/thread/pthread_getschedparam.o \
	src/thread/pthread_getspecific.o src/thread/pthread_join.o \
	src/thread/pthread_key_create.o src/thread/pthread_kill.o \
	src/thread/pthread_mutex_consistent.o src/thread/pthread_mutex_destroy.o \
	src/thread/pthread_mutex_getprioceiling.o src/thread/pthread_mutex_init.o \
	src/thread/pthread_mutex_lock.o src/thread/pthread_mutex_setprioceiling.o \
	src/thread/pthread_mutex_timedlock.o src/thread/pthread_mutex_trylock.o \
	src/thread/pthread_mutex_unlock.o src/thread/pthread_mutexattr_destroy.o \
	src/thread/pthread_mutexattr_init.o \
	src/thread/pthread_mutexattr_setprotocol.o \
	src/thread/pthread_mutexattr_setpshared.o \
	src/thread/pthread_mutexattr_setrobust.o \
	src/thread/pthread_mutexattr_settype.o src/thread/pthread_once.o \
	src/thread/pthread_rwlock_destroy.o src/thread/pthread_rwlock_init.o \
	src/thread/pthread_rwlock_rdlock.o src/thread/pthread_rwlock_timedrdlock.o \
	src/thread/pthread_rwlock_timedwrlock.o \
	src/thread/pthread_rwlock_tryrdlock.o \
	src/thread/pthread_rwlock_trywrlock.o src/thread/pthread_rwlock_unlock.o \
	src/thread/pthread_rwlock_wrlock.o src/thread/pthread_rwlockattr_destroy.o \
	src/thread/pthread_rwlockattr_init.o \
	src/thread/pthread_rwlockattr_setpshared.o src/thread/pthread_self.o \
	src/thread/pthread_setattr_default_np.o \
	src/thread/pthread_setcancelstate.o src/thread/pthread_setcanceltype.o \
	src/thread/pthread_setconcurrency.o src/thread/pthread_setname_np.o \
	src/thread/pthread_setschedparam.o src/thread/pthread_setschedprio.o \
	src/thread/pthread_setspecific.o src/thread/pthread_sigmask.o \
	src/thread/pthread_spin_destroy.o src/thread/pthread_spin_init.o \
	src/thread/pthread_spin_lock.o src/thread/pthread_spin_trylock.o \
	src/thread/pthread_spin_unlock.o src/thread/pthread_testcancel.o \
	src/thread/sem_destroy.o src/thread/sem_getvalue.o src/thread/sem_init.o \
	src/thread/sem_open.o src/thread/sem_post.o src/thread/sem_timedwait.o \
	src/thread/sem_trywait.o src/thread/sem_unlink.o src/thread/sem_wait.o \
	src/thread/synccall.o src/thread/thrd_create.o src/thread/thrd_exit.o \
	src/thread/thrd_join.o src/thread/thrd_sleep.o src/thread/thrd_yield.o \
	src/thread/tls.o src/thread/tss_create.o src/thread/tss_delete.o \
	src/thread/tss_set.o src/thread/vmlock.o \
	src/thread/x86_64/__set_thread_area.o src/thread/x86_64/__unmapself.o \
	src/thread/x86_64/clone.o src/thread/x86_64/syscall_cp.o \
	src/time/__map_file.o src/time/__month_to_secs.o src/time/__secs_to_tm.o \
	src/time/__tm_to_secs.o src/time/__tz.o src/time/__year_to_secs.o \
	src/time/asctime.o src/time/asctime_r.o src/time/clock.o \
	src/time/clock_getcpuclockid.o src/time/clock_getres.o \
	src/time/clock_gettime.o src/time/clock_nanosleep.o \
	src/time/clock_settime.o src/time/ctime.o src/time/ctime_r.o \
	src/time/difftime.o src/time/ftime.o src/time/getdate.o \
	src/time/gettimeofday.o src/time/gmtime.o src/time/gmtime_r.o \
	src/time/localtime.o src/time/localtime_r.o src/time/mktime.o \
	src/time/nanosleep.o src/time/strftime.o src/time/strptime.o \
	src/time/time.o src/time/timegm.o src/time/timer_create.o \
	src/time/timer_delete.o src/time/timer_getoverrun.o \
	src/time/timer_gettime.o src/time/timer_settime.o src/time/times.o \
	src/time/timespec_get.o src/time/utime.o src/time/wcsftime.o \
	src/unistd/_exit.o src/unistd/access.o src/unistd/acct.o \
	src/unistd/alarm.o src/unistd/chdir.o src/unistd/chown.o \
	src/unistd/close.o src/unistd/ctermid.o src/unistd/dup.o src/unistd/dup2.o \
	src/unistd/dup3.o src/unistd/faccessat.o src/unistd/fchdir.o \
	src/unistd/fchown.o src/unistd/fchownat.o src/unistd/fdatasync.o \
	src/unistd/fsync.o src/unistd/ftruncate.o src/unistd/getcwd.o \
	src/unistd/getegid.o src/unistd/geteuid.o src/unistd/getgid.o \
	src/unistd/getgroups.o src/unistd/gethostname.o src/unistd/getlogin.o \
	src/unistd/getlogin_r.o src/unistd/getpgid.o src/unistd/getpgrp.o \
	src/unistd/getpid.o src/unistd/getppid.o src/unistd/getsid.o \
	src/unistd/getuid.o src/unistd/isatty.o src/unistd/lchown.o \
	src/unistd/link.o src/unistd/linkat.o src/unistd/lseek.o src/unistd/nice.o \
	src/unistd/pause.o src/unistd/pipe.o src/unistd/pipe2.o \
	src/unistd/posix_close.o src/unistd/pread.o src/unistd/preadv.o \
	src/unistd/pwrite.o src/unistd/pwritev.o src/unistd/read.o \
	src/unistd/readlink.o src/unistd/readlinkat.o src/unistd/readv.o \
	src/unistd/renameat.o src/unistd/rmdir.o src/unistd/setegid.o \
	src/unistd/seteuid.o src/unistd/setgid.o src/unistd/setpgid.o \
	src/unistd/setpgrp.o src/unistd/setregid.o src/unistd/setresgid.o \
	src/unistd/setresuid.o src/unistd/setreuid.o src/unistd/setsid.o \
	src/unistd/setuid.o src/unistd/setxid.o src/unistd/sleep.o \
	src/unistd/symlink.o src/unistd/symlinkat.o src/unistd/sync.o \
	src/unistd/tcgetpgrp.o src/unistd/tcsetpgrp.o src/unistd/truncate.o \
	src/unistd/ttyname.o src/unistd/ttyname_r.o src/unistd/ualarm.o \
	src/unistd/unlink.o src/unistd/unlinkat.o src/unistd/usleep.o \
	src/unistd/write.o src/unistd/writev.o

.SUFFIXES: .o

.PHONY: all
all: libc.a libc.so ${CRT_OBJ}

.c.o:
	${CC} ${FLAGS} -fPIC -c -o $@ $<

.s.o:
	${CC} ${FLAGS} -fPIC -c -o $@ $<

src/internal/version.h:
	printf '#define VERSION "%s"\n' "$(cd .; ${SH} tools/version.oh)" > $@

alltypes.h:
	mkdir -p include/bits
	sed -f \
		tools/mkalltypes.sed \
		arch/x86_64/bits/alltypes.h.in \
		include/alltypes.h.in > include/bits/$@

syscall.h:
	mkdir -p include/bits
	cp arch/x86_64/bits/syscall.h.in include/bits/syscall.h
	sed -n -e s/__NR_/SYS_/p < arch/x86_64/bits/syscall.h.in >> include/bits/$@

src/internal/version.o: src/internal/version.h

${CRT_OBJ}: src/internal/version.h alltypes.h syscall.h
${DYN_OBJ}: src/internal/version.h alltypes.h syscall.h
${LIBC_OBJ}: src/internal/version.h alltypes.h syscall.h

crt/crt1.o crt/x86_64/crti.o crt/x86_64/crtn.o:
	${CC} ${FLAGS} -fno-stack-protector -DCRT -c -o $@ $<

crt/Scrt1.o crt/rcrt1.o:
	${CC} ${FLAGS} -fPIC -fno-stack-protector -DCRT -c -o $@ $<

src/env/__init_tls.o src/env/__libc_start_main.o src/string/x86_64/memset.o \
	src/string/x86_64/memcpy.o src/thread/x86_64/__set_thread_area.o \
	src/env/__stack_chk_fail.o:
	${CC} ${FLAGS} -fno-stack-protector -fPIC -c -o $@ $<

${DYN_OBJ}:
	${CC} ${FLAGS} -fno-stack-protector -fPIC -c -o $@ $<

libc.a: ${LIBC_OBJ}
	${AR} rcs $@ ${LIBC_OBJ}
	${AR} rc  libm.a
	${AR} rc  libdl.a
	${AR} rc  librt.a
	${AR} rc  libutil.a
	${AR} rc  libxnet.a
	${AR} rc  libcrypt.a
	${AR} rc  libresolv.a
	${AR} rc  libpthread.a

libc.so: ${LIBC_OBJ} ${DYN_OBJ}
	${CC} ${FLAGS} -Wl,--sort-section,alignment -Wl,--sort-common \
		-Wl,--gc-sections -Wl,--hash-style=both -Wl,--no-undefined \
		-Wl,--exclude-libs=ALL -Wl,--dynamic-list=./dynamic.list -nostdlib \
		-shared -Wl,-e,_dlstart -o $@ ${LIBC_OBJ} ${DYN_OBJ} \
		/usr/lib/clang/12.0.1/lib/linux/libclang_rt.builtins-x86_64.a

.PHONY: install
install: libs headers

.PHONY: libs
libs:
	install -Dm644 crt/crt1.o            ${DESTDIR}${LIBDIR}/crt1.o
	install -Dm644 crt/x86_64/crti.o     ${DESTDIR}${LIBDIR}/crti.o
	install -Dm644 crt/x86_64/crtn.o     ${DESTDIR}${LIBDIR}/crtn.o
	install -Dm644 crt/rcrt1.o           ${DESTDIR}${LIBDIR}/rcrt1.o
	install -Dm644 crt/Scrt1.o           ${DESTDIR}${LIBDIR}/Scrt1.o
	install -Dm755 libc.so               ${DESTDIR}${LIBDIR}/libc.so
	install -Dm644 libc.a                ${DESTDIR}${LIBDIR}/libc.a
	install -Dm644 libm.a                ${DESTDIR}${LIBDIR}/libm.a
	install -Dm644 libdl.a               ${DESTDIR}${LIBDIR}/libdl.a
	install -Dm644 librt.a               ${DESTDIR}${LIBDIR}/librt.a
	install -Dm644 libutil.a             ${DESTDIR}${LIBDIR}/libutil.a
	install -Dm644 libxnet.a             ${DESTDIR}${LIBDIR}/libxnet.a
	install -Dm644 libcrypt.a            ${DESTDIR}${LIBDIR}/libcrypt.a
	install -Dm644 libresolv.a           ${DESTDIR}${LIBDIR}/libresolv.a
	install -Dm644 libpthread.a          ${DESTDIR}${LIBDIR}/libpthread.a
	ln -sf libc.so                       ${DESTDIR}${LIBDIR}/ld-musl-x86_64.so.1
	mkdir -p                             ${DESTDIR}${BINDIR}
	ln -sf ${LIBDIR}/ld-musl-x86_64.so.1 ${DESTDIR}${BINDIR}/ldd

.PHONY: headers
headers:
	install -Dm644 include/aio.h                 ${DESTDIR}${INCDIR}/aio.h
	install -Dm644 include/alloca.h              ${DESTDIR}${INCDIR}/alloca.h
	install -Dm644 include/ar.h                  ${DESTDIR}${INCDIR}/ar.h
	install -Dm644 include/assert.h              ${DESTDIR}${INCDIR}/assert.h
	install -Dm644 include/byteswap.h            ${DESTDIR}${INCDIR}/byteswap.h
	install -Dm644 include/complex.h             ${DESTDIR}${INCDIR}/complex.h
	install -Dm644 include/cpio.h                ${DESTDIR}${INCDIR}/cpio.h
	install -Dm644 include/crypt.h               ${DESTDIR}${INCDIR}/crypt.h
	install -Dm644 include/ctype.h               ${DESTDIR}${INCDIR}/ctype.h
	install -Dm644 include/dirent.h              ${DESTDIR}${INCDIR}/dirent.h
	install -Dm644 include/dlfcn.h               ${DESTDIR}${INCDIR}/dlfcn.h
	install -Dm644 include/elf.h                 ${DESTDIR}${INCDIR}/elf.h
	install -Dm644 include/endian.h              ${DESTDIR}${INCDIR}/endian.h
	install -Dm644 include/err.h                 ${DESTDIR}${INCDIR}/err.h
	install -Dm644 include/errno.h               ${DESTDIR}${INCDIR}/errno.h
	install -Dm644 include/fcntl.h               ${DESTDIR}${INCDIR}/fcntl.h
	install -Dm644 include/features.h            ${DESTDIR}${INCDIR}/features.h
	install -Dm644 include/fenv.h                ${DESTDIR}${INCDIR}/fenv.h
	install -Dm644 include/float.h               ${DESTDIR}${INCDIR}/float.h
	install -Dm644 include/fmtmsg.h              ${DESTDIR}${INCDIR}/fmtmsg.h
	install -Dm644 include/fnmatch.h             ${DESTDIR}${INCDIR}/fnmatch.h
	install -Dm644 include/ftw.h                 ${DESTDIR}${INCDIR}/ftw.h
	install -Dm644 include/getopt.h              ${DESTDIR}${INCDIR}/getopt.h
	install -Dm644 include/glob.h                ${DESTDIR}${INCDIR}/glob.h
	install -Dm644 include/grp.h                 ${DESTDIR}${INCDIR}/grp.h
	install -Dm644 include/iconv.h               ${DESTDIR}${INCDIR}/iconv.h
	install -Dm644 include/ifaddrs.h             ${DESTDIR}${INCDIR}/ifaddrs.h
	install -Dm644 include/inttypes.h            ${DESTDIR}${INCDIR}/inttypes.h
	install -Dm644 include/iso646.h              ${DESTDIR}${INCDIR}/iso646.h
	install -Dm644 include/langinfo.h            ${DESTDIR}${INCDIR}/langinfo.h
	install -Dm644 include/lastlog.h             ${DESTDIR}${INCDIR}/lastlog.h
	install -Dm644 include/libgen.h              ${DESTDIR}${INCDIR}/libgen.h
	install -Dm644 include/libintl.h             ${DESTDIR}${INCDIR}/libintl.h
	install -Dm644 include/limits.h              ${DESTDIR}${INCDIR}/limits.h
	install -Dm644 include/link.h                ${DESTDIR}${INCDIR}/link.h
	install -Dm644 include/locale.h              ${DESTDIR}${INCDIR}/locale.h
	install -Dm644 include/malloc.h              ${DESTDIR}${INCDIR}/malloc.h
	install -Dm644 include/math.h                ${DESTDIR}${INCDIR}/math.h
	install -Dm644 include/memory.h              ${DESTDIR}${INCDIR}/memory.h
	install -Dm644 include/mntent.h              ${DESTDIR}${INCDIR}/mntent.h
	install -Dm644 include/monetary.h            ${DESTDIR}${INCDIR}/monetary.h
	install -Dm644 include/mqueue.h              ${DESTDIR}${INCDIR}/mqueue.h
	install -Dm644 include/netdb.h               ${DESTDIR}${INCDIR}/netdb.h
	install -Dm644 include/nl_types.h            ${DESTDIR}${INCDIR}/nl_types.h
	install -Dm644 include/paths.h               ${DESTDIR}${INCDIR}/paths.h
	install -Dm644 include/poll.h                ${DESTDIR}${INCDIR}/poll.h
	install -Dm644 include/pthread.h             ${DESTDIR}${INCDIR}/pthread.h
	install -Dm644 include/pty.h                 ${DESTDIR}${INCDIR}/pty.h
	install -Dm644 include/pwd.h                 ${DESTDIR}${INCDIR}/pwd.h
	install -Dm644 include/regex.h               ${DESTDIR}${INCDIR}/regex.h
	install -Dm644 include/resolv.h              ${DESTDIR}${INCDIR}/resolv.h
	install -Dm644 include/sched.h               ${DESTDIR}${INCDIR}/sched.h
	install -Dm644 include/search.h              ${DESTDIR}${INCDIR}/search.h
	install -Dm644 include/semaphore.h           ${DESTDIR}${INCDIR}/semaphore.h
	install -Dm644 include/setjmp.h              ${DESTDIR}${INCDIR}/setjmp.h
	install -Dm644 include/shadow.h              ${DESTDIR}${INCDIR}/shadow.h
	install -Dm644 include/signal.h              ${DESTDIR}${INCDIR}/signal.h
	install -Dm644 include/spawn.h               ${DESTDIR}${INCDIR}/spawn.h
	install -Dm644 include/stdalign.h            ${DESTDIR}${INCDIR}/stdalign.h
	install -Dm644 include/stdarg.h              ${DESTDIR}${INCDIR}/stdarg.h
	install -Dm644 include/stdbool.h             ${DESTDIR}${INCDIR}/stdbool.h
	install -Dm644 include/stdc-predef.h         ${DESTDIR}${INCDIR}/stdc-predef.h
	install -Dm644 include/stddef.h              ${DESTDIR}${INCDIR}/stddef.h
	install -Dm644 include/stdint.h              ${DESTDIR}${INCDIR}/stdint.h
	install -Dm644 include/stdio.h               ${DESTDIR}${INCDIR}/stdio.h
	install -Dm644 include/stdio_ext.h           ${DESTDIR}${INCDIR}/stdio_ext.h
	install -Dm644 include/stdlib.h              ${DESTDIR}${INCDIR}/stdlib.h
	install -Dm644 include/stdnoreturn.h         ${DESTDIR}${INCDIR}/stdnoreturn.h
	install -Dm644 include/string.h              ${DESTDIR}${INCDIR}/string.h
	install -Dm644 include/strings.h             ${DESTDIR}${INCDIR}/strings.h
	install -Dm644 include/stropts.h             ${DESTDIR}${INCDIR}/stropts.h
	install -Dm644 include/syscall.h             ${DESTDIR}${INCDIR}/syscall.h
	install -Dm644 include/sysexits.h            ${DESTDIR}${INCDIR}/sysexits.h
	install -Dm644 include/syslog.h              ${DESTDIR}${INCDIR}/syslog.h
	install -Dm644 include/tar.h                 ${DESTDIR}${INCDIR}/tar.h
	install -Dm644 include/termios.h             ${DESTDIR}${INCDIR}/termios.h
	install -Dm644 include/tgmath.h              ${DESTDIR}${INCDIR}/tgmath.h
	install -Dm644 include/threads.h             ${DESTDIR}${INCDIR}/threads.h
	install -Dm644 include/time.h                ${DESTDIR}${INCDIR}/time.h
	install -Dm644 include/uchar.h               ${DESTDIR}${INCDIR}/uchar.h
	install -Dm644 include/ucontext.h            ${DESTDIR}${INCDIR}/ucontext.h
	install -Dm644 include/ulimit.h              ${DESTDIR}${INCDIR}/ulimit.h
	install -Dm644 include/unistd.h              ${DESTDIR}${INCDIR}/unistd.h
	install -Dm644 include/utime.h               ${DESTDIR}${INCDIR}/utime.h
	install -Dm644 include/utmp.h                ${DESTDIR}${INCDIR}/utmp.h
	install -Dm644 include/utmpx.h               ${DESTDIR}${INCDIR}/utmpx.h
	install -Dm644 include/values.h              ${DESTDIR}${INCDIR}/values.h
	install -Dm644 include/wait.h                ${DESTDIR}${INCDIR}/wait.h
	install -Dm644 include/wchar.h               ${DESTDIR}${INCDIR}/wchar.h
	install -Dm644 include/wctype.h              ${DESTDIR}${INCDIR}/wctype.h
	install -Dm644 include/wordexp.h             ${DESTDIR}${INCDIR}/wordexp.h
	install -Dm644 include/netpacket/packet.h    ${DESTDIR}${INCDIR}/netpacket/packet.h
	install -Dm644 include/netinet/ether.h       ${DESTDIR}${INCDIR}/netinet/ether.h
	install -Dm644 include/netinet/icmp6.h       ${DESTDIR}${INCDIR}/netinet/icmp6.h
	install -Dm644 include/netinet/if_ether.h    ${DESTDIR}${INCDIR}/netinet/if_ether.h
	install -Dm644 include/netinet/igmp.h        ${DESTDIR}${INCDIR}/netinet/igmp.h
	install -Dm644 include/netinet/in.h          ${DESTDIR}${INCDIR}/netinet/in.h
	install -Dm644 include/netinet/in_systm.h    ${DESTDIR}${INCDIR}/netinet/in_systm.h
	install -Dm644 include/netinet/ip.h          ${DESTDIR}${INCDIR}/netinet/ip.h
	install -Dm644 include/netinet/ip6.h         ${DESTDIR}${INCDIR}/netinet/ip6.h
	install -Dm644 include/netinet/ip_icmp.h     ${DESTDIR}${INCDIR}/netinet/ip_icmp.h
	install -Dm644 include/netinet/tcp.h         ${DESTDIR}${INCDIR}/netinet/tcp.h
	install -Dm644 include/netinet/udp.h         ${DESTDIR}${INCDIR}/netinet/udp.h
	install -Dm644 include/arpa/ftp.h            ${DESTDIR}${INCDIR}/arpa/ftp.h
	install -Dm644 include/arpa/inet.h           ${DESTDIR}${INCDIR}/arpa/inet.h
	install -Dm644 include/arpa/nameser.h        ${DESTDIR}${INCDIR}/arpa/nameser.h
	install -Dm644 include/arpa/nameser_compat.h ${DESTDIR}${INCDIR}/arpa/nameser_compat.h
	install -Dm644 include/arpa/telnet.h         ${DESTDIR}${INCDIR}/arpa/telnet.h
	install -Dm644 include/arpa/tftp.h           ${DESTDIR}${INCDIR}/arpa/tftp.h
	install -Dm644 include/net/ethernet.h        ${DESTDIR}${INCDIR}/net/ethernet.h
	install -Dm644 include/net/if.h              ${DESTDIR}${INCDIR}/net/if.h
	install -Dm644 include/net/if_arp.h          ${DESTDIR}${INCDIR}/net/if_arp.h
	install -Dm644 include/net/route.h           ${DESTDIR}${INCDIR}/net/route.h
	install -Dm644 include/scsi/scsi.h           ${DESTDIR}${INCDIR}/scsi/scsi.h
	install -Dm644 include/scsi/scsi_ioctl.h     ${DESTDIR}${INCDIR}/scsi/scsi_ioctl.h
	install -Dm644 include/scsi/sg.h             ${DESTDIR}${INCDIR}/scsi/sg.h
	install -Dm644 include/sys/acct.h            ${DESTDIR}${INCDIR}/sys/acct.h
	install -Dm644 include/sys/auxv.h            ${DESTDIR}${INCDIR}/sys/auxv.h
	install -Dm644 include/sys/cachectl.h        ${DESTDIR}${INCDIR}/sys/cachectl.h
	install -Dm644 include/sys/dir.h             ${DESTDIR}${INCDIR}/sys/dir.h
	install -Dm644 include/sys/epoll.h           ${DESTDIR}${INCDIR}/sys/epoll.h
	install -Dm644 include/sys/errno.h           ${DESTDIR}${INCDIR}/sys/errno.h
	install -Dm644 include/sys/eventfd.h         ${DESTDIR}${INCDIR}/sys/eventfd.h
	install -Dm644 include/sys/fanotify.h        ${DESTDIR}${INCDIR}/sys/fanotify.h
	install -Dm644 include/sys/fcntl.h           ${DESTDIR}${INCDIR}/sys/fcntl.h
	install -Dm644 include/sys/file.h            ${DESTDIR}${INCDIR}/sys/file.h
	install -Dm644 include/sys/fsuid.h           ${DESTDIR}${INCDIR}/sys/fsuid.h
	install -Dm644 include/sys/inotify.h         ${DESTDIR}${INCDIR}/sys/inotify.h
	install -Dm644 include/sys/io.h              ${DESTDIR}${INCDIR}/sys/io.h
	install -Dm644 include/sys/ioctl.h           ${DESTDIR}${INCDIR}/sys/ioctl.h
	install -Dm644 include/sys/ipc.h             ${DESTDIR}${INCDIR}/sys/ipc.h
	install -Dm644 include/sys/kd.h              ${DESTDIR}${INCDIR}/sys/kd.h
	install -Dm644 include/sys/klog.h            ${DESTDIR}${INCDIR}/sys/klog.h
	install -Dm644 include/sys/membarrier.h      ${DESTDIR}${INCDIR}/sys/membarrier.h
	install -Dm644 include/sys/mman.h            ${DESTDIR}${INCDIR}/sys/mman.h
	install -Dm644 include/sys/mount.h           ${DESTDIR}${INCDIR}/sys/mount.h
	install -Dm644 include/sys/msg.h             ${DESTDIR}${INCDIR}/sys/msg.h
	install -Dm644 include/sys/mtio.h            ${DESTDIR}${INCDIR}/sys/mtio.h
	install -Dm644 include/sys/param.h           ${DESTDIR}${INCDIR}/sys/param.h
	install -Dm644 include/sys/personality.h     ${DESTDIR}${INCDIR}/sys/personality.h
	install -Dm644 include/sys/poll.h            ${DESTDIR}${INCDIR}/sys/poll.h
	install -Dm644 include/sys/prctl.h           ${DESTDIR}${INCDIR}/sys/prctl.h
	install -Dm644 include/sys/procfs.h          ${DESTDIR}${INCDIR}/sys/procfs.h
	install -Dm644 include/sys/ptrace.h          ${DESTDIR}${INCDIR}/sys/ptrace.h
	install -Dm644 include/sys/quota.h           ${DESTDIR}${INCDIR}/sys/quota.h
	install -Dm644 include/sys/random.h          ${DESTDIR}${INCDIR}/sys/random.h
	install -Dm644 include/sys/reboot.h          ${DESTDIR}${INCDIR}/sys/reboot.h
	install -Dm644 include/sys/reg.h             ${DESTDIR}${INCDIR}/sys/reg.h
	install -Dm644 include/sys/resource.h        ${DESTDIR}${INCDIR}/sys/resource.h
	install -Dm644 include/sys/select.h          ${DESTDIR}${INCDIR}/sys/select.h
	install -Dm644 include/sys/sem.h             ${DESTDIR}${INCDIR}/sys/sem.h
	install -Dm644 include/sys/sendfile.h        ${DESTDIR}${INCDIR}/sys/sendfile.h
	install -Dm644 include/sys/shm.h             ${DESTDIR}${INCDIR}/sys/shm.h
	install -Dm644 include/sys/signal.h          ${DESTDIR}${INCDIR}/sys/signal.h
	install -Dm644 include/sys/signalfd.h        ${DESTDIR}${INCDIR}/sys/signalfd.h
	install -Dm644 include/sys/socket.h          ${DESTDIR}${INCDIR}/sys/socket.h
	install -Dm644 include/sys/soundcard.h       ${DESTDIR}${INCDIR}/sys/soundcard.h
	install -Dm644 include/sys/stat.h            ${DESTDIR}${INCDIR}/sys/stat.h
	install -Dm644 include/sys/statfs.h          ${DESTDIR}${INCDIR}/sys/statfs.h
	install -Dm644 include/sys/statvfs.h         ${DESTDIR}${INCDIR}/sys/statvfs.h
	install -Dm644 include/sys/stropts.h         ${DESTDIR}${INCDIR}/sys/stropts.h
	install -Dm644 include/sys/swap.h            ${DESTDIR}${INCDIR}/sys/swap.h
	install -Dm644 include/sys/syscall.h         ${DESTDIR}${INCDIR}/sys/syscall.h
	install -Dm644 include/sys/sysinfo.h         ${DESTDIR}${INCDIR}/sys/sysinfo.h
	install -Dm644 include/sys/syslog.h          ${DESTDIR}${INCDIR}/sys/syslog.h
	install -Dm644 include/sys/sysmacros.h       ${DESTDIR}${INCDIR}/sys/sysmacros.h
	install -Dm644 include/sys/termios.h         ${DESTDIR}${INCDIR}/sys/termios.h
	install -Dm644 include/sys/time.h            ${DESTDIR}${INCDIR}/sys/time.h
	install -Dm644 include/sys/timeb.h           ${DESTDIR}${INCDIR}/sys/timeb.h
	install -Dm644 include/sys/timerfd.h         ${DESTDIR}${INCDIR}/sys/timerfd.h
	install -Dm644 include/sys/times.h           ${DESTDIR}${INCDIR}/sys/times.h
	install -Dm644 include/sys/timex.h           ${DESTDIR}${INCDIR}/sys/timex.h
	install -Dm644 include/sys/ttydefaults.h     ${DESTDIR}${INCDIR}/sys/ttydefaults.h
	install -Dm644 include/sys/types.h           ${DESTDIR}${INCDIR}/sys/types.h
	install -Dm644 include/sys/ucontext.h        ${DESTDIR}${INCDIR}/sys/ucontext.h
	install -Dm644 include/sys/uio.h             ${DESTDIR}${INCDIR}/sys/uio.h
	install -Dm644 include/sys/un.h              ${DESTDIR}${INCDIR}/sys/un.h
	install -Dm644 include/sys/user.h            ${DESTDIR}${INCDIR}/sys/user.h
	install -Dm644 include/sys/utsname.h         ${DESTDIR}${INCDIR}/sys/utsname.h
	install -Dm644 include/sys/vfs.h             ${DESTDIR}${INCDIR}/sys/vfs.h
	install -Dm644 include/sys/vt.h              ${DESTDIR}${INCDIR}/sys/vt.h
	install -Dm644 include/sys/wait.h            ${DESTDIR}${INCDIR}/sys/wait.h
	install -Dm644 include/sys/xattr.h           ${DESTDIR}${INCDIR}/sys/xattr.h
	install -Dm644 include/bits/alltypes.h       ${DESTDIR}${INCDIR}/bits/alltypes.h
	install -Dm644 arch/x86_64/bits/fenv.h       ${DESTDIR}${INCDIR}/bits/fenv.h
	install -Dm644 arch/x86_64/bits/float.h      ${DESTDIR}${INCDIR}/bits/float.h
	install -Dm644 arch/x86_64/bits/io.h         ${DESTDIR}${INCDIR}/bits/io.h
	install -Dm644 arch/x86_64/bits/limits.h     ${DESTDIR}${INCDIR}/bits/limits.h
	install -Dm644 arch/x86_64/bits/mman.h       ${DESTDIR}${INCDIR}/bits/mman.h
	install -Dm644 arch/x86_64/bits/posix.h      ${DESTDIR}${INCDIR}/bits/posix.h
	install -Dm644 arch/x86_64/bits/ptrace.h     ${DESTDIR}${INCDIR}/bits/ptrace.h
	install -Dm644 arch/x86_64/bits/reg.h        ${DESTDIR}${INCDIR}/bits/reg.h
	install -Dm644 arch/x86_64/bits/sem.h        ${DESTDIR}${INCDIR}/bits/sem.h
	install -Dm644 arch/x86_64/bits/setjmp.h     ${DESTDIR}${INCDIR}/bits/setjmp.h
	install -Dm644 arch/x86_64/bits/signal.h     ${DESTDIR}${INCDIR}/bits/signal.h
	install -Dm644 arch/x86_64/bits/stat.h       ${DESTDIR}${INCDIR}/bits/stat.h
	install -Dm644 arch/x86_64/bits/stdint.h     ${DESTDIR}${INCDIR}/bits/stdint.h
	install -Dm644 arch/x86_64/bits/user.h       ${DESTDIR}${INCDIR}/bits/user.h
	install -Dm644 arch/generic/bits/dirent.h    ${DESTDIR}${INCDIR}/bits/dirent.h
	install -Dm644 arch/generic/bits/errno.h     ${DESTDIR}${INCDIR}/bits/errno.h
	install -Dm644 arch/generic/bits/fcntl.h     ${DESTDIR}${INCDIR}/bits/fcntl.h
	install -Dm644 arch/generic/bits/hwcap.h     ${DESTDIR}${INCDIR}/bits/hwcap.h
	install -Dm644 arch/generic/bits/ioctl.h     ${DESTDIR}${INCDIR}/bits/ioctl.h
	install -Dm644 arch/generic/bits/ioctl_fix.h ${DESTDIR}${INCDIR}/bits/ioctl_fix.h
	install -Dm644 arch/generic/bits/ipc.h       ${DESTDIR}${INCDIR}/bits/ipc.h
	install -Dm644 arch/generic/bits/ipcstat.h   ${DESTDIR}${INCDIR}/bits/ipcstat.h
	install -Dm644 arch/generic/bits/kd.h        ${DESTDIR}${INCDIR}/bits/kd.h
	install -Dm644 arch/generic/bits/link.h      ${DESTDIR}${INCDIR}/bits/link.h
	install -Dm644 arch/generic/bits/msg.h       ${DESTDIR}${INCDIR}/bits/msg.h
	install -Dm644 arch/generic/bits/poll.h      ${DESTDIR}${INCDIR}/bits/poll.h
	install -Dm644 arch/generic/bits/resource.h  ${DESTDIR}${INCDIR}/bits/resource.h
	install -Dm644 arch/generic/bits/shm.h       ${DESTDIR}${INCDIR}/bits/shm.h
	install -Dm644 arch/generic/bits/socket.h    ${DESTDIR}${INCDIR}/bits/socket.h
	install -Dm644 arch/generic/bits/soundcard.h ${DESTDIR}${INCDIR}/bits/soundcard.h
	install -Dm644 arch/generic/bits/statfs.h    ${DESTDIR}${INCDIR}/bits/statfs.h
	install -Dm644 include/bits/syscall.h        ${DESTDIR}${INCDIR}/bits/syscall.h
	install -Dm644 arch/generic/bits/termios.h   ${DESTDIR}${INCDIR}/bits/termios.h
	install -Dm644 arch/generic/bits/vt.h        ${DESTDIR}${INCDIR}/bits/vt.h

.PHONY: clean
clean:
	rm -f ${CRT_OBJ} ${DYN_OBJ} ${LIBC_OBJ} libc.a libc.so
