#!/bin/bash
patch -p1 -f < $(dirname "$0")/luci.patch

# sed -i 's/192.168.1.1/192.168.110.249/g' package/base-files/files/bin/config_generate
sed -i 's/ImmortalWrt/redmek40/g' package/base-files/files/bin/config_generate
# Remove packages
rm -rf feeds/luci/applications/luci-app-momo
rm -rf feeds/luci/applications/luci-app-alist
rm -rf feeds/luci/applications/luci-app-passwall2
rm -rf feeds/packages/net/cdnspeedtest
# rm -rf feeds/packages/gst1-plugins-base
# cf测速换ip两个插件
git clone https://github.com/dsddr02/cdnspeedtest package/cdnspeedtest
git clone https://github.com/dsddr02/peed11 package/luci-app-cloudflarespeedtest
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic
git clone --depth=1 https://github.com/nikkinikki-org/OpenWrt-momo package/momo
git clone https://github.com/xiaorouji/openwrt-passwall --depth=1 luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall2 --depth=1 package/luci-app-passwall2
git clone https://github.com/sbwml/luci-app-openlist2 --depth=1 package/luci-app-openlist2
# git clone https://github.com/morytyann/OpenWrt-mihomo luci-app-mihomo mihomo
git clone https://github.com/kenzok8/jell --depth=1 package/small
# git clone https://github.com/kenzok8/openwrt-packages --depth=1 package/small5
git clone https://github.com/xiaorouji/openwrt-passwall-packages --depth=1 package/passwall-packages 
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default

