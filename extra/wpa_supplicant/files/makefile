.POSIX:

PREFIX ?= /usr/local
BINDIR ?= ${PREFIX}/bin

CC ?= cc

XCPPFLAGS = -DCONFIG_BACKEND_FILE -DCONFIG_MATCH_IFACE -DCONFIG_P2P \
	-DCONFIG_DRIVER_WIRED -DCONFIG_DRIVER_NL80211 -DCONFIG_DRIVER_WEXT \
	-DCONFIG_WIRELESS_EXTENSION -DEAP_TLS -DEAP_PEAP -DEAP_TTLS -DEAP_MD5 \
	-DEAP_MSCHAPv2 -DEAP_GTC -DEAP_OTP -DEAP_LEAP -DEAP_PWD -DCONFIG_WPS \
	-DEAP_WSC -DIEEE8021X_EAPOL -DCONFIG_AP -DCONFIG_NO_RADIUS \
	-DCONFIG_NO_ACCOUNTING -DCONFIG_NO_VLAN -DEAP_SERVER -DEAP_SERVER_IDENTITY \
	-DNEED_AP_MLME -DEAP_SERVER_WSC -DCONFIG_NO_RADIUS -DPKCS12_FUNCS \
	-DCONFIG_SMARTCARD -DEAP_TLS_OPENSSL -DCONFIG_DES \
	-DTLS_DEFAULT_CIPHERS=\""DEFAULT:!EXP:!LOW"\" -DCONFIG_SHA256 -DCONFIG_ECC \
	-DCONFIG_NO_RANDOM_POOL -DCONFIG_CTRL_IFACE -DCONFIG_CTRL_IFACE_UNIX \
	-DCONFIG_SME -DCONFIG_DEBUG_SYSLOG -DLOG_HOSTAPD="LOG_DAEMON" \
	-DCONFIG_DEBUG_FILE -DCONFIG_GAS -DCONFIG_OFFCHANNEL

INCLUDES = -I../src -I../src/utils

FLAGS = ${XCPPFLAGS} ${INCLUDES} ${CFLAGS} ${CPPFLAGS}

LIBS = -lrt -lnl-tiny -lssl -lcrypto -ldl

CLI_OBJ = wpa_cli.o ../src/common/wpa_ctrl.o ../src/common/cli.o \
	../src/utils/edit.o ../src/utils/wpa_debug.o ../src/utils/common.o \
	../src/utils/os_unix.o ../src/utils/eloop.o \

PASS_OBJ = wpa_passphrase.o ../src/utils/common.o ../src/utils/wpa_debug.o \
	../src/utils/wpabuf.o ../src/utils/os_unix.o \
	../src/crypto/crypto_openssl.o ../src/crypto/sha1-prf.o \
	../src/crypto/sha1-tlsprf.o ../src/crypto/sha256-prf.o \
	../src/crypto/sha256-tlsprf.o

SUPP_OBJ = ../src/ap/ap_config.o ../src/ap/ap_drv_ops.o \
	../src/ap/ap_list.o ../src/ap/ap_mlme.o ../src/ap/authsrv.o \
	../src/ap/beacon.o ../src/ap/bss_load.o ../src/ap/ctrl_iface_ap.o \
	../src/ap/dfs.o ../src/ap/drv_callbacks.o ../src/ap/eap_user_db.o \
	../src/ap/hostapd.o ../src/ap/hw_features.o ../src/ap/ieee802_11.o \
	../src/ap/ieee802_11_auth.o ../src/ap/ieee802_11_ht.o \
	../src/ap/ieee802_11_shared.o ../src/ap/ieee802_1x.o \
	../src/ap/neighbor_db.o ../src/ap/p2p_hostapd.o \
	../src/ap/pmksa_cache_auth.o ../src/ap/rrm.o ../src/ap/sta_info.o \
	../src/ap/tkip_countermeasures.o ../src/ap/utils.o ../src/ap/wmm.o \
	../src/ap/wpa_auth.o ../src/ap/wpa_auth_glue.o ../src/ap/wpa_auth_ie.o \
	../src/ap/wps_hostapd.o ../src/common/ctrl_iface_common.o \
	../src/common/dragonfly.o ../src/common/gas.o \
	../src/common/hw_features_common.o ../src/common/ieee802_11_common.o \
	../src/common/wpa_common.o ../src/crypto/aes-omac1.o \
	../src/crypto/crypto_openssl.o ../src/crypto/dh_groups.o \
	../src/crypto/ms_funcs.o ../src/crypto/sha1-prf.o \
	../src/crypto/sha1-tlsprf.o ../src/crypto/sha256-prf.o \
	../src/crypto/sha256-tlsprf.o ../src/crypto/tls_openssl.o \
	../src/crypto/tls_openssl_ocsp.o ../src/drivers/driver_common.o \
	../src/drivers/driver_nl80211.o ../src/drivers/driver_nl80211_capa.o \
	../src/drivers/driver_nl80211_event.o \
	../src/drivers/driver_nl80211_monitor.o \
	../src/drivers/driver_nl80211_scan.o ../src/drivers/driver_wext.o \
	../src/drivers/driver_wired.o ../src/drivers/driver_wired_common.o \
	../src/drivers/drivers.o ../src/drivers/linux_ioctl.o \
	../src/drivers/netlink.o ../src/drivers/rfkill.o ../src/eap_common/chap.o \
	../src/eap_common/eap_common.o ../src/eap_common/eap_peap_common.o \
	../src/eap_common/eap_pwd_common.o ../src/eap_common/eap_wsc_common.o \
	../src/eap_peer/eap.o ../src/eap_peer/eap_gtc.o ../src/eap_peer/eap_leap.o \
	../src/eap_peer/eap_md5.o ../src/eap_peer/eap_methods.o \
	../src/eap_peer/eap_mschapv2.o ../src/eap_peer/eap_otp.o \
	../src/eap_peer/eap_peap.o ../src/eap_peer/eap_pwd.o \
	../src/eap_peer/eap_tls.o ../src/eap_peer/eap_tls_common.o \
	../src/eap_peer/eap_ttls.o ../src/eap_peer/eap_wsc.o \
	../src/eap_peer/mschapv2.o ../src/eap_server/eap_server.o \
	../src/eap_server/eap_server_identity.o \
	../src/eap_server/eap_server_methods.o ../src/eap_server/eap_server_wsc.o \
	../src/eapol_auth/eapol_auth_sm.o ../src/eapol_supp/eapol_supp_sm.o \
	../src/l2_packet/l2_packet_linux.o ../src/p2p/p2p.o ../src/p2p/p2p_build.o \
	../src/p2p/p2p_dev_disc.o ../src/p2p/p2p_go_neg.o ../src/p2p/p2p_group.o \
	../src/p2p/p2p_invitation.o ../src/p2p/p2p_parse.o ../src/p2p/p2p_pd.o \
	../src/p2p/p2p_sd.o ../src/p2p/p2p_utils.o ../src/rsn_supp/pmksa_cache.o \
	../src/rsn_supp/preauth.o ../src/rsn_supp/wpa.o ../src/rsn_supp/wpa_ie.o \
	../src/utils/base64.o ../src/utils/bitfield.o ../src/utils/common.o \
	../src/utils/config.o ../src/utils/crc32.o ../src/utils/eloop.o \
	../src/utils/ip_addr.o ../src/utils/os_unix.o ../src/utils/radiotap.o \
	../src/utils/uuid.o ../src/utils/wpa_debug.o ../src/utils/wpabuf.o \
	../src/wps/wps.o ../src/wps/wps_attr_build.o ../src/wps/wps_attr_parse.o \
	../src/wps/wps_attr_process.o ../src/wps/wps_common.o \
	../src/wps/wps_dev_attr.o ../src/wps/wps_enrollee.o \
	../src/wps/wps_registrar.o ap.o bss.o bssid_ignore.o config.o \
	config_file.o ctrl_iface.o ctrl_iface_unix.o eap_register.o events.o \
	gas_query.o main.o notify.o offchannel.o op_classes.o p2p_supplicant.o \
	p2p_supplicant_sd.o robust_av.o rrm.o scan.o sme.o twt.o wmm_ac.o \
	wpa_supplicant.o wpas_glue.o wps_supplicant.o

.PHONY: all
all: wpa_cli wpa_passphrase wpa_supplicant

.c.o:
	${CC} ${FLAGS} -c -o $@ $<

wpa_cli: ${CLI_OBJ}
	${CC} ${FLAGS} -o $@ ${CLI_OBJ} ${LDFLAGS} -lrt

wpa_passphrase: ${PASS_OBJ}
	${CC} ${FLAGS} -o $@ ${PASS_OBJ} ${LIBS}

wpa_supplicant: ${SUPP_OBJ}
	${CC} ${FLAGS} -o $@ ${SUPP_OBJ} ${LIBS}

.PHONY: install
install:
	install -Dm755 wpa_cli ${DESTDIR}${BINDIR}/wpa_cli
	install -Dm755 wpa_passphrase ${DESTDIR}${BINDIR}/wpa_passphrase
	install -Dm755 wpa_supplicant ${DESTDIR}${BINDIR}/wpa_supplicant

.PHONY: clean
clean:
	find ../ -name \*.o -exec rm -f {} \;
	rm -f wpa_cli wpa_passphrase wpa_supplicant
