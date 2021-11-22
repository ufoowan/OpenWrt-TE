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

# Extra package
#git clone https://github.com/kenzok8/small.git package/small
svn co https://github.com/kiddin9/openwrt-packages/trunk/gowebdav package/gowebdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-diskman package/luci-app-diskman
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-gowebdav package/luci-app-gowebdav
svn co https://github.com/kiddin9/openwrt-packages/trunk/luci-app-syncthing package/luci-app-syncthing
rm -rf package/lean/luci-theme-argon
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config.git package/luci-app-argon-config
git clone https://github.com/kiddin9/luci-theme-edge.git package/luci-theme-edge

# Modify default IP
sed -i 's/192.168.1.1/192.168.1.9/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i "s/hostname='OpenWrt'/hostname='PBR-M1'/g" package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /LCsub build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
