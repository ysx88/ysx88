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

git clone https://github.com/kiddin9/luci-theme-edge
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git luci-theme-argon
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
git clone https://github.com/kiddin9/openwrt-adguardhome && mvdir openwrt-adguardhome
svn export https://github.com/haiibo/packages/trunk/luci-app-onliner

rm -rf ./*/.* & rm -rf ./*/LICENSE
cp -f $GITHUB_WORKSPACE/assets/README.md ./README.md