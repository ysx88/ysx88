#!/bin/bash
function git_sparse_clone() {
branch="$1" rurl="$2" localdir="$3" && shift 3
git clone -b $branch --depth 1 --filter=blob:none --sparse $rurl $localdir
cd $localdir
git sparse-checkout init --cone
git sparse-checkout set $@
mv -n $@ ../
cd ..
rm -rf $localdir
}

function mvdir() {
mv -n `find $1/* -maxdepth 0 -type d` ./
rm -rf $1
}

svn co https://github.com/garypang13/luci-theme-edge/branches/18.06 ./luci-theme-edge
svn co https://github.com/jerrykuku/luci-theme-argon/branches/18.06 ./luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config
git clone --depth=1 https://github.com/fw876/helloworld
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb
git clone https://github.com/jerrykuku/luci-app-vssr
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic
svn export https://github.com/281677160/openwrt-package/branches/adguard/adguardhome
svn export https://github.com/281677160/openwrt-package/branches/adguard/luci-app-adguardhome
svn export https://github.com/haiibo/packages/trunk/luci-app-onliner
svn export https://github.com/kiddin9/openwrt-packages/trunk/ffmpeg-remux
svn export https://github.com/haiibo/openwrt-packages/trunk/linkease
svn export https://github.com/haiibo/openwrt-packages/trunk/luci-app-linkease
svn co https://github.com/sbwml/openwrt-alist/trunk/luci-app-alist ./luci-app-alist
svn co https://github.com/sbwml/openwrt-alist/trunk/alist ./alist
git clone --depth 1 https://github.com/linkease/istore && mv -n istore/luci/* ./; rm -rf istore
git clone --depth 1 https://github.com/linkease/istore-ui && mv -n istore-ui/app-store-ui ./; rm -rf istore-ui

rm -rf ./*/.* & rm -rf ./*/LICENSE
cp -f $GITHUB_WORKSPACE/assets/diy/README.md ./README.md
