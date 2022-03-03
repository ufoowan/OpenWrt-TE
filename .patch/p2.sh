#!/bin/bash
#
# Passwall
mkdir package/passwall
pushd package/passwall
#git clone --depth=1 https://github.com/kenzok8/small.git
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/controller/*.lua
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/api/*.lua
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/client/*.lua
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/model/cbi/passwall/server/*.lua
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/app_update/*.htm
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/global/*.htm
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/haproxy/*.htm
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/log/*.htm
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/node_list/*.htm
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/rule/*.htm
sed -i 's/services/vpn/g' openwrt-passwall/luci-app-passwall/luasrc/view/passwall/server/*.htm
popd

# Extra package
rm -rf feeds/packages/utils/syncthing
rm -rf feeds/luci/applications/luci-app-diskman
mkdir package/lc-sub
pushd package/lc-sub
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/gowebdav
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/filebrowser
svn co https://github.com/immortalwrt/packages/branches/openwrt-18.06/utils/syncthing
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-diskman
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-filebrowser
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-gowebdav
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/applications/luci-app-syncthing
popd

# Theme
rm -rf feeds/luci/themes/luci-theme-material
rm -rf feeds/luci/themes/luci-theme-argon
pushd package/lc-sub
git clone https://github.com/jerrykuku/luci-app-argon-config.git
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone -b 18.06 https://github.com/kiddin9/luci-theme-edge.git
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/themes/luci-theme-darkmatter
svn co https://github.com/immortalwrt/luci/branches/openwrt-18.06/themes/luci-theme-material
popd

# Modify Menu
sed -i 's/\"services\"/\"nas\"/g' feeds/luci/applications/luci-app-samba4/luasrc/controller/samba4.lua

# Modify Makefile
find package/lc-sub -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/luci\.mk/include \$(TOPDIR)\/feeds\/luci\/luci\.mk/g' {}
find package/lc-sub -maxdepth 2 -path "*/Makefile" | xargs -i sed -i 's/include\ \.\.\/\.\.\/lang\/golang\/golang\-package\.mk/include \$(TOPDIR)\/feeds\/packages\/lang\/golang\/golang\-package\.mk/g' {}

# HotFix
