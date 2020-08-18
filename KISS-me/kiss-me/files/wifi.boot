#!/bin/sh

/usr/bin/wpa_supplicant -B -i wlan0 -c /etc/wpa_supplicant/wpa_supplicant.conf >/dev/null 2>&1
/usr/bin/dhcpcd wlan0 >/dev/null 2>&1 &
