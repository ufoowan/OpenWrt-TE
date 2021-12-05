#!/bin/bash

# Test
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-1/dts target/linux/ramips/dts/mt7621_d-team_pbr-m1.dts
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-1/led target/linux/ramips/mt7621/base-files/etc/board.d/01_leds
svn export --force https://github.com/lc-sub/OpenWrt-TE/trunk/TEST-1/net target/linux/ramips/mt7621/base-files/etc/board.d/02_network
