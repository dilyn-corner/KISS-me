.POSIX:

PREFIX ?= /usr/local
LIBDIR ?= ${PREFIX}/lib
INCDIR ?= ${PREFIX}/include
PKGCONFDIR ?= ${LIBDIR}/pkgconfig

CC ?= cc
AR ?= ar

XCFLAGS = -fPIC -m64 -ffunction-sections -fdata-sections -pthread

XCPPFLAGS= -UDEBUG -DLINUX -Dlinux -DXP_UNIX -DNSS_NO_GCC48 -DNDEBUG \
	-D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -DSDB_MEASURE_USE_TEMP_DIR \
	-DNSS_NO_INIT_SUPPORT -DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT \
	-DHAVE_STRERROR -DSSL_DISABLE_DEPRECATED_CIPHER_SUITE_NAMES

NSSCPP = -DNSS_SHLIB_VERSION=\"3\" -DSHLIB_PREFIX=\"lib\" \
	-DSHLIB_SUFFIX=\"so\" -DSOFTOKEN_SHLIB_VERSION=\"3\" -DMOZILLA_CLIENT=1 \
	-DNSS_X64 -DNSS_X86_OR_X64

NSSINCLUDES = -I../dist/build/include -I../dist/build/include/public \
	-I../dist/build/include/private -I../dist/build/include/private/nss \
	-I../dist/build/include/public/nss

NSSFLAGS = ${XCFLAGS} ${XCPPFLAGS} ${NSSCPP} ${NSSINCLUDES}

FLAGS = -std=c99 ${NSSFLAGS} ${CFLAGS} ${CPPFLAGS} ${LDFLAGS}

STA_FLAGS = ${FLAGS} -DNSS_USE_STATIC_LIBS
SHA_FLAGS = ${FLAGS} -DSHLIB_SUFFIX=\"so\" -DSHLIB_PREFIX=\"lib\" 

FRCC = -std=c99 -O2 -fPIC -m64 -pipe -ffunction-sections -fdata-sections

FRCPP = -DHAVE_STRERROR -DLINUX -Dlinux -DNSS_NO_GCC48 -DXP_UNIX -UDEBUG \
	-DNDEBUG -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE -DNSS_X64 \
	-DSDB_MEASURE_USE_TEMP_DIR -DRIJNDAEL_INCLUDE_TABLES -DNSS_USE_64 \
	-DNSS_NO_INIT_SUPPORT -DUSE_UTIL_DIRECTLY -DNO_NSPR_10_SUPPORT \
	-DSSL_DISABLE_DEPRECATED_CIPHER_SUITE_NAMES -DFREEBL_NO_DEPEND \
	-DFREEBL_LOWHASH -DNSS_X86_OR_X64 -DUSE_HW_SHA2 -DNSS_BEVAND_ARCFOUR \
	-DMPI_AMD64 -DMP_ASSEMBLY_MULTIPLY -DNSS_USE_COMBA -DMP_API_COMPATIBLE \
	-DMP_IS_LITTLE_ENDIAN -DUSE_HW_AES -DINTEL_GCM -DHAVE_INT128_SUPPORT \
	-D_REENTRANT -DSHLIB_SUFFIX=\"so\" -DSHLIB_PREFIX=\"lib\" \
	-DSHLIB_VERSION=\"3\" -DSOFTOKEN_SHLIB_VERSION=\"3\"

FRINC = -I../dist/build/include -I../dist/build/include/public/nss \
	-I../dist/build/include/private/nss -Ilib/freebl/mpi -Ilib/freebl/ecl \
	-Ilib/freebl/verified -Ilib/freebl/verified/kremlin/include \
	-Ilib/freebl/verified/kremlin/kremlib/dist/minimal \
	-Ilib/freebl/deprecated -Ilib/freebl

FREEBLFLAGS = ${FRCC} ${FRCPP} ${FRINC} ${NSSINCLUDES}

NSS_OBJ = ${BASE_OBJ} ${CERTDB_OBJ} ${CERTHIGH_OBJ} ${CRYPTOHI_OBJ} \
	${CERTSEL_OBJ} ${CHECKER_OBJ} ${CRLSEL_OBJ} ${DEV_OBJ} ${PARAMS_OBJ} ${RESULTS_OBJ} \
	${STORE_OBJ} ${PKI_OBJ} ${TOP_OBJ} ${PKIX_UTIL_OBJ} ${UTIL_OBJ} \
	${PKIX_PKI_OBJ} ${SYSTEM_OBJ} ${PK11WRAP_OBJ} ${MODULE_OBJ} ${NSS_A_OBJ} \
	${CKFW_OBJ} ${CKFW_BUILTIN_OBJ} ${CRMF_OBJ} ${JAR_OBJ} ${PKCS12_OBJ} \
	${PKCS7_OBJ} ${SMIME_OBJ} ${SSL_OBJ} ${SYSINIT_OBJ} ${DBM_OBJ} ${BL_OBJ} \
	${BL_API_OBJ} ${BL_X86_OBJ} ${BL_X86_SSE_OBJ} ${BL_GCM_SSE3_OBJ} \
	${BL_AVX_OBJ} ${BL_VEC_OBJ} ${BL_AVX2_OBJ} ${BL_POLY_AVX_OBJ} \
	${BL_POLY_AVX2_OBJ} ${BL_CPU_OBJ} ${FREEBL_OBJ} ${CKFW_TESTLIB_OBJ} \
	${LEGACYDB_OBJ} ${SOFTTOKEN_OBJ} ${CMD_OBJ} ${SHA_BIN_OBJ}

LIBNSS_OBJ = ${NSS_A_OBJ} ${CERTHIGH_OBJ} ${CRYPTOHI_OBJ} ${PK11WRAP_OBJ} \
	${CERTDB_OBJ} ${PKI_OBJ} ${DEV_OBJ} ${BASE_OBJ} ${CERTSEL_OBJ} ${CHECKER_OBJ} \
	${PARAMS_OBJ} ${RESULTS_OBJ} ${TOP_OBJ} ${PKIX_UTIL_OBJ} ${CRLSEL_OBJ} \
	${STORE_OBJ} ${PKIX_PKI_OBJ} ${SYSTEM_OBJ} ${MODULE_OBJ}

BASE_OBJ = lib/base/arena.o lib/base/error.o lib/base/errorval.o \
	lib/base/hash.o lib/base/hashops.o lib/base/item.o lib/base/libc.o \
	lib/base/list.o lib/base/tracker.o lib/base/utf8.o

CERTDB_OBJ = lib/certdb/alg1485.o lib/certdb/certdb.o \
	lib/certdb/certv3.o lib/certdb/certxutl.o lib/certdb/crl.o \
	lib/certdb/genname.o lib/certdb/polcyxtn.o lib/certdb/secname.o \
	lib/certdb/stanpcertdb.o lib/certdb/xauthkid.o lib/certdb/xbsconst.o \
	lib/certdb/xconst.o

CERTHIGH_OBJ = lib/certhigh/certhigh.o lib/certhigh/certhtml.o \
	lib/certhigh/certreq.o lib/certhigh/certvfy.o lib/certhigh/certvfypkix.o \
	lib/certhigh/crlv2.o lib/certhigh/ocsp.o lib/certhigh/ocspsig.o \
	lib/certhigh/xcrldist.o

CRYPTOHI_OBJ = lib/cryptohi/dsautil.o lib/cryptohi/sechash.o \
	lib/cryptohi/seckey.o lib/cryptohi/secsign.o lib/cryptohi/secvfy.o

CERTSEL_OBJ = lib/libpkix/pkix/certsel/pkix_certselector.o \
	lib/libpkix/pkix/certsel/pkix_comcertselparams.o

CRLSEL_OBJ = lib/libpkix/pkix/crlsel/pkix_comcrlselparams.o \
	lib/libpkix/pkix/crlsel/pkix_crlselector.o

CHECKER_OBJ = lib/libpkix/pkix/checker/pkix_basicconstraintschecker.o \
	lib/libpkix/pkix/checker/pkix_certchainchecker.o \
	lib/libpkix/pkix/checker/pkix_crlchecker.o \
	lib/libpkix/pkix/checker/pkix_ekuchecker.o \
	lib/libpkix/pkix/checker/pkix_expirationchecker.o \
	lib/libpkix/pkix/checker/pkix_namechainingchecker.o \
	lib/libpkix/pkix/checker/pkix_nameconstraintschecker.o \
	lib/libpkix/pkix/checker/pkix_ocspchecker.o \
	lib/libpkix/pkix/checker/pkix_policychecker.o \
	lib/libpkix/pkix/checker/pkix_revocationchecker.o \
	lib/libpkix/pkix/checker/pkix_revocationmethod.o \
	lib/libpkix/pkix/checker/pkix_signaturechecker.o \
	lib/libpkix/pkix/checker/pkix_targetcertchecker.o

DEV_OBJ = lib/dev/ckhelper.o lib/dev/devslot.o \
	lib/dev/devtoken.o lib/dev/devutil.o

PARAMS_OBJ = lib/libpkix/pkix/params/pkix_procparams.o \
	lib/libpkix/pkix/params/pkix_resourcelimits.o \
	lib/libpkix/pkix/params/pkix_trustanchor.o \
	lib/libpkix/pkix/params/pkix_valparams.o

RESULTS_OBJ = lib/libpkix/pkix/results/pkix_buildresult.o \
	lib/libpkix/pkix/results/pkix_policynode.o \
	lib/libpkix/pkix/results/pkix_valresult.o \
	lib/libpkix/pkix/results/pkix_verifynode.o

STORE_OBJ = lib/libpkix/pkix/store/pkix_store.o
	
PKI_OBJ = lib/pki/asymmkey.o lib/pki/certdecode.o lib/pki/certificate.o \
	lib/pki/cryptocontext.o lib/pki/pki3hack.o lib/pki/pkibase.o \
	lib/pki/pkistore.o lib/pki/symmkey.o lib/pki/tdcache.o lib/pki/trustdomain.o

TOP_OBJ = lib/libpkix/pkix/top/pkix_build.o \
	lib/libpkix/pkix/top/pkix_lifecycle.o lib/libpkix/pkix/top/pkix_validate.o

PKIX_UTIL_OBJ = lib/libpkix/pkix/util/pkix_error.o \
	lib/libpkix/pkix/util/pkix_errpaths.o lib/libpkix/pkix/util/pkix_list.o \
	lib/libpkix/pkix/util/pkix_logger.o lib/libpkix/pkix/util/pkix_tools.o

UTIL_OBJ = lib/util/derdec.o lib/util/derenc.o lib/util/dersubr.o \
	lib/util/dertime.o lib/util/errstrs.o lib/util/nssb64d.o \
	lib/util/nssb64e.o lib/util/nssilock.o lib/util/nssrwlk.o \
	lib/util/oidstring.o lib/util/pkcs11uri.o lib/util/pkcs1sig.o \
	lib/util/portreg.o lib/util/quickder.o lib/util/secalgid.o \
	lib/util/secasn1d.o lib/util/secasn1e.o lib/util/secasn1u.o \
	lib/util/secdig.o lib/util/secitem.o lib/util/secload.o lib/util/secoid.o \
	lib/util/secport.o lib/util/sectime.o lib/util/templates.o lib/util/utf8.o \
	lib/util/utilmod.o lib/util/utilpars.o

PKIX_PKI_OBJ = lib/libpkix/pkix_pl_nss/pki/pkix_pl_basicconstraints.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_cert.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_certpolicyinfo.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_certpolicymap.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_certpolicyqualifier.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_crl.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_crldp.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_crlentry.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_date.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_generalname.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_infoaccess.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_nameconstraints.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocspcertid.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocsprequest.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocspresponse.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_publickey.o \
	lib/libpkix/pkix_pl_nss/pki/pkix_pl_x500name.o

SYSTEM_OBJ = lib/libpkix/pkix_pl_nss/system/pkix_pl_bigint.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_bytearray.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_common.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_error.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_hashtable.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_lifecycle.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_mem.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_monitorlock.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_mutex.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_object.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_oid.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_primhash.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_rwlock.o \
	lib/libpkix/pkix_pl_nss/system/pkix_pl_string.o

PK11WRAP_OBJ = lib/pk11wrap/dev3hack.o lib/pk11wrap/pk11akey.o \
	lib/pk11wrap/pk11auth.o lib/pk11wrap/pk11cert.o lib/pk11wrap/pk11cxt.o \
	lib/pk11wrap/pk11err.o lib/pk11wrap/pk11hpke.o lib/pk11wrap/pk11kea.o \
	lib/pk11wrap/pk11list.o lib/pk11wrap/pk11load.o lib/pk11wrap/pk11mech.o \
	lib/pk11wrap/pk11merge.o lib/pk11wrap/pk11nobj.o lib/pk11wrap/pk11obj.o \
	lib/pk11wrap/pk11pars.o lib/pk11wrap/pk11pbe.o lib/pk11wrap/pk11pk12.o \
	lib/pk11wrap/pk11pqg.o lib/pk11wrap/pk11sdr.o lib/pk11wrap/pk11skey.o \
	lib/pk11wrap/pk11slot.o lib/pk11wrap/pk11util.o

MODULE_OBJ = lib/libpkix/pkix_pl_nss/module/pkix_pl_aiamgr.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_colcertstore.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_httpcertstore.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_httpdefaultclient.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapcertstore.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_ldaprequest.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapresponse.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_ldaptemplates.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_nsscontext.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_pk11certstore.o \
	lib/libpkix/pkix_pl_nss/module/pkix_pl_socket.o

NSS_A_OBJ = lib/nss/nssinit.o lib/nss/nssoptions.o lib/nss/nssver.o \
	lib/nss/utilwrap.o

CKFW_OBJ = lib/ckfw/crypto.o lib/ckfw/find.o lib/ckfw/hash.o \
	lib/ckfw/instance.o lib/ckfw/mechanism.o lib/ckfw/mutex.o lib/ckfw/object.o \
	lib/ckfw/session.o lib/ckfw/sessobj.o lib/ckfw/slot.o lib/ckfw/token.o \
	lib/ckfw/wrap.o

CKFW_BUILTIN_OBJ = lib/ckfw/builtins/anchor.o lib/ckfw/builtins/bfind.o \
	lib/ckfw/builtins/binst.o lib/ckfw/builtins/bobject.o \
	lib/ckfw/builtins/bsession.o lib/ckfw/builtins/bslot.o \
	lib/ckfw/builtins/btoken.o lib/ckfw/builtins/ckbiver.o \
	lib/ckfw/builtins/constants.o lib/ckfw/builtins/certdata.o

CRMF_OBJ = lib/crmf/asn1cmn.o lib/crmf/challcli.o lib/crmf/cmmfasn1.o \
	lib/crmf/cmmfchal.o lib/crmf/cmmfrec.o lib/crmf/cmmfresp.o \
	lib/crmf/crmfcont.o lib/crmf/crmfdec.o lib/crmf/crmfenc.o \
	lib/crmf/crmfget.o lib/crmf/crmfpop.o lib/crmf/crmfreq.o \
	lib/crmf/crmftmpl.o lib/crmf/encutil.o lib/crmf/respcli.o \
	lib/crmf/respcmn.o lib/crmf/servget.o

JAR_OBJ = lib/jar/jar-ds.o lib/jar/jar.o lib/jar/jarfile.o lib/jar/jarint.o \
	lib/jar/jarsign.o lib/jar/jarver.o

PKCS12_OBJ = lib/pkcs12/p12creat.o lib/pkcs12/p12d.o \
	lib/pkcs12/p12dec.o lib/pkcs12/p12e.o lib/pkcs12/p12local.o \
	lib/pkcs12/p12plcy.o lib/pkcs12/p12tmpl.o

PKCS7_OBJ = lib/pkcs7/certread.o lib/pkcs7/p7common.o lib/pkcs7/p7create.o \
	lib/pkcs7/p7decode.o lib/pkcs7/p7encode.o lib/pkcs7/p7local.o \
	lib/pkcs7/secmime.o

SMIME_OBJ = lib/smime/cmsarray.o lib/smime/cmsasn1.o lib/smime/cmsattr.o \
	lib/smime/cmscinfo.o lib/smime/cmscipher.o lib/smime/cmsdecode.o \
	lib/smime/cmsdigdata.o lib/smime/cmsdigest.o lib/smime/cmsencdata.o \
	lib/smime/cmsencode.o lib/smime/cmsenvdata.o lib/smime/cmsmessage.o \
	lib/smime/cmspubkey.o lib/smime/cmsrecinfo.o lib/smime/cmsreclist.o \
	lib/smime/cmssigdata.o lib/smime/cmssiginfo.o lib/smime/cmsudf.o \
	lib/smime/cmsutil.o lib/smime/smimemessage.o lib/smime/smimeutil.o \
	lib/smime/smimever.o

SSL_OBJ = lib/ssl/authcert.o lib/ssl/cmpcert.o lib/ssl/dtls13con.o \
	lib/ssl/dtlscon.o lib/ssl/prelib.o lib/ssl/selfencrypt.o \
	lib/ssl/ssl3con.o lib/ssl/ssl3ecc.o lib/ssl/ssl3ext.o \
	lib/ssl/ssl3exthandle.o lib/ssl/ssl3gthr.o lib/ssl/sslauth.o \
	lib/ssl/sslbloom.o lib/ssl/sslcert.o lib/ssl/sslcon.o lib/ssl/ssldef.o \
	lib/ssl/sslencode.o lib/ssl/sslenum.o lib/ssl/sslerr.o lib/ssl/sslerrstrs.o \
	lib/ssl/sslgrp.o lib/ssl/sslinfo.o lib/ssl/sslinit.o lib/ssl/sslmutex.o \
	lib/ssl/sslnonce.o lib/ssl/sslprimitive.o lib/ssl/sslreveal.o \
	lib/ssl/sslsecur.o lib/ssl/sslsnce.o lib/ssl/sslsock.o lib/ssl/sslspec.o \
	lib/ssl/ssltrace.o lib/ssl/sslver.o lib/ssl/tls13con.o lib/ssl/tls13ech.o \
	lib/ssl/tls13echv.o lib/ssl/tls13exthandle.o lib/ssl/tls13hashstate.o \
	lib/ssl/tls13hkdf.o lib/ssl/tls13psk.o lib/ssl/tls13replay.o \
	lib/ssl/tls13subcerts.o lib/ssl/unix_err.o

SYSINIT_OBJ = lib/sysinit/nsssysinit.o

DBM_OBJ = lib/dbm/src/db.o lib/dbm/src/dirent.o lib/dbm/src/h_bigkey.o \
	lib/dbm/src/h_func.o lib/dbm/src/h_log2.o lib/dbm/src/h_page.o \
	lib/dbm/src/hash.o lib/dbm/src/hash_buf.o lib/dbm/src/mktemp.o

BL_OBJ = lib/freebl/freeblver.o lib/freebl/ldvector.o \
	lib/freebl/sysrand.o lib/freebl/md2.o lib/freebl/ec.o lib/freebl/alghmac.o \
	lib/freebl/rawhash.o lib/freebl/arcfour.o lib/freebl/arcfive.o \
	lib/freebl/blake2b.o lib/freebl/crypto_primitives.o lib/freebl/des.o \
	lib/freebl/drbg.o lib/freebl/aeskeywrap.o lib/freebl/dh.o \
	lib/freebl/camellia.o lib/freebl/ecdecode.o lib/freebl/mpi/mplogic.o \
	lib/freebl/mpi/mpi.o lib/freebl/mpi/mp_gf2m.o lib/freebl/sha512.o \
	lib/freebl/md5.o lib/freebl/cmac.o lib/freebl/cts.o \
	lib/freebl/chacha20poly1305.o lib/freebl/hmacct.o lib/freebl/ctr.o \
	lib/freebl/blinit.o lib/freebl/gcm.o lib/freebl/fipsfreebl.o \
	lib/freebl/rijndael.o lib/freebl/rsa.o lib/freebl/pqg.o lib/freebl/dsa.o \
	lib/freebl/rsapkcs.o lib/freebl/ecl/ecp_jac.o lib/freebl/tlsprfalg.o \
	lib/freebl/jpake.o lib/freebl/stubs.o lib/freebl/ecl/ecl.o \
	lib/freebl/ecl/ecp_mont.o lib/freebl/ecl/ec_naf.o lib/freebl/ecl/ecp_jm.o \
	lib/freebl/ecl/ecp_secp521r1.o lib/freebl/ecl/curve25519_64.o \
	lib/freebl/ecl/ecl_gf.o lib/freebl/nsslowhash.o lib/freebl/mpi/mpprime.o \
	lib/freebl/mpi/mpmontg.o lib/freebl/shvfy.o lib/freebl/deprecated/alg2268.o \
	lib/freebl/ecl/ecl_mult.o lib/freebl/mpi/mpi_amd64.o lib/freebl/mpi/mp_comba.o \
	lib/freebl/ecl/ecp_aff.o lib/freebl/deprecated/seed.o lib/freebl/ecl/ecp_256.o \
	lib/freebl/ecl/ecp_384.o lib/freebl/ecl/ecp_521.o lib/freebl/sha_fast.o \
	lib/freebl/ecl/ecp_256_32.o lib/freebl/ecl/ecp_secp384r1.o \
	lib/freebl/ecl/ecp_25519.o lib/freebl/verified/Hacl_Curve25519_51.o \
	lib/freebl/verified/Hacl_Poly1305_32.o lib/freebl/verified/Hacl_Chacha20.o \
	lib/freebl/mpi/mpcpucache.o lib/freebl/verified/Hacl_Chacha20Poly1305_32.o

BL_API_OBJ = lib/freebl/desblapi.o

BL_X86_OBJ = lib/freebl/gcm-x86.o lib/freebl/aes-x86.o

BL_X86_SSE_OBJ = lib/freebl/sha256-x86.o

BL_GCM_SSE3_OBJ = lib/freebl/intel-gcm-wrap.o

BL_AVX_OBJ = lib/freebl/verified/Hacl_Chacha20_Vec128.o \
	lib/freebl/verified/Hacl_Chacha20Poly1305_128.o

BL_VEC_OBJ = lib/freebl/verified/Hacl_Chacha20_Vec256.o

BL_AVX2_OBJ = lib/freebl/verified/Hacl_Chacha20Poly1305_256.o

BL_POLY_AVX_OBJ = lib/freebl/verified/Hacl_Poly1305_128.o

BL_POLY_AVX2_OBJ = lib/freebl/verified/Hacl_Poly1305_256.o

BL_CPU_OBJ = lib/freebl/intel-aes.o lib/freebl/intel-gcm.o \
	lib/freebl/arcfour-amd64-gas.o lib/freebl/mpi/mpi_amd64_common.o

FREEBL_OBJ = ${BL_OBJ} ${BL_API_OBJ} ${BL_X86_OBJ} ${BL_X86_SSE_OBJ} \
	${BL_GCM_SSE3_OBJ} ${BL_AVX_OBJ} ${BL_VEC_OBJ} ${BL_AVX2_OBJ} \
	${BL_POLY_AVX_OBJ} ${BL_POLY_AVX2_OBJ} ${BL_CPU_OBJ}

CKFW_TESTLIB_OBJ = lib/ckfw/builtins/testlib/certdata-testlib.o

LEGACYDB_OBJ = lib/softoken/legacydb/dbmshim.o \
	lib/softoken/legacydb/keydb.o lib/softoken/legacydb/lgattr.o \
	lib/softoken/legacydb/lgcreate.o lib/softoken/legacydb/lgdestroy.o \
	lib/softoken/legacydb/lgfind.o lib/softoken/legacydb/lgfips.o \
	lib/softoken/legacydb/lginit.o lib/softoken/legacydb/lgutil.o \
	lib/softoken/legacydb/lowcert.o lib/softoken/legacydb/lowkey.o \
	lib/softoken/legacydb/pcertdb.o lib/softoken/legacydb/pk11db.o

SOFTOKEN_OBJ = lib/softoken/fipsaudt.o lib/softoken/fipstest.o \
	lib/softoken/fipstokn.o lib/softoken/jpakesftk.o lib/softoken/kbkdf.o \
	lib/softoken/lgglue.o lib/softoken/lowkey.o lib/softoken/lowpbe.o \
	lib/softoken/padbuf.o lib/softoken/pkcs11.o lib/softoken/pkcs11c.o \
	lib/softoken/pkcs11u.o lib/softoken/sdb.o lib/softoken/sftkdb.o \
	lib/softoken/sftkdhverify.o lib/softoken/sftkhmac.o lib/softoken/sftkike.o \
	lib/softoken/sftkmessage.o lib/softoken/sftkpars.o lib/softoken/sftkpwd.o \
	lib/softoken/softkver.o lib/softoken/tlsprf.o

CMD_OBJ = cmd/lib/basicutil.o cmd/lib/derprint.o cmd/lib/ffs.o \
	cmd/lib/moreoids.o cmd/lib/pk11table.o cmd/lib/pppolicy.o cmd/lib/secpwd.o \
	cmd/lib/secutil.o

SHA_BIN_OBJ = cmd/shlibsign/mangle/mangle.o cmd/shlibsign/shlibsign.o

.SUFFIXES: .c .s .S .o

.PHONY: all headers definitions static-libs shared-libs sign-libs bins make-pc
all: headers definitions static-libs shared-libs sign-libs bins make-pc

bins: bltest ecperf fbectest fipstest lowhashtest mangle shlibsign

static-libs: libnssb.a libcertdb.a libcerthi.a libcryptohi.a libnssdev.a \
	libpkixcertsel.a libpkixcrlsel.a libpkixchecker.a libpkixparams.a \
	libpkixresults.a libpkixstore.a libpkixtop.a libpkixutil.a libpkixpki.a \
	libpkixsystem.a libpkixmodule.a libpk11wrap.a libnsspki.a libnssutil.a \
	libcrmf.a libjar.a libpkcs12.a libpkcs7.a libsmime.a libnss.a libnssckfw.a \
	libssl.a libnsssysinit.a libdbm.a libfreebl.a libnssdbm.a libsoftokn.a \
	libsectool.a

shared-libs: libnssutil3.so libnss3.so libnssckbi.so libnssckbi-testlib.so \
	libsmime3.so libssl3.so libnsssysinit.so libfreeblpriv3.so libfreebl3.so \
	libnssdbm3.so libsoftokn3.so

headers:
	install -Dm444 lib/base/baset.h ../dist/build/include/private/nss/baset.h
	install -Dm444 lib/base/base.h ../dist/build/include/private/nss/base.h
	install -Dm444 lib/certdb/genname.h ../dist/build/include/private/nss/genname.h
	install -Dm444 lib/certdb/xconst.h ../dist/build/include/private/nss/xconst.h
	install -Dm444 lib/certdb/certxutl.h ../dist/build/include/private/nss/certxutl.h
	install -Dm444 lib/certdb/certi.h ../dist/build/include/private/nss/certi.h
	install -Dm444 lib/certhigh/ocspti.h ../dist/build/include/private/nss/ocspti.h
	install -Dm444 lib/certhigh/ocspi.h ../dist/build/include/private/nss/ocspi.h
	install -Dm444 lib/cryptohi/keyi.h ../dist/build/include/private/nss/keyi.h
	install -Dm444 lib/dev/ckhelper.h ../dist/build/include/private/nss/ckhelper.h
	install -Dm444 lib/dev/devm.h ../dist/build/include/private/nss/devm.h
	install -Dm444 lib/dev/devtm.h ../dist/build/include/private/nss/devtm.h
	install -Dm444 lib/dev/devt.h ../dist/build/include/private/nss/devt.h
	install -Dm444 lib/dev/dev.h ../dist/build/include/private/nss/dev.h
	install -Dm444 lib/dev/nssdevt.h ../dist/build/include/private/nss/nssdevt.h
	install -Dm444 lib/dev/nssdev.h ../dist/build/include/private/nss/nssdev.h
	install -Dm444 lib/libpkix/include/pkix.h ../dist/build/include/private/nss/pkix.h
	install -Dm444 lib/libpkix/include/pkix_crlsel.h ../dist/build/include/private/nss/pkix_crlsel.h
	install -Dm444 lib/libpkix/include/pkix_errorstrings.h ../dist/build/include/private/nss/pkix_errorstrings.h
	install -Dm444 lib/libpkix/include/pkix_results.h ../dist/build/include/private/nss/pkix_results.h
	install -Dm444 lib/libpkix/include/pkixt.h ../dist/build/include/private/nss/pkixt.h
	install -Dm444 lib/libpkix/include/pkix_certsel.h ../dist/build/include/private/nss/pkix_certsel.h
	install -Dm444 lib/libpkix/include/pkix_params.h ../dist/build/include/private/nss/pkix_params.h
	install -Dm444 lib/libpkix/include/pkix_revchecker.h ../dist/build/include/private/nss/pkix_revchecker.h
	install -Dm444 lib/libpkix/include/pkix_certstore.h ../dist/build/include/private/nss/pkix_certstore.h
	install -Dm444 lib/libpkix/include/pkix_pl_pki.h ../dist/build/include/private/nss/pkix_pl_pki.h
	install -Dm444 lib/libpkix/include/pkix_sample_modules.h ../dist/build/include/private/nss/pkix_sample_modules.h
	install -Dm444 cmd/lib/basicutil.h ../dist/build/include/private/nss/basicutil.h
	install -Dm444 lib/libpkix/include/pkix_checker.h ../dist/build/include/private/nss/pkix_checker.h
	install -Dm444 lib/libpkix/include/pkix_pl_system.h ../dist/build/include/private/nss/pkix_pl_system.h
	install -Dm444 lib/libpkix/include/pkix_util.h ../dist/build/include/private/nss/pkix_util.h
	install -Dm444 lib/libpkix/pkix/certsel/pkix_certselector.h ../dist/build/include/private/nss/pkix_certselector.h
	install -Dm444 lib/libpkix/pkix/certsel/pkix_comcertselparams.h ../dist/build/include/private/nss/pkix_comcertselparams.h
	install -Dm444 lib/libpkix/pkix/crlsel/pkix_comcrlselparams.h ../dist/build/include/private/nss/pkix_comcrlselparams.h
	install -Dm444 lib/libpkix/pkix/crlsel/pkix_crlselector.h ../dist/build/include/private/nss/pkix_crlselector.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_basicconstraintschecker.h ../dist/build/include/private/nss/pkix_basicconstraintschecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_certchainchecker.h ../dist/build/include/private/nss/pkix_certchainchecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_crlchecker.h ../dist/build/include/private/nss/pkix_crlchecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_ekuchecker.h ../dist/build/include/private/nss/pkix_ekuchecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_expirationchecker.h ../dist/build/include/private/nss/pkix_expirationchecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_namechainingchecker.h ../dist/build/include/private/nss/pkix_namechainingchecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_nameconstraintschecker.h ../dist/build/include/private/nss/pkix_nameconstraintschecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_ocspchecker.h ../dist/build/include/private/nss/pkix_ocspchecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_policychecker.h ../dist/build/include/private/nss/pkix_policychecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_revocationmethod.h ../dist/build/include/private/nss/pkix_revocationmethod.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_revocationchecker.h ../dist/build/include/private/nss/pkix_revocationchecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_signaturechecker.h ../dist/build/include/private/nss/pkix_signaturechecker.h
	install -Dm444 lib/libpkix/pkix/checker/pkix_targetcertchecker.h ../dist/build/include/private/nss/pkix_targetcertchecker.h
	install -Dm444 lib/libpkix/pkix/params/pkix_procparams.h ../dist/build/include/private/nss/pkix_procparams.h
	install -Dm444 lib/libpkix/pkix/params/pkix_trustanchor.h ../dist/build/include/private/nss/pkix_trustanchor.h
	install -Dm444 lib/libpkix/pkix/params/pkix_valparams.h ../dist/build/include/private/nss/pkix_valparams.h
	install -Dm444 lib/libpkix/pkix/params/pkix_resourcelimits.h ../dist/build/include/private/nss/pkix_resourcelimits.h
	install -Dm444 lib/libpkix/pkix/results/pkix_buildresult.h ../dist/build/include/private/nss/pkix_buildresult.h
	install -Dm444 lib/libpkix/pkix/results/pkix_policynode.h ../dist/build/include/private/nss/pkix_policynode.h
	install -Dm444 lib/libpkix/pkix/results/pkix_valresult.h ../dist/build/include/private/nss/pkix_valresult.h
	install -Dm444 lib/libpkix/pkix/results/pkix_verifynode.h ../dist/build/include/private/nss/pkix_verifynode.h
	install -Dm444 lib/libpkix/pkix/store/pkix_store.h ../dist/build/include/private/nss/pkix_store.h
	install -Dm444 lib/libpkix/pkix/top/pkix_build.h ../dist/build/include/private/nss/pkix_build.h
	install -Dm444 lib/libpkix/pkix/top/pkix_lifecycle.h ../dist/build/include/private/nss/pkix_lifecycle.h
	install -Dm444 lib/libpkix/pkix/top/pkix_validate.h ../dist/build/include/private/nss/pkix_validate.h
	install -Dm444 lib/libpkix/pkix/util/pkix_tools.h ../dist/build/include/private/nss/pkix_tools.h
	install -Dm444 lib/libpkix/pkix/util/pkix_error.h ../dist/build/include/private/nss/pkix_error.h
	install -Dm444 lib/libpkix/pkix/util/pkix_logger.h ../dist/build/include/private/nss/pkix_logger.h
	install -Dm444 lib/libpkix/pkix/util/pkix_list.h ../dist/build/include/private/nss/pkix_list.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_basicconstraints.h ../dist/build/include/private/nss/pkix_pl_basicconstraints.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_cert.h ../dist/build/include/private/nss/pkix_pl_cert.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_certpolicyinfo.h ../dist/build/include/private/nss/pkix_pl_certpolicyinfo.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_certpolicymap.h ../dist/build/include/private/nss/pkix_pl_certpolicymap.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_certpolicyqualifier.h ../dist/build/include/private/nss/pkix_pl_certpolicyqualifier.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_crl.h ../dist/build/include/private/nss/pkix_pl_crl.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_crldp.h ../dist/build/include/private/nss/pkix_pl_crldp.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_crlentry.h ../dist/build/include/private/nss/pkix_pl_crlentry.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_date.h ../dist/build/include/private/nss/pkix_pl_date.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_generalname.h ../dist/build/include/private/nss/pkix_pl_generalname.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_infoaccess.h ../dist/build/include/private/nss/pkix_pl_infoaccess.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_nameconstraints.h ../dist/build/include/private/nss/pkix_pl_nameconstraints.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocsprequest.h ../dist/build/include/private/nss/pkix_pl_ocsprequest.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocspresponse.h ../dist/build/include/private/nss/pkix_pl_ocspresponse.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_publickey.h ../dist/build/include/private/nss/pkix_pl_publickey.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_x500name.h ../dist/build/include/private/nss/pkix_pl_x500name.h
	install -Dm444 lib/libpkix/pkix_pl_nss/pki/pkix_pl_ocspcertid.h ../dist/build/include/private/nss/pkix_pl_ocspcertid.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_common.h ../dist/build/include/private/nss/pkix_pl_common.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_mem.h ../dist/build/include/private/nss/pkix_pl_mem.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_object.h ../dist/build/include/private/nss/pkix_pl_object.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_string.h ../dist/build/include/private/nss/pkix_pl_string.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_primhash.h ../dist/build/include/private/nss/pkix_pl_primhash.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_bigint.h ../dist/build/include/private/nss/pkix_pl_bigint.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_mutex.h ../dist/build/include/private/nss/pkix_pl_mutex.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_bytearray.h ../dist/build/include/private/nss/pkix_pl_bytearray.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_lifecycle.h ../dist/build/include/private/nss/pkix_pl_lifecycle.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_oid.h ../dist/build/include/private/nss/pkix_pl_oid.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_hashtable.h ../dist/build/include/private/nss/pkix_pl_hashtable.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_rwlock.h ../dist/build/include/private/nss/pkix_pl_rwlock.h
	install -Dm444 lib/libpkix/pkix_pl_nss/system/pkix_pl_monitorlock.h ../dist/build/include/private/nss/pkix_pl_monitorlock.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_aiamgr.h ../dist/build/include/private/nss/pkix_pl_aiamgr.h
	install -Dm444 cmd/lib/secutil.h ../dist/build/include/private/nss/secutil.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_colcertstore.h ../dist/build/include/private/nss/pkix_pl_colcertstore.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_httpcertstore.h ../dist/build/include/private/nss/pkix_pl_httpcertstore.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_httpdefaultclient.h ../dist/build/include/private/nss/pkix_pl_httpdefaultclient.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapt.h ../dist/build/include/private/nss/pkix_pl_ldapt.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapcertstore.h ../dist/build/include/private/nss/pkix_pl_ldapcertstore.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapresponse.h ../dist/build/include/private/nss/pkix_pl_ldapresponse.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_ldaprequest.h ../dist/build/include/private/nss/pkix_pl_ldaprequest.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_ldapdefaultclient.h ../dist/build/include/private/nss/pkix_pl_ldapdefaultclient.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_nsscontext.h ../dist/build/include/private/nss/pkix_pl_nsscontext.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_pk11certstore.h ../dist/build/include/private/nss/pkix_pl_pk11certstore.h
	install -Dm444 lib/libpkix/pkix_pl_nss/module/pkix_pl_socket.h ../dist/build/include/private/nss/pkix_pl_socket.h
	install -Dm444 lib/pk11wrap/secmodi.h ../dist/build/include/private/nss/secmodi.h
	install -Dm444 lib/pk11wrap/secmodti.h ../dist/build/include/private/nss/secmodti.h
	install -Dm444 lib/pk11wrap/dev3hack.h ../dist/build/include/private/nss/dev3hack.h
	install -Dm444 lib/pki/pki.h ../dist/build/include/private/nss/pki.h
	install -Dm444 lib/pki/pkit.h ../dist/build/include/private/nss/pkit.h
	install -Dm444 lib/pki/nsspkit.h ../dist/build/include/private/nss/nsspkit.h
	install -Dm444 lib/pki/nsspki.h ../dist/build/include/private/nss/nsspki.h
	install -Dm444 lib/pki/pkistore.h ../dist/build/include/private/nss/pkistore.h
	install -Dm444 lib/pki/pki3hack.h ../dist/build/include/private/nss/pki3hack.h
	install -Dm444 lib/pki/pkitm.h ../dist/build/include/private/nss/pkitm.h
	install -Dm444 lib/pki/pkim.h ../dist/build/include/private/nss/pkim.h
	install -Dm444 lib/util/verref.h ../dist/build/include/private/nss/verref.h
	install -Dm444 lib/util/templates.c ../dist/build/include/private/nss/templates.c
	install -Dm444 lib/nss/nssrenam.h ../dist/build/include/private/nss/nssrenam.h
	install -Dm444 lib/nss/nssoptions.h ../dist/build/include/private/nss/nssoptions.h
	install -Dm444 lib/ckfw/ck.h ../dist/build/include/private/nss/ck.h
	install -Dm444 lib/ckfw/ckfw.h ../dist/build/include/private/nss/ckfw.h
	install -Dm444 lib/ckfw/ckfwm.h ../dist/build/include/private/nss/ckfwm.h
	install -Dm444 lib/ckfw/ckfwtm.h ../dist/build/include/private/nss/ckfwtm.h
	install -Dm444 lib/ckfw/ckmd.h ../dist/build/include/private/nss/ckmd.h
	install -Dm444 lib/ckfw/ckt.h ../dist/build/include/private/nss/ckt.h
	install -Dm444 lib/crmf/crmfi.h ../dist/build/include/private/nss/crmfi.h
	install -Dm444 lib/crmf/crmfit.h ../dist/build/include/private/nss/crmfit.h
	install -Dm444 lib/crmf/cmmfi.h ../dist/build/include/private/nss/cmmfi.h
	install -Dm444 lib/crmf/cmmfit.h ../dist/build/include/private/nss/cmmfit.h
	install -Dm444 lib/pkcs7/p7local.h ../dist/build/include/private/nss/p7local.h
	install -Dm444 lib/smime/cmslocal.h ../dist/build/include/private/nss/cmslocal.h
	install -Dm444 lib/freebl/cmac.h ../dist/build/include/private/nss/cmac.h
	install -Dm444 lib/freebl/alghmac.h ../dist/build/include/private/nss/alghmac.h
	install -Dm444 lib/freebl/blake2b.h ../dist/build/include/private/nss/blake2b.h
	install -Dm444 lib/freebl/blapi.h ../dist/build/include/private/nss/blapi.h
	install -Dm444 lib/freebl/chacha20poly1305.h ../dist/build/include/private/nss/chacha20poly1305.h
	install -Dm444 lib/freebl/hmacct.h ../dist/build/include/private/nss/hmacct.h
	install -Dm444 lib/freebl/secmpi.h ../dist/build/include/private/nss/secmpi.h
	install -Dm444 lib/freebl/secrng.h ../dist/build/include/private/nss/secrng.h
	install -Dm444 lib/freebl/ec.h ../dist/build/include/private/nss/ec.h
	install -Dm444 lib/freebl/ecl/ecl.h ../dist/build/include/private/nss/ecl/ecl.h
	install -Dm444 lib/freebl/ecl/ecl-curve.h ../dist/build/include/private/nss/ecl/ecl-curve.h
	install -Dm444 lib/freebl/ecl/eclt.h ../dist/build/include/private/nss/ecl/eclt.h
	install -Dm444 lib/softoken/pkcs11ni.h ../dist/build/include/private/nss/pkcs11ni.h
	install -Dm444 lib/softoken/softoken.h ../dist/build/include/private/nss/softoken.h
	install -Dm444 lib/softoken/softoknt.h ../dist/build/include/private/nss/softoknt.h
	install -Dm444 lib/softoken/softkver.h ../dist/build/include/private/nss/softkver.h
	install -Dm444 lib/softoken/sdb.h ../dist/build/include/private/nss/sdb.h
	install -Dm444 lib/softoken/sftkdbt.h ../dist/build/include/private/nss/sftkdbt.h
	install -Dm444 lib/softoken/lgglue.h ../dist/build/include/private/nss/lgglue.h
	install -Dm444 cmd/lib/pk11table.h ../dist/build/include/private/nss/pk11table.h
	install -Dm444 lib/base/nssbaset.h ../dist/build/include/public/nss/nssbaset.h
	install -Dm444 lib/base/nssbase.h ../dist/build/include/public/nss/nssbase.h
	install -Dm444 lib/certdb/cert.h ../dist/build/include/public/nss/cert.h
	install -Dm444 lib/certdb/certt.h ../dist/build/include/public/nss/certt.h
	install -Dm444 lib/certdb/certdb.h ../dist/build/include/public/nss/certdb.h
	install -Dm444 lib/certhigh/ocsp.h ../dist/build/include/public/nss/ocsp.h
	install -Dm444 lib/certhigh/ocspt.h ../dist/build/include/public/nss/ocspt.h
	install -Dm444 lib/cryptohi/cryptohi.h ../dist/build/include/public/nss/cryptohi.h
	install -Dm444 lib/cryptohi/cryptoht.h ../dist/build/include/public/nss/cryptoht.h
	install -Dm444 lib/cryptohi/key.h ../dist/build/include/public/nss/key.h
	install -Dm444 lib/cryptohi/keyhi.h ../dist/build/include/public/nss/keyhi.h
	install -Dm444 lib/cryptohi/keyt.h ../dist/build/include/public/nss/keyt.h
	install -Dm444 lib/cryptohi/keythi.h ../dist/build/include/public/nss/keythi.h
	install -Dm444 lib/cryptohi/sechash.h ../dist/build/include/public/nss/sechash.h
	install -Dm444 lib/pk11wrap/secmod.h ../dist/build/include/public/nss/secmod.h
	install -Dm444 lib/pk11wrap/secmodt.h ../dist/build/include/public/nss/secmodt.h
	install -Dm444 lib/pk11wrap/secpkcs5.h ../dist/build/include/public/nss/secpkcs5.h
	install -Dm444 lib/pk11wrap/pk11func.h ../dist/build/include/public/nss/pk11func.h
	install -Dm444 lib/pk11wrap/pk11hpke.h ../dist/build/include/public/nss/pk11hpke.h
	install -Dm444 lib/pk11wrap/pk11pub.h ../dist/build/include/public/nss/pk11pub.h
	install -Dm444 lib/pk11wrap/pk11priv.h ../dist/build/include/public/nss/pk11priv.h
	install -Dm444 lib/pk11wrap/pk11sdr.h ../dist/build/include/public/nss/pk11sdr.h
	install -Dm444 lib/pk11wrap/pk11pqg.h ../dist/build/include/public/nss/pk11pqg.h
	install -Dm444 lib/util/base64.h ../dist/build/include/public/nss/base64.h
	install -Dm444 lib/util/ciferfam.h ../dist/build/include/public/nss/ciferfam.h
	install -Dm444 lib/util/eccutil.h ../dist/build/include/public/nss/eccutil.h
	install -Dm444 lib/util/hasht.h ../dist/build/include/public/nss/hasht.h
	install -Dm444 lib/util/nssb64.h ../dist/build/include/public/nss/nssb64.h
	install -Dm444 lib/util/nssb64t.h ../dist/build/include/public/nss/nssb64t.h
	install -Dm444 lib/util/nsslocks.h ../dist/build/include/public/nss/nsslocks.h
	install -Dm444 lib/util/nssilock.h ../dist/build/include/public/nss/nssilock.h
	install -Dm444 lib/util/nssilckt.h ../dist/build/include/public/nss/nssilckt.h
	install -Dm444 lib/util/nssrwlk.h ../dist/build/include/public/nss/nssrwlk.h
	install -Dm444 lib/util/nssrwlkt.h ../dist/build/include/public/nss/nssrwlkt.h
	install -Dm444 lib/util/nssutil.h ../dist/build/include/public/nss/nssutil.h
	install -Dm444 lib/util/pkcs11.h ../dist/build/include/public/nss/pkcs11.h
	install -Dm444 lib/util/pkcs11f.h ../dist/build/include/public/nss/pkcs11f.h
	install -Dm444 lib/util/pkcs11p.h ../dist/build/include/public/nss/pkcs11p.h
	install -Dm444 lib/util/pkcs11t.h ../dist/build/include/public/nss/pkcs11t.h
	install -Dm444 lib/util/pkcs11n.h ../dist/build/include/public/nss/pkcs11n.h
	install -Dm444 lib/util/pkcs11u.h ../dist/build/include/public/nss/pkcs11u.h
	install -Dm444 lib/util/pkcs1sig.h ../dist/build/include/public/nss/pkcs1sig.h
	install -Dm444 lib/util/portreg.h ../dist/build/include/public/nss/portreg.h
	install -Dm444 lib/util/secasn1.h ../dist/build/include/public/nss/secasn1.h
	install -Dm444 lib/util/secasn1t.h ../dist/build/include/public/nss/secasn1t.h
	install -Dm444 lib/util/seccomon.h ../dist/build/include/public/nss/seccomon.h
	install -Dm444 lib/util/secder.h ../dist/build/include/public/nss/secder.h
	install -Dm444 lib/util/secdert.h ../dist/build/include/public/nss/secdert.h
	install -Dm444 lib/util/secdig.h ../dist/build/include/public/nss/secdig.h
	install -Dm444 lib/util/secdigt.h ../dist/build/include/public/nss/secdigt.h
	install -Dm444 lib/util/secitem.h ../dist/build/include/public/nss/secitem.h
	install -Dm444 lib/util/secoid.h ../dist/build/include/public/nss/secoid.h
	install -Dm444 lib/util/secoidt.h ../dist/build/include/public/nss/secoidt.h
	install -Dm444 lib/util/secport.h ../dist/build/include/public/nss/secport.h
	install -Dm444 lib/util/secerr.h ../dist/build/include/public/nss/secerr.h
	install -Dm444 lib/util/utilmodt.h ../dist/build/include/public/nss/utilmodt.h
	install -Dm444 lib/util/utilrename.h ../dist/build/include/public/nss/utilrename.h
	install -Dm444 lib/util/utilpars.h ../dist/build/include/public/nss/utilpars.h
	install -Dm444 lib/util/utilparst.h ../dist/build/include/public/nss/utilparst.h
	install -Dm444 lib/util/pkcs11uri.h ../dist/build/include/public/nss/pkcs11uri.h
	install -Dm444 lib/nss/nss.h ../dist/build/include/public/nss/nss.h
	install -Dm444 lib/ckfw/nssck.api ../dist/build/include/public/nss/nssck.api
	install -Dm444 lib/ckfw/nssckepv.h ../dist/build/include/public/nss/nssckepv.h
	install -Dm444 lib/ckfw/nssckft.h ../dist/build/include/public/nss/nssckft.h
	install -Dm444 lib/ckfw/nssckfw.h ../dist/build/include/public/nss/nssckfw.h
	install -Dm444 lib/ckfw/nssckfwc.h ../dist/build/include/public/nss/nssckfwc.h
	install -Dm444 lib/ckfw/nssckfwt.h ../dist/build/include/public/nss/nssckfwt.h
	install -Dm444 lib/ckfw/nssckg.h ../dist/build/include/public/nss/nssckg.h
	install -Dm444 lib/ckfw/nssckmdt.h ../dist/build/include/public/nss/nssckmdt.h
	install -Dm444 lib/ckfw/nssckt.h ../dist/build/include/public/nss/nssckt.h
	install -Dm444 lib/ckfw/builtins/nssckbi.h ../dist/build/include/public/nss/nssckbi.h
	install -Dm444 lib/crmf/crmf.h ../dist/build/include/public/nss/crmf.h
	install -Dm444 lib/crmf/crmft.h ../dist/build/include/public/nss/crmft.h
	install -Dm444 lib/crmf/cmmf.h ../dist/build/include/public/nss/cmmf.h
	install -Dm444 lib/crmf/cmmft.h ../dist/build/include/public/nss/cmmft.h
	install -Dm444 lib/jar/jar.h ../dist/build/include/public/nss/jar.h
	install -Dm444 lib/jar/jar-ds.h ../dist/build/include/public/nss/jar-ds.h
	install -Dm444 lib/jar/jarfile.h ../dist/build/include/public/nss/jarfile.h
	install -Dm444 lib/pkcs12/pkcs12t.h ../dist/build/include/public/nss/pkcs12t.h
	install -Dm444 lib/pkcs12/pkcs12.h ../dist/build/include/public/nss/pkcs12.h
	install -Dm444 lib/pkcs12/p12plcy.h ../dist/build/include/public/nss/p12plcy.h
	install -Dm444 lib/pkcs12/p12.h ../dist/build/include/public/nss/p12.h
	install -Dm444 lib/pkcs12/p12t.h ../dist/build/include/public/nss/p12t.h
	install -Dm444 lib/pkcs7/secmime.h ../dist/build/include/public/nss/secmime.h
	install -Dm444 lib/pkcs7/secpkcs7.h ../dist/build/include/public/nss/secpkcs7.h
	install -Dm444 lib/pkcs7/pkcs7t.h ../dist/build/include/public/nss/pkcs7t.h
	install -Dm444 lib/smime/cms.h ../dist/build/include/public/nss/cms.h
	install -Dm444 lib/smime/cmst.h ../dist/build/include/public/nss/cmst.h
	install -Dm444 lib/smime/smime.h ../dist/build/include/public/nss/smime.h
	install -Dm444 lib/smime/cmsreclist.h ../dist/build/include/public/nss/cmsreclist.h
	install -Dm444 lib/ssl/ssl.h ../dist/build/include/public/nss/ssl.h
	install -Dm444 lib/ssl/sslt.h ../dist/build/include/public/nss/sslt.h
	install -Dm444 lib/ssl/sslerr.h ../dist/build/include/public/nss/sslerr.h
	install -Dm444 lib/ssl/sslexp.h ../dist/build/include/public/nss/sslexp.h
	install -Dm444 lib/ssl/sslproto.h ../dist/build/include/public/nss/sslproto.h
	install -Dm444 lib/ssl/preenc.h ../dist/build/include/public/nss/preenc.h
	install -Dm444 lib/freebl/blapit.h ../dist/build/include/public/nss/blapit.h
	install -Dm444 lib/freebl/shsign.h ../dist/build/include/public/nss/shsign.h
	install -Dm444 lib/freebl/ecl/ecl-exp.h ../dist/build/include/public/nss/ecl-exp.h
	install -Dm444 lib/freebl/nsslowhash.h ../dist/build/include/public/nss/nsslowhash.h
	install -Dm444 lib/softoken/lowkeyi.h ../dist/build/include/public/nss/lowkeyi.h
	install -Dm444 lib/softoken/lowkeyti.h ../dist/build/include/public/nss/lowkeyti.h
	install -Dm444 lib/dbm/include/hsearch.h ../dist/build/include/private/dbm
	install -Dm444 lib/dbm/include/page.h ../dist/build/include/private/dbm
	install -Dm444 lib/dbm/include/extern.h ../dist/build/include/private/dbm
	install -Dm444 lib/dbm/include/queue.h ../dist/build/include/private/dbm
	install -Dm444 lib/dbm/include/hash.h ../dist/build/include/private/dbm
	install -Dm444 lib/dbm/include/search.h ../dist/build/include/private/dbm
	install -Dm444 lib/dbm/include/mcom_db.h ../dist/build/include/public/dbm 
	install -Dm444 lib/dbm/include/ncompat.h ../dist/build/include/public/dbm 
	install -Dm444 lib/dbm/include/winfile.h ../dist/build/include/public/dbm 

definitions:
	grep -v ';-' lib/util/nssutil.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	nssutil.def
	grep -v ';-' lib/nss/nss.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	nss.def
	grep -v ';-' lib/smime/smime.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	smime.def
	grep -v ';-' lib/ckfw/builtins/nssckbi.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	nssckbi.def
	grep -v ';-' lib/ssl/ssl.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	ssl.def
	grep -v ';-' lib/freebl/freebl_hash.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	freebl_hash.def
	grep -v ';-' lib/sysinit/nsssysinit.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	nsssysinit.def
	grep -v ';-' lib/freebl/freebl_hash_vector.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
	freebl_hash_vector.def
	cp -f freebl_hash.def        freebl.def
	cp -f freebl_hash_vector.def freeblpriv.def

lib/ckfw/builtins/certdata.c:
	perl lib/ckfw/builtins/certdata.perl \
		lib/ckfw/builtins/certdata.txt \
		$@

lib/ckfw/builtins/testlib/certdata-testlib.c:
	perl lib/ckfw/builtins/certdata.perl \
		lib/ckfw/builtins/testlib/certdata-testlib.txt \
		$@

${BL_API_OBJ}: headers
	${CC} ${FREEBLFLAGS} -fno-strict-aliasing -c -o $@ $<

${BL_X86_OBJ}: headers
	${CC} ${FREEBLFLAGS} -maes -mpclmul -c -o $@ $<

${BL_X86_SSE_OBJ}: headers
	${CC} ${FREEBLFLAGS} -msha -mssse3 -msse4.1 -c -o $@ $<

${BL_GCM_SSE3_OBJ}: headers
	${CC} ${FREEBLFLAGS} -mssse3 -c -o $@ $<

${BL_AVX_OBJ}: headers
	${CC} ${FREEBLFLAGS} -mssse3 -msse4.1 -msse4.2 -mavx -maes -c -o $@ $<

${BL_VEC_OBJ}: headers
	${CC} ${FREEBLFLAGS} -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -maes -c -o $@ $<

${BL_AVX2_OBJ}: headers
	${CC} ${FREEBLFLAGS} -mssse3 -msse4.1 -msse4.2 -mavx2 -maes -c -o $@ $<

${BL_POLY_AVX_OBJ}: headers
	${CC} ${FREEBLFLAGS} -mssse3 -msse4.1 -msse4.2 -mavx -maes -mpclmul -c -o $@ $<

${BL_POLY_AVX2_OBJ}: headers
	${CC} ${FREEBLFLAGS} -mssse3 -msse4.1 -msse4.2 -mavx -mavx2 -maes -mpclmul -c -o $@ $<

${BL_CPU_OBJ}: headers
	${CC} ${FREEBLFLAGS} -fPIC -Wa,--noexecstack -c -o $@ $<

${DBM_OBJ}: headers
	${CC} ${FLAGS} -DSTDC_HEADERS -DHAVE_SNPRINTF -DMEMMOVE \
		-D__DBINTERFACE_PRIVATE -I../dist/build/include/public/dbm \
		-I../dist/build/include/private/dbm -Ilib/dbm/include -c -o $@ $<

${BL_OBJ}: headers
	${CC} ${FREEBLFLAGS} -c -o $@ $<

${LEGACYDB_OBJ}: headers
	${CC} ${FLAGS} -Ilib/dbm/include -I../dist/build/include/public/dbm \
		-DSHLIB_SUFFICE=\"so\" -DSHLIB_PREFIX=\"lib\" \
		-DLG_LIB_NAME=\"libnssdbm3.so\" -c -o $@ $<

${SOFTOKEN_OBJ}: headers
	${CC} ${FLAGS} -DSHLIB_SUFFIX=\"so\" -DSHLIB_PREFIX=\"lib\" \
		-DSOFTOKEN_LIB_NAME=\"libsoftokn3.so\" -DSHLIB_VERSION=\"3\" -c -o $@ $<

cmd/bltest/blapitest.o: cmd/bltest/blapitest.c headers
	${CC} ${FLAGS} -DNSS_USE_STATIC_LIBS -Ilib/freebl/ecl -c -o $@ cmd/bltest/blapitest.c

cmd/ecperf/ecperf.o: cmd/ecperf/ecperf.c headers
	${CC} ${FLAGS} -DNSS_USE_STATIC_LIBS -Ilib/freebl/ecl -c -o $@ cmd/ecperf/ecperf.c

cmd/fbectest/fbectest.o: cmd/fbectest/fbectest.c headers
	${CC} ${FLAGS} -DNSS_USE_STATIC_LIBS -Ilib/freebl/ecl -c -o $@ cmd/fbectest/fbectest.c

lib/ckfw/builtins/certdata.o: lib/ckfw/builtins/certdata.c headers
	${CC} ${FLAGS} -c -o $@ lib/ckfw/builtins/certdata.c

${CKFW_TESTLIB_OBJ}: lib/ckfw/builtins/testlib/certdata-testlib.c headers
	${CC} ${FLAGS} -Ilib/ckfw/builtins -c -o $@ lib/ckfw/builtins/testlib/certdata-testlib.c

${CMD_OBJ}: headers
	${CC} ${STA_FLAGS} -c -o $@ $<

${SHA_BIN_OBJ}: headers
	${CC} ${SHA_FLAGS} -c -o $@ $<

lib/freebl/lowhash_vector.o lib/freebl/loader.o: headers
	${CC} ${FREEBLFLAGS} -c -o $@ $<

.c.o: headers
	${CC} ${FLAGS} -c -o $@ $<

.s.o: headers
	${CC} ${FLAGS} -c -o $@ $<

.S.o: headers
	${CC} ${FLAGS} -c -o $@ $<

libnssb.a: ${BASE_OBJ}
	${AR} rcs $@ ${BASE_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libcertdb.a: ${CERTDB_OBJ}
	${AR} rcs $@ ${CERTDB_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libcerthi.a: ${CERTHIGH_OBJ}
	${AR} rcs $@ ${CERTHIGH_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libcryptohi.a: ${CRYPTOHI_OBJ}
	${AR} rcs $@ ${CRYPTOHI_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libnssdev.a: ${DEV_OBJ}
	${AR} rcs $@ ${DEV_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixcertsel.a: ${CERTSEL_OBJ}
	${AR} rcs $@ ${CERTSEL_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixcrlsel.a: ${CRLSEL_OBJ}
	${AR} rcs $@ ${CRLSEL_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixchecker.a: ${CHECKER_OBJ}
	${AR} rcs $@ ${CHECKER_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@
	
libpkixparams.a: ${PARAMS_OBJ}
	${AR} rcs $@ ${PARAMS_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixresults.a: ${RESULTS_OBJ}
	${AR} rcs $@ ${RESULTS_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@
	
libpkixstore.a: ${STORE_OBJ}
	${AR} rcs $@ ${STORE_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixtop.a: ${TOP_OBJ}
	${AR} rcs $@ ${TOP_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixutil.a: ${PKIX_UTIL_OBJ}
	${AR} rcs $@ ${PKIX_UTIL_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixpki.a: ${PKIX_PKI_OBJ}
	${AR} rcs $@ ${PKIX_PKI_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixsystem.a: ${SYSTEM_OBJ}
	${AR} rcs $@ ${SYSTEM_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkixmodule.a: ${MODULE_OBJ}
	${AR} rcs $@ ${MODULE_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpk11wrap.a: ${PK11WRAP_OBJ}
	${AR} rcs $@ ${PK11WRAP_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libnsspki.a: ${PKI_OBJ}
	${AR} rcs $@ ${PKI_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libnssutil.a: ${UTIL_OBJ}
	${AR} rcs $@ ${UTIL_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libcrmf.a: ${CRMF_OBJ}
	${AR} rcs $@ ${CRMF_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libjar.a: ${JAR_OBJ}
	${AR} rcs $@ ${JAR_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkcs12.a: ${PKCS12_OBJ}
	${AR} rcs $@ ${PKCS12_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libpkcs7.a: ${PKCS7_OBJ}
	${AR} rcs $@ ${PKCS7_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libsmime.a: ${SMIME_OBJ}
	${AR} rcs $@ ${SMIME_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libnss.a: ${NSS_A_OBJ}
	${AR} rcs $@ ${NSS_A_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libnssckfw.a: ${CKFW_OBJ}
	${AR} rcs $@ ${CKFW_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libssl.a: ${SSL_OBJ}
	${AR} rcs $@ ${SSL_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libnsssysinit.a: ${SYSINIT_OBJ}
	${AR} rcs $@ ${SYSINIT_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libdbm.a: ${DBM_OBJ}
	${AR} rcs $@ ${DBM_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libfreebl.a: lib/freebl/loader.o 
	${AR} rcs $@ lib/freebl/loader.o
	install -Dm644 $@ ../dist/build/lib/$@

libnssdbm.a: ${LEGACYDB_OBJ}
	${AR} rcs $@ ${LEGACYDB_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libsoftokn.a: ${SOFTOKEN_OBJ}
	${AR} rcs $@ ${SOFTOKEN_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libsectool.a: ${CMD_OBJ}
	${AR} rcs $@ ${CMD_OBJ}
	install -Dm644 $@ ../dist/build/lib/$@

libnssutil3.so: ${UTIL_OBJ}
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname \
		-Wl,$@ -Wl,--version-script,nssutil.def -o \
		$@ ${UTIL_OBJ} -L../dist/build/lib -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libnss3.so: ${LIBNSS_OBJ} libnssutil3.so
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname -Wl,$@ \
		-Wl,--version-script,nss.def -o $@ ${LIBNSS_OBJ} -L../dist/build/lib \
		-lnssutil3 -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libnssckbi.so: ${CKFW_BUILTIN_OBJ}
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname -Wl,$@ \
		-Wl,--version-script,nssckbi.def -o $@ ${CKFW_BUILTIN_OBJ} \
		../dist/build/lib/libnssckfw.a ../dist/build/lib/libnssb.a -L../dist/build/lib \
		-Ilib/ckfw/builtins -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libnssckbi-testlib.so: ${CKFW_TESTLIB_OBJ} libnssckfw.a libnssb.a
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname \
		-Wl,$@ -o $@ ${CKFW_TESTLIB_OBJ} -L../dist/build/lib \
		../dist/build/lib/libnssckfw.a ../dist/build/lib/libnssb.a \
		-lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libsmime3.so: ${SMIME_OBJ} ${PKCS7_OBJ} ${PKCS12_OBJ} libnss3.so libnssutil3.so
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname -Wl,$@ \
    	-Wl,--version-script,smime.def -o $@ ${SMIME_OBJ} ${PKCS7_OBJ} \
	    ${PKCS12_OBJ} -L../dist/build/lib -lnss3 -lnssutil3 -lplc4 -lplds4 -lnspr4 \
    	-lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libssl3.so: ${SSL_OBJ} libnss3.so libnssutil3.so
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname -Wl,$@ \
		-Wl,--version-script,ssl.def -o $@ ${SSL_OBJ} -L../dist/build/lib \
		-lnss3 -lnssutil3 -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libnsssysinit.so: ${SYSINIT_OBJ} libnssutil3.so
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname \
		-Wl,$@ -Wl,--version-script,nsssysinit.def -o \
		$@ ${SYSINIT_OBJ} -L../dist/build/lib \
		-lnssutil3 -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libfreeblpriv3.so: ${FREEBL_OBJ}
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname \
		-Wl,$@ -Wl,--version-script,freeblpriv.def \
		-Wl,-Bsymbolic -o $@ ${FREEBL_OBJ} -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libfreebl3.so: lib/freebl/lowhash_vector.o
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname -Wl,$@ \
		-Wl,--version-script,freebl.def -Wl,-Bsymbolic -o $@ \
		lib/freebl/lowhash_vector.o -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libnssdbm3.so: ${LEGACYDB_OBJ} libnssutil3.so
	grep -v ';-' lib/softoken/legacydb/nssdbm.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,' \
		-e 's,;.*,;,' > \
		nssdbm.def
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname -Wl,$@ \
    	-Wl,--version-script,nssdbm.def -o $@ ${LEGACY_OBJ} \
		../dist/build/lib/libfreebl.a ../dist/build/lib/libdbm.a -L../dist/build/lib \
		-lnssutil3 -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

libsoftokn3.so: ${SOFTOKEN_OBJ} libnssutil3.so
	grep -v ';-' lib/softoken/softokn.def | sed -e 's,;+,,' \
		-e 's; DATA ;;' \
		-e 's,;;,,'     \
		-e 's,;.*,;,' > \
		softokn.def
	${CC} -shared -m64 -Wl,--gc-sections -Wl,-z,defs -Wl,-soname \
		-Wl,$@ -Wl,--version-script,softokn.def -o $@ ${SOFTOKEN_OBJ} \
		../dist/build/lib/libfreebl.a -L../dist/build/lib \
		-lsqlite3 -lnssutil3 -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/lib/$@

bltest: cmd/bltest/blapitest.o static-libs
	${CC} -o $@ ${STA_FLAGS} -Ilib/softoken -I../dist/build/include/public/seccmd \
		-I../dist/build/include/public/dbm -I../dist/build/include/public/softoken \
		cmd/bltest/blapitest.o -m64 -z noexecstack libsectool.a libsmime.a libssl.a \
		libnss.a ../dist/build/lib/libpkcs12.a ../dist/build/lib/libpkcs7.a \
		../dist/build/lib/libcerthi.a ../dist/build/lib/libcryptohi.a \
		../dist/build/lib/libpk11wrap.a ../dist/build/lib/libsoftokn.a \
		../dist/build/lib/libcertdb.a ../dist/build/lib/libnsspki.a \
		../dist/build/lib/libnssdev.a ../dist/build/lib/libnssb.a \
		../dist/build/lib/libfreebl.a ../dist/build/lib/libdbm.a \
		../dist/build/lib/libpkixtop.a ../dist/build/lib/libpkixutil.a \
		../dist/build/lib/libpkixsystem.a ../dist/build/lib/libpkixcrlsel.a \
		../dist/build/lib/libpkixmodule.a ../dist/build/lib/libpkixstore.a \
		../dist/build/lib/libpkixparams.a ../dist/build/lib/libpkixchecker.a \
		../dist/build/lib/libpkixpki.a ../dist/build/lib/libpkixtop.a \
		../dist/build/lib/libpkixresults.a ../dist/build/lib/libpkixcertsel.a \
		../dist/build/lib/libnss.a ../dist/build/lib/libpk11wrap.a \
		../dist/build/lib/libcerthi.a -L../dist/build/lib -lsqlite3 -lnssutil3 \
		-lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/bin/$@

ecperf: cmd/ecperf/ecperf.o static-libs libnssutil3.so
	${CC} -o $@ ${STA_FLAGS} -Ilib/softoken cmd/ecperf/ecperf.o -m64 \
		-z noexecstack ../dist/build/lib/libsectool.a \
		../dist/build/lib/libsmime.a ../dist/build/lib/libssl.a \
		../dist/build/lib/libnss.a ../dist/build/lib/libpkcs12.a \
		../dist/build/lib/libpkcs7.a ../dist/build/lib/libcerthi.a \
		../dist/build/lib/libcryptohi.a ../dist/build/lib/libpk11wrap.a \
		../dist/build/lib/libsoftokn.a ../dist/build/lib/libcertdb.a \
		../dist/build/lib/libnsspki.a ../dist/build/lib/libnssdev.a \
		../dist/build/lib/libnssb.a ../dist/build/lib/libfreebl.a \
		../dist/build/lib/libdbm.a ../dist/build/lib/libpkixtop.a \
		../dist/build/lib/libpkixutil.a ../dist/build/lib/libpkixsystem.a \
		../dist/build/lib/libpkixcrlsel.a ../dist/build/lib/libpkixmodule.a \
		../dist/build/lib/libpkixstore.a ../dist/build/lib/libpkixparams.a \
		../dist/build/lib/libpkixchecker.a ../dist/build/lib/libpkixpki.a \
		../dist/build/lib/libpkixtop.a ../dist/build/lib/libpkixresults.a \
		../dist/build/lib/libpkixcertsel.a ../dist/build/lib/libnss.a \
		../dist/build/lib/libpk11wrap.a ../dist/build/lib/libcerthi.a \
		-L../dist/build/lib -lsqlite3 -lnssutil3 -lplc4 -lplds4 \
		-lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/bin/$@

fbectest: cmd/fbectest/fbectest.o static-libs libnssutil3.so
	${CC} -o $@ ${STA_FLAGS} -Ilib/softoken cmd/fbectest/fbectest.o -m64 \
		-z noexecstack ../dist/build/lib/libsectool.a ../dist/build/lib/libsmime.a \
		../dist/build/lib/libssl.a ../dist/build/lib/libnss.a \
		../dist/build/lib/libpkcs12.a ../dist/build/lib/libpkcs7.a \
		../dist/build/lib/libcerthi.a ../dist/build/lib/libcryptohi.a \
		../dist/build/lib/libpk11wrap.a ../dist/build/lib/libsoftokn.a \
		../dist/build/lib/libcertdb.a ../dist/build/lib/libnsspki.a \
		../dist/build/lib/libnssdev.a ../dist/build/lib/libnssb.a \
		../dist/build/lib/libfreebl.a ../dist/build/lib/libdbm.a \
		../dist/build/lib/libpkixtop.a ../dist/build/lib/libpkixutil.a \
		../dist/build/lib/libpkixsystem.a ../dist/build/lib/libpkixcrlsel.a \
		../dist/build/lib/libpkixmodule.a ../dist/build/lib/libpkixstore.a \
		../dist/build/lib/libpkixparams.a ../dist/build/lib/libpkixchecker.a \
		../dist/build/lib/libpkixpki.a ../dist/build/lib/libpkixtop.a \
		../dist/build/lib/libpkixresults.a ../dist/build/lib/libpkixcertsel.a \
		../dist/build/lib/libnss.a ../dist/build/lib/libpk11wrap.a \
		../dist/build/lib/libcerthi.a -L../dist/build/lib -lsqlite3 -lnssutil3 \
		-lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/bin/$@

fipstest: cmd/fipstest/fipstest.o static-libs libnssutil3.so
	${CC} -o $@ ${STA_FLAGS} cmd/fipstest/fipstest.o -m64 -z noexecstack \
		../dist/build/lib/libsectool.a ../dist/build/lib/libsmime.a \
		../dist/build/lib/libssl.a ../dist/build/lib/libnss.a \
		../dist/build/lib/libpkcs12.a ../dist/build/lib/libpkcs7.a \
		../dist/build/lib/libcerthi.a ../dist/build/lib/libcryptohi.a \
		../dist/build/lib/libpk11wrap.a ../dist/build/lib/libsoftokn.a \
		../dist/build/lib/libcertdb.a ../dist/build/lib/libnsspki.a \
		../dist/build/lib/libnssdev.a ../dist/build/lib/libnssb.a \
		../dist/build/lib/libfreebl.a ../dist/build/lib/libdbm.a \
		../dist/build/lib/libpkixtop.a ../dist/build/lib/libpkixutil.a \
		../dist/build/lib/libpkixsystem.a ../dist/build/lib/libpkixcrlsel.a \
		../dist/build/lib/libpkixmodule.a ../dist/build/lib/libpkixstore.a \
		../dist/build/lib/libpkixparams.a ../dist/build/lib/libpkixchecker.a \
		../dist/build/lib/libpkixpki.a ../dist/build/lib/libpkixtop.a \
		../dist/build/lib/libpkixresults.a ../dist/build/lib/libpkixcertsel.a \
		../dist/build/lib/libnss.a ../dist/build/lib/libpk11wrap.a \
		../dist/build/lib/libcerthi.a -L../dist/build/lib -lsqlite3 \
		-lnssutil3 -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/bin/$@

lowhashtest: cmd/lowhashtest/lowhashtest.o static-libs libnssutil3.so
	${CC} -o $@ ${STA_FLAGS} -I../dist/build/include/public/dbm \
		cmd/lowhashtest/lowhashtest.o -m64 -z noexecstack \
		../dist/build/lib/libsectool.a ../dist/build/lib/libsmime.a \
		../dist/build/lib/libssl.a ../dist/build/lib/libnss.a \
		../dist/build/lib/libpkcs12.a ../dist/build/lib/libpkcs7.a \
		../dist/build/lib/libcerthi.a ../dist/build/lib/libcryptohi.a \
		../dist/build/lib/libpk11wrap.a ../dist/build/lib/libsoftokn.a \
		../dist/build/lib/libcertdb.a ../dist/build/lib/libnsspki.a \
		../dist/build/lib/libnssdev.a ../dist/build/lib/libnssb.a \
		../dist/build/lib/libfreebl.a ../dist/build/lib/libdbm.a \
		../dist/build/lib/libpkixtop.a ../dist/build/lib/libpkixutil.a \
		../dist/build/lib/libpkixsystem.a ../dist/build/lib/libpkixcrlsel.a \
		../dist/build/lib/libpkixmodule.a ../dist/build/lib/libpkixstore.a \
		../dist/build/lib/libpkixparams.a ../dist/build/lib/libpkixchecker.a \
		../dist/build/lib/libpkixpki.a ../dist/build/lib/libpkixtop.a \
		../dist/build/lib/libpkixresults.a ../dist/build/lib/libpkixcertsel.a \
		../dist/build/lib/libnss.a ../dist/build/lib/libpk11wrap.a \
		../dist/build/lib/libcerthi.a ../dist/build/lib/libsectool.a \
		-L../dist/build/lib -lsqlite3 -lnssutil3 -lplc4 -lplds4 \
		-lnssutil3 -lfreebl3 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/bin/$@

mangle: ${SHA_BIN_OBJ}
	${CC} -o $@ ${SHA_FLAGS} cmd/shlibsign/mangle/mangle.o -m64 -z noexecstack \
		-L../dist/build/lib -lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/bin/$@

shlibsign: ${SHA_BIN_OBJ}
	${CC} -o $@ ${SHA_FLAGS} cmd/shlibsign/shlibsign.o -m64 \
		-z noexecstack -L../dist/build/lib \
		-lplc4 -lplds4 -lnspr4 -lpthread -ldl -lc
	install -Dm755 $@ ../dist/build/bin/$@

sign-libs: shlibsign libsoftokn3.so libfreebl3.so libfreeblpriv3.so libnssdbm3.so
	sh ./cmd/shlibsign/sign.sh ../dist/build \
		./ Linux ../dist/build/lib ../dist/build/lib/libsoftokn3.so
	sh ./cmd/shlibsign/sign.sh ../dist/build \
		./ Linux ../dist/build/lib ../dist/build/lib/libfreebl3.so
	sh ./cmd/shlibsign/sign.sh ../dist/build \
		./ Linux ../dist/build/lib ../dist/build/lib/libfreeblpriv3.so
	sh ./cmd/shlibsign/sign.sh ../dist/build \
		./ Linux ../dist/build/lib ../dist/build/lib/libnssdbm3.so

make-pc:
	sed -i "s|%prefix%|${PREFIX}|" pkg/pkg-config/nss.pc.in
	sed -i "s|%exec_prefix%|${PREFIX}|" pkg/pkg-config/nss.pc.in
	sed -i "s|%libdir%|${LIBDIR}|" pkg/pkg-config/nss.pc.in
	sed -i "s|%includedir%|${INCDIR}/nss|" pkg/pkg-config/nss.pc.in
	sed -i "s|%NSS_VERSION%|3.76|" pkg/pkg-config/nss.pc.in
	sed -i "s|%NSPR_VERSION%|4.32|" pkg/pkg-config/nss.pc.in

.PHONY: install
install:
	install -Dm755 ../dist/build/lib/libfreebl3.so ${DESTDIR}${LIBDIR}/libfreebl3.so
	install -Dm755 ../dist/build/lib/libfreeblpriv3.so ${DESTDIR}${LIBDIR}/libfreeblpriv3.so
	install -Dm755 ../dist/build/lib/libnspr4.so ${DESTDIR}${LIBDIR}/libnspr4.so
	install -Dm755 ../dist/build/lib/libnss3.so ${DESTDIR}${LIBDIR}/libnss3.so
	install -Dm755 ../dist/build/lib/libnssckbi-testlib.so ${DESTDIR}${LIBDIR}/libnssckbi-testlib.so
	install -Dm755 ../dist/build/lib/libnssckbi.so ${DESTDIR}${LIBDIR}/libnssckbi.so
	install -Dm755 ../dist/build/lib/libnssdbm3.so ${DESTDIR}${LIBDIR}/libnssdbm3.so
	install -Dm755 ../dist/build/lib/libnsssysinit.so ${DESTDIR}${LIBDIR}/libnsssysinit.so
	install -Dm755 ../dist/build/lib/libnssutil3.so ${DESTDIR}${LIBDIR}/libnssutil3.so
	install -Dm755 ../dist/build/lib/libplc4.so ${DESTDIR}${LIBDIR}/libplc4.so
	install -Dm755 ../dist/build/lib/libplds4.so ${DESTDIR}${LIBDIR}/libplds4.so
	install -Dm755 ../dist/build/lib/libsmime3.so ${DESTDIR}${LIBDIR}/libsmime3.so
	install -Dm755 ../dist/build/lib/libsoftokn3.so ${DESTDIR}${LIBDIR}/libsoftokn3.so
	install -Dm755 ../dist/build/lib/libssl3.so ${DESTDIR}${LIBDIR}/libssl3.so
	install -Dm644 ../dist/build/lib/libfreebl3.chk ${DESTDIR}${LIBDIR}/libfreebl3.chk
	install -Dm644 ../dist/build/lib/libfreeblpriv3.chk ${DESTDIR}${LIBDIR}/libfreeblpriv3.chk
	install -Dm644 ../dist/build/lib/libnssdbm3.chk ${DESTDIR}${LIBDIR}/libnssdbm3.chk
	install -Dm644 ../dist/build/lib/libsoftokn3.chk ${DESTDIR}${LIBDIR}/libsoftokn3.chk
	install -Dm644 ../dist/build/include/public/nss/base64.h ${DESTDIR}${INCDIR}/nss/base64.h
	install -Dm644 ../dist/build/include/public/nss/blapit.h ${DESTDIR}${INCDIR}/nss/blapit.h
	install -Dm644 ../dist/build/include/public/nss/cert.h ${DESTDIR}${INCDIR}/nss/cert.h
	install -Dm644 ../dist/build/include/public/nss/certdb.h ${DESTDIR}${INCDIR}/nss/certdb.h
	install -Dm644 ../dist/build/include/public/nss/certt.h ${DESTDIR}${INCDIR}/nss/certt.h
	install -Dm644 ../dist/build/include/public/nss/ciferfam.h ${DESTDIR}${INCDIR}/nss/ciferfam.h
	install -Dm644 ../dist/build/include/public/nss/cmmf.h ${DESTDIR}${INCDIR}/nss/cmmf.h
	install -Dm644 ../dist/build/include/public/nss/cmmft.h ${DESTDIR}${INCDIR}/nss/cmmft.h
	install -Dm644 ../dist/build/include/public/nss/cms.h ${DESTDIR}${INCDIR}/nss/cms.h
	install -Dm644 ../dist/build/include/public/nss/cmsreclist.h ${DESTDIR}${INCDIR}/nss/cmsreclist.h
	install -Dm644 ../dist/build/include/public/nss/cmst.h ${DESTDIR}${INCDIR}/nss/cmst.h
	install -Dm644 ../dist/build/include/public/nss/crmf.h ${DESTDIR}${INCDIR}/nss/crmf.h
	install -Dm644 ../dist/build/include/public/nss/crmft.h ${DESTDIR}${INCDIR}/nss/crmft.h
	install -Dm644 ../dist/build/include/public/nss/cryptohi.h ${DESTDIR}${INCDIR}/nss/cryptohi.h
	install -Dm644 ../dist/build/include/public/nss/cryptoht.h ${DESTDIR}${INCDIR}/nss/cryptoht.h
	install -Dm644 ../dist/build/include/public/nss/eccutil.h ${DESTDIR}${INCDIR}/nss/eccutil.h
	install -Dm644 ../dist/build/include/public/nss/ecl-exp.h ${DESTDIR}${INCDIR}/nss/ecl-exp.h
	install -Dm644 ../dist/build/include/public/nss/hasht.h ${DESTDIR}${INCDIR}/nss/hasht.h
	install -Dm644 ../dist/build/include/public/nss/jar-ds.h ${DESTDIR}${INCDIR}/nss/jar-ds.h
	install -Dm644 ../dist/build/include/public/nss/jar.h ${DESTDIR}${INCDIR}/nss/jar.h
	install -Dm644 ../dist/build/include/public/nss/jarfile.h ${DESTDIR}${INCDIR}/nss/jarfile.h
	install -Dm644 ../dist/build/include/public/nss/key.h ${DESTDIR}${INCDIR}/nss/key.h
	install -Dm644 ../dist/build/include/public/nss/keyhi.h ${DESTDIR}${INCDIR}/nss/keyhi.h
	install -Dm644 ../dist/build/include/public/nss/keyt.h ${DESTDIR}${INCDIR}/nss/keyt.h
	install -Dm644 ../dist/build/include/public/nss/keythi.h ${DESTDIR}${INCDIR}/nss/keythi.h
	install -Dm644 ../dist/build/include/public/nss/lowkeyi.h ${DESTDIR}${INCDIR}/nss/lowkeyi.h
	install -Dm644 ../dist/build/include/public/nss/lowkeyti.h ${DESTDIR}${INCDIR}/nss/lowkeyti.h
	install -Dm644 ../dist/build/include/public/nss/nss.h ${DESTDIR}${INCDIR}/nss/nss.h
	install -Dm644 ../dist/build/include/public/nss/nssb64.h ${DESTDIR}${INCDIR}/nss/nssb64.h
	install -Dm644 ../dist/build/include/public/nss/nssb64t.h ${DESTDIR}${INCDIR}/nss/nssb64t.h
	install -Dm644 ../dist/build/include/public/nss/nssbase.h ${DESTDIR}${INCDIR}/nss/nssbase.h
	install -Dm644 ../dist/build/include/public/nss/nssbaset.h ${DESTDIR}${INCDIR}/nss/nssbaset.h
	install -Dm644 ../dist/build/include/public/nss/nssckbi.h ${DESTDIR}${INCDIR}/nss/nssckbi.h
	install -Dm644 ../dist/build/include/public/nss/nssckepv.h ${DESTDIR}${INCDIR}/nss/nssckepv.h
	install -Dm644 ../dist/build/include/public/nss/nssckft.h ${DESTDIR}${INCDIR}/nss/nssckft.h
	install -Dm644 ../dist/build/include/public/nss/nssckfw.h ${DESTDIR}${INCDIR}/nss/nssckfw.h
	install -Dm644 ../dist/build/include/public/nss/nssckfwc.h ${DESTDIR}${INCDIR}/nss/nssckfwc.h
	install -Dm644 ../dist/build/include/public/nss/nssckfwt.h ${DESTDIR}${INCDIR}/nss/nssckfwt.h
	install -Dm644 ../dist/build/include/public/nss/nssckg.h ${DESTDIR}${INCDIR}/nss/nssckg.h
	install -Dm644 ../dist/build/include/public/nss/nssckmdt.h ${DESTDIR}${INCDIR}/nss/nssckmdt.h
	install -Dm644 ../dist/build/include/public/nss/nssckt.h ${DESTDIR}${INCDIR}/nss/nssckt.h
	install -Dm644 ../dist/build/include/public/nss/nssilckt.h ${DESTDIR}${INCDIR}/nss/nssilckt.h
	install -Dm644 ../dist/build/include/public/nss/nssilock.h ${DESTDIR}${INCDIR}/nss/nssilock.h
	install -Dm644 ../dist/build/include/public/nss/nsslocks.h ${DESTDIR}${INCDIR}/nss/nsslocks.h
	install -Dm644 ../dist/build/include/public/nss/nsslowhash.h ${DESTDIR}${INCDIR}/nss/nsslowhash.h
	install -Dm644 ../dist/build/include/public/nss/nssrwlk.h ${DESTDIR}${INCDIR}/nss/nssrwlk.h
	install -Dm644 ../dist/build/include/public/nss/nssrwlkt.h ${DESTDIR}${INCDIR}/nss/nssrwlkt.h
	install -Dm644 ../dist/build/include/public/nss/nssutil.h ${DESTDIR}${INCDIR}/nss/nssutil.h
	install -Dm644 ../dist/build/include/public/nss/ocsp.h ${DESTDIR}${INCDIR}/nss/ocsp.h
	install -Dm644 ../dist/build/include/public/nss/ocspt.h ${DESTDIR}${INCDIR}/nss/ocspt.h
	install -Dm644 ../dist/build/include/public/nss/p12.h ${DESTDIR}${INCDIR}/nss/p12.h
	install -Dm644 ../dist/build/include/public/nss/p12plcy.h ${DESTDIR}${INCDIR}/nss/p12plcy.h
	install -Dm644 ../dist/build/include/public/nss/p12t.h ${DESTDIR}${INCDIR}/nss/p12t.h
	install -Dm644 ../dist/build/include/public/nss/pk11func.h ${DESTDIR}${INCDIR}/nss/pk11func.h
	install -Dm644 ../dist/build/include/public/nss/pk11hpke.h ${DESTDIR}${INCDIR}/nss/pk11hpke.h
	install -Dm644 ../dist/build/include/public/nss/pk11pqg.h ${DESTDIR}${INCDIR}/nss/pk11pqg.h
	install -Dm644 ../dist/build/include/public/nss/pk11priv.h ${DESTDIR}${INCDIR}/nss/pk11priv.h
	install -Dm644 ../dist/build/include/public/nss/pk11pub.h ${DESTDIR}${INCDIR}/nss/pk11pub.h
	install -Dm644 ../dist/build/include/public/nss/pk11sdr.h ${DESTDIR}${INCDIR}/nss/pk11sdr.h
	install -Dm644 ../dist/build/include/public/nss/pkcs11.h ${DESTDIR}${INCDIR}/nss/pkcs11.h
	install -Dm644 ../dist/build/include/public/nss/pkcs11f.h ${DESTDIR}${INCDIR}/nss/pkcs11f.h
	install -Dm644 ../dist/build/include/public/nss/pkcs11n.h ${DESTDIR}${INCDIR}/nss/pkcs11n.h
	install -Dm644 ../dist/build/include/public/nss/pkcs11p.h ${DESTDIR}${INCDIR}/nss/pkcs11p.h
	install -Dm644 ../dist/build/include/public/nss/pkcs11t.h ${DESTDIR}${INCDIR}/nss/pkcs11t.h
	install -Dm644 ../dist/build/include/public/nss/pkcs11u.h ${DESTDIR}${INCDIR}/nss/pkcs11u.h
	install -Dm644 ../dist/build/include/public/nss/pkcs11uri.h ${DESTDIR}${INCDIR}/nss/pkcs11uri.h
	install -Dm644 ../dist/build/include/public/nss/pkcs12.h ${DESTDIR}${INCDIR}/nss/pkcs12.h
	install -Dm644 ../dist/build/include/public/nss/pkcs12t.h ${DESTDIR}${INCDIR}/nss/pkcs12t.h
	install -Dm644 ../dist/build/include/public/nss/pkcs1sig.h ${DESTDIR}${INCDIR}/nss/pkcs1sig.h
	install -Dm644 ../dist/build/include/public/nss/pkcs7t.h ${DESTDIR}${INCDIR}/nss/pkcs7t.h
	install -Dm644 ../dist/build/include/public/nss/portreg.h ${DESTDIR}${INCDIR}/nss/portreg.h
	install -Dm644 ../dist/build/include/public/nss/preenc.h ${DESTDIR}${INCDIR}/nss/preenc.h
	install -Dm644 ../dist/build/include/public/nss/secasn1.h ${DESTDIR}${INCDIR}/nss/secasn1.h
	install -Dm644 ../dist/build/include/public/nss/secasn1t.h ${DESTDIR}${INCDIR}/nss/secasn1t.h
	install -Dm644 ../dist/build/include/public/nss/seccomon.h ${DESTDIR}${INCDIR}/nss/seccomon.h
	install -Dm644 ../dist/build/include/public/nss/secder.h ${DESTDIR}${INCDIR}/nss/secder.h
	install -Dm644 ../dist/build/include/public/nss/secdert.h ${DESTDIR}${INCDIR}/nss/secdert.h
	install -Dm644 ../dist/build/include/public/nss/secdig.h ${DESTDIR}${INCDIR}/nss/secdig.h
	install -Dm644 ../dist/build/include/public/nss/secdigt.h ${DESTDIR}${INCDIR}/nss/secdigt.h
	install -Dm644 ../dist/build/include/public/nss/secerr.h ${DESTDIR}${INCDIR}/nss/secerr.h
	install -Dm644 ../dist/build/include/public/nss/sechash.h ${DESTDIR}${INCDIR}/nss/sechash.h
	install -Dm644 ../dist/build/include/public/nss/secitem.h ${DESTDIR}${INCDIR}/nss/secitem.h
	install -Dm644 ../dist/build/include/public/nss/secmime.h ${DESTDIR}${INCDIR}/nss/secmime.h
	install -Dm644 ../dist/build/include/public/nss/secmod.h ${DESTDIR}${INCDIR}/nss/secmod.h
	install -Dm644 ../dist/build/include/public/nss/secmodt.h ${DESTDIR}${INCDIR}/nss/secmodt.h
	install -Dm644 ../dist/build/include/public/nss/secoid.h ${DESTDIR}${INCDIR}/nss/secoid.h
	install -Dm644 ../dist/build/include/public/nss/secoidt.h ${DESTDIR}${INCDIR}/nss/secoidt.h
	install -Dm644 ../dist/build/include/public/nss/secpkcs5.h ${DESTDIR}${INCDIR}/nss/secpkcs5.h
	install -Dm644 ../dist/build/include/public/nss/secpkcs7.h ${DESTDIR}${INCDIR}/nss/secpkcs7.h
	install -Dm644 ../dist/build/include/public/nss/secport.h ${DESTDIR}${INCDIR}/nss/secport.h
	install -Dm644 ../dist/build/include/public/nss/shsign.h ${DESTDIR}${INCDIR}/nss/shsign.h
	install -Dm644 ../dist/build/include/public/nss/smime.h ${DESTDIR}${INCDIR}/nss/smime.h
	install -Dm644 ../dist/build/include/public/nss/ssl.h ${DESTDIR}${INCDIR}/nss/ssl.h
	install -Dm644 ../dist/build/include/public/nss/sslerr.h ${DESTDIR}${INCDIR}/nss/sslerr.h
	install -Dm644 ../dist/build/include/public/nss/sslexp.h ${DESTDIR}${INCDIR}/nss/sslexp.h
	install -Dm644 ../dist/build/include/public/nss/sslproto.h ${DESTDIR}${INCDIR}/nss/sslproto.h
	install -Dm644 ../dist/build/include/public/nss/sslt.h ${DESTDIR}${INCDIR}/nss/sslt.h
	install -Dm644 ../dist/build/include/public/nss/utilmodt.h ${DESTDIR}${INCDIR}/nss/utilmodt.h
	install -Dm644 ../dist/build/include/public/nss/utilpars.h ${DESTDIR}${INCDIR}/nss/utilpars.h
	install -Dm644 ../dist/build/include/public/nss/utilparst.h ${DESTDIR}${INCDIR}/nss/utilparst.h
	install -Dm644 ../dist/build/include/public/nss/utilrename.h ${DESTDIR}${INCDIR}/nss/utilrename.h
	install -Dm644 ../dist/build/include/nspr.h ${DESTDIR}${INCDIR}/nss/nspr.h
	install -Dm644 ../dist/build/include/plarena.h ${DESTDIR}${INCDIR}/nss/plarena.h
	install -Dm644 ../dist/build/include/plarenas.h ${DESTDIR}${INCDIR}/nss/plarenas.h
	install -Dm644 ../dist/build/include/plbase64.h ${DESTDIR}${INCDIR}/nss/plbase64.h
	install -Dm644 ../dist/build/include/plerror.h ${DESTDIR}${INCDIR}/nss/plerror.h
	install -Dm644 ../dist/build/include/plgetopt.h ${DESTDIR}${INCDIR}/nss/plgetopt.h
	install -Dm644 ../dist/build/include/plhash.h ${DESTDIR}${INCDIR}/nss/plhash.h
	install -Dm644 ../dist/build/include/plstr.h ${DESTDIR}${INCDIR}/nss/plstr.h
	install -Dm644 ../dist/build/include/pratom.h ${DESTDIR}${INCDIR}/nss/pratom.h
	install -Dm644 ../dist/build/include/prbit.h ${DESTDIR}${INCDIR}/nss/prbit.h
	install -Dm644 ../dist/build/include/prclist.h ${DESTDIR}${INCDIR}/nss/prclist.h
	install -Dm644 ../dist/build/include/prcmon.h ${DESTDIR}${INCDIR}/nss/prcmon.h
	install -Dm644 ../dist/build/include/prcountr.h ${DESTDIR}${INCDIR}/nss/prcountr.h
	install -Dm644 ../dist/build/include/prcpucfg.h ${DESTDIR}${INCDIR}/nss/prcpucfg.h
	install -Dm644 ../dist/build/include/prcvar.h ${DESTDIR}${INCDIR}/nss/prcvar.h
	install -Dm644 ../dist/build/include/prdtoa.h ${DESTDIR}${INCDIR}/nss/prdtoa.h
	install -Dm644 ../dist/build/include/prenv.h ${DESTDIR}${INCDIR}/nss/prenv.h
	install -Dm644 ../dist/build/include/prerr.h ${DESTDIR}${INCDIR}/nss/prerr.h
	install -Dm644 ../dist/build/include/prerror.h ${DESTDIR}${INCDIR}/nss/prerror.h
	install -Dm644 ../dist/build/include/prinet.h ${DESTDIR}${INCDIR}/nss/prinet.h
	install -Dm644 ../dist/build/include/prinit.h ${DESTDIR}${INCDIR}/nss/prinit.h
	install -Dm644 ../dist/build/include/prinrval.h ${DESTDIR}${INCDIR}/nss/prinrval.h
	install -Dm644 ../dist/build/include/prio.h ${DESTDIR}${INCDIR}/nss/prio.h
	install -Dm644 ../dist/build/include/pripcsem.h ${DESTDIR}${INCDIR}/nss/pripcsem.h
	install -Dm644 ../dist/build/include/prlink.h ${DESTDIR}${INCDIR}/nss/prlink.h
	install -Dm644 ../dist/build/include/prlock.h ${DESTDIR}${INCDIR}/nss/prlock.h
	install -Dm644 ../dist/build/include/prlog.h ${DESTDIR}${INCDIR}/nss/prlog.h
	install -Dm644 ../dist/build/include/prlong.h ${DESTDIR}${INCDIR}/nss/prlong.h
	install -Dm644 ../dist/build/include/prmem.h ${DESTDIR}${INCDIR}/nss/prmem.h
	install -Dm644 ../dist/build/include/prmon.h ${DESTDIR}${INCDIR}/nss/prmon.h
	install -Dm644 ../dist/build/include/prmwait.h ${DESTDIR}${INCDIR}/nss/prmwait.h
	install -Dm644 ../dist/build/include/prnetdb.h ${DESTDIR}${INCDIR}/nss/prnetdb.h
	install -Dm644 ../dist/build/include/prolock.h ${DESTDIR}${INCDIR}/nss/prolock.h
	install -Dm644 ../dist/build/include/prpdce.h ${DESTDIR}${INCDIR}/nss/prpdce.h
	install -Dm644 ../dist/build/include/prprf.h ${DESTDIR}${INCDIR}/nss/prprf.h
	install -Dm644 ../dist/build/include/prproces.h ${DESTDIR}${INCDIR}/nss/prproces.h
	install -Dm644 ../dist/build/include/prrng.h ${DESTDIR}${INCDIR}/nss/prrng.h
	install -Dm644 ../dist/build/include/prrwlock.h ${DESTDIR}${INCDIR}/nss/prrwlock.h
	install -Dm644 ../dist/build/include/prshm.h ${DESTDIR}${INCDIR}/nss/prshm.h
	install -Dm644 ../dist/build/include/prshma.h ${DESTDIR}${INCDIR}/nss/prshma.h
	install -Dm644 ../dist/build/include/prsystem.h ${DESTDIR}${INCDIR}/nss/prsystem.h
	install -Dm644 ../dist/build/include/prthread.h ${DESTDIR}${INCDIR}/nss/prthread.h
	install -Dm644 ../dist/build/include/prtime.h ${DESTDIR}${INCDIR}/nss/prtime.h
	install -Dm644 ../dist/build/include/prtpool.h ${DESTDIR}${INCDIR}/nss/prtpool.h
	install -Dm644 ../dist/build/include/prtrace.h ${DESTDIR}${INCDIR}/nss/prtrace.h
	install -Dm644 ../dist/build/include/prtypes.h ${DESTDIR}${INCDIR}/nss/prtypes.h
	install -Dm644 ../dist/build/include/prvrsion.h ${DESTDIR}${INCDIR}/nss/prvrsion.h
	install -Dm644 ../dist/build/include/prwin16.h ${DESTDIR}${INCDIR}/nss/prwin16.h
	install -Dm644 ../dist/build/include/obsolete/pralarm.h ${DESTDIR}${INCDIR}/nss/obsolete/pralarm.h
	install -Dm644 ../dist/build/include/obsolete/probslet.h ${DESTDIR}${INCDIR}/nss/obsolete/probslet.h
	install -Dm644 ../dist/build/include/obsolete/protypes.h ${DESTDIR}${INCDIR}/nss/obsolete/protypes.h
	install -Dm644 ../dist/build/include/obsolete/prsem.h ${DESTDIR}${INCDIR}/nss/obsolete/prsem.h
	install -Dm644 pkg/pkg-config/nss.pc.in ${DESTDIR}${PKGCONFDIR}/nss.pc

.PHONY: clean
clean:
	rm -rf ${NSS_OBJ} \
		../dist \
		definitions \
		static-libs \
		shared-libs \
		sign-libs \
		bins
