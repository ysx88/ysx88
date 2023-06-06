#!/bin/bash


# 修改openwrt登陆地址,把下面的192.168.11.1修改成你想要的就可以了
sed -i 's/192.168.1.1/192.168.71.3/g' package/base-files/files/bin/config_generate

#删除原默认主题
rm -rf feeds/luci/themes/luci-theme-argon
rm -rf feeds/small8/luci-theme-argon
rm -rf feeds/small8/luci-app-argon-config
#rm -rf feeds/luci/luci-theme-bootstrap
#rm -rf feeds/luci/luci-theme-material
#rm -rf feeds/luci/luci-theme-netgear
#rm -rf feeds/luci/luci-theme-ifit
#rm -rf feeds/luci/luci-theme-neobird

#下载主题luci-theme-argon
git clone --depth=1 -b 18.06 https://github.com/jerrykuku/luci-theme-argon package/lean/luci-theme-argon
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config package/lean/luci-app-argon-config

#取消原主题luci-theme-bootstrap为默认主题
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap

# 修改 argon 为默认主题,可根据你喜欢的修改成其他的（不选择那些会自动改变为默认主题的主题才有效果）
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
