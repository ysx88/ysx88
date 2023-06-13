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

git clone https://github.com/jerrykuku/luci-theme-argon
git clone https://github.com/jerrykuku/luci-app-argon-config
git clone --depth=1 https://github.com/kiddin9/luci-app-dnsfilter
git clone --depth=1 https://github.com/kiddin9/qBittorrent-Enhanced-Edition
git clone --depth=1 https://github.com/yaof2/luci-app-ikoolproxy
git clone --depth=1 https://github.com/tty228/luci-app-serverchan
git clone --depth=1 https://github.com/ntlf9t/luci-app-easymesh
git clone --depth=1 https://github.com/zzsj0928/luci-app-pushbot
git clone https://github.com/jerrykuku/luci-app-vssr
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb
git clone --depth=1 https://github.com/sirpdboy/luci-app-advanced
git clone --depth=1 https://github.com/hubbylei/luci-app-clash
git clone --depth=1 https://github.com/Jason6111/luci-app-netdata
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff
git clone --depth=1 -b lede https://github.com/pymumu/luci-app-smartdns
git clone --depth=1 https://github.com/pymumu/openwrt-smartdns smartdns
git clone https://github.com/Hyy2001X/AutoBuild-Packages && rm -rf AutoBuild-Packages/luci-app-adguardhome && mvdir AutoBuild-Packages
git clone --depth=1 https://github.com/peter-tank/luci-app-autorepeater
git clone --depth=1 https://github.com/sensec/luci-app-udp2raw
git clone --depth=1 https://github.com/sensec/openwrt-udp2raw udp2raw
git clone --depth=1 https://github.com/BoringCat/luci-app-mentohust
git clone --depth=1 https://github.com/KyleRicardo/MentoHUST-OpenWrt-ipk mentohust
git clone --depth=1 https://github.com/UnblockNeteaseMusic/luci-app-unblockneteasemusic
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall
git clone --depth=1 https://github.com/fw876/helloworld && rm -rf helloworld/luci-app-ssr-plus
git clone https://github.com/kiddin9/openwrt-adguardhome && mvdir openwrt-adguardhome
git clone --depth 1 https://github.com/destan19/OpenAppFilter && mvdir OpenAppFilter
git clone --depth 1 https://github.com/sbwml/openwrt-alist && mvdir openwrt-alist
git clone --depth 1 https://github.com/sbwml/luci-app-mosdns openwrt-mosdns && mvdir openwrt-mosdns
git clone --depth 1 https://github.com/sirpdboy/luci-app-ddns-go openwrt-ddns-go && mvdir openwrt-ddns-go
git clone --depth 1 https://github.com/linkease/istore && mv -n istore/luci/* ./; rm -rf istore
git clone --depth 1 https://github.com/linkease/nas-packages && mv -n nas-packages/network/services/* ./; rm -rf nas-packages
git clone --depth 1 https://github.com/linkease/nas-packages-luci && mv -n nas-packages-luci/luci/* ./; rm -rf nas-packages-luci
git clone --depth 1 https://github.com/messense/aliyundrive-fuse aliyundrive && mv -n aliyundrive/openwrt/* ./; rm -rf aliyundrive
git clone --depth 1 https://github.com/messense/aliyundrive-webdav aliyundrive && mv -n aliyundrive/openwrt/* ./; rm -rf aliyundrive

svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall
svn export https://github.com/xiaorouji/openwrt-passwall2/trunk/luci-app-passwall2
svn export https://github.com/fw876/helloworld/trunk/luci-app-ssr-plus
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash
svn export https://github.com/kiddin9/openwrt-packages/trunk/luci-app-bypass
svn export https://github.com/ophub/luci-app-amlogic/trunk/luci-app-amlogic
svn export https://github.com/coolsnowwolf/packages/trunk/multimedia/UnblockNeteaseMusic
svn export https://github.com/lisaac/luci-app-dockerman/trunk/applications/luci-app-dockerman
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/gost
svn export https://github.com/immortalwrt/packages/branches/openwrt-18.06/net/iptvhelper
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-ssr-mudb-server
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-filebrowser
svn export https://github.com/Lienol/openwrt-package/trunk/luci-app-pppoe-server
svn export https://github.com/sirpdboy/netspeedtest/trunk/luci-app-netspeedtest
svn export https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/op-webdav/luci-app-gowebdav
svn export https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/op-webdav/gowebdav
svn export https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/op-homebox/luci-app-homebox
svn export https://github.com/xiangfeidexiaohuo/openwrt-packages/trunk/op-homebox/homebox
svn export https://github.com/syb999/openwrt-19.07.1/trunk/package/network/services/msd_lite && mv -n msd_lite/luci-app-msd_lite ./

git_sparse_clone openwrt-18.06 "https://github.com/immortalwrt/luci" "luci" applications/luci-app-eqos \
applications/luci-app-aliddns applications/luci-app-gost applications/luci-app-iptvhelper

git_sparse_clone main "https://github.com/haiibo/packages" "packages" luci-app-wrtbwmon wrtbwmon luci-app-onliner \
git_sparse_clone master "https://github.com/kiddin9/openwrt-packages" "openwrt-packages" ffmpeg-remux \

rm -rf ./*/.* & rm -rf ./*/LICENSE

cp -f $GITHUB_WORKSPACE/assets/README.md ./README.md
