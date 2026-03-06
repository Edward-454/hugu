#!/bin/bash

#sed -i 's/192.168.1.1/192.168.110.249/g' package/base-files/files/bin/config_generate
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


git clone https://github.com/sbwml/packages_lang_golang -b 24.x feeds/packages/lang/golang
echo "Lowering Go version requirement from 1.25 to 1.24..."
# 针对 feeds 目录
if [ -d "feeds" ]; then
    find feeds/ -type f -name "go.mod" -exec sed -i 's/go 1.25/go 1.24/g' {} \;
fi

# 针对 package 目录
if [ -d "package" ]; then
    find package/ -type f -name "go.mod" -exec sed -i 's/go 1.25/go 1.24/g' {} \;
    find package/ -type f -name "Makefile" -exec sed -i 's/GO_VERSION_MIN:=1.25/GO_VERSION_MIN:=1.24/g' {} \;
fi

echo "Go version downgrade completed."
# 修正后的 go.mod 修改命令
find ./ -type f -name "go.mod" -exec sed -i 's/go 1.25/go 1.24/g' {} \;

# 修正后的 Makefile 修改命令
find ./package/ -type f -name "Makefile" -exec sed -i 's/GO_VERSION_MIN:=1.25/GO_VERSION_MIN:=1.24/g' {} \;
# 设置默认密码为 password
#sed -i 's/root:::0:99999:7:::/root:$1$V4UetPzk$CYXluq4wUazHjmCDBCqXF.::0:99999:7:::/g' openwrt/package/base-files/files/etc/shadow
# 修改默认 IP 为 192.168.1.99
