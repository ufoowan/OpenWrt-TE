#!/bin/bash

# Passwall
mkdir package/passwall
pushd package/passwall
#git clone --depth=1 https://github.com/kenzok8/small.git
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git
popd

# Extra package
rm -rf package/lean/luci-app-diskman
mkdir package/lcsub
pushd package/lcsub
git clone https://github.com/jerrykuku/luci-app-ttnode.git
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
svn co https://github.com/apollo-ng/luci-theme-darkmatter/trunk/luci/themes/luci-theme-darkmatter
find luci-theme-darkmatter -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
popd

# Modify default IP
sed -i 's/192.168.1.1/192.168.10.1/g' package/base-files/files/bin/config_generate

# Modify hostname
sed -i "s/hostname='OpenWrt'/hostname='CreativeBox'/g" package/base-files/files/bin/config_generate

# Modify the version number
sed -i "s/OpenWrt /lc-sub build $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt /g" package/lean/default-settings/files/zzz-default-settings

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# hotfix
rm -rf package/libs/wolfssl
svn co https://github.com/coolsnowwolf/lede/tags/20211107/package/libs/wolfssl package/libs/wolfssl
