.POSIX:

PREFIX := /usr/local

CC := cc
AR := ar

INCLUDES := -Iinclude -Imodule/icp/include -Ilib/libspl/include \
			-Ilib/libspl/include/os/linux -Igarbo/usr/include

XCFLAGS := -std=gnu99 -Wall -Wstrict-prototypes \
			-Wmissing-prototypes -fno-strict-aliasing -Igarbo/usr/lib

XCPPFLAGS := -DHAVE_CONFIG_H -D_GNU_SOURCE -D_REENTRANT -D_FILE_OFFSET_BITS=64 \
				-D_LARGEFILE64_SOURCE -DHAVE_LARGE_STACKS=1 \
				-DLIBEXECDIR=\"/usr/lib\" -DRUNSTATEDIR=\"/usr/var/run\" \
				-DSBINDIR=\"/usr/bin\" -DSYSCONFDIR=\"/etc\" \
				-DPKGDATADIR=\"/usr/share/zfs\" -UDEBUG -DNDEBUG \
				-DTEXT_DOMAIN=\"zfs-linux-user\"

GARBOLIBS := -Lgarbo/usr/lib

FLAGS := ${XCFLAGS} ${XCPPFLAGS} ${INCLUDES} ${CFLAGS}

LIBAVL_SRC := module/avl
LIBAVL_OBJ := obj/avl

${LIBAVL_OBJ}/%.o : ${LIBAVL_SRC}/%.c
	${CC} ${FLAGS} -c $< -o $@
LIBAVL_SRC = module/avl/avl.c

LIBICP_ICP_SRC = module/icp/illumos-crypto.c

LIBICP_AES_SRC = module/icp/algs/aes/aes_impl.c \
					module/icp/algs/aes/aes_impl_aesni.c \
					module/icp/algs/aes/aes_impl_generic.c \
					module/icp/algs/aes/aes_impl_x86-64.c \
					module/icp/algs/aes/aes_modes.c \

LIBICP_EDONR_SRC = module/icp/algs/edonr/edonr.c \

LIBICP_MODES_SRC = module/icp/algs/modes/cbc.c \
					module/icp/algs/modes/ccm.c \
					module/icp/algs/modes/ctr.c \
					module/icp/algs/modes/ecb.c \
					module/icp/algs/modes/gcm.c \
					module/icp/algs/modes/gcm_generic.c \
					module/icp/algs/modes/gcm_pclmulqdq.c \
					module/icp/algs/modes/modes.c \

LIBICP_SHA1_SRC = module/icp/algs/sha1/sha1.c \

LIBICP_SHA2_SRC = module/icp/algs/sha2/sha2.c \

LIBICP_SKEIN_SRC = module/icp/algs/skein/skein.c \
					module/icp/algs/skein/skein_block.c \
					module/icp/algs/skein/skein_iv.c \

LIBICP_API_SRC = module/icp/api/kcf_cipher.c \
					module/icp/api/kcf_ctxops.c \
					module/icp/api/kcf_digest.c \
					module/icp/api/kcf_mac.c \
					module/icp/api/kcf_miscapi.c \

LIBICP_ASM_AES_SRC = module/icp/asm-x86_64/aes/aes_aesni.c \
						module/icp/asm-x86_64/aes/aes_amd64.c \
						module/icp/asm-x86_64/aes/aeskey.c \

LIBICP_ASM_MODES_SRC = module/icp/asm-x86_64/modes/aesni-gcm-x86_64.c \
						module/icp/asm-x86_64/modes/gcm_pclmulqdq.c \
						module/icp/asm-x86_64/modes/ghash-x86_64.c \

LIBICP_ASM_SHA1_SRC = module/icp/asm-x86_64/sha1/sha1-x86_64.c \

LIBICP_ASM_SHA2_SRC = module/icp/asm-x86_64/sha2/sha256_impl.c \
						module/icp/asm-x86_64/sha2/sha512_impl.c \

LIBICP_CORE_SRC = module/icp/core/kcf_callprov.c \
					module/icp/core/kcf_mech_tabs.c \
					module/icp/core/kcf_prov_lib.c \
					module/icp/core/kcf_prov_tabs.c \
					module/icp/core/kcf_sched.c \

LIBICP_IO_SRC = module/icp/io/aes.c \
				module/icp/io/edonr_mod.c \
				module/icp/io/sha1_mod.c \
				module/icp/io/sha2_mod.c \
				module/icp/io/skein_mod.c \

LIBICP_OS_SRC = module/icp/os/modconf.c \
				module/icp/os/modhash.c \

LIBICP_SPI_SRC = module/icp/spi/kcf_spi.c

LIBICP_SRC = ${LIBICP_ICP_SRC} ${LIBICP_AES_SRC} ${LIBICP_EDONR_SRC} \
				${LIBICP_MODES_SRC} ${LIBICP_SHA1_SRC} ${LIBICP_SHA2_SRC} \
				${LIBICP_SKEIN_SRC} ${LIBICP_API_SRC} ${LIBICP_ASM_AES_SRC} \
				${LIBICP_ASM_MODES_SRC} ${LIBICP_ASM_SHA1_SRC} ${LIBICP_ASM_SHA2_SRC} \
				${LIBICP_CORE_SRC} ${LIBICP_IO_SRC} ${LIBICP_OS_SRC} ${LIBICP_SPI_SRC}

LIBSHARE_SRC = lib/libshare/libshare.c \
				lib/libshare/os/linux/nfs.c \
				lib/libshare/os/linux/smb.c

LIBSPL_OS_SRC = lib/libspl/os/linux/getexecname.c \
				lib/libspl/os/linux/gethostid.c \
				lib/libspl/os/linux/getmntany.c \
				lib/libspl/os/linux/zone.c

LIBSPL_SRC = lib/libspl/assert.c \
				lib/libspl/atomic.c \
				lib/libspl/list.c \
				lib/libspl/mkdirp.c \
				lib/libspl/page.c \
				lib/libspl/strlcat.c \
				lib/libspl/strlcpy.c \
				lib/libspl/timestamp.c \
				${LIBSPL_OS_SRC}

LIBTPOOL_SRC = lib/libtpool/thread_pool.c

ZSTD_LIB_SRC = module/zstd/lib/zstd.c

ZSTD_SRC = module/zstd/zfs_zstd.c \
			${ZSTD_LIB_SRC}

LIBEFI_SRC = lib/libefi/rdwr_efi.c

LIBNVPAIR_MOD_SRC = module/nvpair/fnvpair.c \
				module/nvpair/nvpair.c \
				module/nvpair/nvpair_alloc_fixed.c

LIBNVPAIR_SRC = lib/libnvpair/libnvpair.c \
				lib/libnvpair/libnvpair_json.c \
				lib/libnvpair/nvpair_alloc_system.c \
				${LIBNVPAIR_MOD_SRC}

LIBZUTIL_OS_SRC = lib/libzutil/os/linux/zutil_compat.c \
				lib/libzutil/os/linux/zutil_device_path_os.c \
				lib/libzutil/os/linux/zutil_import_os.c

LIBZUTIL_SRC = lib/libzutil/zutil_device_path.c \
				lib/libzutil/zutil_import.c \
				lib/libzutil/zutil_nicenum.c \
				lib/libzutil/zutil_pool.c \
				${LIBZUTIL_OS_SRC}

UNICODE_SRC = module/unicode/u8_textprep.c \
				module/unicode/uconv.c

LIBUUTIL_SRC = lib/libuutil/uu_alloc.c \
				lib/libuutil/uu_avl.c \
				lib/libuutil/uu_dprintf.c \
				lib/libuutil/uu_ident.c \
				lib/libuutil/uu_list.c \
				lib/libuutil/uu_misc.c \
				lib/libuutil/uu_open.c \
				lib/libuutil/uu_pname.c \
				lib/libuutil/uu_string.c

LIBZFS_CORE_SRC = lib/libzfs_core/libzfs_core.c

LIBZFS_OS_SRC = lib/libzfs/os/linux/libzfs_mount_os.c \
				lib/libzfs/os/linux/libzfs_pool_os.c \
				lib/libzfs/os/linux/libzfs_sendrecv_os.c \
				lib/libzfs/os/linux/libzfs_util_os.c \

LIBZFS_SHA2_SRC = module/icp/algs/sha2/sha2.c \

ZCOMMON_SRC = module/zcommon/cityhash.c \
				module/zcommon/zfeature_common.c \
				module/zcommon/zfs_comutil.c \
				module/zcommon/zfs_deleg.c \
				module/zcommon/zfs_fletcher.c \
				module/zcommon/zfs_fletcher_aarch64_neon.c \
				module/zcommon/zfs_fletcher_avx512.c \
				module/zcommon/zfs_fletcher_intel.c \
				module/zcommon/zfs_fletcher_sse.c \
				module/zcommon/zfs_fletcher_superscalar.c \
				module/zcommon/zfs_fletcher_superscalar4.c \
				module/zcommon/zfs_namecheck.c \
				module/zcommon/zfs_prop.c \
				module/zcommon/zpool_prop.c \
				module/zcommon/zprop_common.c

LIBZFS_SRC = lib/libzfs/libzfs_changelist.c \
				lib/libzfs/libzfs_config.c \
				lib/libzfs/libzfs_crypto.c \
				lib/libzfs/libzfs_dataset.c \
				lib/libzfs/libzfs_diff.c \
				lib/libzfs/libzfs_import.c \
				lib/libzfs/libzfs_iter.c \
				lib/libzfs/libzfs_mount.c \
				lib/libzfs/libzfs_pool.c \
				lib/libzfs/libzfs_sendrecv.c \
				lib/libzfs/libzfs_status.c \
				lib/libzfs/libzfs_util.c \
				${LIBZFS_OS_SRC} \
				${LIBZFS_SHA2_SRC} \
				${ZCOMMON_SRC}

LIBZPOOL_LUA_SRC = module/lua/lapi.c \
					module/lua/lauxlib.c \
					module/lua/lbaselib.c \
					module/lua/lcode.c \
					module/lua/lcompat.c \
					module/lua/lcorolib.c \
					module/lua/lctype.c \
					module/lua/ldebug.c \
					module/lua/ldo.c \
					module/lua/lfunc.c \
					module/lua/lgc.c \
					module/lua/llex.c \
					module/lua/lmem.c \
					module/lua/lobject.c \
					module/lua/lopcodes.c \
					module/lua/lparser.c \
					module/lua/lstate.c \
					module/lua/lstring.c \
					module/lua/lstrlib.c \
					module/lua/ltable.c \
					module/lua/ltablib.c \
					module/lua/ltm.c \
					module/lua/lvm.c \
					module/lua/lzio.c \

LIBZPOOL_OS_SRC = module/os/linux/zfs/abd_os.c \
					module/os/linux/zfs/arc_os.c \
					module/os/linux/zfs/trace.c \
					module/os/linux/zfs/vdev_file.c \
					module/os/linux/zfs/zfs_debug.c \
					module/os/linux/zfs/zfs_racct.c \
					module/os/linux/zfs/zfs_znode.c \
					module/os/linux/zfs/zio_crypt.c \

LIBZPOOL_ZFS_SRC = module/zfs/abd.c \
				module/zfs/aggsum.c \
				module/zfs/arc.c \
				module/zfs/blkptr.c \
				module/zfs/bplist.c \
				module/zfs/bpobj.c \
				module/zfs/bptree.c \
				module/zfs/bqueue.c \
				module/zfs/btree.c \
				module/zfs/dbuf.c \
				module/zfs/dbuf_stats.c \
				module/zfs/ddt.c \
				module/zfs/ddt_zap.c \
				module/zfs/dmu.c \
				module/zfs/dmu_diff.c \
				module/zfs/dmu_object.c \
				module/zfs/dmu_objset.c \
				module/zfs/dmu_recv.c \
				module/zfs/dmu_redact.c \
				module/zfs/dmu_send.c \
				module/zfs/dmu_traverse.c \
				module/zfs/dmu_tx.c \
				module/zfs/dmu_zfetch.c \
				module/zfs/dnode.c \
				module/zfs/dnode_sync.c \
				module/zfs/dsl_bookmark.c \
				module/zfs/dsl_crypt.c \
				module/zfs/dsl_dataset.c \
				module/zfs/dsl_deadlist.c \
				module/zfs/dsl_deleg.c \
				module/zfs/dsl_destroy.c \
				module/zfs/dsl_dir.c \
				module/zfs/dsl_pool.c \
				module/zfs/dsl_prop.c \
				module/zfs/dsl_scan.c \
				module/zfs/dsl_synctask.c \
				module/zfs/dsl_userhold.c \
				module/zfs/edonr_zfs.c \
				module/zfs/fm.c \
				module/zfs/gzip.c \
				module/zfs/hkdf.c \
				module/zfs/lz4.c \
				module/zfs/lzjb.c \
				module/zfs/metaslab.c \
				module/zfs/mmp.c \
				module/zfs/multilist.c \
				module/zfs/objlist.c \
				module/zfs/pathname.c \
				module/zfs/range_tree.c \
				module/zfs/refcount.c \
				module/zfs/rrwlock.c \
				module/zfs/sa.c \
				module/zfs/sha256.c \
				module/zfs/skein_zfs.c \
				module/zfs/spa.c \
				module/zfs/spa_boot.c \
				module/zfs/spa_checkpoint.c \
				module/zfs/spa_config.c \
				module/zfs/spa_errlog.c \
				module/zfs/spa_history.c \
				module/zfs/spa_log_spacemap.c \
				module/zfs/spa_misc.c \
				module/zfs/spa_stats.c \
				module/zfs/space_map.c \
				module/zfs/space_reftree.c \
				module/zfs/txg.c \
				module/zfs/uberblock.c \
				module/zfs/unique.c \
				module/zfs/vdev.c \
				module/zfs/vdev_cache.c \
				module/zfs/vdev_draid.c \
				module/zfs/vdev_draid_rand.c \
				module/zfs/vdev_indirect.c \
				module/zfs/vdev_indirect_births.c \
				module/zfs/vdev_indirect_mapping.c \
				module/zfs/vdev_initialize.c \
				module/zfs/vdev_label.c \
				module/zfs/vdev_mirror.c \
				module/zfs/vdev_missing.c \
				module/zfs/vdev_queue.c \
				module/zfs/vdev_raidz.c \
				module/zfs/vdev_raidz_math.c \
				module/zfs/vdev_raidz_math_aarch64_neon.c \
				module/zfs/vdev_raidz_math_aarch64_neonx2.c \
				module/zfs/vdev_raidz_math_avx2.c \
				module/zfs/vdev_raidz_math_avx512bw.c \
				module/zfs/vdev_raidz_math_avx512f.c \
				module/zfs/vdev_raidz_math_powerpc_altivec.c \
				module/zfs/vdev_raidz_math_scalar.c \
				module/zfs/vdev_raidz_math_sse2.c \
				module/zfs/vdev_raidz_math_ssse3.c \
				module/zfs/vdev_rebuild.c \
				module/zfs/vdev_removal.c \
				module/zfs/vdev_root.c \
				module/zfs/vdev_trim.c \
				module/zfs/zap.c \
				module/zfs/zap_leaf.c \
				module/zfs/zap_micro.c \
				module/zfs/zcp.c \
				module/zfs/zcp_get.c \
				module/zfs/zcp_global.c \
				module/zfs/zcp_iter.c \
				module/zfs/zcp_set.c \
				module/zfs/zcp_synctask.c \
				module/zfs/zfeature.c \
				module/zfs/zfs_byteswap.c \
				module/zfs/zfs_fm.c \
				module/zfs/zfs_fuid.c \
				module/zfs/zfs_ratelimit.c \
				module/zfs/zfs_rlock.c \
				module/zfs/zfs_sa.c \
				module/zfs/zil.c \
				module/zfs/zio.c \
				module/zfs/zio_checksum.c \
				module/zfs/zio_compress.c \
				module/zfs/zio_inject.c \
				module/zfs/zle.c \
				module/zfs/zrlock.c \
				module/zfs/zthr.c

LIBZPOOL_SRC = lib/libzpool/kernel.c \
				lib/libzpool/taskq.c \
				lib/libzpool/util.c \
				${ZCOMMON_SRC} \
				${LIBZPOOL_LUA_SRC} \
				${LIBZPOOL_OS_SRC} \
				${LIBZPOOL_ZFS_SRC}

BOOTENV_SRC = lib/libzfsbootenv/lzbe_device.c \
				lib/libzfsbootenv/lzbe_pair.c \
				lib/libzfsbootenv/lzbe_util.c

ZFS_SRC = cmd/zfs/zfs_iter.c \
			cmd/zfs/zfs_main.c \
			cmd/zfs/zfs_project.c

ZPOOL_OS_SRC = cmd/zpool/os/linux/zpool_vdev_os.c

ZPOOL_SRC = cmd/zpool/zpool_iter.c \
				cmd/zpool/zpool_main.c \
				cmd/zpool/zpool_util.c \
				cmd/zpool/zpool_vdev.c \
				${ZPOOL_OS_SRC}

ZDB_SRC = cmd/zdb/zdb.c \
			cmd/zdb/zdb_il.c

ZHACK_SRC = cmd/zhack/zhack.c

ZINJECT_SRC = cmd/zinject/translate.c \
				cmd/zinject/zinject.c

ZSTREAM_SRC = cmd/zstream/zstream.c \
				cmd/zstream/zstream_dump.c \
				cmd/zstream/zstream_redup.c \
				cmd/zstream/zstream_token.c

ZTEST_SRC = cmd/ztest/ztest.c

RAIDZ_TEST_SRC = cmd/raidz_test/raidz_test.c \
					cmd/raidz_test/raidz_bench.c

ZFS_IDS_SRC = cmd/zfs_ids_to_path/zfs_ids_to_path.c

ZPOOL_INFLUXDB_SRC = cmd/zpool_influxdb/zpool_influxdb.c

MOUNT_ZFS_SRC = cmd/mount_zfs/mount_zfs.c

ZED_AGENTS_SRC = cmd/zed/agents/fmd_api.c \
					cmd/zed/agents/fmd_serd.c \
					cmd/zed/agents/zfs_agents.c \
					cmd/zed/agents/zfs_diagnosis.c \
					cmd/zed/agents/zfs_mod.c \
					cmd/zed/agents/zfs_retire.c \

ZED_SRC = cmd/zed/zed.c \
			cmd/zed/zed_conf.c \
			cmd/zed/zed_disk_event.c \
			cmd/zed/zed_event.c \
			cmd/zed/zed_exec.c \
			cmd/zed/zed_file.c \
			cmd/zed/zed_log.c \
			cmd/zed/zed_strings.c \
			${ZED_AGENTS_SRC}

ZGENHOSTID_OBJ = cmd/zgenhostid/zgenhostid.c

.DEFAULT: all

all: progs libs

progs: zfs zpool zdb zhack zinject zstream ztest raidz_test zfs_ids_to_path zpool_influxdb mount.zfs zed zgenhostid

libs: libavl.a libicp.a libshare.a libspl.a libtpool.a libefi.a libnvpair.a libzutil.a libunicode.a libuutil.a libzfs_core.a libzfs.a libzpool.a libzfsbootenv.a libzstd.a

LIBAVL_OBJ : ${LIBAVL_SRC}
	${CC} ${FLAGS} ${GARBOLIBS} -c -o $< ${LIBAV_SRC}

LIBIPC_OBJ : ${LIBIPC_SRC}
LIBSHARE_OBJ : ${LIBSHARE_SRC}
LIBSPL_OBJ : ${LIBSPL_SRC}
LIBTPOOL_OBJ : ${LIBTPOOL_SRC}
ZSTD_OBJ : ${ZSTD_SRC}
LIBEFI_OBJ : ${LIBEFI_SRC}
LIBNVPAIR_OBJ : ${LIBNVPAIR_SRC}
LIBZUTIL_OBJ : ${LIBZUTIL_SRC}
UNICODE_OBJ : ${UNICODE_SRC}
LIBUUTIL_OBJ : ${LIBUUTIL_SRC}
LIBZFS_CORE_OBJ : ${LIBZFS_CORE_SRC}
LIBZFS_OBJ : ${LIBZFS_SRC}
LIBZPOOL_OBJ : ${LIBZPOOL_SRC}
BOOTENV_OBJ : ${BOOTENV_SRC}
ZFS_OBJ : ${ZFS_SRC}
ZPOOL_OBJ : ${ZPOOL_SRC}
ZDB_OBJ : ${ZDB_SRC}
ZHACK_OBJ : ${ZHACK_SRC}
ZINJECT_OBJ : ${ZINJECT_SRC}
ZSTREAM_OBJ : ${ZSTREAM_SRC}
ZTEST_OBJ : ${ZTEST_SRC}
RAIDZ_TEST_OBJ : ${RAIDZ_TEST_SRC}
ZFS_IDS_OBJ : ${ZFS_IDS_SRC}
ZPOOL_INFLUXDB_OBJ : ${ZPOOL_INFLUXDB_SRC}
MOUNT_ZFS_OBJ : ${MOUNT_ZFS_SRC}
ZED_OBJ : ${ZED_SRC}
ZGENHOSTID_OBJ : ${ZGENHOSTID_SRC}

LIBAVL_OBJ: ${LIBAVL_SRC}
	${CC} ${FLAGS} -o $@ $<
libavl.a: ${LIBAVL_OBJ}
	${CC} ${FLAGS} --static -o $@ ${LIBAVL_OBJ}

libicp.a: ${LIBICP_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${LIBICP_OBJ}

libshare.a: ${LIBSHARE_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${LIBSHARE_OBJ}

libspl.a: ${LIBSPL_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${LIBSPL_OBJ}

libtpool.a: ${LIBTPOOL_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${LIBTPOOL_OBJ}

libefi.a: ${LIBEFI_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} -Igarbo/usr/include --static -o $@ ${LIBEFI_OBJ} -luuid -lz

libnvpair.a: ${LIBNVPAIR_OBJ} libspl.a
	${CC} ${FLAGS} ${GARBOLIBS} -Igarbo/usr/include/tirpc -Wl,-z,defs -version-info 3:0:0 --static -o $@ -rpath /usr/lib ${LIBNVPAIR_OBJ} libspl.a -ltirpc

libzutil.a: ${LIBZUTIL_OBJ} libavl.a libtpool.a libnvpair.a libspl.a libefi.a
	${CC} ${FLAGS} ${GARBOLIBS} -Igarbo/usr/include --static -o $@ ${LIBZUTIL_OBJ} libavl.a libtpool.a libnvpair.a libspl.a libefi.a -lrt -lm -lblkid -ludev

libunicode.a: ${UNICODE_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${UNICODE_OBJ}

libuutil.a: ${LIBUUTIL_OBJ} libavl.a libspl.a
	${CC} ${FLAGS} ${GARBOLIBS} -pthread -Wl,-z-defs -version-info 3:0:0 --static -o $@ -rpath /usr/lib ${LIBUUTIL_OBJ}  libavl.a libspl.a

libzfs_core.a: ${LIBZFS_CORE_OBJ} libzutil.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} -pthread -Wl,-z-defs -version-info 3:0:0 --static -o $@ -rpath /usr/lib ${LIBZFS_CORE_OBJ}  libzutil.a libnvpair.a

libzfs.a: ${LIBZFS_OBJ} libshare.a libzfs_core.a libnvpair.a libuutil.a
	${CC} ${FLAGS} ${GARBOLIBS} -pthread -Wl,-z-defs -version-info 5:0:1 --static -o $@ -rpath /usr/lib ${LIBZFS_OBJ} libshare.a libzfs_core.a libnvpair.a libuutil.a -lm -lcrypto -lz

libzstd.a: ${ZSTD_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZSTD_OBJ}

libzpool.a: ${LIBZPOOL_OBJ} libicp.a libunicode.a libzfs_core.a libnvpair.a libzstd.a
	${CC} ${FLAGS} ${GARBOLIBS} -pthread -Wl,-z-defs -version-info 5:0:0 --static -o $@ -rpath /usr/lib ${LIBZPOOL_OBJ} libicp.a libunicode.a libzfs_core.a libnvpair.a libzstd.a -lz -ldl -lm

libzfsbootenv.a: ${BOOTENV_OBJ} libzfs.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} -Wl,-z-defs -version-info 1:0:0 --static -o $@ -rpath /usr/lib ${BOOTENV_OBJ} libzfs.a libnvpair.a

zfs: ${ZFS_OBJ} libzfs.a libzfs_core.a libnvpair.a libuutil.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZFS_OBJ} libzfs.a libzfs_core.a libnvpair.a libuutil.a

zpool: ${ZPOOL_OBJ} libzfs.a libzfs_core.a libnvpair.a libuutil.a
	${CC} ${FLAGS} ${GARBOLIBS} -Igarbo/usr/include --static -o $@ ${ZPOOL_OBJ} libzfs.a libzfs_core.a libnvpair.a libuutil.a -lm -lblkid -luuid

zdb: ${ZDB_OBJ} libzpool.a libzfs_core.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZDB_OBJ} libzpool.a libzfs_core.a libnvpair.a

zhack: ${ZHACK_OBJ} libzpool.a libzfs_core.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZHACK_OBJ} libzpool.a libzfs_core.a libnvpair.a

zinject: ${ZINJECT_OBJ} libzfs.a libzfs_core.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZINJECT_OBJ} libzfs.a libzfs_core.a libnvpair.a

zstream: ${ZSTREAM_OBJ} libzfs.a libzfs_core.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZSTREAM_OBJ} libzfs.a libzfs_core.a libnvpair.a

ztest: ${ZTEST_OBJ} libzpool.a libzfs_core.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZTEST_OBJ} libzfs.a libzfs_core.a libnvpair.a -lm

raidz_test: ${RAIDZ_TEST_OBJ} libzpool.a libzfs_core.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${RAIDZ_TEST_OBJ} libzpool.a libzfs_core.a -lm

zfs_ids_to_path: ${ZFS_IDS_OBJ} libzfs.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZFS_IDS_OBJ} libzpool.a

zpool_influxdb: ${ZPOOL_INFLUXDB_OBJ} libspl.a libnvpair.a libzfs.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZPOOL_INFLUXDB_OBJ} libspl.a libnvpair.a libzfs.a

mount.zfs: ${MOUNT_ZFS_OBJ} libzfs.a libzfs_core.a libnvpair.a
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${MOUNT_ZFS_OBJ} libzfs.a libzfs_core.a libnvpair.a

zed: ${ZED_OBJ} libzfs.a libzfs_core.a libnvpair.a libuutil.a
	${CC} ${FLAGS} ${GARBOLIBS} -pthread --static -o $@ ${ZED_OBJ} libzfs.a libzfs_core.a libnvpair.a libuutil.a -lrt ludev -luuid

zgenhostid: ${ZGENHOSTID_OBJ}
	${CC} ${FLAGS} ${GARBOLIBS} --static -o $@ ${ZGENHOSTID_OBJ}

clean:
	find . -name '*.lo' -exec rm -f {} \;

install:
	echo tbd
