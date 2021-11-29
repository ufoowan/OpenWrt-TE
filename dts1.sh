#!/bin/bash

# Test
wget -nv https://github.com/lc-sub/LCsub-OpenWrt-TE/raw/main/dts1 -O target/linux/ramips/dts/mt7621_d-team_pbr-m1.dts
wget -nv https://github.com/lc-sub/LCsub-OpenWrt-TE/raw/main/net -O target/linux/ramips/mt7621/base-files/etc/board.d/02_network
