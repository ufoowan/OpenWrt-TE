#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

# Passwall
mkdir package/passwall
pushd package/passwall
#git clone --depth=1 https://github.com/kenzok8/small.git
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git
popd

# Extra package
mkdir package/lcsub
pushd package/lcsub
svn co https://github.com/kiddin9/openwrt-packages/trunk/filebrowser
svn co https://github.com/kiddin9/openwrt-packages/trunk/gowebdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-diskman
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-fileassistant
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-filebrowser
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-gowebdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-syncthing
popd

# Use snapshots' syncthing package
pushd feeds/packages/utils
rm -rf syncthing
svn co https://github.com/openwrt/packages/trunk/utils/syncthing
popd

# Theme
rm -rf package/lean/luci-theme-argon
pushd package/lcsub
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone https://github.com/kiddin9/luci-theme-edge.git
popd

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i "s/hostname='OpenWrt'/hostname='PBR-M1'/g" package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /LCsub build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Test
wget -nv https://github.com/lc-sub/LCsub-OpenWrt-TE/raw/main/dts2 -O target/linux/ramips/dts/mt7621_d-team_pbr-m1.dts
