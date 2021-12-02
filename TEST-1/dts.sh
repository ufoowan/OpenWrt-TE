#!/bin/bash

# Test
svn export --force https://github.com/lc-sub/LCsub-OpenWrt-TE/trunk/TEST-1/dts target/linux/ramips/dts/mt7621_d-team_pbr-m1.dts
svn export --force https://github.com/lc-sub/LCsub-OpenWrt-TE/trunk/TEST-1/led target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
#wget -nv https://github.com/lc-sub/LCsub-OpenWrt-TE/raw/main/TEST-1/dts -O target/linux/ramips/dts/mt7621_d-team_pbr-m1.dts
#wget -nv https://github.com/lc-sub/LCsub-OpenWrt-TE/raw/main/TEST-1/led -O target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
