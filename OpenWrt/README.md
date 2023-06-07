<h4 align="center">访客数 :eyes:</h4>

<p align="center"><img src="https://profile-counter.glitch.me/ysx88/count.svg" alt="ysx88 :: Visitor's Count" /></p>
<div align="center">
   
![](https://raw.githubusercontent.com/DHDAXCW/DHDAXCW/output/github-snake.svg)
<h1>OpenWrt — 多设备固件云编译</h1>

<img src="https://img.shields.io/github/downloads/ysx88/OpenWrt/total.svg?style=for-the-badge&color=32C955"/>
<img src="https://img.shields.io/github/stars/ysx88/OpenWrt.svg?style=for-the-badge&color=orange"/>
<img src="https://img.shields.io/github/forks/ysx88/OpenWrt.svg?style=for-the-badge&color=ff69b4"/>
<img src="https://img.shields.io/github/license/ysx88/OpenWrt.svg?style=for-the-badge&color=blueviolet"/>

[![](https://img.shields.io/badge/-目录:-696969.svg)](#readme) [![](https://img.shields.io/badge/-项目说明-FFFFFF.svg)](#项目说明-) [![](https://img.shields.io/badge/-固件特色-FFFFFF.svg)](#固件特色-) [![](https://img.shields.io/badge/-固件下载-FFFFFF.svg)](#固件下载-)  [![](https://img.shields.io/badge/-定制固件-FFFFFF.svg)](#定制固件-) [![](https://img.shields.io/badge/-特别提示-FFFFFF.svg)](#特别提示-) 
</div>


## 项目说明 [![](https://img.shields.io/badge/-项目基本介绍-FFFFFF.svg)](#项目说明-)
- 固件来源：[![Lean](https://img.shields.io/badge/Lede-Lean-ff69b4.svg?style=flat&logo=appveyor)](https://github.com/coolsnowwolf/lede) [![P3TERX](https://img.shields.io/badge/OpenWrt-P3TERX-blueviolet.svg?style=flat&logo=appveyor)](https://github.com/P3TERX/Actions-OpenWrt) [![Flippy](https://img.shields.io/badge/Package-Flippy-orange.svg?style=flat&logo=appveyor)](https://github.com/unifreq/openwrt_packit) [![ysx88](https://img.shields.io/badge/Build-ysx88-32C955.svg?style=flat&logo=appveyor)](https://github.com/ysx88/OpenWrt)
- 项目使用 Github Actions 拉取 [Lean](https://github.com/coolsnowwolf/lede) 的 Openwrt 源码仓库进行云编译
- 固件默认管理地址：`192.168.1.1` 默认用户：`root` 默认密码：`password`
- 提供适配于 NanoPi-R2S、Phicomm-N1以及 X86 平台设备的 OpenWrt 固件
- 固件集成的所有 ipk 插件全部打包在 Packages 文件中，可以在 [Releases](https://github.com/ysx88/OpenWrt/releases) 内进行下载
- 项目编译的固件插件为最新版本，最新版插件可能有 BUG，如果之前使用稳定则无需追新
- 第一次使用请采用全新安装，避免出现升级失败以及其他一些可能的 BUG


## 固件特色 [![](https://img.shields.io/badge/-本项目固件特色-FFFFFF.svg)](#固件特色-)
1. 固件每天定时自动编译，以确保获得最新体验
7. 集成在线用户插件，可查看所有在线用户 IP 地址与实时速率等
8. Phicomm-N1固件内置晶晨宝盒，支持在线更新固件及内核等


## 固件下载 [![](https://img.shields.io/badge/-编译状态及下载链接-FFFFFF.svg)](#固件下载-)
点击下表中 [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?style=flat&logo=hack-the-box)](https://github.com/ysx88/OpenWrt/releases) 即可跳转到该设备固件下载页面
| 平台+设备名称 | 固件编译状态 | 配置文件 | 固件下载 |
| :-------------: | :-------------: | :-------------: | :-------------: |
| [![](https://img.shields.io/badge/OpenWrt-X86_64位-32C955.svg?logo=openwrt)](https://github.com/ysx88/OpenWrt/blob/main/.github/workflows/Build-x86.yml) | [![](https://github.com/ysx88/OpenWrt/actions/workflows/Build-x86.yml/badge.svg)](https://github.com/ysx88/OpenWrt/actions/workflows/Build-x86.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/ysx88/OpenWrt/blob/main/configs/x86.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/ysx88/OpenWrt/releases/tag/OpenWrt-x86) |
| [![](https://img.shields.io/badge/OpenWrt-Phicomm_N1-32C955.svg?logo=openwrt)](https://github.com/ysx88/OpenWrt/blob/main/.github/workflows/Build-N1.yml) | [![](https://github.com/ysx88/OpenWrt/actions/workflows/Build-N1.yml/badge.svg)](https://github.com/ysx88/OpenWrt/actions/workflows/Build-N1.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/ysx88/OpenWrt/blob/main/configs/n1.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/ysx88/OpenWrt/releases/tag/Phicomm-N1) |
| [![](https://img.shields.io/badge/OpenWrt-ARMv8_平台-32C955.svg?logo=openwrt)](https://github.com/ysx88/OpenWrt/blob/main/.github/workflows/Build-ARMv8.yml) | [![](https://github.com/ysx88/OpenWrt/actions/workflows/Build-ARMv8.yml/badge.svg)](https://github.com/ysx88/OpenWrt/actions/workflows/Build-ARMv8.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/ysx88/OpenWrt/blob/main/configs/n1.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/ysx88/OpenWrt/releases/tag/ARMv8) |
| [![](https://img.shields.io/badge/OpenWrt-Rockchip_平台-32C955.svg?logo=openwrt)](https://github.com/ysx88/OpenWrt/blob/main/.github/workflows/Build-R2S.yml) | [![](https://github.com/ysx88/OpenWrt/actions/workflows/Build-R2S.yml/badge.svg)](https://github.com/ysx88/OpenWrt/actions/workflows/Build-R2S.yml) | [![](https://img.shields.io/badge/编译-配置-orange.svg?logo=apache-spark)](https://github.com/ysx88/OpenWrt/blob/main/configs/r2s.config) | [![](https://img.shields.io/badge/下载-链接-blueviolet.svg?logo=hack-the-box)](https://github.com/ysx88/OpenWrt/releases/tag/NanoPi-R2S) |


## 定制固件 [![](https://img.shields.io/badge/-项目基本编译教程-FFFFFF.svg)](#定制固件-)
1. 首先要登录 Gihub 账号，然后 Fork 此项目到你自己的 Github 仓库
2. 修改 `configs` 目录对应文件添加或删除插件，或者上传自己的 `xx.config` 配置文件
3. 插件对应名称及功能请参考恩山网友帖子：[Applications 添加插件应用说明](https://www.right.com.cn/forum/thread-3682029-1-1.html)
4. 如需修改默认 IP、添加或删除插件包以及一些其他设置请在 `diy-script.sh` 文件内修改
5. 添加或修改 `xx.yml` 文件，最后点击 `Actions` 运行要编译的 `workflow` 即可开始编译
6. 编译大概需要3-5小时，编译完成后在仓库主页 [Releases](https://github.com/ysx88/OpenWrt/releases) 对应 Tag 标签内下载固件
<details>
<summary><b>&nbsp;如果你觉得修改 config 文件麻烦，那么你可以点击此处尝试本地提取</b></summary>

1. 首先装好 Linux 系统，推荐 Debian 11 或 Ubuntu LTS

2. 安装编译依赖环境

   ```bash
   sudo apt update -y
   sudo apt full-upgrade -y
   sudo apt install -y ack antlr3 asciidoc autoconf automake autopoint binutils bison build-essential \
   bzip2 ccache cmake cpio curl device-tree-compiler fastjar flex gawk gettext gcc-multilib g++-multilib \
   git gperf haveged help2man intltool libc6-dev-i386 libelf-dev libglib2.0-dev libgmp3-dev libltdl-dev \
   libmpc-dev libmpfr-dev libncurses5-dev libncursesw5-dev libreadline-dev libssl-dev libtool lrzsz \
   mkisofs msmtp nano ninja-build p7zip p7zip-full patch pkgconf python2.7 python3 python3-pyelftools \
   libpython3-dev qemu-utils rsync scons squashfs-tools subversion swig texinfo uglifyjs upx-ucl unzip \
   vim wget xmlto xxd zlib1g-dev
   ```

3. 下载源代码，更新 feeds 并安装到本地

   ```bash
   git clone https://github.com/coolsnowwolf/lede
   cd lede
   ./scripts/feeds update -a
   ./scripts/feeds install -a
   ```

4. 复制 diy-script.sh 文件内所有内容到命令行，添加自定义插件和自定义设置

5. 命令行输入 `make menuconfig` 选择配置，选好配置后导出差异部分到 seed.config 文件

   ```bash
   make defconfig
   ./scripts/diffconfig.sh > seed.config
   ```

7. 命令行输入 `cat seed.config` 查看这个文件，也可以用文本编辑器打开

8. 复制 seed.config 文件内所有内容到 configs 目录对应文件中覆盖就可以了

   **如果看不懂编译界面可以参考 YouTube 视频：[软路由固件 OpenWrt 编译界面设置](https://www.youtube.com/watch?v=jEE_J6-4E3Y&list=WL&index=7)**
</details>


## 特别提示 [![](https://img.shields.io/badge/-个人免责声明-FFFFFF.svg)](#特别提示-)

- **因精力有限不提供任何技术支持和教程等相关问题解答，不保证完全无 BUG！**

- **本人不对任何人因使用本固件所遭受的任何理论或实际的损失承担责任！**

- **本固件禁止用于任何商业用途，请务必严格遵守国家互联网使用相关法律规定！**

- **请务必遵从 “不涉及政治，不涉及宗教，不涉及黄赌毒” 三不原则！**


<a href="#readme">
<img src="https://img.shields.io/badge/-返回顶部-FFFFFF.svg" title="返回顶部" align="right"/>
</a>
