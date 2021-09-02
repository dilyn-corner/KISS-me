lib/libshare/libshare.o:
	${CC} ${FLAGS} -Ilib/libshare -c -o $@ $<
lib/libshare/os/linux/nfs.o:
	${CC} ${FLAGS} -Ilib/libshare -c -o $@ $<
lib/libshare/os/linux/smb.o:
	${CC} ${FLAGS} -Ilib/libshare -c -o $@ $<

module/zstd/lib/zstd.o:
	${CC} ${FLAGS} -fno-tree-vectorize -c -o $@ $<
module/zstd/zfs_zstd.o:
	${CC} ${FLAGS} -fno-tree-vectorize -c -o $@ $<

lib/libefi/rdwr_efi.o:
	${CC} ${FLAGS} ${LIBUUID_CFLAGS} -c -o $@ $<

module/nvpair/fnvpair.o:
	${CC} ${FLAGS} ${LIBTIRPC_CFLAGS} -c -o $@ $<
module/nvpair/nvpair.o:
	${CC} ${FLAGS} ${LIBTIRPC_CFLAGS} -c -o $@ $<
module/nvpair/nvpair_alloc_fixed.o:
	${CC} ${FLAGS} ${LIBTIRPC_CFLAGS} -c -o $@ $<
lib/libnvpair/libnvpair.o:
	${CC} ${FLAGS} ${LIBTIRPC_CFLAGS} -c -o $@ $<
lib/libnvpair/libnvpair_json.o:
	${CC} ${FLAGS} ${LIBTIRPC_CFLAGS} -c -o $@ $<
lib/libnvpair/nvpair_alloc_system.o:
	${CC} ${FLAGS} ${LIBTIRPC_CFLAGS} -c -o $@ $<

lib/libzutil/os/linux/zutil_compat.o:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -c -o $@ $<
lib/libzutil/os/linux/zutil_device_path_os.o:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -c -o $@ $<
lib/libzutil/os/linux/zutil_import_os.o:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -c -o $@ $<
lib/libzutil/zutil_device_path.o:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -c -o $@ $<
lib/libzutil/zutil_import.o:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -c -o $@ $<
lib/libzutil/zutil_nicenum.o:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -c -o $@ $<
lib/libzutil/zutil_pool.o:
	${CC} ${FLAGS} ${LIBBLKID_CFLAGS} -c -o $@ $<

module/lua/lapi.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lauxlib.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lbaselib.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lcode.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lcompat.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lcorolib.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lctype.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/ldebug.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/ldo.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lfunc.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lgc.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/llex.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lmem.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lobject.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lopcodes.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lparser.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lstate.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lstring.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lstrlib.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/ltable.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/ltablib.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/ltm.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lvm.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/lua/lzio.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/abd_os.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/arc_os.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/trace.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/vdev_file.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/zfs_debug.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/zfs_racct.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/zfs_znode.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/os/linux/zfs/zio_crypt.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/abd.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/aggsum.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/arc.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/blkptr.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/bplist.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/bpobj.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/bptree.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/bqueue.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/btree.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dbuf.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dbuf_stats.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/ddt.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/ddt_zap.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_diff.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_object.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_objset.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_recv.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_redact.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_send.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_traverse.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_tx.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dmu_zfetch.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dnode.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dnode_sync.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_bookmark.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_crypt.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_dataset.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_deadlist.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_deleg.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_destroy.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_dir.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_pool.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_prop.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_scan.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_synctask.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/dsl_userhold.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/edonr_zfs.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/fm.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/gzip.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/hkdf.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/lz4.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/lzjb.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/metaslab.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/mmp.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/multilist.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/objlist.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/pathname.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/range_tree.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/refcount.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/rrwlock.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/sa.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/sha256.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/skein_zfs.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_boot.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_checkpoint.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_config.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_errlog.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_history.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_log_spacemap.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_misc.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/spa_stats.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/space_map.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/space_reftree.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/txg.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/uberblock.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/unique.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_cache.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_draid.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_draid_rand.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_indirect.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_indirect_births.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_indirect_mapping.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_initialize.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_label.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_mirror.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_missing.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_queue.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_aarch64_neon.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_aarch64_neonx2.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_avx2.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_avx512bw.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_avx512f.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_powerpc_altivec.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_scalar.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_sse2.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_raidz_math_ssse3.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_rebuild.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_removal.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_root.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/vdev_trim.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zap.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zap_leaf.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zap_micro.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zcp.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zcp_get.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zcp_global.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zcp_iter.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zcp_set.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zcp_synctask.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zfeature.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zfs_byteswap.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zfs_fm.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zfs_fuid.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zfs_ratelimit.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zfs_rlock.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zfs_sa.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zil.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zio.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zio_checksum.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zio_compress.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zio_inject.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zle.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zrlock.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
module/zfs/zthr.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
lib/libzpool/kernel.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
lib/libzpool/taskq.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<
lib/libzpool/util.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs ${XDEBUGFLAGS} -DLIB_ZPOOL_BUILD -c -o $@ $<

lib/libzfsbootenv/lzbe_device.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs -c -o $@ $<
lib/libzfsbootenv/lzbe_pair.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs -c -o $@ $<
lib/libzfsbootenv/lzbe_util.o:
	${CC} ${FLAGS} -Iinclude/os/linux/zfs -c -o $@ $<

cmd/zfs/zfs_iter.o:
	${CC} ${FLAGS} -Icmd/zfs -c -o $@ $<
cmd/zfs/zfs_main.o:
	${CC} ${FLAGS} -Icmd/zfs -c -o $@ $<
cmd/zfs/zfs_project.o:
	${CC} ${FLAGS} -Icmd/zfs -c -o $@ $<

cmd/zpool/os/linux/zpool_vdev_os.o:
	${CC} ${FLAGS} -Icmd/zpool -c -o $@ $<
cmd/zpool/zpool_iter.o:
	${CC} ${FLAGS} -Icmd/zpool -c -o $@ $<
cmd/zpool/zpool_main.o:
	${CC} ${FLAGS} -Icmd/zpool -c -o $@ $<
cmd/zpool/zpool_util.o:
	${CC} ${FLAGS} -Icmd/zpool -c -o $@ $<
cmd/zpool/zpool_vdev.o:
	${CC} ${FLAGS} -Icmd/zpool -c -o $@ $<

cmd/zdb/zdb.o:
	${CC} ${FLAGS} ${XDEBUFLAGS} -c -o $@ $<
cmd/zdb/zdb_il.o:
	${CC} ${FLAGS} ${XDEBUFLAGS} -c -o $@ $<

cmd/zhack/zhack.o:
	${CC} ${FLAGS} ${XDEBUFLAGS} -c -o $@ $<

cmd/ztest/ztest.o:
	${CC} ${FLAGS} ${XDEBUFLAGS} -c -o $@ $<

cmd/raidz_test/raidz_test.o:
	${CC} ${FLAGS} ${XDEBUFLAGS} -c -o $@ $<
cmd/raidz_test/raidz_bench.o:
	${CC} ${FLAGS} ${XDEBUFLAGS} -c -o $@ $<
