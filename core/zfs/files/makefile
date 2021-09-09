.POSIX:

PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include
SYSCONFDIR ?= /etc

CC ?= cc
AR ?= ar
PKG_CONFIG ?= pkg-config

INCLUDES = -Iinclude -Imodule/icp/include -Ilib/libspl/include \
	-Ilib/libspl/include/os/linux

XCPPFLAGS = -DHAVE_CONFIG_H -include zfs_config.h -D_GNU_SOURCE -D_REENTRANT \
	-D_FILE_OFFSET_BITS=64 -D_LARGEFILE64_SOURCE -DHAVE_LARGE_STACKS=1 \
	-DLIBEXECDIR=\"${LIBDIR}\" -DRUNSTATEDIR=\"${PREFIX}/var/run\" \
	-DSBINDIR=\"${BINDIR}\" -DSYSCONFDIR=\"${SYSCONFDIR}\" \
	-DPKGDATADIR=\"${PREFIX}/share/zfs\" -DTEXT_DOMAIN=\"zfs-linux-user\"

XCFLAGS = -std=gnu99 -fno-strict-aliasing

XDEBUGFLAGS = -DDEBUG -UNDEBUG -DZFS_DEBUG

FLAGS = ${INCLUDES} ${XCPPFLAGS} ${CPPFLAGS} ${XCFLAGS} ${CFLAGS}

PROG_FLAGS = ${FLAGS} --static -Wl,--gc-sections

LIBAVL_OBJ = module/avl/avl.o

LIBICP_OBJ = module/icp/illumos-crypto.o module/icp/algs/aes/aes_impl.o \
	module/icp/algs/aes/aes_impl_aesni.o \
	module/icp/algs/aes/aes_impl_generic.o \
	module/icp/algs/aes/aes_impl_x86-64.o module/icp/algs/aes/aes_modes.o \
	module/icp/algs/edonr/edonr.o module/icp/algs/modes/cbc.o \
	module/icp/algs/modes/ccm.o module/icp/algs/modes/ctr.o \
	module/icp/algs/modes/ecb.o module/icp/algs/modes/gcm.o \
	module/icp/algs/modes/gcm_generic.o module/icp/algs/modes/gcm_pclmulqdq.o \
	module/icp/algs/modes/modes.o module/icp/algs/sha1/sha1.o \
	module/icp/algs/sha2/sha2.o module/icp/algs/skein/skein.o \
	module/icp/algs/skein/skein_block.o module/icp/algs/skein/skein_iv.o \
	module/icp/api/kcf_cipher.o module/icp/api/kcf_ctxops.o \
	module/icp/api/kcf_digest.o module/icp/api/kcf_mac.o \
	module/icp/api/kcf_miscapi.o module/icp/asm-x86_64/aes/aes_aesni.o \
	module/icp/asm-x86_64/aes/aes_amd64.o module/icp/asm-x86_64/aes/aeskey.o \
	module/icp/asm-x86_64/modes/aesni-gcm-x86_64.o \
	module/icp/asm-x86_64/modes/gcm_pclmulqdq.o \
	module/icp/asm-x86_64/modes/ghash-x86_64.o \
	module/icp/asm-x86_64/sha1/sha1-x86_64.o \
	module/icp/asm-x86_64/sha2/sha256_impl.o \
	module/icp/asm-x86_64/sha2/sha512_impl.o module/icp/core/kcf_callprov.o \
	module/icp/core/kcf_mech_tabs.o module/icp/core/kcf_prov_lib.o \
	module/icp/core/kcf_prov_tabs.o module/icp/core/kcf_sched.o \
	module/icp/io/aes.o module/icp/io/edonr_mod.o module/icp/io/sha1_mod.o \
	module/icp/io/sha2_mod.o module/icp/io/skein_mod.o module/icp/os/modconf.o \
	module/icp/os/modhash.o module/icp/spi/kcf_spi.o

LIBSHARE_OBJ = lib/libshare/libshare.o lib/libshare/os/linux/nfs.o \
	lib/libshare/os/linux/smb.o

LIBSPL_OBJ = lib/libspl/os/linux/getexecname.o \
	lib/libspl/os/linux/gethostid.o lib/libspl/os/linux/getmntany.o \
	lib/libspl/os/linux/zone.o lib/libspl/assert.o lib/libspl/atomic.o \
	lib/libspl/list.o lib/libspl/mkdirp.o lib/libspl/page.o \
	lib/libspl/strlcat.o lib/libspl/strlcpy.o lib/libspl/timestamp.o

LIBTPOOL_OBJ = lib/libtpool/thread_pool.o

LIBZSTD_OBJ = module/zstd/lib/zstd.o module/zstd/zfs_zstd.o

LIBEFI_OBJ = lib/libefi/rdwr_efi.o

LIBNVPAIR_OBJ = module/nvpair/fnvpair.o module/nvpair/nvpair.o \
	module/nvpair/nvpair_alloc_fixed.o lib/libnvpair/libnvpair.o \
	lib/libnvpair/libnvpair_json.o lib/libnvpair/nvpair_alloc_system.o

LIBZUTIL_OBJ = lib/libzutil/os/linux/zutil_compat.o \
	lib/libzutil/os/linux/zutil_device_path_os.o \
	lib/libzutil/os/linux/zutil_import_os.o lib/libzutil/zutil_device_path.o \
	lib/libzutil/zutil_import.o lib/libzutil/zutil_nicenum.o \
	lib/libzutil/zutil_pool.o

UNICODE_OBJ = module/unicode/u8_textprep.o module/unicode/uconv.o

LIBUUTIL_OBJ = lib/libuutil/uu_alloc.o lib/libuutil/uu_avl.o \
	lib/libuutil/uu_dprintf.o lib/libuutil/uu_ident.o lib/libuutil/uu_list.o \
	lib/libuutil/uu_misc.o lib/libuutil/uu_open.o lib/libuutil/uu_pname.o \
	lib/libuutil/uu_string.o

ZCOMMON_OBJ = module/zcommon/cityhash.o module/zcommon/zfeature_common.o \
	module/zcommon/zfs_comutil.o module/zcommon/zfs_deleg.o \
	module/zcommon/zfs_fletcher.o module/zcommon/zfs_fletcher_aarch64_neon.o \
	module/zcommon/zfs_fletcher_avx512.o module/zcommon/zfs_fletcher_intel.o \
	module/zcommon/zfs_fletcher_sse.o \
	module/zcommon/zfs_fletcher_superscalar.o \
	module/zcommon/zfs_fletcher_superscalar4.o module/zcommon/zfs_namecheck.o \
	module/zcommon/zfs_prop.o module/zcommon/zpool_prop.o \
	module/zcommon/zprop_common.o

LIBZFS_OBJ = lib/libzfs/libzfs_changelist.o lib/libzfs/libzfs_config.o \
	lib/libzfs/libzfs_crypto.o lib/libzfs/libzfs_dataset.o \
	lib/libzfs/libzfs_diff.o lib/libzfs/libzfs_import.o \
	lib/libzfs/libzfs_iter.o lib/libzfs/libzfs_mount.o \
	lib/libzfs/libzfs_pool.o lib/libzfs/libzfs_sendrecv.o \
	lib/libzfs/libzfs_status.o lib/libzfs/libzfs_util.o \
	lib/libzfs/os/linux/libzfs_mount_os.o lib/libzfs/os/linux/libzfs_pool_os.o \
	lib/libzfs/os/linux/libzfs_sendrecv_os.o \
	lib/libzfs/os/linux/libzfs_util_os.o module/icp/algs/sha2/sha2.o

LIBZFS_CORE_OBJ = lib/libzfs_core/libzfs_core.o

LIBZPOOL_OBJ = module/lua/lapi.o module/lua/lauxlib.o \
	module/lua/lbaselib.o module/lua/lcode.o module/lua/lcompat.o \
	module/lua/lcorolib.o module/lua/lctype.o module/lua/ldebug.o \
	module/lua/ldo.o module/lua/lfunc.o module/lua/lgc.o module/lua/llex.o \
	module/lua/lmem.o module/lua/lobject.o module/lua/lopcodes.o \
	module/lua/lparser.o module/lua/lstate.o module/lua/lstring.o \
	module/lua/lstrlib.o module/lua/ltable.o module/lua/ltablib.o \
	module/lua/ltm.o module/lua/lvm.o module/lua/lzio.o \
	module/os/linux/zfs/abd_os.o module/os/linux/zfs/arc_os.o \
	module/os/linux/zfs/trace.o module/os/linux/zfs/vdev_file.o \
	module/os/linux/zfs/zfs_debug.o module/os/linux/zfs/zfs_racct.o \
	module/os/linux/zfs/zfs_znode.o module/os/linux/zfs/zio_crypt.o \
	module/zfs/abd.o module/zfs/aggsum.o module/zfs/arc.o module/zfs/blkptr.o \
	module/zfs/bplist.o module/zfs/bpobj.o module/zfs/bptree.o \
	module/zfs/bqueue.o module/zfs/btree.o module/zfs/dbuf.o \
	module/zfs/dbuf_stats.o module/zfs/ddt.o module/zfs/ddt_zap.o \
	module/zfs/dmu.o module/zfs/dmu_diff.o module/zfs/dmu_object.o \
	module/zfs/dmu_objset.o module/zfs/dmu_recv.o module/zfs/dmu_redact.o \
	module/zfs/dmu_send.o module/zfs/dmu_traverse.o module/zfs/dmu_tx.o \
	module/zfs/dmu_zfetch.o module/zfs/dnode.o module/zfs/dnode_sync.o \
	module/zfs/dsl_bookmark.o module/zfs/dsl_crypt.o module/zfs/dsl_dataset.o \
	module/zfs/dsl_deadlist.o module/zfs/dsl_deleg.o module/zfs/dsl_destroy.o \
	module/zfs/dsl_dir.o module/zfs/dsl_pool.o module/zfs/dsl_prop.o \
	module/zfs/dsl_scan.o module/zfs/dsl_synctask.o module/zfs/dsl_userhold.o \
	module/zfs/edonr_zfs.o module/zfs/fm.o module/zfs/gzip.o module/zfs/hkdf.o \
	module/zfs/lz4.o module/zfs/lzjb.o module/zfs/metaslab.o module/zfs/mmp.o \
	module/zfs/multilist.o module/zfs/objlist.o module/zfs/pathname.o \
	module/zfs/range_tree.o module/zfs/refcount.o module/zfs/rrwlock.o \
	module/zfs/sa.o module/zfs/sha256.o module/zfs/skein_zfs.o \
	module/zfs/spa.o module/zfs/spa_boot.o module/zfs/spa_checkpoint.o \
	module/zfs/spa_config.o module/zfs/spa_errlog.o module/zfs/spa_history.o \
	module/zfs/spa_log_spacemap.o module/zfs/spa_misc.o module/zfs/spa_stats.o \
	module/zfs/space_map.o module/zfs/space_reftree.o module/zfs/txg.o \
	module/zfs/uberblock.o module/zfs/unique.o module/zfs/vdev.o \
	module/zfs/vdev_cache.o module/zfs/vdev_draid.o \
	module/zfs/vdev_draid_rand.o module/zfs/vdev_indirect.o \
	module/zfs/vdev_indirect_births.o module/zfs/vdev_indirect_mapping.o \
	module/zfs/vdev_initialize.o module/zfs/vdev_label.o \
	module/zfs/vdev_mirror.o module/zfs/vdev_missing.o module/zfs/vdev_queue.o \
	module/zfs/vdev_raidz.o module/zfs/vdev_raidz_math.o \
	module/zfs/vdev_raidz_math_aarch64_neon.o \
	module/zfs/vdev_raidz_math_aarch64_neonx2.o \
	module/zfs/vdev_raidz_math_avx2.o module/zfs/vdev_raidz_math_avx512bw.o \
	module/zfs/vdev_raidz_math_avx512f.o \
	module/zfs/vdev_raidz_math_powerpc_altivec.o \
	module/zfs/vdev_raidz_math_scalar.o module/zfs/vdev_raidz_math_sse2.o \
	module/zfs/vdev_raidz_math_ssse3.o module/zfs/vdev_rebuild.o \
	module/zfs/vdev_removal.o module/zfs/vdev_root.o module/zfs/vdev_trim.o \
	module/zfs/zap.o module/zfs/zap_leaf.o module/zfs/zap_micro.o \
	module/zfs/zcp.o module/zfs/zcp_get.o module/zfs/zcp_global.o \
	module/zfs/zcp_iter.o module/zfs/zcp_set.o module/zfs/zcp_synctask.o \
	module/zfs/zfeature.o module/zfs/zfs_byteswap.o module/zfs/zfs_fm.o \
	module/zfs/zfs_fuid.o module/zfs/zfs_ratelimit.o module/zfs/zfs_rlock.o \
	module/zfs/zfs_sa.o module/zfs/zil.o module/zfs/zio.o \
	module/zfs/zio_checksum.o module/zfs/zio_compress.o \
	module/zfs/zio_inject.o module/zfs/zle.o module/zfs/zrlock.o \
	module/zfs/zthr.o lib/libzpool/kernel.o lib/libzpool/taskq.o \
	lib/libzpool/util.o

LIBZFSBOOTENV_OBJ = lib/libzfsbootenv/lzbe_device.o \
	lib/libzfsbootenv/lzbe_pair.o lib/libzfsbootenv/lzbe_util.o

ZFS_OBJ = cmd/zfs/zfs_iter.o cmd/zfs/zfs_main.o cmd/zfs/zfs_project.o

ZPOOL_OBJ = cmd/zpool/os/linux/zpool_vdev_os.o cmd/zpool/zpool_iter.o \
	cmd/zpool/zpool_main.o cmd/zpool/zpool_util.o cmd/zpool/zpool_vdev.o

ZDB_OBJ = cmd/zdb/zdb.o cmd/zdb/zdb_il.o

ZHACK_OBJ = cmd/zhack/zhack.o

ZINJECT_OBJ = cmd/zinject/translate.o cmd/zinject/zinject.o

ZSTREAM_OBJ = cmd/zstream/zstream.o cmd/zstream/zstream_dump.o \
	cmd/zstream/zstream_redup.o cmd/zstream/zstream_token.o

ZTEST_OBJ = cmd/ztest/ztest.o

RAIDZ_TEST_OBJ = cmd/raidz_test/raidz_test.o cmd/raidz_test/raidz_bench.o

ZFS_IDS_OBJ = cmd/zfs_ids_to_path/zfs_ids_to_path.o

INFLUXDB_OBJ = cmd/zpool_influxdb/zpool_influxdb.o

MOUNT_ZFS_OBJ = cmd/mount_zfs/mount_zfs.o

ZED_OBJ = cmd/zed/zed.o cmd/zed/zed_conf.o cmd/zed/zed_disk_event.o \
	cmd/zed/zed_event.o cmd/zed/zed_exec.o cmd/zed/zed_file.o \
	cmd/zed/zed_log.o cmd/zed/zed_strings.o cmd/zed/agents/fmd_api.o \
	cmd/zed/agents/fmd_serd.o cmd/zed/agents/zfs_agents.o \
	cmd/zed/agents/zfs_diagnosis.o cmd/zed/agents/zfs_mod.o \
	cmd/zed/agents/zfs_retire.o

ZGENHOSTID_OBJ = cmd/zgenhostid/zgenhostid.o

LIBZFS_CORE_A_OBJ = ${LIBZFS_CORE_OBJ} ${LIBZUTIL_OBJ} ${LIBAVL_OBJ} \
	${LIBTPOOL_OBJ} ${LIBSPL_OBJ} ${LIBEFI_OBJ}

OBJ = ${LIBAVL_OBJ} ${LIBICP_OBJ} ${LIBSHARE_OBJ} ${LIBSPL_OBJ} \
	${LIBTPOOL_OBJ} ${LIBZSTD_OBJ} ${LIBEFI_OBJ} ${LIBNVPAIR_OBJ} \
	${LIBZUTIL_OBJ} ${UNICODE_OBJ} ${LIBUUTIL_OBJ} ${ZCOMMON_OBJ} \
	${LIBZFS_OBJ} ${LIBZFS_CORE_OBJ} ${LIBZPOOL_OBJ} ${LIBZFSBOOTENV_OBJ} \
	${ZFS_OBJ} ${ZPOOL_OBJ} ${ZDB_OBJ} ${ZHACK_OBJ} ${ZINJECT_OBJ} \
	${ZSTREAM_OBJ} ${ZTEST_OBJ} ${RAIDZ_TEST_OBJ} ${ZFS_IDS_OBJ} \
	${INFLUXDB_OBJ} ${MOUNT_ZFS_OBJ} ${ZED_OBJ} ${ZGENHOSTID_OBJ}

LIBCOMMON = libzfs_core.a libzutil.a libavl.a libtpool.a libnvpair.a libspl.a
LIB_EFI_UTIL = libefi.a libuutil.a
LIB_POOL_UNI_ICP = libzpool.a libunicode.a libicp.a
LIB_ZFS_SHARE = libzfs.a libshare.a

ZFS_PROG = libzfs.a ${LIBCOMMON} ${LIB_ZFS_SHARE} ${LIB_EFI_UTIL}
ZPOOL_PROG = ${LIBCOMMON} ${LIB_ZFS_SHARE} ${LIB_EFI_UTIL}
ZDB_PROG = ${LIBCOMMON} ${LIB_POOL_UNI_ICP} libefi.a libzstd.a
ZHACK_PROG = ${LIBCOMMON} ${LIB_POOL_UNI_ICP} libefi.a libzstd.a
ZINJECT_PROG = ${LIBCOMMON} ${LIB_ZFS_SHARE} ${LIB_EFI_UTIL}
ZSTREAM_PROG = ${LIBCOMMON} ${LIB_ZFS_SHARE} ${LIB_EFI_UTIL}
ZTEST_PROG = ${LIBCOMMON} ${LIB_POOL_UNI_ICP} libefi.a libzstd.a
RAIDZ_TEST_PROG = ${LIBCOMMON} ${LIB_POOL_UNI_ICP} libefi.a
ZFS_IDS_PROG = ${LIBCOMMON} ${LIB_ZFS_SHARE} ${LIB_EFI_UTIL}
INFLUXDB_PROG = ${LIBCOMMON} ${LIB_ZFS_SHARE} ${LIB_EFI_UTIL}
MOUNT_ZFS_PROG = ${LIBCOMMON} ${LIB_ZFS_SHARE} ${LIB_EFI_UTIL}
ZED_PROG = ${LIBCOMMON} ${LIB_EFI_UTIL} libzfs.a libuutil.a

LIBS = ${LIBUUID_LIBS} ${LIBTIRPC_LIBS} ${LIBBLKID_LIBS} -lm -lz -lpthread -ludev

.SUFFIXES: .S

.PHONY: all
all: libs progs extra

.c.o:
	${CC} ${FLAGS} -c -o $@ $<

.S.o:
	${CC} ${FLAGS} -c -o $@ $<

${LIBSHARE_OBJ}:
	${CC} ${FLAGS} -Ilib/libshare -c -o $@ $<

${LIBZSTD_OBJ}:
	${CC} ${FLAGS} -fno-tree-vectorize -c -o $@ $<

${LIBEFI_OBJ} ${ZED_OBJ}:
	${CC} ${FLAGS} ${LIBUUID_CFLAGS} -c -o $@ $<

${LIBNVPAIR_OBJ}:
	${CC} ${FLAGS} ${LIBTIRPC_CFLAGS} -c -o $@ $<

${LIBZUTIL_OBJ}:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -Ilib/libzutil -c -o $@ $<

${LIBZPOOL_OBJ}:
	${CC} ${FLAGS} ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -Iinclude/os/linux/zfs -c -o $@ $<

${LIBZFSBOOTENV_OBJ} ${ZCOMMON_OBJ}:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs -c -o $@ $<

${ZFS_OBJ}:
	${CC} ${FLAGS} -Icmd/zfs -c -o $@ $<

${ZPOOL_OBJ}:
	${CC} ${FLAGS} ${LIBUUID_CFLAGS} -Icmd/zpool -c -o $@ $<

${ZDB_OBJ}:
	${CC} ${FLAGS} ${XDEBUGFLAGS} -Icmd/zdb -c -o $@ $<

${ZHACK_OBJ} ${ZTEST_OBJ} ${RAIDZ_TEST_OBJ}:
	${CC} ${FLAGS} ${XDEBUGFLAGS} -c -o $@ $<

.PHONY: libs
libs: libavl.a libicp.a libspl.a libzstd.a libshare.a libtpool.a \
	libunicode.a libzfs_core.a libzfsbootenv.a libnvpair.a libzfs.a \
	libuutil.a libzpool.a libefi.a libzutil.a

libavl.a: ${LIBAVL_OBJ}
	${AR} rcs $@ $?

libicp.a: ${LIBICP_OBJ}
	${AR} rcs $@ $?

libspl.a: ${LIBSPL_OBJ}
	${AR} rcs $@ $?

libzstd.a: ${LIBZSTD_OBJ}
	${AR} rcs $@ $?

libshare.a: ${LIBSHARE_OBJ}
	${AR} rcs $@ $?

libtpool.a: ${LIBTPOOL_OBJ}
	${AR} rcs $@ $?

libunicode.a: ${UNICODE_OBJ}
	${AR} rcs $@ $?

libzfs_core.a: ${LIBZFS_CORE_A_OBJ}
	${AR} rcs $@ $?

libzfsbootenv.a: ${LIBZFSBOOTENV_OBJ}
	${AR} rcs $@ $?

libnvpair.a: ${LIBNVPAIR_OBJ} ${LIBSPL_OBJ}
	${AR} rcs $@ $?

libzfs.a: ${LIBZFS_OBJ} ${ZCOMMON_OBJ} ${LIBSHARE_OBJ}
	${AR} rcs $@ $?

libuutil.a: ${LIBUUTIL_OBJ} ${LIBAVL_OBJ} ${LIBSPL_OBJ}
	${AR} rcs $@ $?

libzpool.a: ${LIBZPOOL_OBJ} ${ZCOMMON_OBJ} ${LIBICP_OBJ} ${UNICODE_OBJ} ${LIBZSTD_OBJ}
	${AR} rcs $@ $?

libefi.a: ${LIBEFI_OBJ}
	${AR} rcs $@ $? ${LIBBLKID_LIBS} /usr/lib/libz.a

libzutil.a: ${LIBZUTIL_OBJ} libavl.a libtpool.a libnvpair.a libspl.a libefi.a
	${AR} rcs $@ $? ${LIBTIRPC_LIBS} ${LIBUUID_LIBS} ${LIBBLKID_LIBS} \
		/usr/lib/libudev.a /usr/lib/libm.a /usr/lib/librt.a

.PHONY: progs
progs: zgenhostid zdb zhack ztest raidz_test zfs zpool \
	zinject zfs_ids_to_path zpool_influxdb mount.zfs zed zstream

zgenhostid: ${ZGENHOSTID_OBJ}
	${CC} ${PROG_FLAGS} -o $@ $?

zdb: ${ZDB_OBJ} ${ZDB_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -ldl

zhack: ${ZHACK_OBJ} ${ZHACK_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -ldl

ztest: ${ZTEST_OBJ} ${ZTEST_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -ldl

raidz_test: ${RAIDZ_TEST_OBJ} ${RAIDZ_TEST_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -ldl

zfs: ${ZFS_OBJ} ${ZFS_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -lcrypto

zpool: ${ZPOOL_OBJ} ${ZPOOL_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -lcrypto

zinject: ${ZINJECT_OBJ} ${ZINJECT_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -lcrypto

zfs_ids_to_path: ${ZFS_IDS_OBJ} ${ZFS_IDS_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -lcrypto

zpool_influxdb: ${INFLUXDB_OBJ} ${INFLUXDB_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -lcrypto

mount.zfs: ${MOUNT_ZFS_OBJ} ${MOUNT_ZFS_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -lcrypto

zed: ${ZED_OBJ} ${ZED_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -lrt -lcrypto

zstream: ${ZSTREAM_OBJ} ${ZSTREAM_PROG}
	${CC} ${PROG_FLAGS} -o $@ $? ${LIBS} -luutil -lcrypto

.PHONY: extra
extra: pkgconfig functions

.PHONY: pkgconfig
pkgconfig: libzfs_core.pc libzfs.pc libzfsbootenv.pc

libzfs_core.pc: lib/libzfs_core/libzfs_core.pc.in
	sed -e "s|@prefix@|${PREFIX}|g" \
		-e "s|@exec_prefix@|${BINDIR}|g" \
		-e "s|@libdir@|${LIBDIR}|g" \
		-e "s|@includedir@|${INCDIR}|g" \
		-e "s|@VERSION@|$2|g" \
		lib/libzfs_core/libzfs_core.pc.in > $@
libzfs.pc: lib/libzfs/libzfs.pc.in
	sed -e "s|@prefix@|${PREFIX}|g" \
		-e "s|@exec_prefix@|${BINDIR}|g" \
		-e "s|@libdir@|${LIBDIR}|g" \
		-e "s|@includedir@|${INCDIR}|g" \
		-e "s|@VERSION@|$2|g" \
		lib/libzfs/libzfs.pc.in > $@
libzfsbootenv.pc: lib/libzfsbootenv/libzfsbootenv.pc.in
	sed -e "s|@prefix@|${PREFIX}|g" \
		-e "s|@exec_prefix@|${BINDIR}|g" \
		-e "s|@libdir@|${LIBDIR}|g" \
		-e "s|@includedir@|${INCDIR}|g" \
		-e "s|@VERSION@|$2|g" \
		lib/libzfsbootenv/libzfsbootenv.pc.in > $@

.PHONY: functions
functions: etc/zfs/zfs-functions etc/default/zfs cmd/zed/zed.d/history_event-zfs-list-cacher.sh

etc/zfs/zfs-functions:
	sed -e "s|@bindir[@]|${BINDIR}|g" \
		-e "s|@sbindir[@]|${BINDIR}|g" \
		-e "s|@datadir[@]|${PREFIX}/share|g" \
		-e "s|@sysconfdir[@]|${SYSCONFDIR}|g" \
		-e "s|@runstatedir[@]|${PREFIX}/var/run|g" \
		-e "s|@initconfdir[@]|${SYSCONFDIR}/default|g" \
		-e "s|@initdir[@]|${SYSCONFDIR}/init.d|g" \
		-e "s|@mounthelperdir[@]|${BINDIR}|g" \
		-e "s|@systemdgeneratordir[@]|no|g" \
		-e "s|@systemdunitdir[@]|no|g" \
		-e "s|@udevdir[@]|no|g" \
		-e "s|@udevruledir[@]|no/rules.d|g" \
		-e "s|@zfsexecdir[@]|${LIBDIR}/zfs|g" \
		-e "s|@PYTHON[@]|:|g" \
		-e "s|@PYTHON_SHEBANG[@]|python3|g" \
		-e "s|@DEFAULT_INIT_NFS_SERVER[@]|nfs|g" \
		-e "s|@DEFAULT_INIT_SHELL[@]|${SHELL}|g" \
		etc/zfs/zfs-functions.in > $@
etc/default/zfs:
	sed -e "s|@bindir[@]|${BINDIR}|g" \
		-e "s|@sbindir[@]|${BINDIR}|g" \
		-e "s|@datadir[@]|${PREFIX}/share|g" \
		-e "s|@sysconfdir[@]|${SYSCONFDIR}|g" \
		-e "s|@runstatedir[@]|${PREFIX}/var/run|g" \
		-e "s|@initconfdir[@]|${SYSCONFDIR}/default|g" \
		-e "s|@initdir[@]|${SYSCONFDIR}/init.d|g" \
		-e "s|@mounthelperdir[@]|${BINDIR}|g" \
		-e "s|@systemdgeneratordir[@]|no|g" \
		-e "s|@systemdunitdir[@]|no|g" \
		-e "s|@udevdir[@]|no|g" \
		-e "s|@udevruledir[@]|no/rules.d|g" \
		-e "s|@zfsexecdir[@]|${LIBDIR}/zfs|g" \
		-e "s|@PYTHON[@]|:|g" \
		-e "s|@PYTHON_SHEBANG[@]|python3|g" \
		-e "s|@DEFAULT_INIT_NFS_SERVER[@]|nfs|g" \
		-e "s|@DEFAULT_INIT_SHELL[@]|${SHELL}|g" \
		etc/default/zfs.in > $@
cmd/zed/zed.d/history_event-zfs-list-cacher.sh:
	sed -e "s|@bindir[@]|${BINDIR}|g" \
		-e "s|@sbindir[@]|${BINDIR}|g" \
		-e "s|@datadir[@]|${PREFIX}/share|g" \
		-e "s|@sysconfdir[@]|${SYSCONFDIR}|g" \
		-e "s|@runstatedir[@]|${PREFIX}/var/run|g" \
		-e "s|@initconfdir[@]|${SYSCONFDIR}/default|g" \
		-e "s|@initdir[@]|${SYSCONFDIR}/init.d|g" \
		-e "s|@mounthelperdir[@]|${BINDIR}|g" \
		-e "s|@systemdgeneratordir[@]|no|g" \
		-e "s|@systemdunitdir[@]|no|g" \
		-e "s|@udevdir[@]|no|g" \
		-e "s|@udevruledir[@]|no/rules.d|g" \
		-e "s|@zfsexecdir[@]|${LIBDIR}/zfs|g" \
		-e "s|@PYTHON[@]|:|g" \
		-e "s|@PYTHON_SHEBANG[@]|python3|g" \
		-e "s|@DEFAULT_INIT_NFS_SERVER[@]|nfs|g" \
		-e "s|@DEFAULT_INIT_SHELL[@]|${SHELL}|g" \
		cmd/zed/zed.d/history_event-zfs-list-cacher.sh > $@

.PHONY: install
install: install-lib install-progs install-examples install-scripts install-extra install-headers install-pc

install-lib:
	install -Dm644 libzfs.a ${DESTDIR}${LIBDIR}/libzfs.a
	install -Dm644 libzpool.a ${DESTDIR}${LIBDIR}/libzpool.a
	install -Dm644 libuutil.a ${DESTDIR}${LIBDIR}/libuutil.a
	install -Dm644 libnvpair.a ${DESTDIR}${LIBDIR}/libnvpair.a
	install -Dm644 libzfs_core.a ${DESTDIR}${LIBDIR}/libzfs_core.a
	install -Dm644 libzfsbootenv.a ${DESTDIR}${LIBDIR}/libzfsbootenv.a

install-progs:
	install -Dm755 zdb ${DESTDIR}${BINDIR}/zdb
	install -Dm755 zed ${DESTDIR}${BINDIR}/zed
	install -Dm755 zfs ${DESTDIR}${BINDIR}/zfs
	install -Dm755 zhack ${DESTDIR}${BINDIR}/zhack
	install -Dm755 zpool ${DESTDIR}${BINDIR}/zpool
	install -Dm755 ztest ${DESTDIR}${BINDIR}/ztest
	install -Dm755 zinject ${DESTDIR}${BINDIR}/zinject
	install -Dm755 zstream ${DESTDIR}${BINDIR}/zstream
	install -Dm755 mount.zfs ${DESTDIR}${BINDIR}/mount.zfs
	install -Dm755 raidz_test ${DESTDIR}${BINDIR}/raidz_test
	install -Dm755 zgenhostid ${DESTDIR}${BINDIR}/zgenhostid
	install -Dm755 cmd/fsck_zfs/fsck.zfs ${DESTDIR}${BINDIR}/fsck.zfs
	install -Dm755 zfs_ids_to_path ${DESTDIR}${BINDIR}/zfs_ids_to_path
	install -Dm755 cmd/zvol_wait/zvol_wait ${DESTDIR}${BINDIR}/zvol_wait
	install -Dm755 zpool_influxdb ${DESTDIR}${LIBDIR}/zfs/zpool_influxdb
	ln -sf zstream ${DESTDIR}${BINDIR}/zstreamdump

install-examples:
	install -Dm644 etc/zfs/vdev_id.conf.alias.example ${DESTDIR}${SYSCONFDIR}/zfs/vdev_id.conf.alias.example
	install -Dm644 etc/zfs/vdev_id.conf.multipath.example ${DESTDIR}${SYSCONFDIR}/zfs/vdev_id.conf.multipath.example
	install -Dm644 etc/zfs/vdev_id.conf.sas_direct.example ${DESTDIR}${SYSCONFDIR}/zfs/vdev_id.conf.sas_direct.example
	install -Dm644 etc/zfs/vdev_id.conf.sas_switch.example ${DESTDIR}${SYSCONFDIR}/zfs/vdev_id.conf.sas_switch.example
	install -Dm644 etc/zfs/vdev_id.conf.scsi.example ${DESTDIR}${SYSCONFDIR}/zfs/vdev_id.conf.scsi.example

install-scripts: functions
	install -Dm755 etc/zfs/zfs-functions ${DESTDIR}${SYSCONFDIR}/zfs/zfs-functions
	install -Dm644 etc/default/zfs ${DESTDIR}${SYSCONFDIR}/default/zfs
	install -Dm644 cmd/zed/zed.d/zed.rc ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/zed.rc
	install -Dm755 cmd/zed/zed.d/zed-functions.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/zed-functions.sh
	install -Dm755 cmd/zed/zed.d/history_event-zfs-list-cacher.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/history_event-zfs-list-cacher.sh
	install -Dm755 cmd/zed/zed.d/all-debug.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/all-debug.sh
	install -Dm755 cmd/zed/zed.d/all-syslog.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/all-syslog.sh
	install -Dm755 cmd/zed/zed.d/data-notify.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/data-notify.sh
	install -Dm755 cmd/zed/zed.d/generic-notify.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/generic-notify.sh
	install -Dm755 cmd/zed/zed.d/pool_import-led.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/pool_import-led.sh
	install -Dm755 cmd/zed/zed.d/resilver_finish-notify.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/resilver_finish-notify.sh
	install -Dm755 cmd/zed/zed.d/resilver_finish-start-scrub.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/resilver_finish-start-scrub.sh
	install -Dm755 cmd/zed/zed.d/scrub_finish-notify.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/scrub_finish-notify.sh
	install -Dm755 cmd/zed/zed.d/statechange-led.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/statechange-led.sh
	install -Dm755 cmd/zed/zed.d/statechange-notify.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/statechange-notify.sh
	install -Dm755 cmd/zed/zed.d/trim_finish-notify.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/trim_finish-notify.sh
	install -Dm755 cmd/zed/zed.d/vdev_attach-led.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/vdev_attach-led.sh
	install -Dm755 cmd/zed/zed.d/vdev_clear-led.sh ${DESTDIR}${LIBDIR}/zfs/zed.d/vdev_clear-led.sh
	ln -sf /usr/lib/zfs/zed.d/history_event-zfs-list-cacher.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/history_event-zfs-list-cacher.sh
	ln -sf /usr/lib/zfs/zed.d/all-syslog.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/all-syslog.sh
	ln -sf /usr/lib/zfs/zed.d/data-notify.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/data-notify.sh
	ln -sf /usr/lib/zfs/zed.d/pool_import-led.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/pool_import-led.sh
	ln -sf /usr/lib/zfs/zed.d/resilver_finish-notify.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/resilver_finish-notify.sh
	ln -sf /usr/lib/zfs/zed.d/resilver_finish-start-scrub.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/resilver_finish-start-scrub.sh
	ln -sf /usr/lib/zfs/zed.d/scrub_finish-notify.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/scrub_finish-notify.sh
	ln -sf /usr/lib/zfs/zed.d/statechange-led.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/statechange-led.sh
	ln -sf /usr/lib/zfs/zed.d/statechange-notify.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/statechange-notify.sh
	ln -sf /usr/lib/zfs/zed.d/vdev_attach-led.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/vdev_attach-led.sh
	ln -sf /usr/lib/zfs/zed.d/vdev_clear-led.sh ${DESTDIR}${SYSCONFDIR}/zfs/zed.d/vdev_clear-led.sh

install-extra:
	mkdir -p ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d
	install -Dm644 cmd/zpool/zpool.d/ata_err ${DESTDIR}${LIBDIR}/zfs/zpool.d/ata_err
	install -Dm644 cmd/zpool/zpool.d/cmd_to ${DESTDIR}${LIBDIR}/zfs/zpool.d/cmd_to
	install -Dm644 cmd/zpool/zpool.d/defect ${DESTDIR}${LIBDIR}/zfs/zpool.d/defect
	install -Dm644 cmd/zpool/zpool.d/dm-deps ${DESTDIR}${LIBDIR}/zfs/zpool.d/dm-deps
	install -Dm644 cmd/zpool/zpool.d/enc ${DESTDIR}${LIBDIR}/zfs/zpool.d/enc
	install -Dm644 cmd/zpool/zpool.d/encdev ${DESTDIR}${LIBDIR}/zfs/zpool.d/encdev
	install -Dm644 cmd/zpool/zpool.d/fault_led ${DESTDIR}${LIBDIR}/zfs/zpool.d/fault_led
	install -Dm644 cmd/zpool/zpool.d/health ${DESTDIR}${LIBDIR}/zfs/zpool.d/health
	install -Dm644 cmd/zpool/zpool.d/hours_on ${DESTDIR}${LIBDIR}/zfs/zpool.d/hours_on
	install -Dm644 cmd/zpool/zpool.d/iostat ${DESTDIR}${LIBDIR}/zfs/zpool.d/iostat
	install -Dm644 cmd/zpool/zpool.d/iostat-10s ${DESTDIR}${LIBDIR}/zfs/zpool.d/iostat-10s
	install -Dm644 cmd/zpool/zpool.d/iostat-1s ${DESTDIR}${LIBDIR}/zfs/zpool.d/iostat-1s
	install -Dm644 cmd/zpool/zpool.d/label ${DESTDIR}${LIBDIR}/zfs/zpool.d/label
	install -Dm644 cmd/zpool/zpool.d/locate_led ${DESTDIR}${LIBDIR}/zfs/zpool.d/locate_led
	install -Dm644 cmd/zpool/zpool.d/lsblk ${DESTDIR}${LIBDIR}/zfs/zpool.d/lsblk
	install -Dm644 cmd/zpool/zpool.d/media ${DESTDIR}${LIBDIR}/zfs/zpool.d/media
	install -Dm644 cmd/zpool/zpool.d/model ${DESTDIR}${LIBDIR}/zfs/zpool.d/model
	install -Dm644 cmd/zpool/zpool.d/nonmed ${DESTDIR}${LIBDIR}/zfs/zpool.d/nonmed
	install -Dm644 cmd/zpool/zpool.d/nvme_err ${DESTDIR}${LIBDIR}/zfs/zpool.d/nvme_err
	install -Dm644 cmd/zpool/zpool.d/off_ucor ${DESTDIR}${LIBDIR}/zfs/zpool.d/off_ucor
	install -Dm644 cmd/zpool/zpool.d/pend_sec ${DESTDIR}${LIBDIR}/zfs/zpool.d/pend_sec
	install -Dm644 cmd/zpool/zpool.d/pwr_cyc ${DESTDIR}${LIBDIR}/zfs/zpool.d/pwr_cyc
	install -Dm644 cmd/zpool/zpool.d/r_proc ${DESTDIR}${LIBDIR}/zfs/zpool.d/r_proc
	install -Dm644 cmd/zpool/zpool.d/r_ucor ${DESTDIR}${LIBDIR}/zfs/zpool.d/r_ucor
	install -Dm644 cmd/zpool/zpool.d/realloc ${DESTDIR}${LIBDIR}/zfs/zpool.d/realloc
	install -Dm644 cmd/zpool/zpool.d/rep_ucor ${DESTDIR}${LIBDIR}/zfs/zpool.d/rep_ucor
	install -Dm644 cmd/zpool/zpool.d/serial ${DESTDIR}${LIBDIR}/zfs/zpool.d/serial
	install -Dm644 cmd/zpool/zpool.d/ses ${DESTDIR}${LIBDIR}/zfs/zpool.d/ses
	install -Dm644 cmd/zpool/zpool.d/size ${DESTDIR}${LIBDIR}/zfs/zpool.d/size
	install -Dm644 cmd/zpool/zpool.d/slot ${DESTDIR}${LIBDIR}/zfs/zpool.d/slot
	install -Dm644 cmd/zpool/zpool.d/smart ${DESTDIR}${LIBDIR}/zfs/zpool.d/smart
	install -Dm644 cmd/zpool/zpool.d/smart_test ${DESTDIR}${LIBDIR}/zfs/zpool.d/smart_test
	install -Dm644 cmd/zpool/zpool.d/smartx ${DESTDIR}${LIBDIR}/zfs/zpool.d/smartx
	install -Dm644 cmd/zpool/zpool.d/temp ${DESTDIR}${LIBDIR}/zfs/zpool.d/temp
	install -Dm644 cmd/zpool/zpool.d/test_ended ${DESTDIR}${LIBDIR}/zfs/zpool.d/test_ended
	install -Dm644 cmd/zpool/zpool.d/test_progress ${DESTDIR}${LIBDIR}/zfs/zpool.d/test_progress
	install -Dm644 cmd/zpool/zpool.d/test_status ${DESTDIR}${LIBDIR}/zfs/zpool.d/test_status
	install -Dm644 cmd/zpool/zpool.d/test_type ${DESTDIR}${LIBDIR}/zfs/zpool.d/test_type
	install -Dm644 cmd/zpool/zpool.d/upath ${DESTDIR}${LIBDIR}/zfs/zpool.d/upath
	install -Dm644 cmd/zpool/zpool.d/vendor ${DESTDIR}${LIBDIR}/zfs/zpool.d/vendor
	install -Dm644 cmd/zpool/zpool.d/w_proc ${DESTDIR}${LIBDIR}/zfs/zpool.d/w_proc
	install -Dm644 cmd/zpool/zpool.d/w_ucor ${DESTDIR}${LIBDIR}/zfs/zpool.d/w_ucor
	ln -sf /usr/lib/zfs/zpool.d/ata_err ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/ata_err
	ln -sf /usr/lib/zfs/zpool.d/cmd_to ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/cmd_to
	ln -sf /usr/lib/zfs/zpool.d/defect ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/defect
	ln -sf /usr/lib/zfs/zpool.d/dm-deps ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/dm-deps
	ln -sf /usr/lib/zfs/zpool.d/enc ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/enc
	ln -sf /usr/lib/zfs/zpool.d/encdev ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/encdev
	ln -sf /usr/lib/zfs/zpool.d/fault_led ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/fault_led
	ln -sf /usr/lib/zfs/zpool.d/health ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/health
	ln -sf /usr/lib/zfs/zpool.d/hours_on ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/hours_on
	ln -sf /usr/lib/zfs/zpool.d/iostat ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/iostat
	ln -sf /usr/lib/zfs/zpool.d/iostat-10s ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/iostat-10s
	ln -sf /usr/lib/zfs/zpool.d/iostat-1s ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/iostat-1s
	ln -sf /usr/lib/zfs/zpool.d/label ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/label
	ln -sf /usr/lib/zfs/zpool.d/locate_led ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/locate_led
	ln -sf /usr/lib/zfs/zpool.d/lsblk ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/lsblk
	ln -sf /usr/lib/zfs/zpool.d/media ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/media
	ln -sf /usr/lib/zfs/zpool.d/model ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/model
	ln -sf /usr/lib/zfs/zpool.d/nonmed ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/nonmed
	ln -sf /usr/lib/zfs/zpool.d/nvme_err ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/nvme_err
	ln -sf /usr/lib/zfs/zpool.d/off_ucor ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/off_ucor
	ln -sf /usr/lib/zfs/zpool.d/pend_sec ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/pend_sec
	ln -sf /usr/lib/zfs/zpool.d/pwr_cyc ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/pwr_cyc
	ln -sf /usr/lib/zfs/zpool.d/r_proc ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/r_proc
	ln -sf /usr/lib/zfs/zpool.d/r_ucor ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/r_ucor
	ln -sf /usr/lib/zfs/zpool.d/realloc ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/realloc
	ln -sf /usr/lib/zfs/zpool.d/rep_ucor ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/rep_ucor
	ln -sf /usr/lib/zfs/zpool.d/serial ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/serial
	ln -sf /usr/lib/zfs/zpool.d/ses ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/ses
	ln -sf /usr/lib/zfs/zpool.d/size ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/size
	ln -sf /usr/lib/zfs/zpool.d/slot ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/slot
	ln -sf /usr/lib/zfs/zpool.d/smart ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/smart
	ln -sf /usr/lib/zfs/zpool.d/smart_test ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/smart_test
	ln -sf /usr/lib/zfs/zpool.d/smartx ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/smartx
	ln -sf /usr/lib/zfs/zpool.d/temp ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/temp
	ln -sf /usr/lib/zfs/zpool.d/test_ended ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/test_ended
	ln -sf /usr/lib/zfs/zpool.d/test_progress ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/test_progress
	ln -sf /usr/lib/zfs/zpool.d/test_status ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/test_status
	ln -sf /usr/lib/zfs/zpool.d/test_type ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/test_type
	ln -sf /usr/lib/zfs/zpool.d/upath ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/upath
	ln -sf /usr/lib/zfs/zpool.d/vendor ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/vendor
	ln -sf /usr/lib/zfs/zpool.d/w_proc ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/w_proc
	ln -sf /usr/lib/zfs/zpool.d/w_ucor ${DESTDIR}${SYSCONFDIR}/zfs/zpool.d/w_ucor

install-headers:
	install -Dm644 include/zfs_prop.h ${DESTDIR}${INCDIR}/libzfs/zfs_prop.h
	install -Dm644 include/zfs_namecheck.h ${DESTDIR}${INCDIR}/libzfs/zfs_namecheck.h
	install -Dm644 include/zfs_fletcher.h ${DESTDIR}${INCDIR}/libzfs/zfs_fletcher.h
	install -Dm644 include/zfs_deleg.h ${DESTDIR}${INCDIR}/libzfs/zfs_deleg.h
	install -Dm644 include/zfs_comutil.h ${DESTDIR}${INCDIR}/libzfs/zfs_comutil.h
	install -Dm644 include/zfeature_common.h ${DESTDIR}${INCDIR}/libzfs/zfeature_common.h
	install -Dm644 include/thread_pool.h ${DESTDIR}${INCDIR}/libzfs/thread_pool.h
	install -Dm644 include/sys/zthr.h ${DESTDIR}${INCDIR}/libzfs/sys/zthr.h
	install -Dm644 include/sys/zstd/zstd.h ${DESTDIR}${INCDIR}/libzfs/sys/zstd/zstd.h
	install -Dm644 include/sys/zrlock.h ${DESTDIR}${INCDIR}/libzfs/sys/zrlock.h
	install -Dm644 include/sys/zio_priority.h ${DESTDIR}${INCDIR}/libzfs/sys/zio_priority.h
	install -Dm644 include/sys/zio_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/zio_impl.h
	install -Dm644 include/sys/zio_crypt.h ${DESTDIR}${INCDIR}/libzfs/sys/zio_crypt.h
	install -Dm644 include/sys/zio_compress.h ${DESTDIR}${INCDIR}/libzfs/sys/zio_compress.h
	install -Dm644 include/sys/zio_checksum.h ${DESTDIR}${INCDIR}/libzfs/sys/zio_checksum.h
	install -Dm644 include/sys/zio.h ${DESTDIR}${INCDIR}/libzfs/sys/zio.h
	install -Dm644 include/sys/zil_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/zil_impl.h
	install -Dm644 include/sys/zil.h ${DESTDIR}${INCDIR}/libzfs/sys/zil.h
	install -Dm644 include/sys/zfs_znode.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_znode.h
	install -Dm644 include/sys/zfs_vnops.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_vnops.h
	install -Dm644 include/sys/zfs_vfsops.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_vfsops.h
	install -Dm644 include/sys/zfs_sysfs.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_sysfs.h
	install -Dm644 include/sys/zfs_stat.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_stat.h
	install -Dm644 include/sys/zfs_sa.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_sa.h
	install -Dm644 include/sys/zfs_rlock.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_rlock.h
	install -Dm644 include/sys/zfs_refcount.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_refcount.h
	install -Dm644 include/sys/zfs_ratelimit.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_ratelimit.h
	install -Dm644 include/sys/zfs_racct.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_racct.h
	install -Dm644 include/sys/zfs_quota.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_quota.h
	install -Dm644 include/sys/zfs_project.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_project.h
	install -Dm644 include/sys/zfs_fuid.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_fuid.h
	install -Dm644 include/sys/zfs_file.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_file.h
	install -Dm644 include/sys/zfs_delay.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_delay.h
	install -Dm644 include/sys/zfs_debug.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_debug.h
	install -Dm644 include/sys/zfs_context.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_context.h
	install -Dm644 include/sys/zfs_bootenv.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_bootenv.h
	install -Dm644 include/sys/zfs_acl.h ${DESTDIR}${INCDIR}/libzfs/sys/zfs_acl.h
	install -Dm644 include/sys/zfeature.h ${DESTDIR}${INCDIR}/libzfs/sys/zfeature.h
	install -Dm644 include/sys/zcp_set.h ${DESTDIR}${INCDIR}/libzfs/sys/zcp_set.h
	install -Dm644 include/sys/zcp_prop.h ${DESTDIR}${INCDIR}/libzfs/sys/zcp_prop.h
	install -Dm644 include/sys/zcp_iter.h ${DESTDIR}${INCDIR}/libzfs/sys/zcp_iter.h
	install -Dm644 include/sys/zcp_global.h ${DESTDIR}${INCDIR}/libzfs/sys/zcp_global.h
	install -Dm644 include/sys/zcp.h ${DESTDIR}${INCDIR}/libzfs/sys/zcp.h
	install -Dm644 include/sys/zap_leaf.h ${DESTDIR}${INCDIR}/libzfs/sys/zap_leaf.h
	install -Dm644 include/sys/zap_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/zap_impl.h
	install -Dm644 include/sys/zap.h ${DESTDIR}${INCDIR}/libzfs/sys/zap.h
	install -Dm644 include/sys/xvattr.h ${DESTDIR}${INCDIR}/libzfs/sys/xvattr.h
	install -Dm644 include/sys/vdev_trim.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_trim.h
	install -Dm644 include/sys/vdev_removal.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_removal.h
	install -Dm644 include/sys/vdev_rebuild.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_rebuild.h
	install -Dm644 include/sys/vdev_raidz_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_raidz_impl.h
	install -Dm644 include/sys/vdev_raidz.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_raidz.h
	install -Dm644 include/sys/vdev_initialize.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_initialize.h
	install -Dm644 include/sys/vdev_indirect_mapping.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_indirect_mapping.h
	install -Dm644 include/sys/vdev_indirect_births.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_indirect_births.h
	install -Dm644 include/sys/vdev_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_impl.h
	install -Dm644 include/sys/vdev_file.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_file.h
	install -Dm644 include/sys/vdev_draid.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_draid.h
	install -Dm644 include/sys/vdev_disk.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev_disk.h
	install -Dm644 include/sys/vdev.h ${DESTDIR}${INCDIR}/libzfs/sys/vdev.h
	install -Dm644 include/sys/uuid.h ${DESTDIR}${INCDIR}/libzfs/sys/uuid.h
	install -Dm644 include/sys/unique.h ${DESTDIR}${INCDIR}/libzfs/sys/unique.h
	install -Dm644 include/sys/uio_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/uio_impl.h
	install -Dm644 include/sys/uberblock_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/uberblock_impl.h
	install -Dm644 include/sys/uberblock.h ${DESTDIR}${INCDIR}/libzfs/sys/uberblock.h
	install -Dm644 include/sys/u8_textprep_data.h ${DESTDIR}${INCDIR}/libzfs/sys/u8_textprep_data.h
	install -Dm644 include/sys/u8_textprep.h ${DESTDIR}${INCDIR}/libzfs/sys/u8_textprep.h
	install -Dm644 include/sys/txg_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/txg_impl.h
	install -Dm644 include/sys/txg.h ${DESTDIR}${INCDIR}/libzfs/sys/txg.h
	install -Dm644 include/sys/sysevent/eventdefs.h ${DESTDIR}${INCDIR}/libzfs/sys/sysevent/eventdefs.h
	install -Dm644 include/sys/sysevent/dev.h ${DESTDIR}${INCDIR}/libzfs/sys/sysevent/dev.h
	install -Dm644 include/sys/sysevent.h ${DESTDIR}${INCDIR}/libzfs/sys/sysevent.h
	install -Dm644 include/sys/space_reftree.h ${DESTDIR}${INCDIR}/libzfs/sys/space_reftree.h
	install -Dm644 include/sys/space_map.h ${DESTDIR}${INCDIR}/libzfs/sys/space_map.h
	install -Dm644 include/sys/spa_log_spacemap.h ${DESTDIR}${INCDIR}/libzfs/sys/spa_log_spacemap.h
	install -Dm644 include/sys/spa_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/spa_impl.h
	install -Dm644 include/sys/spa_checksum.h ${DESTDIR}${INCDIR}/libzfs/sys/spa_checksum.h
	install -Dm644 include/sys/spa_checkpoint.h ${DESTDIR}${INCDIR}/libzfs/sys/spa_checkpoint.h
	install -Dm644 include/sys/spa_boot.h ${DESTDIR}${INCDIR}/libzfs/sys/spa_boot.h
	install -Dm644 include/sys/spa.h ${DESTDIR}${INCDIR}/libzfs/sys/spa.h
	install -Dm644 include/sys/skein.h ${DESTDIR}${INCDIR}/libzfs/sys/skein.h
	install -Dm644 include/sys/sa_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/sa_impl.h
	install -Dm644 include/sys/sa.h ${DESTDIR}${INCDIR}/libzfs/sys/sa.h
	install -Dm644 include/sys/rrwlock.h ${DESTDIR}${INCDIR}/libzfs/sys/rrwlock.h
	install -Dm644 include/sys/range_tree.h ${DESTDIR}${INCDIR}/libzfs/sys/range_tree.h
	install -Dm644 include/sys/qat.h ${DESTDIR}${INCDIR}/libzfs/sys/qat.h
	install -Dm644 include/sys/pathname.h ${DESTDIR}${INCDIR}/libzfs/sys/pathname.h
	install -Dm644 include/sys/objlist.h ${DESTDIR}${INCDIR}/libzfs/sys/objlist.h
	install -Dm644 include/sys/nvpair_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/nvpair_impl.h
	install -Dm644 include/sys/nvpair.h ${DESTDIR}${INCDIR}/libzfs/sys/nvpair.h
	install -Dm644 include/sys/note.h ${DESTDIR}${INCDIR}/libzfs/sys/note.h
	install -Dm644 include/sys/multilist.h ${DESTDIR}${INCDIR}/libzfs/sys/multilist.h
	install -Dm644 include/sys/mod.h ${DESTDIR}${INCDIR}/libzfs/sys/mod.h
	install -Dm644 include/sys/mntent.h ${DESTDIR}${INCDIR}/libzfs/sys/mntent.h
	install -Dm644 include/sys/mmp.h ${DESTDIR}${INCDIR}/libzfs/sys/mmp.h
	install -Dm644 include/sys/metaslab_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/metaslab_impl.h
	install -Dm644 include/sys/metaslab.h ${DESTDIR}${INCDIR}/libzfs/sys/metaslab.h
	install -Dm644 include/sys/lua/lualib.h ${DESTDIR}${INCDIR}/libzfs/sys/lua/lualib.h
	install -Dm644 include/sys/lua/luaconf.h ${DESTDIR}${INCDIR}/libzfs/sys/lua/luaconf.h
	install -Dm644 include/sys/lua/lua.h ${DESTDIR}${INCDIR}/libzfs/sys/lua/lua.h
	install -Dm644 include/sys/lua/lauxlib.h ${DESTDIR}${INCDIR}/libzfs/sys/lua/lauxlib.h
	install -Dm644 include/sys/hkdf.h ${DESTDIR}${INCDIR}/libzfs/sys/hkdf.h
	install -Dm644 include/sys/fs/zfs.h ${DESTDIR}${INCDIR}/libzfs/sys/fs/zfs.h
	install -Dm644 include/sys/frame.h ${DESTDIR}${INCDIR}/libzfs/sys/frame.h
	install -Dm644 include/sys/fm/util.h ${DESTDIR}${INCDIR}/libzfs/sys/fm/util.h
	install -Dm644 include/sys/fm/protocol.h ${DESTDIR}${INCDIR}/libzfs/sys/fm/protocol.h
	install -Dm644 include/sys/fm/fs/zfs.h ${DESTDIR}${INCDIR}/libzfs/sys/fm/fs/zfs.h
	install -Dm644 include/sys/efi_partition.h ${DESTDIR}${INCDIR}/libzfs/sys/efi_partition.h
	install -Dm644 include/sys/edonr.h ${DESTDIR}${INCDIR}/libzfs/sys/edonr.h
	install -Dm644 include/sys/dsl_userhold.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_userhold.h
	install -Dm644 include/sys/dsl_synctask.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_synctask.h
	install -Dm644 include/sys/dsl_scan.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_scan.h
	install -Dm644 include/sys/dsl_prop.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_prop.h
	install -Dm644 include/sys/dsl_pool.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_pool.h
	install -Dm644 include/sys/dsl_dir.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_dir.h
	install -Dm644 include/sys/dsl_destroy.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_destroy.h
	install -Dm644 include/sys/dsl_deleg.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_deleg.h
	install -Dm644 include/sys/dsl_deadlist.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_deadlist.h
	install -Dm644 include/sys/dsl_dataset.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_dataset.h
	install -Dm644 include/sys/dsl_crypt.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_crypt.h
	install -Dm644 include/sys/dsl_bookmark.h ${DESTDIR}${INCDIR}/libzfs/sys/dsl_bookmark.h
	install -Dm644 include/sys/dnode.h ${DESTDIR}${INCDIR}/libzfs/sys/dnode.h
	install -Dm644 include/sys/dmu_zfetch.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_zfetch.h
	install -Dm644 include/sys/dmu_tx.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_tx.h
	install -Dm644 include/sys/dmu_traverse.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_traverse.h
	install -Dm644 include/sys/dmu_send.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_send.h
	install -Dm644 include/sys/dmu_redact.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_redact.h
	install -Dm644 include/sys/dmu_recv.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_recv.h
	install -Dm644 include/sys/dmu_objset.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_objset.h
	install -Dm644 include/sys/dmu_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu_impl.h
	install -Dm644 include/sys/dmu.h ${DESTDIR}${INCDIR}/libzfs/sys/dmu.h
	install -Dm644 include/sys/ddt.h ${DESTDIR}${INCDIR}/libzfs/sys/ddt.h
	install -Dm644 include/sys/dbuf.h ${DESTDIR}${INCDIR}/libzfs/sys/dbuf.h
	install -Dm644 include/sys/dataset_kstats.h ${DESTDIR}${INCDIR}/libzfs/sys/dataset_kstats.h
	install -Dm644 include/sys/crypto/icp.h ${DESTDIR}${INCDIR}/libzfs/sys/crypto/icp.h
	install -Dm644 include/sys/crypto/common.h ${DESTDIR}${INCDIR}/libzfs/sys/crypto/common.h
	install -Dm644 include/sys/crypto/api.h ${DESTDIR}${INCDIR}/libzfs/sys/crypto/api.h
	install -Dm644 include/sys/btree.h ${DESTDIR}${INCDIR}/libzfs/sys/btree.h
	install -Dm644 include/sys/bqueue.h ${DESTDIR}${INCDIR}/libzfs/sys/bqueue.h
	install -Dm644 include/sys/bptree.h ${DESTDIR}${INCDIR}/libzfs/sys/bptree.h
	install -Dm644 include/sys/bpobj.h ${DESTDIR}${INCDIR}/libzfs/sys/bpobj.h
	install -Dm644 include/sys/bplist.h ${DESTDIR}${INCDIR}/libzfs/sys/bplist.h
	install -Dm644 include/sys/blkptr.h ${DESTDIR}${INCDIR}/libzfs/sys/blkptr.h
	install -Dm644 include/sys/bitops.h ${DESTDIR}${INCDIR}/libzfs/sys/bitops.h
	install -Dm644 include/sys/avl_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/avl_impl.h
	install -Dm644 include/sys/avl.h ${DESTDIR}${INCDIR}/libzfs/sys/avl.h
	install -Dm644 include/sys/arc_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/arc_impl.h
	install -Dm644 include/sys/arc.h ${DESTDIR}${INCDIR}/libzfs/sys/arc.h
	install -Dm644 include/sys/aggsum.h ${DESTDIR}${INCDIR}/libzfs/sys/aggsum.h
	install -Dm644 include/sys/abd_impl.h ${DESTDIR}${INCDIR}/libzfs/sys/abd_impl.h
	install -Dm644 include/sys/abd.h ${DESTDIR}${INCDIR}/libzfs/sys/abd.h
	install -Dm644 include/libzutil.h ${DESTDIR}${INCDIR}/libzfs/libzutil.h
	install -Dm644 include/libzfsbootenv.h ${DESTDIR}${INCDIR}/libzfs/libzfsbootenv.h
	install -Dm644 include/libzfs_impl.h ${DESTDIR}${INCDIR}/libzfs/libzfs_impl.h
	install -Dm644 include/libzfs_core.h ${DESTDIR}${INCDIR}/libzfs/libzfs_core.h
	install -Dm644 include/libzfs.h ${DESTDIR}${INCDIR}/libzfs/libzfs.h
	install -Dm644 include/libuutil_impl.h ${DESTDIR}${INCDIR}/libzfs/libuutil_impl.h
	install -Dm644 include/libuutil_common.h ${DESTDIR}${INCDIR}/libzfs/libuutil_common.h
	install -Dm644 include/libuutil.h ${DESTDIR}${INCDIR}/libzfs/libuutil.h
	install -Dm644 include/libnvpair.h ${DESTDIR}${INCDIR}/libzfs/libnvpair.h
	install -Dm644 include/cityhash.h ${DESTDIR}${INCDIR}/libzfs/cityhash.h
	install -Dm644 lib/libspl/include/zone.h ${DESTDIR}${INCDIR}/libspl/zone.h
	install -Dm644 lib/libspl/include/unistd.h ${DESTDIR}${INCDIR}/libspl/unistd.h
	install -Dm644 lib/libspl/include/umem.h ${DESTDIR}${INCDIR}/libspl/umem.h
	install -Dm644 lib/libspl/include/ucred.h ${DESTDIR}${INCDIR}/libspl/ucred.h
	install -Dm644 lib/libspl/include/tzfile.h ${DESTDIR}${INCDIR}/libspl/tzfile.h
	install -Dm644 lib/libspl/include/thread.h ${DESTDIR}${INCDIR}/libspl/thread.h
	install -Dm644 lib/libspl/include/stropts.h ${DESTDIR}${INCDIR}/libspl/stropts.h
	install -Dm644 lib/libspl/include/string.h ${DESTDIR}${INCDIR}/libspl/string.h
	install -Dm644 lib/libspl/include/stdlib.h ${DESTDIR}${INCDIR}/libspl/stdlib.h
	install -Dm644 lib/libspl/include/stdio.h ${DESTDIR}${INCDIR}/libspl/stdio.h
	install -Dm644 lib/libspl/include/statcommon.h ${DESTDIR}${INCDIR}/libspl/statcommon.h
	install -Dm644 lib/libspl/include/rpc/xdr.h ${DESTDIR}${INCDIR}/libspl/rpc/xdr.h
	install -Dm644 lib/libspl/include/locale.h ${DESTDIR}${INCDIR}/libspl/locale.h
	install -Dm644 lib/libspl/include/limits.h ${DESTDIR}${INCDIR}/libspl/limits.h
	install -Dm644 lib/libspl/include/libshare.h ${DESTDIR}${INCDIR}/libspl/libshare.h
	install -Dm644 lib/libspl/include/libgen.h ${DESTDIR}${INCDIR}/libspl/libgen.h
	install -Dm644 lib/libspl/include/libdevinfo.h ${DESTDIR}${INCDIR}/libspl/libdevinfo.h
	install -Dm644 lib/libspl/include/ia32/sys/asm_linkage.h ${DESTDIR}${INCDIR}/libspl/ia32/sys/asm_linkage.h
	install -Dm644 lib/libspl/include/atomic.h ${DESTDIR}${INCDIR}/libspl/atomic.h
	install -Dm644 lib/libspl/include/assert.h ${DESTDIR}${INCDIR}/libspl/assert.h
	install -Dm644 lib/libspl/include/sys/zone.h ${DESTDIR}${INCDIR}/libspl/sys/zone.h
	install -Dm644 lib/libspl/include/sys/wmsum.h ${DESTDIR}${INCDIR}/libspl/sys/wmsum.h
	install -Dm644 lib/libspl/include/sys/vtoc.h ${DESTDIR}${INCDIR}/libspl/sys/vtoc.h
	install -Dm644 lib/libspl/include/sys/vnode.h ${DESTDIR}${INCDIR}/libspl/sys/vnode.h
	install -Dm644 lib/libspl/include/sys/varargs.h ${DESTDIR}${INCDIR}/libspl/sys/varargs.h
	install -Dm644 lib/libspl/include/sys/va_list.h ${DESTDIR}${INCDIR}/libspl/sys/va_list.h
	install -Dm644 lib/libspl/include/sys/uio.h ${DESTDIR}${INCDIR}/libspl/sys/uio.h
	install -Dm644 lib/libspl/include/sys/tzfile.h ${DESTDIR}${INCDIR}/libspl/sys/tzfile.h
	install -Dm644 lib/libspl/include/sys/types32.h ${DESTDIR}${INCDIR}/libspl/sys/types32.h
	install -Dm644 lib/libspl/include/sys/types.h ${DESTDIR}${INCDIR}/libspl/sys/types.h
	install -Dm644 lib/libspl/include/sys/trace_zfs.h ${DESTDIR}${INCDIR}/libspl/sys/trace_zfs.h
	install -Dm644 lib/libspl/include/sys/trace_spl.h ${DESTDIR}${INCDIR}/libspl/sys/trace_spl.h
	install -Dm644 lib/libspl/include/sys/time.h ${DESTDIR}${INCDIR}/libspl/sys/time.h
	install -Dm644 lib/libspl/include/sys/systeminfo.h ${DESTDIR}${INCDIR}/libspl/sys/systeminfo.h
	install -Dm644 lib/libspl/include/os/linux/sys/sysmacros.h ${DESTDIR}${INCDIR}/libspl/sys/sysmacros.h
	install -Dm644 lib/libspl/include/sys/sunddi.h ${DESTDIR}${INCDIR}/libspl/sys/sunddi.h
	install -Dm644 lib/libspl/include/sys/stropts.h ${DESTDIR}${INCDIR}/libspl/sys/stropts.h
	install -Dm644 lib/libspl/include/sys/strings.h ${DESTDIR}${INCDIR}/libspl/sys/strings.h
	install -Dm644 lib/libspl/include/sys/stdtypes.h ${DESTDIR}${INCDIR}/libspl/sys/stdtypes.h
	install -Dm644 lib/libspl/include/os/linux/sys/stat.h ${DESTDIR}${INCDIR}/libspl/sys/stat.h
	install -Dm644 lib/libspl/include/sys/stack.h ${DESTDIR}${INCDIR}/libspl/sys/stack.h
	install -Dm644 lib/libspl/include/sys/simd.h ${DESTDIR}${INCDIR}/libspl/sys/simd.h
	install -Dm644 lib/libspl/include/sys/sha2.h ${DESTDIR}${INCDIR}/libspl/sys/sha2.h
	install -Dm644 lib/libspl/include/sys/processor.h ${DESTDIR}${INCDIR}/libspl/sys/processor.h
	install -Dm644 lib/libspl/include/sys/priv.h ${DESTDIR}${INCDIR}/libspl/sys/priv.h
	install -Dm644 lib/libspl/include/sys/poll.h ${DESTDIR}${INCDIR}/libspl/sys/poll.h
	install -Dm644 lib/libspl/include/sys/policy.h ${DESTDIR}${INCDIR}/libspl/sys/policy.h
	install -Dm644 lib/libspl/include/os/linux/sys/param.h ${DESTDIR}${INCDIR}/libspl/sys/param.h
	install -Dm644 lib/libspl/include/sys/mkdev.h ${DESTDIR}${INCDIR}/libspl/sys/mkdev.h
	install -Dm644 lib/libspl/include/sys/mhd.h ${DESTDIR}${INCDIR}/libspl/sys/mhd.h
	install -Dm644 lib/libspl/include/sys/list_impl.h ${DESTDIR}${INCDIR}/libspl/sys/list_impl.h
	install -Dm644 lib/libspl/include/sys/list.h ${DESTDIR}${INCDIR}/libspl/sys/list.h
	install -Dm644 lib/libspl/include/sys/kstat.h ${DESTDIR}${INCDIR}/libspl/sys/kstat.h
	install -Dm644 lib/libspl/include/sys/kmem.h ${DESTDIR}${INCDIR}/libspl/sys/kmem.h
	install -Dm644 lib/libspl/include/sys/isa_defs.h ${DESTDIR}${INCDIR}/libspl/sys/isa_defs.h
	install -Dm644 lib/libspl/include/sys/inttypes.h ${DESTDIR}${INCDIR}/libspl/sys/inttypes.h
	install -Dm644 lib/libspl/include/sys/int_types.h ${DESTDIR}${INCDIR}/libspl/sys/int_types.h
	install -Dm644 lib/libspl/include/sys/int_limits.h ${DESTDIR}${INCDIR}/libspl/sys/int_limits.h
	install -Dm644 lib/libspl/include/sys/feature_tests.h ${DESTDIR}${INCDIR}/libspl/sys/feature_tests.h
	install -Dm644 lib/libspl/include/os/linux/sys/errno.h ${DESTDIR}${INCDIR}/libspl/sys/errno.h
	install -Dm644 lib/libspl/include/sys/dktp/fdisk.h ${DESTDIR}${INCDIR}/libspl/sys/dktp/fdisk.h
	install -Dm644 lib/libspl/include/sys/dklabel.h ${DESTDIR}${INCDIR}/libspl/sys/dklabel.h
	install -Dm644 lib/libspl/include/sys/dkio.h ${DESTDIR}${INCDIR}/libspl/sys/dkio.h
	install -Dm644 lib/libspl/include/sys/debug.h ${DESTDIR}${INCDIR}/libspl/sys/debug.h
	install -Dm644 lib/libspl/include/sys/cred.h ${DESTDIR}${INCDIR}/libspl/sys/cred.h
	install -Dm644 lib/libspl/include/sys/cmn_err.h ${DESTDIR}${INCDIR}/libspl/sys/cmn_err.h
	install -Dm644 lib/libspl/include/sys/callb.h ${DESTDIR}${INCDIR}/libspl/sys/callb.h
	install -Dm644 lib/libspl/include/os/linux/sys/byteorder.h ${DESTDIR}${INCDIR}/libspl/sys/byteorder.h
	install -Dm644 lib/libspl/include/sys/acl_impl.h ${DESTDIR}${INCDIR}/libspl/sys/acl_impl.h
	install -Dm644 lib/libspl/include/sys/acl.h ${DESTDIR}${INCDIR}/libspl/sys/acl.h
	install -Dm644 lib/libspl/include/util/sscanf.h ${DESTDIR}${INCDIR}/libspl/sscanf.h
	install -Dm644 lib/libspl/include/os/linux/sys/mount.h ${DESTDIR}${INCDIR}/libspl/sys/mount.h
	install -Dm644 lib/libspl/include/os/linux/sys/mnttab.h ${DESTDIR}${INCDIR}/libspl/sys/mnttab.h
	install -Dm644 lib/libspl/include/os/linux/sys/zfs_context_os.h ${DESTDIR}${INCDIR}/libspl/sys/zfs_context_os.h

install-pc: pkgconfig
	install -Dm644 libzfs_core.pc ${DESTDIR}${LIBDIR}/pkgconfig/libzfs_core.pc
	install -Dm644 libzfs.pc ${DESTDIR}${LIBDIR}/pkgconfig/libzfs.pc
	install -Dm644 libzfsbootenv.pc ${DESTDIR}${LIBDIR}/pkgconfig/libzfsbootenv.pc

.PHONY: clean
clean:
	rm -f ${OBJ} progs libs pkgconfig
