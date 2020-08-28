#!/bin/sh

wpa_supplicant -B -iwlan0 -c/etc/wpa_supplicant/wpa_supplicant.conf >/dev/null 2>&1
dhcpcd wlan0 >/dev/null 2>&1 &
