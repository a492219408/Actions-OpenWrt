#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
#sed -i '$a src-git smpackage https://github.com/kenzok8/small-package' feeds.conf
sed -i '$a src-git vernesong https://github.com/vernesong/OpenClash' feeds.conf
sed -i '$a src-git sundaqiang https://github.com/sundaqiang/openwrt-packages' feeds.conf
sed -i '$a src-git brvphoenix https://github.com/brvphoenix/luci-app-wrtbwmon' feeds.conf
sed -i '$a src-git jerrykuku https://github.com/jerrykuku/luci-theme-argon' feeds.conf

## 如果设置了 OFFICIAL_FEEDS_VERSION，就重写官方四个 feed
## 例如：OFFICIAL_FEEDS_VERSION=';openwrt-24.10' 或 '^b5ed85f...'
#if [ -n "${OFFICIAL_FEEDS_VERSION:-}" ]; then
#  # 兜底：如果没写前导 ; 或 ^，默认当作分支/标签处理
#  case "$OFFICIAL_FEEDS_VERSION" in
#    ';'*|'^'*) SUFFIX="$OFFICIAL_FEEDS_VERSION" ;;
#    *)         SUFFIX=";$OFFICIAL_FEEDS_VERSION" ;;
#  esac
#
#  for name in packages luci routing telephony; do
#    # 把该行的 URL（无论原来跟的是 ;branch 还是 ^commit）替换为 <base_url><SUFFIX>
#    sed -i -E "s|^([[:space:]]*src-git[[:space:]]+$name[[:space:]]+[^;^[:space:]]+)([;^][^[:space:]]*)?|\1${SUFFIX}|" feeds.conf
#  done
#fi
