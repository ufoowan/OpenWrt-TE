#!/bin/bash

# Test
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-2/dts target/linux/ramips/dts/mt7621_d-team_pbr-m1.dts
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-2/led target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-2/net target/linux/ramips/mt7621/base-files/etc/board.d/02_network
#wget -nv https://github.com/lc-sub/OpenWrt-TE/raw/main/TEST-2/dts -O target/linux/ramips/dts/mt7621_d-team_pbr-m1.dts
#wget -nv https://github.com/lc-sub/OpenWrt-TE/raw/main/TEST-2/led -O target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
#wget -nv https://github.com/lc-sub/OpenWrt-TE/raw/main/TEST-2/net -O target/linux/ramips/mt7621/base-files/etc/board.d/02_network
