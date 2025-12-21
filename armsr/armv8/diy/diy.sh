#!/bin/bash

sed -i 's/192.168.1.1/192.168.11.249/g' package/base-files/files/bin/config_generate
# Remove packages
rm -rf feeds/luci/applications/luci-app-momo
rm -rf feeds/luci/applications/luci-app-alist
rm -rf feeds/luci/applications/luci-app-passwall2
rm -rf feeds/packages/net/cdnspeedtest
# rm -rf feeds/packages/gst1-plugins-base
# cf测速换ip两个插件
git clone https://github.com/dsddr02/cdnspeedtest package/cdnspeedtest
git clone https://github.com/dsddr02/peed11 package/luci-app-cloudflarespeedtest
#git_sparse_clone main https://github.com/kenzok8/small-package luci-lib-taskd
git clone --depth=1 https://github.com/ophub/luci-app-amlogic package/amlogic
#git_sparse_clone main https://github.com/xiaorouji/openwrt-passwall luci-app-passwall
git clone https://github.com/xiaorouji/openwrt-passwall2 package/luci-app-passwall2
git clone https://github.com/sbwml/luci-app-openlist2 package/luci-app-openlist2
#git_sparse_clone main https://github.com/morytyann/OpenWrt-mihomo luci-app-mihomo mihomo
git clone https://github.com/kenzok8/small-package package/small-package 
git clone https://github.com/xiaorouji/openwrt-passwall-packages package/passwall-packages 
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
# sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf.default
rm -rf package/small-package/luci-app-openvpn-server
rm -rf package/small-package/openvpn-easy-rsa-whisky
rm -rf package/small-package/luci-app-wrtbwmon
rm -rf package/small-package/wrtbwmon
rm -rf package/small-package/luci-app-koolproxy
rm -rf package/small-package/luci-app-godproxy
rm -rf package/small-package/luci-app-passwall2
#rm -rf package/small-package/luci-theme-argon*
rm -rf package/small-package/luci-app-amlogic
rm -rf package/small-package/cdnspeedtest
rm -rf package/small-package/luci-app-unblockneteasemusic
rm -rf package/small-package/upx-static
rm -rf package/small-package/upx
rm -rf package/small-package/firewall*
rm -rf package/small-package/opkg
rm -rf package/small-package/base-files
rm -rf package/small-package/luci-app-bandwidthd
rm -rf package/small-package/luci-app-bypass
rm -rf package/small-package/luci-app-dogcom
rm -rf package/small-package/luci-app-gowebdav
rm -rf package/small-package/luci-app-nginx-pingos
rm -rf package/small-package/luci-app-ssr-plus
rm -rf package/small-package/luci-app-onliner
rm -rf package/small-package/natflow
rm -rf package/small-package/luci-app-cloudflarespeedtest
#rm -rf feeds/smpackage/{base-files,dnsmasq,firewall*,fullconenat,libnftnl,nftables,ppp,opkg,ucl,upx,vsftpd*,miniupnpd-iptables,wireless-regdb}
rm -rf package/feeds/packages/aliyundrive-webdav
rm -rf feeds/packages/multimedia/aliyundrive-webdav
rm -rf package/feeds/packages/perl-xml-parser
rm -rf package/feeds/packages/xfsprogs
#rm -rf package/feeds/packages/alist
#rm -rf feeds/packages/net/alist
rm -rf feeds/luci/applications/luci-app-openlist
rm -rf package/small-package/luci-app-openlist
rm -rf feeds/luci/applications/luci-app-openlist2
rm -rf package/small-package/luci-app-openlist2
rm -rf package/small-package/alist
rm -rf package/small-package/openlist2
rm -rf feeds/luci/applications/openlist2
rm -rf package/small-package/luci-app-lingtigameacc
rm -rf feeds/packages/lang/golang
rm -rf package/small-package/nftables
rm -rf package/small-package/haproxy
rm -rf package/small-package/python-zope-event
rm -rf package/small-package/onionshare-cli
rm -rf package/small-package/luci-app-wechatpush
rm -rf package/small-package/exim
echo "Lowering Go version requirement from 1.25 to 1.24..."
find feeds/ package/ -type f -name "go.mod" -exec sed -i 's/go 1.25/go 1.24/g' {} +

# 针对某些 Makefile 里可能存在的硬编码检查也进行处理
find feeds/ package/ -type f -name "Makefile" -exec sed -i 's/GO_VERSION_MIN:=1.25/GO_VERSION_MIN:=1.24/g' {} +
git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
sed -i 's/ImmortalWrt/redmek40/g' package/base-files/files/bin/config_generate
# 设置默认密码为 password
#sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' openwrt/package/base-files/files/etc/shadow
# 修改默认 IP 为 192.168.1.99
