#!/bin/bash

# Test
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-3/dts target/linux/ramips/dts/mt7621_xzwifi_creativebox-v1.dts
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-3/led target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
#wget -nv https://github.com/lc-sub/OpenWrt-TE/raw/main/TEST-3/dts -O target/linux/ramips/dts/mt7621_xzwifi_creativebox-v1.dts
#wget -nv https://github.com/lc-sub/OpenWrt-TE/raw/main/TEST-3/led -O target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
