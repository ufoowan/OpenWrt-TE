#!/bin/bash

# Test
svn export https://github.com/lc-sub/LCsub-OpenWrt-TE/trunk/TEST-1/dts target/linux/ramips/dts/mt7621_xzwifi_creativebox-v1.dts
svn export https://github.com/lc-sub/LCsub-OpenWrt-TE/trunk/TEST-1/led target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
#wget -nv https://github.com/lc-sub/LCsub-OpenWrt-TE/raw/main/dts1 -O target/linux/ramips/dts/mt7621_xzwifi_creativebox-v1.dts
#wget -nv https://github.com/lc-sub/LCsub-OpenWrt-TE/raw/main/led -O target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
